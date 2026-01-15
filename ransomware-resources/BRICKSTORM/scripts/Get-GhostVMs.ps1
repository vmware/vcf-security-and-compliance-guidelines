<#
.SYNOPSIS
    Scans for BRICKSTORM "Ghost VMs" and vCLS Masquerading.

.DESCRIPTION
    This script performs two security checks:
    1. Ghost VM Detection: Compares running ESXi processes against vCenter inventory
       to find VMs that are running but hidden/unregistered.
    2. vCLS Audit: Checks for fake vSphere Cluster Services (vCLS) VMs. Legitimate
       vCLS agents do not have network adapters; attackers add them for C2.

    Ghost VMs are running on VMware ESX but deleted from vCenter inventory. vCenter
    cannot see them; detection requires direct VMware ESX host inspection.

.PARAMETER VMHost
    Specific VMware ESX host(s) to scan. If not specified, scans all hosts.

.EXAMPLE
    # Scan all hosts in connected vCenter
    .\Get-GhostVMs.ps1

.EXAMPLE
    # Scan specific host
    Get-VMHost -Name "esxi-01" | .\Get-GhostVMs.ps1

.EXAMPLE
    # Export results to CSV
    .\Get-GhostVMs.ps1 | Export-Csv -Path ghost-vms.csv -NoTypeInformation

.NOTES
    Reference: BRICKSTORM Defense Guide - Ghost VM Detection
    Requirements: VMware PowerCLI, Connection to vCenter

    IMPORTANT: If results are returned, do not power off VMs immediately.
    Use the ESX host command line to suspend the process to capture memory
    (the .vmem file) for forensics before terminating the world ID.

    For high-risk investigations where attacker may have root access on ESX,
    SSH directly to each host and run 'esxcli vm process list' manually.
#>

[CmdletBinding()]
param (
    [Parameter(ValueFromPipeline = $true)]
    [VMware.VimAutomation.ViCore.Impl.V1.Inventory.VMHostImpl[]]
    $VMHost
)

begin {
    Write-Host "Starting BRICKSTORM Ghost VM Scan..." -ForegroundColor Cyan
    $Results = @()
    $GhostCount = 0
    $FakeVclsCount = 0
}

process {
    $HostsToScan = if ($VMHost) { $VMHost } else { Get-VMHost }

    foreach ($ESXi in $HostsToScan) {
        Write-Host "Scanning Host: $($ESXi.Name)" -ForegroundColor Gray

        # 1. Get the "Official" list (What vCenter knows about)
        $RegisteredVMs = @{}
        Get-VM -Location $ESXi | ForEach-Object { $RegisteredVMs[$_.Name] = $_ }

        # 2. Get the "Real" list (What is actually running on the metal)
        try {
            $EsxCli = Get-EsxCli -VMHost $ESXi -V2
            $RunningWorlds = $EsxCli.vm.process.list.Invoke()
        }
        catch {
            Write-Warning "Could not access ESXCLI on $($ESXi.Name). Verify connection/permissions."
            continue
        }

        foreach ($World in $RunningWorlds) {
            $WorldName = $World.DisplayName
            $WorldID = $World.WorldID

            # --- CHECK 1: Ghost VM Detection ---
            if (-not $RegisteredVMs.ContainsKey($WorldName)) {
                $Result = [PSCustomObject]@{
                    TimeStamp  = (Get-Date)
                    Type       = "GHOST VM"
                    RiskLevel  = "CRITICAL"
                    Host       = $ESXi.Name
                    VMName     = $WorldName
                    WorldID    = $WorldID
                    Details    = "Process running on host but NOT registered in vCenter."
                }
                Write-Warning "DETECTED GHOST VM: $WorldName on $($ESXi.Name)"
                $Results += $Result
                $GhostCount++
            }
            # --- CHECK 2: vCLS Masquerading ---
            elseif ($WorldName -like "vCLS*") {
                $VMObj = $RegisteredVMs[$WorldName]
                $NICs = Get-NetworkAdapter -VM $VMObj

                if ($NICs) {
                    $Result = [PSCustomObject]@{
                        TimeStamp  = (Get-Date)
                        Type       = "FAKE vCLS"
                        RiskLevel  = "HIGH"
                        Host       = $ESXi.Name
                        VMName     = $WorldName
                        WorldID    = $WorldID
                        Details    = "VM mimics vCLS but has $($NICs.Count) network adapter(s). Legitimate vCLS has 0."
                    }
                    Write-Warning "DETECTED FAKE vCLS: $WorldName on $($ESXi.Name)"
                    $Results += $Result
                    $FakeVclsCount++
                }
            }
        }
    }
}

end {
    Write-Host ""
    Write-Host "Ghost VM Scan Summary" -ForegroundColor Cyan
    Write-Host "=====================" -ForegroundColor Cyan
    Write-Host "Hosts scanned:    $($HostsToScan.Count)"
    Write-Host "Ghost VMs:        $GhostCount" -ForegroundColor $(if ($GhostCount -gt 0) { "Red" } else { "Green" })
    Write-Host "Fake vCLS VMs:    $FakeVclsCount" -ForegroundColor $(if ($FakeVclsCount -gt 0) { "Red" } else { "Green" })

    if ($GhostCount -gt 0 -or $FakeVclsCount -gt 0) {
        Write-Host ""
        Write-Host "ACTION REQUIRED: Anomalies detected. Do NOT power off immediately." -ForegroundColor Red
        Write-Host "Capture memory (.vmem) for forensics before terminating processes." -ForegroundColor Red
    }

    $Results
}
