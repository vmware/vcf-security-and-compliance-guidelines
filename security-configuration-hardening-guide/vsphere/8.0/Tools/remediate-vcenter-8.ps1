<#
    Script Name: VMware vCenter Security Settings Remediation Utility
    Copyright (C) 2024 Broadcom, Inc. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
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
    # vCenter Name
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$Name,
    # Output File Name
    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [string]$OutputFileName,
    # Accept-EULA
    [Parameter(Mandatory=$false)]
    [switch]$AcceptEULA,
    # Remediate distributed virtual network switches
    [Parameter(Mandatory=$false)]
    [switch]$RemediateDistributedSwitches = $false,
    # Skip safety checks
    [Parameter(Mandatory=$false)]
    [switch]$NoSafetyChecks = $false,
    # Skip safety checks except for appliances
    [Parameter(Mandatory=$false)]
    [switch]$NoSafetyChecksExceptAppliances = $false
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
Log-Message "VMware vCenter Security Settings Remediation Utility 803-20240625-01" -Level "INFO"
Log-Message "Remediation of $name started at $currentDateTime from $env:COMPUTERNAME by $env:USERNAME" -Level "INFO"

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
# By removing or commenting this section you accept any and all risk of running this script.
#
# This kit is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained
# in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided “AS IS.”
# Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein.
# Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for 
# review of requirements and effectiveness of implementations.
#
# You acknowledge that Broadcom is not responsible for the results of any actions taken by you or your organization
# based on the information provided in this kit, or through the execution of this script.
#
# Do not run this script in a production environment. It will change virtual switch settings, port groups, and numerous other settings
# that may cause operational issues. It may also set things that require host reboots.
#
# See the included documentation for more information.
#
Log-Message "This script should not be used in a production environment." -Level "ERROR"
Log-Message "It will change things that can cause operational issues." -Level "ERROR"
Log-Message "If you accept the risk, please remove or comment this section of the" -Level "ERROR"
Log-Message "script (lines 203-225). By doing so, you accept any and all risk this" -Level "ERROR"
Log-Message "script and these commands may pose to your environment." -Level "ERROR"
Exit

#####################
# Tests for SSO 
$scg_adv = @{
    
    'vpxd.event.syslog.enabled' = $true
    'config.log.level' = 'info'
    'VirtualCenter.VimPasswordExpirationInDays' = 30

}

foreach ($param in $scg_adv.GetEnumerator() )
{
    $value = (Get-AdvancedSetting -Entity $name "$($param.Name)").Value

    if ($value -eq $($param.Value)) {
        Log-Message "$($param.Name) configured correctly ($value)" -Level "PASS"
    } else {
        try {
            Get-AdvancedSetting -Entity $name -Name "$($param.Name)" | Set-AdvancedSetting -Value $($param.Value) -Confirm:$false | Out-Null
            Log-Message "$($param.Name) updated ($value -> $($param.Value))" -Level "UPDATE"
        } catch {
            Log-Message "Failed to set $($param.Name)`: $_" -Level "ERROR"
        }
    }
}

#####################
# Set etc.issue
$sample_banner = "****************************************************************************`n* Authorized users only. Actual or attempted unauthorized use of this      *`n* system is prohibited and may result in criminal, civil, security, or     *`n* administrative proceedings and/or penalties. Use of this information     *`n* system indicates consent to monitoring and recording, without notice     *`n* or permission. Users have no expectation of privacy. Any information     *`n* stored on or transiting this system, or obtained by monitoring and/or    *`n* recording, may be disclosed to law enforcement and/or used in accordance *`n* with Federal law, State statute, and organization policy. If you are not *`n* an authorized user of this system, exit the system at this time.         *`n****************************************************************************`n"
$old_banner = 'Platform Services Controller'

$value = (Get-AdvancedSetting -Entity $name -Name etc.issue | Select-Object -ExpandProperty Value)

