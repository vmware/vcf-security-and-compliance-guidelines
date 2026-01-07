<#
    Script Name: VMware vCenter Security Settings Remediation Utility
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
    # vCenter Name (defaults to current connection)
    [Parameter(Mandatory=$false)]
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

# Import common functions
Import-Module "$PSScriptRoot\scg-common.psm1" -Force

# Default to current connection if Name not specified
if ([string]::IsNullOrEmpty($Name)) {
    if ($global:DefaultVIServers.Count -gt 0) {
        $Name = $global:DefaultVIServers[0].Name
    }
}

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
Log-Message "VMware vCenter Security Settings Remediation Utility 9.0.1" -Level "INFO"
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
Log-Message "script (lines 109-119). By doing so, you accept any and all risk this" -Level "ERROR"
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
try {
    $lockoutPolicy = Get-SsoLockoutPolicy

    # AutoUnlockIntervalSec must be exactly 0
    if ($lockoutPolicy.AutoUnlockIntervalSec -eq 0) {
        Log-Message "SSO AutoUnlockIntervalSec configured correctly ($($lockoutPolicy.AutoUnlockIntervalSec))" -Level "PASS"
    } else {
        try {
            Get-SsoLockoutPolicy | Set-SsoLockoutPolicy -AutoUnlockIntervalSec 0 | Out-Null
            Log-Message "SSO AutoUnlockIntervalSec updated ($($lockoutPolicy.AutoUnlockIntervalSec) -> 0)" -Level "UPDATE"
        } catch {
            Log-Message "Failed to set SSO AutoUnlockIntervalSec: $_" -Level "ERROR"
        }
    }

    # FailedAttemptIntervalSec: 900 or higher is more secure
    if ($lockoutPolicy.FailedAttemptIntervalSec -ge 900) {
        Log-Message "SSO FailedAttemptIntervalSec configured correctly ($($lockoutPolicy.FailedAttemptIntervalSec))" -Level "PASS"
    } else {
        try {
            Get-SsoLockoutPolicy | Set-SsoLockoutPolicy -FailedAttemptIntervalSec 900 | Out-Null
            Log-Message "SSO FailedAttemptIntervalSec updated ($($lockoutPolicy.FailedAttemptIntervalSec) -> 900)" -Level "UPDATE"
        } catch {
            Log-Message "Failed to set SSO FailedAttemptIntervalSec: $_" -Level "ERROR"
        }
    }

    # MaxFailedAttempts: 5 or fewer is more secure
    if ($lockoutPolicy.MaxFailedAttempts -le 5) {
        Log-Message "SSO MaxFailedAttempts configured correctly ($($lockoutPolicy.MaxFailedAttempts))" -Level "PASS"
    } else {
        try {
            Get-SsoLockoutPolicy | Set-SsoLockoutPolicy -MaxFailedAttempts 5 | Out-Null
            Log-Message "SSO MaxFailedAttempts updated ($($lockoutPolicy.MaxFailedAttempts) -> 5)" -Level "UPDATE"
        } catch {
            Log-Message "Failed to set SSO MaxFailedAttempts: $_" -Level "ERROR"
        }
    }
} catch {
    Log-Message "Failed to retrieve SSO Lockout Policy: $_" -Level "ERROR"
}

