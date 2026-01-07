<#
    Module Name: scg-common
    Description: Common functions for VMware vSphere Security Configuration Guide 9.0 scripts
    Copyright (C) 2026 Broadcom, Inc. All rights reserved.
#>

#####################
# Log to both screen and file
function Write-Log {
    param (
        [Parameter(Mandatory=$false)]
        [AllowEmptyString()]
        [AllowNull()]
        [string]$Message = "",

        [Parameter(Mandatory=$false)]
        [ValidateSet("INFO", "WARNING", "ERROR", "EULA", "PASS", "FAIL", "UPDATE")]
        [string]$Level = "INFO",

        [Parameter(Mandatory=$false)]
        [string]$OutputFileName
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$Level] $Message"

    # Output to screen
    switch ($Level) {
        "INFO"    { Write-Host $logEntry -ForegroundColor White }
        "WARNING" { Write-Host $logEntry -ForegroundColor Yellow }
        "ERROR"   { Write-Host $logEntry -ForegroundColor Red }
        "EULA"    { Write-Host $logEntry -ForegroundColor Cyan }
        "PASS"    { Write-Host $logEntry -ForegroundColor Gray }
        "FAIL"    { Write-Host $logEntry -ForegroundColor Yellow }
        "UPDATE"  { Write-Host $logEntry -ForegroundColor Green }
    }

    # Append to file
    if ($OutputFileName) {
        $logEntry | Out-File -FilePath $OutputFileName -Append
    }
}

#####################
# Accept EULA and terms to continue
Function Show-EULA {
    param (
        [Parameter(Mandatory=$false)]
        [string]$OutputFileName
    )

    Write-Log "This software is provided as is and any express or implied warranties, including," -Level "EULA" -OutputFileName $OutputFileName
    Write-Log "but not limited to, the implied warranties of merchantability and fitness for a particular" -Level "EULA" -OutputFileName $OutputFileName
    Write-Log "purpose are disclaimed. In no event shall the copyright holder or contributors be liable" -Level "EULA" -OutputFileName $OutputFileName
    Write-Log "for any direct, indirect, incidental, special, exemplary, or consequential damages (including," -Level "EULA" -OutputFileName $OutputFileName
    Write-Log "but not limited to, procurement of substitute goods or services; loss of use, data, or" -Level "EULA" -OutputFileName $OutputFileName
    Write-Log "profits; or business interruption) however caused and on any theory of liability, whether" -Level "EULA" -OutputFileName $OutputFileName
    Write-Log "in contract, strict liability, or tort (including negligence or otherwise) arising in any" -Level "EULA" -OutputFileName $OutputFileName
    Write-Log "way out of the use of this software, even if advised of the possibility of such damage." -Level "EULA" -OutputFileName $OutputFileName
    Write-Log "The provider makes no claims, promises, or guarantees about the accuracy, completeness, or" -Level "EULA" -OutputFileName $OutputFileName
    Write-Log "adequacy of this sample. Organizations should engage appropriate legal, business, technical," -Level "EULA" -OutputFileName $OutputFileName
    Write-Log "and audit expertise within their specific organization for review of requirements and" -Level "EULA" -OutputFileName $OutputFileName
    Write-Log "effectiveness of implementations. You acknowledge that there may be performance or other" -Level "EULA" -OutputFileName $OutputFileName
    Write-Log "considerations, and that this example may make assumptions which may not be valid in your" -Level "EULA" -OutputFileName $OutputFileName
    Write-Log "environment or organization." -Level "EULA" -OutputFileName $OutputFileName
    Write-Log "" -Level "EULA" -OutputFileName $OutputFileName
    Write-Log "Press any character key to accept all terms and risk. Use CTRL+C to exit." -Level "EULA" -OutputFileName $OutputFileName

    $null = $host.UI.RawUI.FlushInputBuffer()
    do {
        $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    } while ($key.Character -eq [char]0)
}

#####################
# Pause for user input
Function Wait-UserInput {
    param (
        [Parameter(Mandatory=$false)]
        [string]$OutputFileName
    )

    Write-Log "Check the vSphere Client to make sure all tasks have completed, then press any character key." -Level "INFO" -OutputFileName $OutputFileName
    $null = $host.UI.RawUI.FlushInputBuffer()
    do {
        $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    } while ($key.Character -eq [char]0)
}

#####################
# Check to see if we are attached to a vCenter Server
Function Test-vCenterConnection {
    param (
        [Parameter(Mandatory=$false)]
        [string]$OutputFileName
    )

    if ($global:DefaultVIServers.Count -lt 1) {
        Write-Log "Please connect to a vCenter Server (use Connect-VIServer) prior to running this script. Thank you." -Level "ERROR" -OutputFileName $OutputFileName
        return $false
    }

    if ($global:DefaultVIServers.Count -gt 1) {
        Write-Log "Connect to a single vCenter Server (use Connect-VIServer) prior to running this script." -Level "ERROR" -OutputFileName $OutputFileName
        return $false
    }

    return $true
}

#####################
# Check to see if we have hosts attached
Function Test-HostsExist {
    param (
        [Parameter(Mandatory=$false)]
        [string]$OutputFileName
    )

    $ESX = Get-VMHost
    if ($ESX.Count -lt 1) {
        Write-Log "No ESX hosts found. Please ensure hosts are connected to vCenter." -Level "ERROR" -OutputFileName $OutputFileName
        return $false
    }

    return $true
}

# Export functions
Export-ModuleMember -Function Write-Log, Show-EULA, Wait-UserInput, Test-vCenterConnection, Test-HostsExist
