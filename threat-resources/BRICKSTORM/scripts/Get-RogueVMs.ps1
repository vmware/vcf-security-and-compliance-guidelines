<#
.SYNOPSIS
    Detects rogue VMs that may have been deployed by attackers.

.DESCRIPTION
    Rogue VMs are registered in vCenter but hidden in obscure locations or named
    to blend in. BRICKSTORM provides attackers with persistent vCenter access,
    enabling them to deploy hidden VMs for staging, data exfiltration, or backup
    persistence.

    This script identifies:
    1. Recently created VMs (potential unauthorized deployments)
    2. VMs in non-standard folders (hiding in obscure locations)
    3. VMs with suspicious naming patterns

.PARAMETER DaysBack
    Number of days to look back for recently created VMs. Default: 90

.PARAMETER StandardFolders
    Array of folder names considered "standard". VMs outside these folders are flagged.
    Default: 'Production', 'Development', 'Templates', 'Discovered virtual machine'

.PARAMETER IncludeAll
    Include all VMs in output, not just suspicious ones.

.EXAMPLE
    # Find rogue VMs with default settings
    .\Get-RogueVMs.ps1

.EXAMPLE
    # Check VMs created in last 30 days
    .\Get-RogueVMs.ps1 -DaysBack 30

.EXAMPLE
    # Custom standard folders for your environment
    .\Get-RogueVMs.ps1 -StandardFolders @('Prod', 'Dev', 'QA', 'Templates')

.NOTES
    Reference: BRICKSTORM Defense Guide - Rogue VM Detection
    Requirements: VMware PowerCLI, Connection to vCenter

    Cross-reference findings with change management records.
    Attackers often use names like 'template-backup', 'test-server-01'.
#>

[CmdletBinding()]
param (
    [Parameter()]
    [int]$DaysBack = 90,

    [Parameter()]
    [string[]]$StandardFolders = @('Production', 'Development', 'Templates', 'Discovered virtual machine'),

    [Parameter()]
    [switch]$IncludeAll
)

begin {
    Write-Host "Scanning for Rogue VMs..." -ForegroundColor Cyan
    $Results = @()
    $Now = Get-Date
    $Cutoff = $Now.AddDays(-$DaysBack)
    $RecentCount = 0
    $NonStandardCount = 0
    $SuspiciousNameCount = 0
}

process {
    # Suspicious name patterns (common attacker naming conventions)
    $SuspiciousPatterns = @(
        '*template*backup*',
        '*test-server*',
        '*temp-*',
        '*backup-*',
        '*staging*',
        '*exfil*',
        '*tunnel*'
    )

    $AllVMs = Get-VM

    foreach ($VM in $AllVMs) {
        $Flags = @()
        $CreateDate = $VM.ExtensionData.Config.CreateDate
        $FolderName = $VM.Folder.Name

        # Check 1: Recently created
        if ($CreateDate -and $CreateDate -gt $Cutoff) {
            $Flags += "RECENT"
            $RecentCount++
        }

        # Check 2: Non-standard folder
        if ($FolderName -notin $StandardFolders) {
            $Flags += "NON-STD-FOLDER"
            $NonStandardCount++
        }

        # Check 3: Suspicious naming
        foreach ($Pattern in $SuspiciousPatterns) {
            if ($VM.Name -like $Pattern) {
                $Flags += "SUSPICIOUS-NAME"
                $SuspiciousNameCount++
                break
            }
        }

        $Status = if ($Flags.Count -gt 0) { $Flags -join "," } else { "OK" }

        if ($IncludeAll -or $Flags.Count -gt 0) {
            $Result = [PSCustomObject]@{
                Status      = $Status
                VMName      = $VM.Name
                PowerState  = $VM.PowerState
                Created     = $CreateDate
                AgeDays     = if ($CreateDate) { [math]::Round(($Now - $CreateDate).TotalDays, 0) } else { "Unknown" }
                Folder      = $FolderName
                Host        = $VM.VMHost.Name
                NumCPU      = $VM.NumCpu
                MemoryGB    = [math]::Round($VM.MemoryGB, 1)
                Notes       = $VM.Notes
            }
            $Results += $Result
        }
    }
}

end {
    Write-Host ""
    Write-Host "Rogue VM Scan Summary" -ForegroundColor Cyan
    Write-Host "=====================" -ForegroundColor Cyan
    Write-Host "Total VMs scanned:      $($AllVMs.Count)"
    Write-Host "Recently created:       $RecentCount" -ForegroundColor $(if ($RecentCount -gt 0) { "Yellow" } else { "Green" })
    Write-Host "Non-standard folders:   $NonStandardCount" -ForegroundColor $(if ($NonStandardCount -gt 0) { "Yellow" } else { "Green" })
    Write-Host "Suspicious names:       $SuspiciousNameCount" -ForegroundColor $(if ($SuspiciousNameCount -gt 0) { "Yellow" } else { "Green" })
    Write-Host ""

    if ($Results.Count -gt 0) {
        Write-Host "Cross-reference flagged VMs against change management records." -ForegroundColor Yellow
    }

    $Results
}
