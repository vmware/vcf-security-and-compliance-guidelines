<#
    Script Name: VMware vSphere Security Settings Audit Utility
    Copyright (C) 2026 Broadcom, Inc. All rights reserved.
#>

<#
    This software is provided as is and any express or implied warranties,
    including, but not limited to, the implied warranties of merchantability and
    fitness for a particular purpose are disclaimed. In no event shall the
    copyright holder or contributors be liable for any direct, indirect,
    incidental, special, exemplary, or consequential damages (including, but not
    limited to, procurement of substitute goods or services; loss of use, data,
    or profits; or business interruption) however caused and on any theory of
    liability, whether in contract, strict liability, or tort (including
    negligence or otherwise) arising in any way out of the use of this software,
    even if advised of the possibility of such damage. The provider makes no
    claims, promises, or guarantees about the accuracy, completeness, or adequacy
    of this sample. Organizations should engage appropriate legal, business,
    technical, and audit expertise within their specific organization for review
    of requirements and effectiveness of implementations. You acknowledge that
    there may be performance or other considerations, and that this example may
    make assumptions which may not be valid in your environment or organization.
    This software is not supported by anyone.

    Make backups of all configurations and data before using this tool. Where
    prompted, monitor task progress directly in the vSphere Client.
#>

Param (
    # Output File Name
    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [string]$OutputDirName,
    # Accept-EULA
    [Parameter(Mandatory=$false)]
    [switch]$AcceptEULA,
    # Skip safety checks
    [Parameter(Mandatory=$false)]
    [switch]$NoSafetyChecks
)

# Import common functions
Import-Module "$PSScriptRoot\scg-common.psm1" -Force

# Wrapper functions for backward compatibility
function Log-Message {
    param (
        [Parameter(Mandatory=$false)][AllowEmptyString()][AllowNull()][string]$Message = "",
        [Parameter(Mandatory=$false)][ValidateSet("INFO", "WARNING", "ERROR", "EULA", "PASS", "FAIL", "UPDATE")][string]$Level = "INFO"
    )
    Write-Log -Message $Message -Level $Level -OutputFileName $OutputFileName
}

Function Accept-EULA() { Show-EULA -OutputFileName $OutputFileName }
Function Do-Pause() { Wait-UserInput -OutputFileName $OutputFileName }
Function Check-vCenter() { if (-not (Test-vCenterConnection -OutputFileName $OutputFileName)) { Exit } }
Function Check-Hosts() { if (-not (Test-HostsExist -OutputFileName $OutputFileName)) { Exit } }

#######################################################################################################

$currentDateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Log-Message "VMware vSphere Security Settings Audit Utility 9.0.1" -Level "INFO"
Log-Message "Audit started at $currentDateTime from $env:COMPUTERNAME by $env:USERNAME" -Level "INFO"

# Accept EULA and terms to continue
if ($false -eq $AcceptEULA) {
    Accept-EULA
    Log-Message "EULA accepted." -Level "INFO"
} else {
    Log-Message "EULA accepted." -Level "INFO"
}

# Safety checks
if ($false -eq $NoSafetyChecks) {
    Check-vCenter
    Check-Hosts
} else {
    Log-Message "Safety checks skipped." -Level "INFO"
}

#####################
# Test to see if the output directory exists
if (!(Test-Path -Path $OutputDirName -PathType Container)) {
    Log-Message "The directory '$OutputDirName' does not exist. Please create it and try again." -Level "ERROR"
    exit 1
}

#####################
# Test to see if the output directory is empty
if ((Get-ChildItem -Path $OutputDirName -Force | Measure-Object).Count -ne 0) {
    Log-Message "The directory '$OutputDirName' is not empty. Please empty it and try again." -Level "ERROR"
    exit 1
}

#####################
# Read the VMs and ESX hosts
try {
    $vms = Get-VM -ErrorAction Stop | Sort-Object -Property Name
    Log-Message "Found $($vms.Count) virtual machines to audit." -Level "INFO"
}
catch {
    Log-Message "Failed to retrieve virtual machines: $_" -Level "ERROR"
    exit 1
}

try {
    $hosts = Get-VMHost -ErrorAction Stop | Sort-Object -Property Name
    Log-Message "Found $($hosts.Count) ESX hosts to audit." -Level "INFO"
}
catch {
    Log-Message "Failed to retrieve ESX hosts: $_" -Level "ERROR"
    exit 1
}

#####################
# Run the audits
foreach ($vm in $vms) {
    try {
        & "$PSScriptRoot\audit-vm-9.ps1" -name $vm -AcceptEULA -NoSafetyChecksExceptAppliances -OutputFileName "$OutputDirName\$($vm).txt" -ErrorAction Stop
    }
    catch {
        Log-Message "Failed to audit VM '$vm': $_" -Level "ERROR"
    }
}

foreach ($esxi in $hosts) {
    try {
        & "$PSScriptRoot\audit-esx-9.ps1" -name $esxi -AcceptEULA -NoSafetyChecks -OutputFileName "$OutputDirName\$($esxi).txt" -ErrorAction Stop
    }
    catch {
        Log-Message "Failed to audit ESX host '$esxi': $_" -Level "ERROR"
    }
}

$name = $global:DefaultVIServers.Name
try {
    & "$PSScriptRoot\audit-vcenter-9.ps1" -Name $name -AcceptEULA -NoSafetyChecks -OutputFileName "$OutputDirName\$($global:DefaultVIServers.Name).txt" -ErrorAction Stop
}
catch {
    Log-Message "Failed to audit vCenter '$name': $_" -Level "ERROR"
}
