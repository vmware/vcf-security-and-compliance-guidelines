<#
.SYNOPSIS
    Detects VM cloning operations that may indicate credential extraction attacks.

.DESCRIPTION
    BRICKSTORM operators clone VMs (especially Domain Controllers and password vaults)
    to extract credentials offline. The attack pattern is:
    1. Clone the target VM
    2. Extract NTDS.dit or other credential stores
    3. Delete the clone to hide evidence

    This script identifies:
    - Recent VM cloning events
    - Clones during suspicious hours (01:00-10:00 UTC)
    - Clone-then-delete patterns (credential extraction signature)
    - Clones of sensitive VMs (DCs, vaults, CAs)

.PARAMETER Hours
    Number of hours to look back for events. Default: 168 (7 days)

.PARAMETER MaxSamples
    Maximum number of events to retrieve. Default: 10000

.PARAMETER SuspiciousStartUTC
    Start of suspicious activity window (UTC hour). Default: 1

.PARAMETER SuspiciousEndUTC
    End of suspicious activity window (UTC hour). Default: 10

.EXAMPLE
    # Check last 7 days with default settings
    .\Get-VMCloneEvents.ps1

.EXAMPLE
    # Check last 30 days
    .\Get-VMCloneEvents.ps1 -Hours 720

.EXAMPLE
    # Export to CSV for analysis
    .\Get-VMCloneEvents.ps1 | Export-Csv -Path clone-events.csv -NoTypeInformation

.NOTES
    Reference: BRICKSTORM Defense Guide - VM Cloning Operations
    Requirements: VMware PowerCLI, Connection to vCenter

    Sensitive VM patterns: *DC*, *domain*, *vault*, *password*, *cred*, *CA*, *cert*
    Attackers typically operate during 01:00-10:00 UTC.
#>

[CmdletBinding()]
param (
    [Parameter()]
    [int]$Hours = 168,

    [Parameter()]
    [int]$MaxSamples = 10000,

    [Parameter()]
    [int]$SuspiciousStartUTC = 1,

    [Parameter()]
    [int]$SuspiciousEndUTC = 10
)

begin {
    Write-Host "Scanning for VM Clone Events..." -ForegroundColor Cyan
    $Results = @()
    $StartTime = (Get-Date).AddHours(-$Hours)

    # Patterns indicating sensitive VMs
    $SensitivePatterns = @('*DC*', '*domain*', '*vault*', '*password*', '*cred*', '*CA*', '*cert*', '*key*', '*secret*')
}

process {
    # Get clone events
    $CloneEvents = Get-VIEvent -MaxSamples $MaxSamples -Start $StartTime |
        Where-Object { $_.FullFormattedMessage -like "*clone*" -or $_ -is [VMware.Vim.VmClonedEvent] }

    # Get removal events for correlation
    $RemovalEvents = Get-VIEvent -MaxSamples $MaxSamples -Start $StartTime |
        Where-Object { $_ -is [VMware.Vim.VmRemovedEvent] }

    # Build removal lookup by VM name
    $RemovedVMs = @{}
    foreach ($Removal in $RemovalEvents) {
        $VMName = $Removal.Vm.Name
        if (-not $RemovedVMs.ContainsKey($VMName)) {
            $RemovedVMs[$VMName] = @()
        }
        $RemovedVMs[$VMName] += $Removal.CreatedTime
    }

    foreach ($Event in $CloneEvents) {
        $Flags = @()
        $EventTimeUTC = $Event.CreatedTime.ToUniversalTime()
        $HourUTC = $EventTimeUTC.Hour

        # Extract VM name from event
        $VMName = if ($Event.Vm) { $Event.Vm.Name } else { "Unknown" }
        $SourceVM = $Event.FullFormattedMessage -replace '.*from\s+(\S+).*', '$1'

        # Check 1: Suspicious hours (01:00-10:00 UTC)
        if ($HourUTC -ge $SuspiciousStartUTC -and $HourUTC -le $SuspiciousEndUTC) {
            $Flags += "SUSPICIOUS-HOURS"
        }

        # Check 2: Sensitive VM target
        foreach ($Pattern in $SensitivePatterns) {
            if ($SourceVM -like $Pattern -or $VMName -like $Pattern) {
                $Flags += "SENSITIVE-TARGET"
                break
            }
        }

        # Check 3: Clone-then-delete pattern
        if ($RemovedVMs.ContainsKey($VMName)) {
            foreach ($RemovalTime in $RemovedVMs[$VMName]) {
                $TimeDiff = ($RemovalTime - $Event.CreatedTime).TotalHours
                if ($TimeDiff -gt 0 -and $TimeDiff -lt 24) {
                    $Flags += "CLONE-AND-BURN"
                    break
                }
            }
        }

        # Check 4: VSPHERE.LOCAL\Administrator usage
        if ($Event.UserName -like "*Administrator*" -and $Event.UserName -like "*VSPHERE.LOCAL*") {
            $Flags += "BUILTIN-ADMIN"
        }

        $Status = if ($Flags.Count -gt 0) { $Flags -join "," } else { "OK" }

        $Result = [PSCustomObject]@{
            Status       = $Status
            TimeLocal    = $Event.CreatedTime
            TimeUTC      = $EventTimeUTC
            User         = $Event.UserName
            VMName       = $VMName
            Message      = $Event.FullFormattedMessage
            RiskScore    = $Flags.Count
        }
        $Results += $Result
    }
}

end {
    # Sort by risk score descending
    $Results = $Results | Sort-Object RiskScore -Descending

    $HighRisk = ($Results | Where-Object { $_.RiskScore -ge 2 }).Count
    $MediumRisk = ($Results | Where-Object { $_.RiskScore -eq 1 }).Count

    Write-Host ""
    Write-Host "VM Clone Event Summary" -ForegroundColor Cyan
    Write-Host "======================" -ForegroundColor Cyan
    Write-Host "Total clone events:     $($Results.Count)"
    Write-Host "High risk (2+ flags):   $HighRisk" -ForegroundColor $(if ($HighRisk -gt 0) { "Red" } else { "Green" })
    Write-Host "Medium risk (1 flag):   $MediumRisk" -ForegroundColor $(if ($MediumRisk -gt 0) { "Yellow" } else { "Green" })
    Write-Host ""

    if ($HighRisk -gt 0) {
        Write-Host "HIGH RISK events detected. Investigate immediately." -ForegroundColor Red
        Write-Host "CLONE-AND-BURN pattern indicates credential extraction attack." -ForegroundColor Red
    }

    $Results
}
