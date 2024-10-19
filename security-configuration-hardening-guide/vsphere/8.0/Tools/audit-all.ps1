<#
    Script Name: VMware vSphere Security Settings Audit Utility

    SOFTWARE LICENSE AGREEMENT
    ==========================
    Copyright (c) CA, Inc. All rights reserved.

    You are hereby granted a non-exclusive, worldwide, royalty-free license under CA, Inc.’s copyrights to use,
    copy, modify, and distribute this software in source code or binary form for use in connection with CA, Inc. products.

    This copyright notice shall be included in all copies or substantial portions of the software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
    TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
    THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
    CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
    DEALINGS IN THE SOFTWARE.

    DISCLAIMER
    ==========

    This software is intended to provide general guidance for organizations that
    are considering Broadcom solutions. The information contained in this document
    is for educational and informational purposes only. This repository is not intended
    to provide advice and is provided “AS IS.” Broadcom makes no claims, promises, or
    guarantees about the accuracy, completeness, or adequacy of the information contained
    herein. Organizations should engage appropriate legal, business, technical, and audit
    expertise within their specific organization for review of requirements and
    effectiveness of implementations.

    This material is provided as is and any express or implied warranties, including,
    but not limited to, the implied warranties of merchantability and fitness for a
    particular purpose are disclaimed. In no event shall the copyright holder or
    contributors be liable for any direct, indirect, incidental, special, exemplary,
    or consequential damages (including, but not limited to, procurement of substitute
    goods or services; loss of use, data, or profits; or business interruption) however
    caused and on any theory of liability, whether in contract, strict liability, or
    tort (including negligence or otherwise) arising in any way out of the use of this
    software, even if advised of the possibility of such damage. The provider makes no
    claims, promises, or guarantees about the accuracy, completeness, or adequacy of this
    sample. Organizations should engage appropriate legal, business, technical, and audit
    expertise within their specific organization for review of requirements and
    effectiveness of implementations. You acknowledge that there may be performance or
    other considerations, and that these examples may make assumptions which may
    not be valid in your environment or organization.

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