$singleline = $value -replace '\r?\n', ' '
if ($value -match $old_banner) {
    try {
        Get-AdvancedSetting -Entity $name -Name etc.issue | Set-AdvancedSetting -Value $sample_banner -Confirm:$false | Out-Null
        Log-Message "etc.issue updated ($singleline -> $($sample_banner -replace '\r?\n', ' ')" -Level "UPDATE"
    }
    catch {
        Log-Message "Failed to set etc.issue`: $_" -Level "ERROR"
    }
} else {
    Log-Message "etc.issue configured with non-default content ($singleline)" -Level "PASS"
}

#####################
# Set SSO Lockout Configurations
$value = Get-SsoLockoutPolicy
if ($value.AutoUnlockIntervalSec -eq 0) {
    Log-Message "SSO AutoUnlockIntervalSec configured correctly ($($value.AutoUnlockIntervalSec))" -Level "PASS"
} else {
    try {
        Get-SsoLockoutPolicy | Set-SsoLockoutPolicy -AutoUnlockIntervalSec 0 | Out-Null
        Log-Message "SSO AutoUnlockIntervalSec updated ($($value.AutoUnlockIntervalSec) -> 0)" -Level "UPDATE"
    }
    catch {
        Log-Message "Failed to set SSO AutoUnlockIntervalSec`: $_" -Level "ERROR"
    }
}

if ($value.FailedAttemptIntervalSec -eq 900) {
    Log-Message "SSO FailedAttemptIntervalSec configured correctly ($($value.FailedAttemptIntervalSec))" -Level "PASS"
} else {
    try {
        Get-SsoLockoutPolicy | Set-SsoLockoutPolicy -FailedAttemptIntervalSec 900 | Out-Null
        Log-Message "SSO FailedAttemptIntervalSec updated ($($value.FailedAttemptIntervalSec) -> 900)" -Level "UPDATE"
    }
    catch {
        Log-Message "Failed to set SSO FailedAttemptIntervalSec`: $_" -Level "ERROR"
    }
}

if ($value.MaxFailedAttempts -eq 5) {
    Log-Message "SSO MaxFailedAttempts configured correctly ($($value.MaxFailedAttempts))" -Level "PASS"
} else {
    try {
        Get-SsoLockoutPolicy | Set-SsoLockoutPolicy -MaxFailedAttempts 5 | Out-Null
        Log-Message "SSO MaxFailedAttempts updated ($($value.MaxFailedAttempts) -> 5)" -Level "UPDATE"
    }
    catch {
        Log-Message "Failed to set SSO MaxFailedAttempts`: $_" -Level "ERROR"
    } 
}

#####################
# Test SSO Password Policy
$value = Get-SsoPasswordPolicy
if ($value.PasswordLifetimeDays -eq 9999) {
    Log-Message "SSO PasswordLifetimeDays configured correctly ($($value.PasswordLifetimeDays))" -Level "PASS"
} else {
    try {
        Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -PasswordLifetimeDays 9999 | Out-Null
        Log-Message "SSO PasswordLifetimeDays updated ($($value.PasswordLifetimeDays) -> 9999)" -Level "UPDATE"
    }
    catch {
        Log-Message "Failed to set SSO PasswordLifetimeDays`: $_" -Level "ERROR"
    }
}

if ($value.ProhibitedPreviousPasswordsCount -eq 5) {
    Log-Message "SSO ProhibitedPreviousPasswordsCount configured correctly ($($value.ProhibitedPreviousPasswordsCount))" -Level "PASS"
} else {
    try {
        Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -ProhibitedPreviousPasswordsCount 5 | Out-Null
        Log-Message "SSO ProhibitedPreviousPasswordsCount updated ($($value.ProhibitedPreviousPasswordsCount) -> 5)" -Level "UPDATE"
    }
    catch {
        Log-Message "Failed to set SSO ProhibitedPreviousPasswordsCount`: $_" -Level "ERROR"
    } 
}

