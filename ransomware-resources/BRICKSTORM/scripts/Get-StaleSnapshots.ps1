<#
.SYNOPSIS
    Audits VM snapshots for age and size to identify stale snapshots.

.DESCRIPTION
    Scans all VMs in connected vCenter(s) for snapshots and reports:
    - Snapshot age (days since creation)
    - Snapshot size (GB)
    - Parent VM name and power state
    - Snapshot creator (if available in events)

    Stale snapshots are a security risk: they may contain outdated credentials,
    consume storage, and provide attackers with point-in-time system states
    for offline analysis.

.PARAMETER AgeThresholdDays
    Snapshots older than this value (in days) are flagged as STALE.
    Default: 7 days.

.PARAMETER SizeThresholdGB
    Snapshots larger than this value (in GB) are flagged as LARGE.
    Default: 50 GB.

.PARAMETER IncludeAll
    Include all snapshots in output, not just those exceeding thresholds.

.EXAMPLE
    # Find stale snapshots (default: older than 7 days)
    .\Get-StaleSnapshots.ps1

.EXAMPLE
    # Flag snapshots older than 30 days
    .\Get-StaleSnapshots.ps1 -AgeThresholdDays 30

.EXAMPLE
    # Export all snapshots to CSV for review
    .\Get-StaleSnapshots.ps1 -IncludeAll | Export-Csv -Path snapshots.csv -NoTypeInformation

.NOTES
    Reference: BRICKSTORM Defense Checklist - Section 4.4 Infrastructure Hygiene
    Requirements: VMware PowerCLI, Connection to vCenter
#>

[CmdletBinding()]
param (
    [Parameter()]
    [int]$AgeThresholdDays = 7,

    [Parameter()]
    [int]$SizeThresholdGB = 50,

    [Parameter()]
    [switch]$IncludeAll
)

function Get-StaleSnapshots {
    [CmdletBinding()]
    param (
        [int]$AgeThreshold,
        [int]$SizeThreshold,
        [switch]$All
    )

    begin {
        Write-Host "Scanning for VM snapshots..." -ForegroundColor Cyan
        $Now = Get-Date
        $Results = @()
        $StaleCount = 0
        $LargeCount = 0
    }

    process {
        # Get all VMs with snapshots
        $VMsWithSnapshots = Get-VM | Where-Object { $_.ExtensionData.Snapshot }

        if (-not $VMsWithSnapshots) {
            Write-Host "No snapshots found." -ForegroundColor Green
            return
        }

        foreach ($VM in $VMsWithSnapshots) {
            $Snapshots = Get-Snapshot -VM $VM

            foreach ($Snap in $Snapshots) {
                $AgeDays = [math]::Round(($Now - $Snap.Created).TotalDays, 1)
                $SizeGB = [math]::Round($Snap.SizeGB, 2)

                # Determine flags
                $Flags = @()
                if ($AgeDays -gt $AgeThreshold) {
                    $Flags += "STALE"
                    $StaleCount++
                }
                if ($SizeGB -gt $SizeThreshold) {
                    $Flags += "LARGE"
                    $LargeCount++
                }

                $Status = if ($Flags.Count -gt 0) { $Flags -join "," } else { "OK" }

                $Result = [PSCustomObject]@{
                    Status       = $Status
                    VMName       = $VM.Name
                    SnapshotName = $Snap.Name
                    Created      = $Snap.Created
                    AgeDays      = $AgeDays
                    SizeGB       = $SizeGB
                    PowerState   = $VM.PowerState
                    Description  = $Snap.Description
                    IsCurrent    = $Snap.IsCurrent
                    ParentSnapshot = if ($Snap.Parent) { $Snap.Parent.Name } else { "-" }
                }

                # Output based on filter preference
                if ($All -or $Flags.Count -gt 0) {
                    $Results += $Result
                }
            }
        }
    }

    end {
        # Summary
        $TotalSnapshots = ($VMsWithSnapshots | ForEach-Object { Get-Snapshot -VM $_ }).Count
        Write-Host ""
        Write-Host "Snapshot Audit Summary" -ForegroundColor Cyan
        Write-Host "======================" -ForegroundColor Cyan
        Write-Host "Total snapshots:     $TotalSnapshots"
        Write-Host "Stale (>$AgeThreshold days):    $StaleCount" -ForegroundColor $(if ($StaleCount -gt 0) { "Yellow" } else { "Green" })
        Write-Host "Large (>$SizeThreshold GB):     $LargeCount" -ForegroundColor $(if ($LargeCount -gt 0) { "Yellow" } else { "Green" })
        Write-Host ""

        if ($StaleCount -gt 0 -or $LargeCount -gt 0) {
            Write-Host "Review flagged snapshots and delete if no longer needed." -ForegroundColor Yellow
            Write-Host "Stale snapshots may contain outdated credentials or provide" -ForegroundColor Yellow
            Write-Host "attackers with point-in-time system states for offline analysis." -ForegroundColor Yellow
        }

        # Return results for pipeline
        $Results
    }
}

# Main execution
Get-StaleSnapshots -AgeThreshold $AgeThresholdDays -SizeThreshold $SizeThresholdGB -All:$IncludeAll
