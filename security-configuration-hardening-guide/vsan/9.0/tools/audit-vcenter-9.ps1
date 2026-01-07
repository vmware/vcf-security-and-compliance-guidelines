<#
    Script Name: VMware vCenter Security Settings Audit Utility
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
    # Skip safety checks
    [Parameter(Mandatory=$false)]
    [switch]$NoSafetyChecks = $false
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
Log-Message "VMware vCenter Security Settings Audit Utility 9.0.1" -Level "INFO"
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
try {
    $lockoutPolicy = Get-SsoLockoutPolicy

    $ssoLockoutChecks = @{
        'AutoUnlockIntervalSec' = @{ Expected = 0; Comparator = 'eq' }
        'FailedAttemptIntervalSec' = @{ Expected = 900; Comparator = 'ge' }
        'MaxFailedAttempts' = @{ Expected = 5; Comparator = 'le' }
    }

    foreach ($check in $ssoLockoutChecks.GetEnumerator()) {
        $actual = $lockoutPolicy.$($check.Name)
        $pass = switch ($check.Value.Comparator) {
            'eq' { $actual -eq $check.Value.Expected }
            'ge' { $actual -ge $check.Value.Expected }
            'le' { $actual -le $check.Value.Expected }
        }
        if ($pass) {
            Log-Message "SSO $($check.Name) configured correctly ($actual)" -Level "PASS"
        } else {
            Log-Message "SSO $($check.Name) not configured correctly ($actual)" -Level "FAIL"
        }
    }
} catch {
    Log-Message "Failed to check SSO Lockout Policy: $_" -Level "ERROR"
}

#####################
# Test SSO Password Policy
try {
    $passwordPolicy = Get-SsoPasswordPolicy

    $ssoPasswordChecks = @{
        'PasswordLifetimeDays' = @{ Expected = 9999; Comparator = 'eq' }
        'ProhibitedPreviousPasswordsCount' = @{ Expected = 5; Comparator = 'ge' }
        'MinLength' = @{ Expected = 15; Comparator = 'ge' }
        'MaxLength' = @{ Expected = 64; Comparator = 'ge' }
        'MinNumericCount' = @{ Expected = 1; Comparator = 'ge' }
        'MinSpecialCharCount' = @{ Expected = 1; Comparator = 'ge' }
        'MaxIdenticalAdjacentCharacters' = @{ Expected = 3; Comparator = 'le' }
        'MinAlphabeticCount' = @{ Expected = 2; Comparator = 'ge' }
        'MinUppercaseCount' = @{ Expected = 1; Comparator = 'ge' }
        'MinLowercaseCount' = @{ Expected = 1; Comparator = 'ge' }
    }

    foreach ($check in $ssoPasswordChecks.GetEnumerator()) {
        $actual = $passwordPolicy.$($check.Name)
        $pass = switch ($check.Value.Comparator) {
            'eq' { $actual -eq $check.Value.Expected }
            'ge' { $actual -ge $check.Value.Expected }
            'le' { $actual -le $check.Value.Expected }
        }
        if ($pass) {
            Log-Message "SSO $($check.Name) configured correctly ($actual)" -Level "PASS"
        } else {
            Log-Message "SSO $($check.Name) not configured correctly ($actual)" -Level "FAIL"
        }
    }
} catch {
    Log-Message "Failed to check SSO Password Policy: $_" -Level "ERROR"
}

#####################
# Test Distributed Switches
try {
    $switches = Get-VDSwitch
} catch {
    Log-Message "Failed to retrieve distributed switches: $_" -Level "ERROR"
    $switches = @()
}

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
}

#####################
# Test VCSA Settings for SSH
try {
    $value = (Get-CisService -Name "com.vmware.appliance.access.ssh").get()
    if ($value -eq $true) {
        Log-Message "vCenter Server Appliance has SSH enabled ($value)" -Level "FAIL"
    } else {
        Log-Message "vCenter Server Appliance does not have SSH enabled ($value)" -Level "PASS"
    }
} catch {
    Log-Message "Failed to check vCenter Server Appliance SSH status: $_" -Level "ERROR"
}

#####################
# Test VCSA Settings for password policies
try {
    $value = (Get-CisService -Name "com.vmware.appliance.local_accounts.policy").get() | Select-Object -ExpandProperty max_days
    if ($value -ne 9999) {
        Log-Message "vCenter Server Appliance local accounts max_days not configured correctly ($value)" -Level "FAIL"
    } else {
        Log-Message "vCenter Server Appliance local accounts max_days configured correctly ($value)" -Level "PASS"
    }
} catch {
    Log-Message "Failed to check vCenter Server Appliance local accounts policy: $_" -Level "ERROR"
}

#####################
# Test VCSA Settings for log forwarding
try {
    $value = (Get-CisService -Name "com.vmware.appliance.logging.forwarding").get()
    if ($value.Count -eq 0) {
        Log-Message "vCenter Server Appliance not configured to forward logs ($($value.Hostname))" -Level "FAIL"
    } else {
        Log-Message "vCenter Server Appliance configured to forward logs ($($value.Hostname))" -Level "PASS"
    }
} catch {
    Log-Message "Failed to check vCenter Server Appliance log forwarding: $_" -Level "ERROR"
}

#####################
# Test VCSA Settings for NTP
try {
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
} catch {
    Log-Message "Failed to check vCenter Server Appliance NTP settings: $_" -Level "ERROR"
}

#####################
Log-Message "Audit of $name completed at $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")" -Level "INFO"