if ($value.MinLength -ge 15) {
    Log-Message "SSO MinLength configured correctly ($($value.MinLength))" -Level "PASS"
} else {
    try {
        Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -MinLength 15 | Out-Null
        Log-Message "SSO MinLength updated ($($value.MinLength) -> 15)" -Level "UPDATE"
    }
    catch {
        Log-Message "Failed to set SSO MinLength`: $_" -Level "ERROR"
    }
}

if ($value.MaxLength -eq 64) {
    Log-Message "SSO MaxLength configured correctly ($($value.MaxLength))" -Level "PASS"
} else {
    try {
        Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -MaxLength 64 | Out-Null
        Log-Message "SSO MaxLength updated ($($value.MaxLength) -> 64)" -Level "UPDATE"
    }
    catch {
        Log-Message "Failed to set SSO MaxLength`: $_" -Level "ERROR"
    }
}

if ($value.MinNumericCount -eq 1) {
    Log-Message "SSO MinNumericCount configured correctly ($($value.MinNumericCount))" -Level "PASS"
} else {
    try {
        Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -MinNumericCount 1 | Out-Null
        Log-Message "SSO MinNumericCount updated ($($value.MinNumericCount) -> 1)" -Level "UPDATE"
    }
    catch {
        Log-Message "Failed to set SSO MinNumericCount`: $_" -Level "ERROR"
    }
}

if ($value.MinSpecialCharCount -eq 1) {
    Log-Message "SSO MinSpecialCharCount configured correctly ($($value.MinSpecialCharCount))" -Level "PASS"
} else {
    try {
        Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -MinSpecialCharCount 1 | Out-Null
        Log-Message "SSO MinSpecialCharCount updated ($($value.MinSpecialCharCount) -> 1)" -Level "UPDATE"
    }
    catch {
        Log-Message "Failed to set SSO MinSpecialCharCount`: $_" -Level "ERROR"
    }
}

if ($value.MaxIdenticalAdjacentCharacters -eq 3) {
    Log-Message "SSO MaxIdenticalAdjacentCharacters configured correctly ($($value.MaxIdenticalAdjacentCharacters))" -Level "PASS"
} else {
    try {
        Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -MaxIdenticalAdjacentCharacters 3 | Out-Null
        Log-Message "SSO MaxIdenticalAdjacentCharacters updated ($($value.MaxIdenticalAdjacentCharacters) -> 3)" -Level "UPDATE"
    }
    catch {
        Log-Message "Failed to set SSO MaxIdenticalAdjacentCharacters`: $_" -Level "ERROR"
    }
}

if ($value.MinAlphabeticCount -eq 2) {
    Log-Message "SSO MinAlphabeticCount configured correctly ($($value.MinAlphabeticCount))" -Level "PASS"
} else {
    try {
        Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -MinAlphabeticCount 2 | Out-Null
        Log-Message "SSO MinAlphabeticCount updated ($($value.MinAlphabeticCount) -> 2)" -Level "UPDATE"
    }
    catch {
        Log-Message "Failed to set SSO MinAlphabeticCount`: $_" -Level "ERROR"
    }
}

if ($value.MinUppercaseCount -eq 1) {
    Log-Message "SSO MinUppercaseCount configured correctly ($($value.MinUppercaseCount))" -Level "PASS"
} else {
    try {
        Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -MinUppercaseCount 1 | Out-Null
        Log-Message "SSO MinUppercaseCount updated ($($value.MinUppercaseCount) -> 1)" -Level "UPDATE"
    }
    catch {
        Log-Message "Failed to set SSO MinUppercaseCount`: $_" -Level "ERROR"
    }
}

if ($value.MinLowercaseCount -eq 1) {
    Log-Message "SSO MinLowercaseCount configured correctly ($($value.MinLowercaseCount))" -Level "PASS"
} else {
    try {
        Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -MinLowercaseCount 1 | Out-Null
        Log-Message "SSO MinLowercaseCount updated ($($value.MinLowercaseCount) -> 1)" -Level "UPDATE"
    }
    catch {
        Log-Message "Failed to set SSO MinLowercaseCount`: $_" -Level "ERROR"
    }
}

