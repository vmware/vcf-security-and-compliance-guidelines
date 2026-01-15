<#
.SYNOPSIS
    Audits SSH service status across all VMware ESX hosts.

.DESCRIPTION
    BRICKSTORM operators require shell access to install persistence mechanisms.
    SSH should be disabled on VMware ESX hosts when not in use. This script
    identifies hosts with SSH enabled and reports on service policy settings.

    Flags:
    - SSH-ENABLED: SSH service is currently running
    - AUTO-START: SSH configured to start automatically (policy: on)
    - FIREWALL-OPEN: SSH allowed through ESX firewall

.PARAMETER VMHost
    Specific VMware ESX host(s) to audit. If not specified, audits all hosts.

.EXAMPLE
    # Audit all hosts
    .\Get-SSHServiceStatus.ps1

.EXAMPLE
    # Audit specific cluster
    Get-Cluster "Production" | Get-VMHost | .\Get-SSHServiceStatus.ps1

.EXAMPLE
    # Export results
    .\Get-SSHServiceStatus.ps1 | Export-Csv -Path ssh-audit.csv -NoTypeInformation

.NOTES
    Reference: BRICKSTORM Defense Guide - VMware ESX Hardening
    Requirements: VMware PowerCLI, Connection to vCenter

    SSH should be disabled when not in use. If SSH must remain enabled,
    configure session timeouts and monitor for vpxuser SSH sessions.
#>

[CmdletBinding()]
param (
    [Parameter(ValueFromPipeline = $true)]
    [VMware.VimAutomation.ViCore.Impl.V1.Inventory.VMHostImpl[]]
    $VMHost
)

begin {
    Write-Host "Auditing SSH Service Status..." -ForegroundColor Cyan
    $Results = @()
    $EnabledCount = 0
    $AutoStartCount = 0
}

process {
    $HostsToScan = if ($VMHost) { $VMHost } else { Get-VMHost }

    foreach ($ESXi in $HostsToScan) {
        $Flags = @()

        # Get SSH service
        $SSHService = Get-VMHostService -VMHost $ESXi | Where-Object { $_.Key -eq "TSM-SSH" }

        # Get ESX Shell service
        $ShellService = Get-VMHostService -VMHost $ESXi | Where-Object { $_.Key -eq "TSM" }

        # Check SSH status
        if ($SSHService.Running) {
            $Flags += "SSH-ENABLED"
            $EnabledCount++
        }

        # Check auto-start policy
        if ($SSHService.Policy -eq "on") {
            $Flags += "AUTO-START"
            $AutoStartCount++
        }

        # Check ESX Shell
        if ($ShellService.Running) {
            $Flags += "SHELL-ENABLED"
        }

        $Status = if ($Flags.Count -gt 0) { $Flags -join "," } else { "SECURE" }

        $Result = [PSCustomObject]@{
            Status       = $Status
            Host         = $ESXi.Name
            SSHRunning   = $SSHService.Running
            SSHPolicy    = $SSHService.Policy
            ShellRunning = $ShellService.Running
            ShellPolicy  = $ShellService.Policy
            ConnectionState = $ESXi.ConnectionState
            Version      = $ESXi.Version
        }
        $Results += $Result
    }
}

end {
    Write-Host ""
    Write-Host "SSH Service Audit Summary" -ForegroundColor Cyan
    Write-Host "=========================" -ForegroundColor Cyan
    Write-Host "Hosts audited:          $($HostsToScan.Count)"
    Write-Host "SSH enabled:            $EnabledCount" -ForegroundColor $(if ($EnabledCount -gt 0) { "Yellow" } else { "Green" })
    Write-Host "SSH auto-start:         $AutoStartCount" -ForegroundColor $(if ($AutoStartCount -gt 0) { "Yellow" } else { "Green" })
    Write-Host ""

    if ($EnabledCount -gt 0) {
        Write-Host "Consider disabling SSH on hosts where it is not actively needed." -ForegroundColor Yellow
        Write-Host "If SSH must remain enabled, configure session timeouts." -ForegroundColor Yellow
    }

    $Results
}