#####################
# Set SSO Password Policy
try {
    $passwordPolicy = Get-SsoPasswordPolicy

    # PasswordLifetimeDays must be exactly 9999
    if ($passwordPolicy.PasswordLifetimeDays -eq 9999) {
        Log-Message "SSO PasswordLifetimeDays configured correctly ($($passwordPolicy.PasswordLifetimeDays))" -Level "PASS"
    } else {
        try {
            Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -PasswordLifetimeDays 9999 | Out-Null
            Log-Message "SSO PasswordLifetimeDays updated ($($passwordPolicy.PasswordLifetimeDays) -> 9999)" -Level "UPDATE"
        } catch {
            Log-Message "Failed to set SSO PasswordLifetimeDays: $_" -Level "ERROR"
        }
    }

    # ProhibitedPreviousPasswordsCount: 5 or more is more secure
    if ($passwordPolicy.ProhibitedPreviousPasswordsCount -ge 5) {
        Log-Message "SSO ProhibitedPreviousPasswordsCount configured correctly ($($passwordPolicy.ProhibitedPreviousPasswordsCount))" -Level "PASS"
    } else {
        try {
            Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -ProhibitedPreviousPasswordsCount 5 | Out-Null
            Log-Message "SSO ProhibitedPreviousPasswordsCount updated ($($passwordPolicy.ProhibitedPreviousPasswordsCount) -> 5)" -Level "UPDATE"
        } catch {
            Log-Message "Failed to set SSO ProhibitedPreviousPasswordsCount: $_" -Level "ERROR"
        }
    }

    # MinLength: 15 or more is more secure
    if ($passwordPolicy.MinLength -ge 15) {
        Log-Message "SSO MinLength configured correctly ($($passwordPolicy.MinLength))" -Level "PASS"
    } else {
        try {
            Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -MinLength 15 | Out-Null
            Log-Message "SSO MinLength updated ($($passwordPolicy.MinLength) -> 15)" -Level "UPDATE"
        } catch {
            Log-Message "Failed to set SSO MinLength: $_" -Level "ERROR"
        }
    }

    # MaxLength: 64 or more is more secure
    if ($passwordPolicy.MaxLength -ge 64) {
        Log-Message "SSO MaxLength configured correctly ($($passwordPolicy.MaxLength))" -Level "PASS"
    } else {
        try {
            Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -MaxLength 64 | Out-Null
            Log-Message "SSO MaxLength updated ($($passwordPolicy.MaxLength) -> 64)" -Level "UPDATE"
        } catch {
            Log-Message "Failed to set SSO MaxLength: $_" -Level "ERROR"
        }
    }

    # MinNumericCount: 1 or more is more secure
    if ($passwordPolicy.MinNumericCount -ge 1) {
        Log-Message "SSO MinNumericCount configured correctly ($($passwordPolicy.MinNumericCount))" -Level "PASS"
    } else {
        try {
            Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -MinNumericCount 1 | Out-Null
            Log-Message "SSO MinNumericCount updated ($($passwordPolicy.MinNumericCount) -> 1)" -Level "UPDATE"
        } catch {
            Log-Message "Failed to set SSO MinNumericCount: $_" -Level "ERROR"
        }
    }

    # MinSpecialCharCount: 1 or more is more secure
    if ($passwordPolicy.MinSpecialCharCount -ge 1) {
        Log-Message "SSO MinSpecialCharCount configured correctly ($($passwordPolicy.MinSpecialCharCount))" -Level "PASS"
    } else {
        try {
            Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -MinSpecialCharCount 1 | Out-Null
            Log-Message "SSO MinSpecialCharCount updated ($($passwordPolicy.MinSpecialCharCount) -> 1)" -Level "UPDATE"
        } catch {
            Log-Message "Failed to set SSO MinSpecialCharCount: $_" -Level "ERROR"
        }
    }

    # MaxIdenticalAdjacentCharacters: 3 or fewer is more secure
    if ($passwordPolicy.MaxIdenticalAdjacentCharacters -le 3) {
        Log-Message "SSO MaxIdenticalAdjacentCharacters configured correctly ($($passwordPolicy.MaxIdenticalAdjacentCharacters))" -Level "PASS"
    } else {
        try {
            Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -MaxIdenticalAdjacentCharacters 3 | Out-Null
            Log-Message "SSO MaxIdenticalAdjacentCharacters updated ($($passwordPolicy.MaxIdenticalAdjacentCharacters) -> 3)" -Level "UPDATE"
        } catch {
            Log-Message "Failed to set SSO MaxIdenticalAdjacentCharacters: $_" -Level "ERROR"
        }
    }

    # MinAlphabeticCount: 2 or more is more secure
    if ($passwordPolicy.MinAlphabeticCount -ge 2) {
        Log-Message "SSO MinAlphabeticCount configured correctly ($($passwordPolicy.MinAlphabeticCount))" -Level "PASS"
    } else {
        try {
            Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -MinAlphabeticCount 2 | Out-Null
            Log-Message "SSO MinAlphabeticCount updated ($($passwordPolicy.MinAlphabeticCount) -> 2)" -Level "UPDATE"
        } catch {
            Log-Message "Failed to set SSO MinAlphabeticCount: $_" -Level "ERROR"
        }
    }

    # MinUppercaseCount: 1 or more is more secure
    if ($passwordPolicy.MinUppercaseCount -ge 1) {
        Log-Message "SSO MinUppercaseCount configured correctly ($($passwordPolicy.MinUppercaseCount))" -Level "PASS"
    } else {
        try {
            Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -MinUppercaseCount 1 | Out-Null
            Log-Message "SSO MinUppercaseCount updated ($($passwordPolicy.MinUppercaseCount) -> 1)" -Level "UPDATE"
        } catch {
            Log-Message "Failed to set SSO MinUppercaseCount: $_" -Level "ERROR"
        }
    }

    # MinLowercaseCount: 1 or more is more secure
    if ($passwordPolicy.MinLowercaseCount -ge 1) {
        Log-Message "SSO MinLowercaseCount configured correctly ($($passwordPolicy.MinLowercaseCount))" -Level "PASS"
    } else {
        try {
            Get-SsoPasswordPolicy | Set-SsoPasswordPolicy -MinLowercaseCount 1 | Out-Null
            Log-Message "SSO MinLowercaseCount updated ($($passwordPolicy.MinLowercaseCount) -> 1)" -Level "UPDATE"
        } catch {
            Log-Message "Failed to set SSO MinLowercaseCount: $_" -Level "ERROR"
        }
    }
} catch {
    Log-Message "Failed to retrieve SSO Password Policy: $_" -Level "ERROR"
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
                Log-Message "Distributed switch `'$switch`' is updated to disallow promiscuous mode ($value -> false)" -Level "UPDATE"
            }
            catch {
                Log-Message "Distributed switch `'$switch`' could not be updated ($value)" -Level "ERROR"
            }
        }

        $value = $switch | Get-VDSecurityPolicy | Select-Object -ExpandProperty MacChanges
        if ($value -eq $false) {
            Log-Message "Distributed switch `'$switch`' is not configured to allow MAC address changes ($value)" -Level "PASS"
        } else {
            try {
                $switch | Set-VDSecurityPolicy -MacChanges $false -Confirm:$false | Out-Null
                Log-Message "Distributed switch `'$switch`' is updated to disallow MAC address changes ($value -> false)" -Level "UPDATE"
            }
            catch {
                Log-Message "Distributed switch `'$switch`' could not be updated ($value)" -Level "ERROR"
            }
        }

        $value = $switch | Get-VDSecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
        if ($value -eq $false) {
            Log-Message "Distributed switch `'$switch`' is not configured to allow forged transmits ($value)" -Level "PASS"
        } else {
            try {
                $switch | Set-VDSecurityPolicy -ForgedTransmits $false -Confirm:$false | Out-Null
                Log-Message "Distributed switch `'$switch`' is updated to disallow forged transmits ($value -> false)" -Level "UPDATE"
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