#####################
# Remediate Distributed Switches
if ($RemediateDistributedSwitches) {

    $switches = Get-VDSwitch

    foreach ($switch in $switches) {
        $value = $switch | Get-VDSecurityPolicy | Select-Object -ExpandProperty AllowPromiscuous
        if ($value -eq $false) {
            Log-Message "Distributed switch `'$switch`' is not configured to allow promiscuous mode ($value)" -Level "PASS"
        } else {
            try {
                $switch | Get-VDSecurityPolicy | Set-VDSecurityPolicy -AllowPromiscuous $false -Confirm:$false | Out-Null
                Log-Message "Distributed switch `'$switch`' is updated to allow promiscuous mode ($value)" -Level "UPDATE"
            }
            catch {
                Log-Message "Distributed switch `'$switch`' could not be updated ($value)" -Level "ERROR"
            }
        }

        $value = $switch | Get-VDSecurityPolicy | Select-Object -ExpandProperty MacChanges
        if ($value -eq $false) {
            Log-Message "Distributed switch `'$switch`' is configured to allow MAC address changes ($value)" -Level "PASS"
        } else {
            try {
                $switch | Set-VDSecurityPolicy -MacChanges $true -Confirm:$false | Out-Null
                Log-Message "Distributed switch `'$switch`' is updated to allow MAC address changes ($value -> true)" -Level "UPDATE"
            }
            catch {
                Log-Message "Distributed switch `'$switch`' could not be updated ($value)" -Level "ERROR"
            }
        }

        $value = $switch | Get-VDSecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
        if ($value -eq $false) {
            Log-Message "Distributed switch `'$switch`' is configured to allow forged transmits ($value)" -Level "PASS"
        } else {
            try {
                $switch | Set-VDSecurityPolicy -ForgedTransmits $true -Confirm:$false | Out-Null
                Log-Message "Distributed switch `'$switch`' is updated to allow forged transmits ($value -> true)" -Level "UPDATE"
            }
            catch {
                Log-Message "Distributed switch `'$switch`' could not be updated ($value)" -Level "ERROR"
            }
        }

        $value = $switch.ExtensionData.Config.LinkDiscoveryProtocolConfig | Select-Object -ExpandProperty Operation
        if ($value -eq "none") {
            Log-Message "Distributed switch `'$switch`' link discovery is configured correctly ($value)" -Level "PASS"
        } else {
            try {
                $view = Get-VDSwitch $switch | Get-View
                $ConfigSpec = New-Object VMware.Vim.VMwareDVSConfigSpec
                $ConfigSpec.LinkDiscoveryProtocolConfig = New-Object VMware.Vim.LinkDiscoveryProtocolConfig
                $ConfigSpec.LinkDiscoveryProtocolConfig.Protocol = 'cdp'
                $ConfigSpec.LinkDiscoveryProtocolConfig.Operation = 'none'
                $ConfigSpec.ConfigVersion = $view.Config.ConfigVersion
                $view.ReconfigureDvs_Task($ConfigSpec) | Out-Null
                Log-Message "Distributed switch `'$switch`' is updated to link discovery disabled ($value -> none)" -Level "UPDATE"
            }
            catch {
                Log-Message "Distributed switch `'$switch`' could not be updated ($value)" -Level "ERROR"
            }
        }

        $value = $switch.ExtensionData.Config.IpfixConfig | Select-Object -ExpandProperty CollectorIpAddress
        if (($value -eq "") -or ($null -eq $value)) {
            Log-Message "Distributed switch `'$switch`' NetFlow is configured correctly ($value)" -Level "PASS"
        } else {
            try {
                $view = Get-VDSwitch $switch | Get-View
                $ConfigSpec = New-Object VMware.Vim.VMwareDVSConfigSpec
                $ConfigSpec.IpfixConfig = New-Object VMware.Vim.VMwareIpfixConfig
                $ConfigSpec.IpfixConfig.CollectorIpAddress = ""
                $ConfigSpec.IpfixConfig.CollectorPort = "0"
                $ConfigSpec.IpfixConfig.ActiveFlowTimeout = "60"
                $ConfigSpec.IpfixConfig.IdleFlowTimeout = "15"
                $ConfigSpec.IpfixConfig.SamplingRate = "0"
                $ConfigSpec.IpfixConfig.InternalFlowsOnly = "false"
                $ConfigSpec.ConfigVersion = $view.Config.ConfigVersion
                $view.ReconfigureDvs_Task($ConfigSpec) | Out-Null
                Log-Message "Distributed switch `'$switch`' is updated to NetFlow disabled ($value -> null)" -Level "UPDATE"
            }
            catch {
                Log-Message "Distributed switch `'$switch`' could not be updated ($value)" -Level "ERROR"
            }
        }

        $portgroups = Get-VDPortgroup -VDSwitch $switch | Where-Object {$_.ExtensionData.Config.Uplink -ne "True"}
        foreach ($portgroup in $portgroups) {
            $value = $portgroup | Get-VDSecurityPolicy | Select-Object -ExpandProperty AllowPromiscuous
            if ($value -eq $false) {
                Log-Message "Distributed portgroup `'$portgroup`' is not configured to allow promiscuous mode ($value)" -Level "PASS"
            } else {
                try {
                    $portgroup | Get-VDSecurityPolicy | Set-VDSecurityPolicy -AllowPromiscuous $false -Confirm:$false | Out-Null
                    Log-Message "Distributed portgroup `'$portgroup`' is updated to disable promiscuous mode ($value -> false)" -Level "UPDATE"
                }
                catch {
                    Log-Message "Distributed portgroup `'$portgroup`' could not be updated ($value)" -Level "ERROR"
                }
            }
        
            $value = $portgroup | Get-VDSecurityPolicy | Select-Object -ExpandProperty MacChanges
            if ($value -eq $false) {
                Log-Message "Distributed portgroup `'$portgroup`' is not configured to allow MAC address changes ($value)" -Level "PASS"
            } else {
                try {
                    $portgroup | Get-VDSecurityPolicy | Set-VDSecurityPolicy -MacChanges $false -Confirm:$false | Out-Null
                    Log-Message "Distributed portgroup `'$portgroup`' is updated to disable MAC address changes ($value -> false)" -Level "UPDATE"
                }
                catch {
                    Log-Message "Distributed portgroup `'$portgroup`' could not be updated ($value)" -Level "ERROR"
                }
            }
        
            $value = $portgroup | Get-VDSecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
            if ($value -eq $false) {
                Log-Message "Distributed portgroup `'$portgroup`' is not configured to allow forged transmits ($value)" -Level "PASS"
            } else {
                try {
                    $portgroup | Get-VDSecurityPolicy | Set-VDSecurityPolicy -ForgedTransmits $false -Confirm:$false | Out-Null
                    Log-Message "Distributed portgroup `'$portgroup`' is updated to disable forged transmits ($value -> false)" -Level "UPDATE"
                }
                catch {
                    Log-Message "Distributed portgroup `'$portgroup`' could not be updated ($value)" -Level "ERROR"
                }
            }
     
            $value = $portgroup.ExtensionData.Config.Policy | Select-Object -ExpandProperty PortConfigResetAtDisconnect
            if ($value -eq $true) {
                Log-Message "Distributed portgroup `'$portgroup`' is configured to reset port configuration on disconnect ($value)" -Level "PASS"
            } else {
                try {
                    $view = Get-VDPortgroup $portgroup | Get-View
                    $ConfigSpec = New-Object VMware.Vim.DVPortgroupConfigSpec
                    $ConfigSpec.DefaultPortConfig = New-Object VMware.Vim.VMwareDVSPortSetting
                    $ConfigSpec.Policy = New-Object VMware.Vim.VMwareDVSPortgroupPolicy
                    $ConfigSpec.Policy.PortConfigResetAtDisconnect = $true
                    $ConfigSpec.ConfigVersion = $view.Config.ConfigVersion
                    $view.ReconfigureDVPortgroup_Task($ConfigSpec) | Out-Null
                    Log-Message "Distributed portgroup `'$portgroup`' is updated to reset port configuration on disconnect ($value -> true)" -Level "UPDATE"
                }
                catch {
                    Log-Message "Distributed portgroup `'$portgroup`' could not be updated ($value)" -Level "ERROR"
                }
            }

            $value = $portgroup.ExtensionData.Config.DefaultPortConfig.IpfixEnabled | Select-Object -ExpandProperty Value
            if ($value -eq $false) {
                Log-Message "Distributed portgroup `'$portgroup`' NetFlow is configured correctly ($value)" -Level "PASS"
            } else {
                try {
                    $view = Get-VDPortgroup $portgroup | Get-View
                    $ConfigSpec = New-Object VMware.Vim.DVPortgroupConfigSpec
                    $ConfigSpec.DefaultPortConfig = New-Object VMware.Vim.VMwareDVSPortSetting
                    $ConfigSpec.DefaultPortConfig.IpfixEnabled = New-Object VMware.Vim.BoolPolicy
                    $ConfigSpec.DefaultPortConfig.IpfixEnabled.Inherited = $false
                    $ConfigSpec.DefaultPortConfig.IpfixEnabled.Value = $false
                    $ConfigSpec.ConfigVersion = $view.Config.ConfigVersion
                    $view.ReconfigureDVPortgroup_Task($ConfigSpec) | Out-Null
                    Log-Message "Distributed portgroup `'$portgroup`' is updated to NetFlow disabled ($value -> false)" -Level "UPDATE"
                } catch {
                    Log-Message "Distributed portgroup `'$portgroup`' could not be updated ($value)" -Level "ERROR"
                }
            }

            # Test port group policies
            $valueObj = $portgroup.ExtensionData.Config.Policy | Select-Object VlanOverrideAllowed, UplinkTeamingOverrideAllowed, 
                        SecurityPolicyOverrideAllowed, MacManagementOverrideAllowed, BlockOverrideAllowed, ShapingOverrideAllowed, IpfixOverrideAllowed,
                        VendorConfigOverrideAllowed, LivePortMovingAllowed, NetworkResourcePoolOverrideAllowed, TrafficFilterOverrideAllowed
            $valueStr = ($valueObj.PSObject.Properties | ForEach-Object { "$($_.Name): $($_.Value)" }) -join ', '

            if (
                $valueObj.VlanOverrideAllowed -eq $false -and
                $valueObj.UplinkTeamingOverrideAllowed -eq $false -and
                $valueObj.SecurityPolicyOverrideAllowed -eq $false -and
                $valueObj.MacManagementOverrideAllowed -eq $false -and
                $valueObj.BlockOverrideAllowed -eq $true -and
                $valueObj.ShapingOverrideAllowed -eq $false -and
                $valueObj.IpfixOverrideAllowed -eq $false -and
                $valueObj.VendorConfigOverrideAllowed -eq $false -and
                $valueObj.LivePortMovingAllowed -eq $false -and
                $valueObj.NetworkResourcePoolOverrideAllowed -eq $false -and
                $valueObj.TrafficFilterOverrideAllowed -eq $false
            ) {
                Log-Message "Distributed portgroup `'$portgroup`' policies are configured correctly ($valueStr)" -Level "PASS"
            } else {
                try {
                    $view = Get-VDPortgroup $portgroup | Get-View
                    $ConfigSpec = New-Object VMware.Vim.DVPortgroupConfigSpec
                    $ConfigSpec.DefaultPortConfig = New-Object VMware.Vim.VMwareDVSPortSetting
                    $ConfigSpec.Policy = New-Object VMware.Vim.VMwareDVSPortgroupPolicy
                    $ConfigSpec.Policy.UplinkTeamingOverrideAllowed = $false
                    $ConfigSpec.Policy.BlockOverrideAllowed = $true
                    $ConfigSpec.Policy.LivePortMovingAllowed = $false
                    $ConfigSpec.Policy.VlanOverrideAllowed = $false
                    $ConfigSpec.Policy.SecurityPolicyOverrideAllowed = $false
                    $ConfigSpec.Policy.VendorConfigOverrideAllowed = $false
                    $ConfigSpec.Policy.ShapingOverrideAllowed = $false
                    $ConfigSpec.Policy.IpfixOverrideAllowed = $false
                    $ConfigSpec.Policy.TrafficFilterOverrideAllowed = $false
                    $ConfigSpec.ConfigVersion = $view.Config.ConfigVersion
                    $view.ReconfigureDVPortgroup_Task($ConfigSpec) | Out-Null
                    Log-Message "Distributed portgroup `'$portgroup`' is updated to secure policies ($valueStr)" -Level "UPDATE"
                }
                catch {
                    Log-Message "Distributed portgroup `'$portgroup`' could not be updated ($value)" -Level "ERROR"
                }
            }

            # Test MAC learning policy
            $value = $portgroup.ExtensionData.Config.DefaultPortConfig.MacManagementPolicy.MacLearningPolicy | Select-Object -ExpandProperty Enabled
            if ($value -eq $false) {
                Log-Message "Distributed portgroup `'$portgroup`' MAC learning is not enabled ($value)" -Level "PASS"
            } else {
                try {
                    $view = Get-VDPortgroup $portgroup | Get-View
                    $ConfigSpec = New-Object VMware.Vim.DVPortgroupConfigSpec
                    $ConfigSpec.DefaultPortConfig = New-Object VMware.Vim.VMwareDVSPortSetting
                    $ConfigSpec.DefaultPortConfig.MacManagementPolicy = New-Object VMware.Vim.DVSMacManagementPolicy
                    $ConfigSpec.DefaultPortConfig.MacManagementPolicy.MacLearningPolicy = New-Object VMware.Vim.DVSMacLearningPolicy
                    $ConfigSpec.DefaultPortConfig.MacManagementPolicy.MacLearningPolicy.Enabled = $false
                    $ConfigSpec.ConfigVersion = $view.Config.ConfigVersion
                    $view.ReconfigureDVPortgroup_Task($ConfigSpec) | Out-Null
                    Log-Message "Distributed portgroup `'$portgroup`' is updated to disable MAC learning ($value -> false)" -Level "UPDATE"
                }
                catch {
                    Log-Message "Distributed portgroup `'$portgroup`' could not be updated ($value)" -Level "ERROR"
                }
            }
        }
    }
}

    #####################
    # Test VCSA Settings for SSH
    $value = (Get-CisService -Name "com.vmware.appliance.access.ssh").get()
    if ($value -eq $true) {
        try {
            (Get-CisService -Name "com.vmware.appliance.access.ssh").set($false) | Out-Null
            Log-Message "vCenter Server Appliance SSH has been disabled ($value -> false)" -Level "UPDATE"
        } catch {
            Log-Message "vCenter Server Appliance SSH could not be updated ($value)" -Level "ERROR"
        }
    } else {
        Log-Message "vCenter Server Appliance does not have SSH enabled ($value)" -Level "PASS"
    }

#####################
# Test VCSA Settings for password policies
$value = (Get-CisService -Name "com.vmware.appliance.local_accounts.policy").get() | Select-Object -ExpandProperty max_days
if ($value -ne 9999) {
    try {
        (Get-CisService -Name "com.vmware.appliance.local_accounts.policy").set(@{max_days=9999}) | Out-Null
        Log-Message "vCenter Server Appliance local accounts max_days has been updated ($value -> 9999)" -Level "UPDATE"
    } catch {
        Log-Message "vCenter Server Appliance local accounts max_days could not be updated ($value)" -Level "ERROR"
    }
} else {
    Log-Message "vCenter Server Appliance local accounts max_days configured correctly ($value)" -Level "PASS"
}

Log-Message "Remediation of $name completed at $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")" -Level "INFO"
Log-Message "Re-run the corresponding audit script to verify the remediation." -Level "INFO"
Log-Message "Remember to address security controls that are not covered by these tools." -Level "INFO"