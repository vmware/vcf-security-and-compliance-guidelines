<#
    Script Name: VMware vCenter Security Settings Audit Utility
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
    # Skip safety checks
    [Parameter(Mandatory=$false)]
    [switch]$NoSafetyChecks = $false
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
    while ($Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")) {
            break
    }
}

Function Do-Pause() {
    Log-Message "Check the vSphere Client to make sure all tasks have completed, then press a key." -Level "INFO"
    $null = $host.UI.RawUI.FlushInputBuffer()
    while ($Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")) {
            break
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
Log-Message "VMware vCenter Security Settings Audit Utility 803-20241115-01" -Level "INFO"
Log-Message "Audit of $name started at $currentDateTime from $env:COMPUTERNAME by $env:USERNAME" -Level "INFO"

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
# Tests for SSO 
$scg_adv = @{
    
    'vpxd.event.syslog.enabled' = $true
    'config.log.level' = 'info'
    'VirtualCenter.VimPasswordExpirationInDays' = 30

}

foreach ($param in $scg_adv.GetEnumerator() )
{
    $value = (Get-AdvancedSetting -Entity $global:DefaultVIServers.Name "$($param.Name)").Value

    if ($value -eq $($param.Value)) {
        Log-Message "$($param.Name) configured correctly ($value)" -Level "PASS"
    } else {
        Log-Message "$($param.Name) not configured correctly ($value)" -Level "FAIL"
    }
}

#####################
# Tests for things that should not be set a certain way
$scg_not = @{

    'etc.issue' = 'Platform Services Controller' # Just test to see if the stock message is there.

}

foreach ($param in $scg_not.GetEnumerator() )
{
    $value = (Get-AdvancedSetting -Entity $global:DefaultVIServers.Name -Name "$($param.Name)" | Select-Object -ExpandProperty Value)

    $singleline = $value -replace '\r?\n', ' '
    if ($value -match $($param.Value)) {
        Log-Message "$($param.Name) contains the default message ($singleline)" -Level "FAIL"
    } else {
        Log-Message "$($param.Name) does not contain the default message ($singleline)" -Level "PASS"
    }
}

#####################
# Test SSO Lockout Configurations
$value = Get-SsoLockoutPolicy
if ($value.AutoUnlockIntervalSec -eq 0) {
    Log-Message "SSO AutoUnlockIntervalSec configured correctly ($($value.AutoUnlockIntervalSec))" -Level "PASS"
} else {
    Log-Message "SSO AutoUnlockIntervalSec not configured correctly ($($value.AutoUnlockIntervalSec))" -Level "FAIL"
}

if ($value.FailedAttemptIntervalSec -eq 900) {
    Log-Message "SSO FailedAttemptIntervalSec configured correctly ($($value.FailedAttemptIntervalSec))" -Level "PASS"
} else {
    Log-Message "SSO FailedAttemptIntervalSec not configured correctly ($($value.FailedAttemptIntervalSec))" -Level "FAIL"
}

if ($value.MaxFailedAttempts -eq 5) {
    Log-Message "SSO MaxFailedAttempts configured correctly ($($value.MaxFailedAttempts))" -Level "PASS"
} else {
    Log-Message "SSO MaxFailedAttempts not configured correctly ($($value.MaxFailedAttempts))" -Level "FAIL"
}

#####################
# Test SSO Password Policy
$value = Get-SsoPasswordPolicy
if ($value.PasswordLifetimeDays -eq 9999) {
    Log-Message "SSO PasswordLifetimeDays configured correctly ($($value.PasswordLifetimeDays))" -Level "PASS"
} else {
    Log-Message "SSO PasswordLifetimeDays not configured correctly ($($value.PasswordLifetimeDays))" -Level "FAIL"
}

if ($value.ProhibitedPreviousPasswordsCount -eq 5) {
    Log-Message "SSO ProhibitedPreviousPasswordsCount configured correctly ($($value.ProhibitedPreviousPasswordsCount))" -Level "PASS"
} else {
    Log-Message "SSO ProhibitedPreviousPasswordsCount not configured correctly ($($value.ProhibitedPreviousPasswordsCount))" -Level "FAIL"
}

if ($value.MinLength -ge 15) {
    Log-Message "SSO MinLength configured correctly ($($value.MinLength))" -Level "PASS"
} else {
    Log-Message "SSO MinLength not configured correctly ($($value.MinLength))" -Level "FAIL"
}

if ($value.MaxLength -eq 64) {
    Log-Message "SSO MaxLength configured correctly ($($value.MaxLength))" -Level "PASS"
} else {
    Log-Message "SSO MaxLength not configured correctly ($($value.MaxLength))" -Level "FAIL"
}

if ($value.MinNumericCount -eq 1) {
    Log-Message "SSO MinNumericCount configured correctly ($($value.MinNumericCount))" -Level "PASS"
} else {
    Log-Message "SSO MinNumericCount not configured correctly ($($value.MinNumericCount))" -Level "FAIL"
}

if ($value.MinSpecialCharCount -eq 1) {
    Log-Message "SSO MinSpecialCharCount configured correctly ($($value.MinSpecialCharCount))" -Level "PASS"
} else {
    Log-Message "SSO MinSpecialCharCount not configured correctly ($($value.MinSpecialCharCount))" -Level "FAIL"
}

if ($value.MaxIdenticalAdjacentCharacters -eq 3) {
    Log-Message "SSO MaxIdenticalAdjacentCharacters configured correctly ($($value.MaxIdenticalAdjacentCharacters))" -Level "PASS"
} else {
    Log-Message "SSO MaxIdenticalAdjacentCharacters not configured correctly ($($value.MaxIdenticalAdjacentCharacters))" -Level "FAIL"
}

if ($value.MinAlphabeticCount -eq 2) {
    Log-Message "SSO MinAlphabeticCount configured correctly ($($value.MinAlphabeticCount))" -Level "PASS"
} else {
    Log-Message "SSO MinAlphabeticCount not configured correctly ($($value.MinAlphabeticCount))" -Level "FAIL"
}

if ($value.MinUppercaseCount -eq 1) {
    Log-Message "SSO MinUppercaseCount configured correctly ($($value.MinUppercaseCount))" -Level "PASS"
} else {
    Log-Message "SSO MinUppercaseCount not configured correctly ($($value.MinUppercaseCount))" -Level "FAIL"
}

if ($value.MinLowercaseCount -eq 1) {
    Log-Message "SSO MinLowercaseCount configured correctly ($($value.MinLowercaseCount))" -Level "PASS"
} else {
    Log-Message "SSO MinLowercaseCount not configured correctly ($($value.MinLowercaseCount))" -Level "FAIL"
}

#####################
# Test Distributed Switches
$switches = Get-VDSwitch

foreach ($switch in $switches) {
    $value = $switch | Get-VDSecurityPolicy | Select-Object -ExpandProperty AllowPromiscuous
    if ($value -eq $false) {
        Log-Message "Distributed switch `'$switch`' is not configured to allow promiscuous mode ($value)" -Level "PASS"
    } else {
        Log-Message "Distributed switch `'$switch`' is configured to allow promiscuous mode ($value)" -Level "FAIL"
    }

    $value = $switch | Get-VDSecurityPolicy | Select-Object -ExpandProperty MacChanges
    if ($value -eq $false) {
        Log-Message "Distributed switch `'$switch`' is not configured to allow MAC address changes ($value)" -Level "PASS"
    } else {
        Log-Message "Distributed switch `'$switch`' is configured to allow MAC address changes ($value)" -Level "FAIL"
    }

    $value = $switch | Get-VDSecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
    if ($value -eq $false) {
        Log-Message "Distributed switch `'$switch`' is not configured to allow forged transmits ($value)" -Level "PASS"
    } else {
        Log-Message "Distributed switch `'$switch`' is configured to allow forged transmits ($value)" -Level "FAIL"
    }

    $value = $switch.ExtensionData.Config.LinkDiscoveryProtocolConfig | Select-Object -ExpandProperty Operation
    if ($value -eq "none") {
        Log-Message "Distributed switch `'$switch`' link discovery is configured correctly ($value)" -Level "PASS"
    } else {
        Log-Message "Distributed switch `'$switch`' link discovery is not configured correctly ($value)" -Level "FAIL"
    }

    $value = $switch.ExtensionData.Config.IpfixConfig | Select-Object -ExpandProperty CollectorIpAddress
    if (($value -eq "") -or ($null -eq $value)) {
        Log-Message "Distributed switch `'$switch`' NetFlow is configured correctly ($value)" -Level "PASS"
    } else {
        Log-Message "Distributed switch `'$switch`' NetFlow is configured with a collector ($value)" -Level "FAIL"
    }

    $value = $switch.ExtensionData.Config | Select-Object -ExpandProperty VspanSession
    if ($null -eq $value) {
        Log-Message "Distributed switch `'$switch`' port mirroring is inactive ($value)" -Level "PASS"
    } else {
        Log-Message "Distributed switch `'$switch`' port mirroring is active ($value)" -Level "FAIL"
    }

    $portgroups = Get-VDPortgroup -VDSwitch $switch | Where-Object {$_.ExtensionData.Config.Uplink -ne "True"}
    foreach ($portgroup in $portgroups) {
        $value = $portgroup | Get-VDSecurityPolicy | Select-Object -ExpandProperty AllowPromiscuous
        if ($value -eq $false) {
            Log-Message "Distributed portgroup `'$portgroup`' is not configured to allow promiscuous mode ($value)" -Level "PASS"
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' is configured to allow promiscuous mode ($value)" -Level "FAIL"
        }
    
        $value = $portgroup | Get-VDSecurityPolicy | Select-Object -ExpandProperty MacChanges
        if ($value -eq $false) {
            Log-Message "Distributed portgroup `'$portgroup`' is not configured to allow MAC address changes ($value)" -Level "PASS"
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' is configured to allow MAC address changes ($value)" -Level "FAIL"
        }
    
        $value = $portgroup | Get-VDSecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
        if ($value -eq $false) {
            Log-Message "Distributed portgroup `'$portgroup`' is not configured to allow forged transmits ($value)" -Level "PASS"
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' is configured to allow forged transmits ($value)" -Level "FAIL"
        }

        $value = $portgroup | Select-Object -ExpandProperty VlanConfiguration
        if ($value -eq 4095) {
            Log-Message "Distributed portgroup `'$portgroup`' is configured to allow VLAN 4095 ($value)" -Level "FAIL"
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' is not configured to allow VLAN 4095 ($value)" -Level "PASS"
        }
       
        if (($value -eq 1) -or ($null -eq $value)) {
            Log-Message "Distributed portgroup `'$portgroup`' may be configured to use a default VLAN and should be assessed ($value)" -Level "FAIL"
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' does not appear to be configured to use a default VLAN ($value)" -Level "PASS"
        }

        $value = $portgroup.ExtensionData.Config.Policy | Select-Object -ExpandProperty PortConfigResetAtDisconnect
        if ($value -eq $true) {
            Log-Message "Distributed portgroup `'$portgroup`' is configured to reset port configuration on disconnect ($value)" -Level "PASS"
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' is not configured to reset port configuration on disconnect ($value)" -Level "FAIL"
        }

        $value = $portgroup.ExtensionData.Config.DefaultPortConfig.IpfixEnabled | Select-Object -ExpandProperty Value
        if ($value -eq $false) {
            Log-Message "Distributed portgroup `'$portgroup`' NetFlow is configured correctly ($value)" -Level "PASS"
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' NetFlow is not configured correctly ($value)" -Level "FAIL"
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
            Log-Message "Distributed portgroup `'$portgroup`' policies are not configured correctly ($valueStr)" -Level "FAIL"
        }

        # Test MAC learning policy
        $value = $portgroup.ExtensionData.Config.DefaultPortConfig.MacManagementPolicy.MacLearningPolicy | Select-Object -ExpandProperty Enabled
        if ($value -eq $false) {
            Log-Message "Distributed portgroup `'$portgroup`' MAC learning is not enabled ($value)" -Level "PASS"
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' MAC learning is enabled ($value)" -Level "FAIL"
        }
    }

    #####################
    # Test VCSA Settings for SSH
    $value = (Get-CisService -Name "com.vmware.appliance.access.ssh").get()
    if ($value -eq $true) {
        Log-Message "vCenter Server Appliance has SSH enabled ($value)" -Level "FAIL"
    } else {
        Log-Message "vCenter Server Appliance does not have SSH enabled ($value)" -Level "PASS"
    }

    #####################
    # Test VCSA Settings for password policies
    $value = (Get-CisService -Name "com.vmware.appliance.local_accounts.policy").get() | Select-Object -ExpandProperty max_days
    if ($value -ne 9999) {
        Log-Message "vCenter Server Appliance local accounts max_days not configured correctly ($value)" -Level "FAIL"
    } else {
        Log-Message "vCenter Server Appliance local accounts max_days configured correctly ($value)" -Level "PASS"
    }

    #####################
    # Test VCSA Settings for log forwarding
    $value = (Get-CisService -Name "com.vmware.appliance.logging.forwarding").get()
    if ($value.Count -eq 0) {
        Log-Message "vCenter Server Appliance not configured to forward logs ($($value.Hostname))" -Level "FAIL"
    } else {
        Log-Message "vCenter Server Appliance configured to forward logs ($($value.Hostname))" -Level "PASS"
    }

    #####################
    # Test VCSA Settings for NTP
    $value = (Get-CisService -Name "com.vmware.appliance.timesync").get()
    if ($value -ne "NTP") {
        Log-Message "vCenter Server Appliance NTP not configured ($value)" -Level "FAIL"
    } else {
        Log-Message "vCenter Server Appliance NTP is configured ($value)" -Level "PASS"
    }

    $value = (Get-CisService -Name "com.vmware.appliance.ntp").get()
    if ($null -eq $value) {
        Log-Message "vCenter Server Appliance NTP does not have servers defined ($value)" -Level "FAIL"
    } else {
        Log-Message "vCenter Server Appliance NTP has servers defined ($value)" -Level "PASS"
    }
}

#####################
Log-Message "Audit of $name completed at $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")" -Level "INFO"