#####################
# Log to both screen and file
function Log-Message {
    param (
        [Parameter(Mandatory=$false)]
        [AllowEmptyString()]
        [AllowNull()]
        [string]$Message = "",

        [Parameter(Mandatory=$false)]
        [ValidateSet("INFO", "WARNING", "ERROR", "EULA", "PASS", "FAIL", "UPDATE")]
        [string]$Level = "INFO"
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
Function Accept-EULA() {
    Log-Message "This software is provided as is and any express or implied warranties, including," -Level "EULA"
    Log-Message "but not limited to, the implied warranties of merchantability and fitness for a particular" -Level "EULA"
    Log-Message "purpose are disclaimed. In no event shall the copyright holder or contributors be liable" -Level "EULA"
    Log-Message "for any direct, indirect, incidental, special, exemplary, or consequential damages (including," -Level "EULA"
    Log-Message "but not limited to, procurement of substitute goods or services; loss of use, data, or" -Level "EULA"
    Log-Message "profits; or business interruption) however caused and on any theory of liability, whether" -Level "EULA"
    Log-Message "in contract, strict liability, or tort (including negligence or otherwise) arising in any" -Level "EULA"
    Log-Message "way out of the use of this software, even if advised of the possibility of such damage." -Level "EULA"
    Log-Message "The provider makes no claims, promises, or guarantees about the accuracy, completeness, or" -Level "EULA"
    Log-Message "adequacy of this sample. Organizations should engage appropriate legal, business, technical," -Level "EULA"
    Log-Message "and audit expertise within their specific organization for review of requirements and" -Level "EULA"
    Log-Message "effectiveness of implementations. You acknowledge that there may be performance or other" -Level "EULA"
    Log-Message "considerations, and that this example may make assumptions which may not be valid in your" -Level "EULA"
    Log-Message "environment or organization." -Level "EULA"
    Log-Message "" -Level "EULA"
    Log-Message "Press any key to accept all terms and risk. Use CTRL+C to exit." -Level "EULA"

    $null = $host.UI.RawUI.FlushInputBuffer()
    while ($true) {
        $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        if ($key.Character -match '[a-zA-Z0-9 ]') {
            break
        }
    }
}

Function Do-Pause() {
    Log-Message "Check the vSphere Client to make sure all tasks have completed, then press a key." -Level "INFO"
    $null = $host.UI.RawUI.FlushInputBuffer()
    while ($true) {
        $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        if ($key.Character -match '[a-zA-Z0-9 ]') {
            break
        }
    }
}

#####################
# Check to see if we have the required version of VMware.PowerCLI
Function Check-PowerCLI() {
    $installedVersion = (Get-InstalledModule -Name 'VMware.PowerCLI' -AllVersions -ErrorAction SilentlyContinue).Version | Sort-Object -Desc | Select-Object -First 1
    if ('13.3.0' -gt $installedVersion) {
        Log-Message "This script requires PowerCLI 13.3 or newer. Current version is $installedVersion" -Level "ERROR"
        Log-Message "Instructions for installation & upgrade can be found at https://developer.vmware.com/powercli" -Level "ERROR"
        Log-Message "Some installations of PowerCLI cannot be detected. Use -NoSafetyChecks if you are sure." -Level "ERROR"
        Exit
    }
}

#####################
# Check to see if we are attached to a supported vCenter Server
Function Check-vCenter() {
    if ($global:DefaultVIServers.Count -lt 1) {
        Log-Message "Please connect to a vCenter Server (use Connect-VIServer) prior to running this script. Thank you." -Level "ERROR"
        Exit
    }

    if (($global:DefaultVIServers.Count -lt 1) -or ($global:DefaultVIServers.Count -gt 1)) {
        Log-Message "Connect to a single vCenter Server (use Connect-VIServer) prior to running this script." -Level "ERROR"
        Exit
    }

    $vcVersion = $global:DefaultVIServers.Version
    if (($vcVersion -lt '8.0.3') -or ($vcVersion -gt '8.0.3')) {
        Log-Message "vCenter Server is not the correct version for this script." -Level "ERROR"
        Exit
    }
}

#####################
# Check to see if we are attached to supported hosts. Older hosts might work but things change.
Function Check-Hosts() {
    $ESXi = Get-VMHost
    foreach ($hostVersion in $ESXi.Version) {
        if (($hostVersion -lt '8.0.3') -or ($hostVersion -gt '8.0.3')) {
            Log-Message "This script requires vSphere 8.0.3 throughout the environment." -Level "ERROR"
            Log-Message "There is at least one host attached that is downlevel ($hostVersion). Exiting." -Level "ERROR"
            Exit
        }
    }    
}

#######################################################################################################

$currentDateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Log-Message "VMware vSphere Security Settings Audit Utility 803-20240625-01" -Level "INFO"
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
    Check-PowerCLI
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
# Read the ESXi host into objects and views once to save time & resources
$vms = Get-VM | Sort-Object -Property Name
$hosts = Get-VMHost | Sort-Object -Property Name

#####################
# Run the audits
foreach ($vm in $vms) {
    ./audit-vm-8.ps1 -name $vm -AcceptEULA -NoSafetyChecksExceptAppliances -OutputFileName "$OutputDirName\$($vm).txt"
}

foreach ($esxi in $hosts) {
    .\audit-esxi-8.ps1 -name $esxi -AcceptEULA -NoSafetyChecks -OutputFileName "$OutputDirName\$($esxi).txt"
}

$name = $global:DefaultVIServers.Name
.\audit-vcenter-8.ps1 -Name $name -AcceptEULA -NoSafetyChecks -OutputFileName "$OutputDirName\$($global:DefaultVIServers.Name).txt"
