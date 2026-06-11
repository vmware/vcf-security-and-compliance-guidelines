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
    # CSV Output File Name
    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [string]$CSVOutputFileName,
    # Accept-EULA
    [Parameter(Mandatory=$false)]
    [switch]$AcceptEULA,
    # Skip safety checks
    [Parameter(Mandatory=$false)]
    [switch]$NoSafetyChecks = $false,
    # Audit only these SCG control IDs (default: all)
    [Parameter(Mandatory=$false)]
    [string[]]$Controls,
    # Skip these SCG control IDs
    [Parameter(Mandatory=$false)]
    [string[]]$ExcludeControls
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
        [Parameter(Mandatory=$false)][ValidateSet("INFO", "WARNING", "ERROR", "EULA", "PASS", "FAIL", "UPDATE")][string]$Level = "INFO",
        [Parameter(Mandatory=$false)][string]$Control
    )
    Write-Log -Message $Message -Level $Level -OutputFileName $OutputFileName -CSVOutputFileName $CSVOutputFileName -Control $Control
}

Function Accept-EULA() { Show-EULA -OutputFileName $OutputFileName }
Function Do-Pause() { Wait-UserInput -OutputFileName $OutputFileName }
Function Check-vCenter() { if (-not (Test-vCenterConnection -OutputFileName $OutputFileName)) { Exit } }
Function Check-Hosts() { if (-not (Test-HostsExist -OutputFileName $OutputFileName)) { Exit } }
Function Test-Control([string]$id) { Test-ControlInScope -Control $id -Include $Controls -Exclude $ExcludeControls }

# Warn about requested controls this script does not cover
$coveredControls = @(
    'vcenter-9.account-lockout-duration'
    'vcenter-9.account-lockout-max-attempts'
    'vcenter-9.account-lockout-reset'
    'vcenter-9.drs'
    'vcenter-9.etc-issue'
    'vcenter-9.events-remote-logging'
    'vcenter-9.log-forwarding'
    'vcenter-9.logs-level-global'
    'vcenter-9.network-mac-learning'
    'vcenter-9.network-nioc'
    'vcenter-9.network-reject-forged-transmit-dvportgroup'
    'vcenter-9.network-reject-mac-changes-dvportgroup'
    'vcenter-9.network-reject-promiscuous-mode-dvportgroup'
    'vcenter-9.network-reset-port'
    'vcenter-9.network-restrict-discovery-protocol'
    'vcenter-9.network-restrict-netflow-usage'
    'vcenter-9.network-restrict-port-level-overrides'
    'vcenter-9.network-restrict-port-mirroring'
    'vcenter-9.network-vgt'
    'vcenter-9.password-complexity'
    'vcenter-9.password-history'
    'vcenter-9.password-max-age'
    'vcenter-9.service-resilience-evc'
    'vcenter-9.service-resilience-ha'
    'vcenter-9.ssh'
    'vcenter-9.supported'
    'vcenter-9.time'
    'vcenter-9.tls-ciphers'
    'vcenter-9.vami-password-max-age'
    'vcenter-9.vami-updates'
    'vcenter-9.vds-health-check-disable'
    'vcenter-9.vpxuser-length'
    'vcenter-9.vpxuser-rotation'
    'vsan-9.auto-policy-management'
    'vsan-9.auto-raid'
    'vsan-9.automatic-rebalance'
    'vsan-9.encryption-rest'
    'vsan-9.encryption-transit-esa'
    'vsan-9.encryption-transit-osa'
    'vsan-9.hcl-internet'
    'vsan-9.managed-disk-claim'
    'vsan-9.operations-reserve'
)
foreach ($requested in $Controls) {
    if ($requested -notin $coveredControls) {
        Write-Log "Requested control '$requested' is not covered by this script." -Level "WARNING" -OutputFileName $OutputFileName
    }
}

#######################################################################################################

$currentDateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Log-Message "VMware vCenter Security Settings Audit Utility 9.1.0" -Level "INFO"
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

    'vpxd.event.syslog.enabled' = @{ Expected = $true; Control = 'vcenter-9.events-remote-logging' }
    'config.log.level' = @{ Expected = 'info'; Control = 'vcenter-9.logs-level-global' }
    'VirtualCenter.VimPasswordExpirationInDays' = @{ Expected = 30; Control = 'vcenter-9.vpxuser-rotation' }
    'config.vpxd.hostPasswordLength' = @{ Expected = 32; Control = 'vcenter-9.vpxuser-length' }

}

foreach ($param in $scg_adv.GetEnumerator() )
{
    if (-not (Test-Control $param.Value.Control)) { continue }
    $value = (Get-AdvancedSetting -Entity $global:DefaultVIServers.Name "$($param.Name)").Value

    if ($value -eq $($param.Value.Expected)) {
        Log-Message "$($param.Name) configured correctly ($value)" -Level "PASS" -Control $param.Value.Control
    } else {
        Log-Message "$($param.Name) not configured correctly ($value)" -Level "FAIL" -Control $param.Value.Control
    }
}

#####################
# Tests for things that should not be set a certain way
$scg_not = @{

    'etc.issue' = @{ Expected = 'Platform Services Controller'; Control = 'vcenter-9.etc-issue' } # Just test to see if the stock message is there.

}

foreach ($param in $scg_not.GetEnumerator() )
{
    if (-not (Test-Control $param.Value.Control)) { continue }
    $value = (Get-AdvancedSetting -Entity $global:DefaultVIServers.Name -Name "$($param.Name)" | Select-Object -ExpandProperty Value)

    $singleline = $value -replace '\r?\n', ' '
    if ($value -match $($param.Value.Expected)) {
        Log-Message "$($param.Name) contains the default message ($singleline)" -Level "FAIL" -Control $param.Value.Control
    } else {
        Log-Message "$($param.Name) does not contain the default message ($singleline)" -Level "PASS" -Control $param.Value.Control
    }
}

#####################
# Test SSO Lockout Configurations
try {
    $lockoutPolicy = Get-SsoLockoutPolicy

    $ssoLockoutChecks = @{
        # 0 (manual unlock only) is stricter than the recommended 300 and also passes
        'AutoUnlockIntervalSec' = @{ Expected = 300; Comparator = 'ge-or-zero'; Control = 'vcenter-9.account-lockout-duration' }
        'FailedAttemptIntervalSec' = @{ Expected = 900; Comparator = 'ge'; Control = 'vcenter-9.account-lockout-reset' }
        'MaxFailedAttempts' = @{ Expected = 5; Comparator = 'le'; Control = 'vcenter-9.account-lockout-max-attempts' }
    }

    foreach ($check in $ssoLockoutChecks.GetEnumerator()) {
        if (-not (Test-Control $check.Value.Control)) { continue }
        $actual = $lockoutPolicy.$($check.Name)
        $pass = switch ($check.Value.Comparator) {
            'eq' { $actual -eq $check.Value.Expected }
            'ge' { $actual -ge $check.Value.Expected }
            'le' { $actual -le $check.Value.Expected }
            'ge-or-zero' { ($actual -eq 0) -or ($actual -ge $check.Value.Expected) }
        }
        if ($pass) {
            Log-Message "SSO $($check.Name) configured correctly ($actual)" -Level "PASS" -Control $check.Value.Control
        } else {
            Log-Message "SSO $($check.Name) not configured correctly ($actual)" -Level "FAIL" -Control $check.Value.Control
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
        'PasswordLifetimeDays' = @{ Expected = 9999; Comparator = 'eq'; Control = 'vcenter-9.password-max-age' }
        'ProhibitedPreviousPasswordsCount' = @{ Expected = 5; Comparator = 'ge'; Control = 'vcenter-9.password-history' }
        'MinLength' = @{ Expected = 15; Comparator = 'ge'; Control = 'vcenter-9.password-complexity' }
        'MaxLength' = @{ Expected = 64; Comparator = 'ge'; Control = 'vcenter-9.password-complexity' }
        'MinNumericCount' = @{ Expected = 1; Comparator = 'ge'; Control = 'vcenter-9.password-complexity' }
        'MinSpecialCharCount' = @{ Expected = 1; Comparator = 'ge'; Control = 'vcenter-9.password-complexity' }
        'MinAlphabeticCount' = @{ Expected = 2; Comparator = 'ge'; Control = 'vcenter-9.password-complexity' }
        'MaxIdenticalAdjacentCharacters' = @{ Expected = 3; Comparator = 'le'; Control = 'vcenter-9.password-complexity' }
        'MinUppercaseCount' = @{ Expected = 1; Comparator = 'ge'; Control = 'vcenter-9.password-complexity' }
        'MinLowercaseCount' = @{ Expected = 1; Comparator = 'ge'; Control = 'vcenter-9.password-complexity' }
    }

    foreach ($check in $ssoPasswordChecks.GetEnumerator()) {
        if (-not (Test-Control $check.Value.Control)) { continue }
        $actual = $passwordPolicy.$($check.Name)
        $pass = switch ($check.Value.Comparator) {
            'eq' { $actual -eq $check.Value.Expected }
            'ge' { $actual -ge $check.Value.Expected }
            'le' { $actual -le $check.Value.Expected }
        }
        if ($pass) {
            Log-Message "SSO $($check.Name) configured correctly ($actual)" -Level "PASS" -Control $check.Value.Control
        } else {
            Log-Message "SSO $($check.Name) not configured correctly ($actual)" -Level "FAIL" -Control $check.Value.Control
        }
    }
} catch {
    Log-Message "Failed to check SSO Password Policy: $_" -Level "ERROR"
}

#####################
# Test Distributed Switches
$vdsControls = @(
    'vcenter-9.network-reject-promiscuous-mode-dvportgroup'
    'vcenter-9.network-reject-mac-changes-dvportgroup'
    'vcenter-9.network-reject-forged-transmit-dvportgroup'
    'vcenter-9.network-restrict-discovery-protocol'
    'vcenter-9.network-restrict-netflow-usage'
    'vcenter-9.network-restrict-port-mirroring'
    'vcenter-9.vds-health-check-disable'
    'vcenter-9.network-nioc'
    'vcenter-9.network-vgt'
    'vcenter-9.network-reset-port'
    'vcenter-9.network-restrict-port-level-overrides'
    'vcenter-9.network-mac-learning'
)
try {
    $switches = if ($vdsControls | Where-Object { Test-Control $_ }) { Get-VDSwitch } else { @() }
} catch {
    Log-Message "Failed to retrieve distributed switches: $_" -Level "ERROR"
    $switches = @()
}

foreach ($switch in $switches) {
    $value = $switch | Get-VDSecurityPolicy | Select-Object -ExpandProperty AllowPromiscuous
    if ($value -eq $false) {
        Log-Message "Distributed switch `'$switch`' is not configured to allow promiscuous mode ($value)" -Level "PASS" -Control 'vcenter-9.network-reject-promiscuous-mode-dvportgroup'
    } else {
        Log-Message "Distributed switch `'$switch`' is configured to allow promiscuous mode ($value)" -Level "FAIL" -Control 'vcenter-9.network-reject-promiscuous-mode-dvportgroup'
    }

    $value = $switch | Get-VDSecurityPolicy | Select-Object -ExpandProperty MacChanges
    if ($value -eq $false) {
        Log-Message "Distributed switch `'$switch`' is not configured to allow MAC address changes ($value)" -Level "PASS" -Control 'vcenter-9.network-reject-mac-changes-dvportgroup'
    } else {
        Log-Message "Distributed switch `'$switch`' is configured to allow MAC address changes ($value)" -Level "FAIL" -Control 'vcenter-9.network-reject-mac-changes-dvportgroup'
    }

    $value = $switch | Get-VDSecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
    if ($value -eq $false) {
        Log-Message "Distributed switch `'$switch`' is not configured to allow forged transmits ($value)" -Level "PASS" -Control 'vcenter-9.network-reject-forged-transmit-dvportgroup'
    } else {
        Log-Message "Distributed switch `'$switch`' is configured to allow forged transmits ($value)" -Level "FAIL" -Control 'vcenter-9.network-reject-forged-transmit-dvportgroup'
    }

    $value = $switch.ExtensionData.Config.LinkDiscoveryProtocolConfig | Select-Object -ExpandProperty Operation
    if ($value -eq "none") {
        Log-Message "Distributed switch `'$switch`' link discovery is configured correctly ($value)" -Level "PASS" -Control 'vcenter-9.network-restrict-discovery-protocol'
    } else {
        Log-Message "Distributed switch `'$switch`' link discovery is not configured correctly ($value)" -Level "FAIL" -Control 'vcenter-9.network-restrict-discovery-protocol'
    }

    $value = $switch.ExtensionData.Config.IpfixConfig | Select-Object -ExpandProperty CollectorIpAddress
    if (($value -eq "") -or ($null -eq $value)) {
        Log-Message "Distributed switch `'$switch`' NetFlow is configured correctly ($value)" -Level "PASS" -Control 'vcenter-9.network-restrict-netflow-usage'
    } else {
        Log-Message "Distributed switch `'$switch`' NetFlow is configured with a collector ($value)" -Level "FAIL" -Control 'vcenter-9.network-restrict-netflow-usage'
    }

    $value = $switch.ExtensionData.Config | Select-Object -ExpandProperty VspanSession
    if ($null -eq $value) {
        Log-Message "Distributed switch `'$switch`' port mirroring is inactive ($value)" -Level "PASS" -Control 'vcenter-9.network-restrict-port-mirroring'
    } else {
        Log-Message "Distributed switch `'$switch`' port mirroring is active ($value)" -Level "FAIL" -Control 'vcenter-9.network-restrict-port-mirroring'
    }

    $value = $switch.ExtensionData.Config.HealthCheckConfig | Where-Object {$_.Enable -eq $true}
    if ($null -eq $value) {
        Log-Message "Distributed switch `'$switch`' health check is disabled" -Level "PASS" -Control 'vcenter-9.vds-health-check-disable'
    } else {
        Log-Message "Distributed switch `'$switch`' health check is enabled" -Level "FAIL" -Control 'vcenter-9.vds-health-check-disable'
    }

    $value = $switch.ExtensionData.Config.NetworkResourceManagementEnabled
    if ($value -eq $true) {
        Log-Message "Distributed switch `'$switch`' Network I/O Control is enabled ($value)" -Level "PASS" -Control 'vcenter-9.network-nioc'
    } else {
        Log-Message "Distributed switch `'$switch`' Network I/O Control is disabled ($value)" -Level "FAIL" -Control 'vcenter-9.network-nioc'
    }

    $portgroups = Get-VDPortgroup -VDSwitch $switch | Where-Object {$_.ExtensionData.Config.Uplink -ne "True"}
    foreach ($portgroup in $portgroups) {
        $value = $portgroup | Get-VDSecurityPolicy | Select-Object -ExpandProperty AllowPromiscuous
        if ($value -eq $false) {
            Log-Message "Distributed portgroup `'$portgroup`' is not configured to allow promiscuous mode ($value)" -Level "PASS" -Control 'vcenter-9.network-reject-promiscuous-mode-dvportgroup'
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' is configured to allow promiscuous mode ($value)" -Level "FAIL" -Control 'vcenter-9.network-reject-promiscuous-mode-dvportgroup'
        }
    
        $value = $portgroup | Get-VDSecurityPolicy | Select-Object -ExpandProperty MacChanges
        if ($value -eq $false) {
            Log-Message "Distributed portgroup `'$portgroup`' is not configured to allow MAC address changes ($value)" -Level "PASS" -Control 'vcenter-9.network-reject-mac-changes-dvportgroup'
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' is configured to allow MAC address changes ($value)" -Level "FAIL" -Control 'vcenter-9.network-reject-mac-changes-dvportgroup'
        }
    
        $value = $portgroup | Get-VDSecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
        if ($value -eq $false) {
            Log-Message "Distributed portgroup `'$portgroup`' is not configured to allow forged transmits ($value)" -Level "PASS" -Control 'vcenter-9.network-reject-forged-transmit-dvportgroup'
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' is configured to allow forged transmits ($value)" -Level "FAIL" -Control 'vcenter-9.network-reject-forged-transmit-dvportgroup'
        }

        $vlanSpec = $portgroup.ExtensionData.Config.DefaultPortConfig.Vlan
        if ($vlanSpec -is [VMware.Vim.VmwareDistributedVirtualSwitchTrunkVlanSpec]) {
            $ranges = ($vlanSpec.VlanId | ForEach-Object { if ($_.Start -eq $_.End) { "$($_.Start)" } else { "$($_.Start)-$($_.End)" } }) -join ', '
            Log-Message "Distributed portgroup `'$portgroup`' is configured as a VLAN trunk ($ranges), which passes tagged frames to VMs (VGT) and should be assessed" -Level "FAIL" -Control 'vcenter-9.network-vgt'
        } elseif ($vlanSpec.VlanId -eq 4095) {
            Log-Message "Distributed portgroup `'$portgroup`' is configured to allow VLAN 4095 (VGT)" -Level "FAIL" -Control 'vcenter-9.network-vgt'
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' is not configured for VGT (VLAN $($vlanSpec.VlanId))" -Level "PASS" -Control 'vcenter-9.network-vgt'
        }

        if (($null -eq $vlanSpec) -or ($vlanSpec.VlanId -eq 0) -or ($vlanSpec.VlanId -eq 1)) {
            Log-Message "Distributed portgroup `'$portgroup`' may be configured to use a default VLAN and should be assessed (VLAN $($vlanSpec.VlanId))" -Level "FAIL" -Control 'vcenter-9.network-vgt'
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' does not appear to be configured to use a default VLAN" -Level "PASS" -Control 'vcenter-9.network-vgt'
        }

        $value = $portgroup.ExtensionData.Config.Policy | Select-Object -ExpandProperty PortConfigResetAtDisconnect
        if ($value -eq $true) {
            Log-Message "Distributed portgroup `'$portgroup`' is configured to reset port configuration on disconnect ($value)" -Level "PASS" -Control 'vcenter-9.network-reset-port'
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' is not configured to reset port configuration on disconnect ($value)" -Level "FAIL" -Control 'vcenter-9.network-reset-port'
        }

        $value = $portgroup.ExtensionData.Config.DefaultPortConfig.IpfixEnabled | Select-Object -ExpandProperty Value
        if ($value -eq $false) {
            Log-Message "Distributed portgroup `'$portgroup`' NetFlow is configured correctly ($value)" -Level "PASS" -Control 'vcenter-9.network-restrict-netflow-usage'
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' NetFlow is not configured correctly ($value)" -Level "FAIL" -Control 'vcenter-9.network-restrict-netflow-usage'
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
            Log-Message "Distributed portgroup `'$portgroup`' policies are configured correctly ($valueStr)" -Level "PASS" -Control 'vcenter-9.network-restrict-port-level-overrides'
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' policies are not configured correctly ($valueStr)" -Level "FAIL" -Control 'vcenter-9.network-restrict-port-level-overrides'
        }

        # Test MAC learning policy
        $value = $portgroup.ExtensionData.Config.DefaultPortConfig.MacManagementPolicy.MacLearningPolicy | Select-Object -ExpandProperty Enabled
        if ($value -eq $false) {
            Log-Message "Distributed portgroup `'$portgroup`' MAC learning is not enabled ($value)" -Level "PASS" -Control 'vcenter-9.network-mac-learning'
        } else {
            Log-Message "Distributed portgroup `'$portgroup`' MAC learning is enabled ($value)" -Level "FAIL" -Control 'vcenter-9.network-mac-learning'
        }
    }
}

#####################
# Test VCSA Settings for SSH (vcenter-9.ssh)
if (Test-Control 'vcenter-9.ssh') {
    try {
        $value = (Get-CisService -Name "com.vmware.appliance.access.ssh").get()
        if ($value -eq $true) {
            Log-Message "vCenter Server Appliance has SSH enabled ($value)" -Level "FAIL" -Control 'vcenter-9.ssh'
        } else {
            Log-Message "vCenter Server Appliance does not have SSH enabled ($value)" -Level "PASS" -Control 'vcenter-9.ssh'
        }
    } catch {
        Log-Message "Failed to check vCenter Server Appliance SSH status: $_" -Level "ERROR"
    }
}

#####################
# Test VCSA Settings for password policies (vcenter-9.vami-password-max-age)
if (Test-Control 'vcenter-9.vami-password-max-age') {
    try {
        $value = (Get-CisService -Name "com.vmware.appliance.local_accounts.policy").get() | Select-Object -ExpandProperty max_days
        if ($value -ne 9999) {
            Log-Message "vCenter Server Appliance local accounts max_days not configured correctly ($value)" -Level "FAIL" -Control 'vcenter-9.vami-password-max-age'
        } else {
            Log-Message "vCenter Server Appliance local accounts max_days configured correctly ($value)" -Level "PASS" -Control 'vcenter-9.vami-password-max-age'
        }
    } catch {
        Log-Message "Failed to check vCenter Server Appliance local accounts policy: $_" -Level "ERROR"
    }
}

#####################
# Test VCSA Settings for log forwarding (vcenter-9.log-forwarding)
if (Test-Control 'vcenter-9.log-forwarding') {
    try {
        $value = (Get-CisService -Name "com.vmware.appliance.logging.forwarding").get()
        if ($value.Count -eq 0) {
            Log-Message "vCenter Server Appliance not configured to forward logs ($($value.Hostname))" -Level "FAIL" -Control 'vcenter-9.log-forwarding'
        } else {
            Log-Message "vCenter Server Appliance configured to forward logs ($($value.Hostname))" -Level "PASS" -Control 'vcenter-9.log-forwarding'
        }
    } catch {
        Log-Message "Failed to check vCenter Server Appliance log forwarding: $_" -Level "ERROR"
    }
}

#####################
# Test VCSA Settings for NTP (vcenter-9.time)
if (Test-Control 'vcenter-9.time') {
    try {
        $value = (Get-CisService -Name "com.vmware.appliance.timesync").get()
        if ($value -ne "NTP") {
            Log-Message "vCenter Server Appliance NTP not configured ($value)" -Level "FAIL" -Control 'vcenter-9.time'
        } else {
            Log-Message "vCenter Server Appliance NTP is configured ($value)" -Level "PASS" -Control 'vcenter-9.time'
        }

        $value = (Get-CisService -Name "com.vmware.appliance.ntp").get()
        if (@($value).Count -eq 0) {
            Log-Message "vCenter Server Appliance NTP does not have servers defined ($value)" -Level "FAIL" -Control 'vcenter-9.time'
        } else {
            Log-Message "vCenter Server Appliance NTP has servers defined ($value)" -Level "PASS" -Control 'vcenter-9.time'
        }
    } catch {
        Log-Message "Failed to check vCenter Server Appliance NTP settings: $_" -Level "ERROR"
    }
}

#####################
# Test cluster availability and scheduling configurations (vSphere HA, DRS, EVC)
$clusterControls = @('vcenter-9.service-resilience-ha', 'vcenter-9.drs', 'vcenter-9.service-resilience-evc')
$vsanControls = @('vsan-9.encryption-rest', 'vsan-9.automatic-rebalance', 'vsan-9.operations-reserve',
                  'vsan-9.encryption-transit-esa', 'vsan-9.encryption-transit-osa', 'vsan-9.auto-policy-management',
                  'vsan-9.auto-raid', 'vsan-9.managed-disk-claim')
try {
    $clusters = if (($clusterControls + $vsanControls) | Where-Object { Test-Control $_ }) { Get-Cluster } else { @() }
} catch {
    Log-Message "Failed to retrieve clusters: $_" -Level "ERROR"
    $clusters = @()
}

foreach ($cluster in $clusters) {
    if (Test-Control 'vcenter-9.service-resilience-ha') {
    if ($cluster.HAEnabled -eq $true) {
        Log-Message "Cluster `'$cluster`' has vSphere HA enabled ($($cluster.HAEnabled))" -Level "PASS" -Control 'vcenter-9.service-resilience-ha'
    } else {
        Log-Message "Cluster `'$cluster`' does not have vSphere HA enabled ($($cluster.HAEnabled))" -Level "FAIL" -Control 'vcenter-9.service-resilience-ha'
    }
    }

    if (Test-Control 'vcenter-9.drs') {
    if ($cluster.DrsEnabled -eq $true) {
        Log-Message "Cluster `'$cluster`' has DRS enabled ($($cluster.DrsEnabled))" -Level "PASS" -Control 'vcenter-9.drs'
    } else {
        Log-Message "Cluster `'$cluster`' does not have DRS enabled ($($cluster.DrsEnabled))" -Level "FAIL" -Control 'vcenter-9.drs'
    }
    }

    if (Test-Control 'vcenter-9.service-resilience-evc') {
    if ($null -ne $cluster.EVCMode) {
        Log-Message "Cluster `'$cluster`' has EVC configured ($($cluster.EVCMode))" -Level "PASS" -Control 'vcenter-9.service-resilience-evc'
    } else {
        Log-Message "Cluster `'$cluster`' does not have EVC configured ($($cluster.EVCMode))" -Level "FAIL" -Control 'vcenter-9.service-resilience-evc'
    }
    }
}

#####################
# Test vSAN cluster configurations
foreach ($cluster in ($clusters | Where-Object {$_.VsanEnabled -eq $true})) {
    try {
        $vsanConfig = Get-VsanClusterConfiguration -Cluster $cluster

        if (Test-Control 'vsan-9.encryption-rest') {
            if ($vsanConfig.EncryptionEnabled -eq $true) {
            Log-Message "vSAN cluster `'$cluster`' has data-at-rest encryption enabled ($($vsanConfig.EncryptionEnabled))" -Level "PASS" -Control 'vsan-9.encryption-rest'
        } else {
            Log-Message "vSAN cluster `'$cluster`' does not have data-at-rest encryption enabled ($($vsanConfig.EncryptionEnabled))" -Level "FAIL" -Control 'vsan-9.encryption-rest'
        }
        }

        if (Test-Control 'vsan-9.automatic-rebalance') {
            if ($vsanConfig.ProactiveRebalanceEnabled -eq $true) {
            Log-Message "vSAN cluster `'$cluster`' has automatic rebalance enabled ($($vsanConfig.ProactiveRebalanceEnabled))" -Level "PASS" -Control 'vsan-9.automatic-rebalance'
        } else {
            Log-Message "vSAN cluster `'$cluster`' does not have automatic rebalance enabled ($($vsanConfig.ProactiveRebalanceEnabled))" -Level "FAIL" -Control 'vsan-9.automatic-rebalance'
        }
        }

        if (Test-Control 'vsan-9.operations-reserve') {
            if ($vsanConfig.VsanOperationReservationState -in @('Enforced', 'Reported')) {
            Log-Message "vSAN cluster `'$cluster`' has the operations reserve enabled ($($vsanConfig.VsanOperationReservationState))" -Level "PASS" -Control 'vsan-9.operations-reserve'
        } else {
            Log-Message "vSAN cluster `'$cluster`' does not have the operations reserve enabled ($($vsanConfig.VsanOperationReservationState))" -Level "FAIL" -Control 'vsan-9.operations-reserve'
        }
        }
    } catch {
        Log-Message "Failed to check vSAN configuration for cluster '$cluster': $_" -Level "ERROR"
    }

    try {
        $cfgSys = Get-VsanView -Id "VsanVcClusterConfigSystem-vsan-cluster-config-system"
        $vsanCfg = $cfgSys.VsanClusterGetConfig($cluster.ExtensionData.MoRef)

        $transitControl = if ($null -ne $vsanCfg.VsanEsaConfigInfo) { 'vsan-9.encryption-transit-esa' } else { 'vsan-9.encryption-transit-osa' }
        if (Test-Control $transitControl) {
            $value = $vsanCfg.DataInTransitEncryptionConfig.Enabled
            if ($value -eq $true) {
                Log-Message "vSAN cluster `'$cluster`' has data-in-transit encryption enabled ($value)" -Level "PASS" -Control $transitControl
            } else {
                Log-Message "vSAN cluster `'$cluster`' does not have data-in-transit encryption enabled ($value)" -Level "FAIL" -Control $transitControl
            }
        }

        if (Test-Control 'vsan-9.auto-policy-management') {
        $value = $vsanCfg.DatastoreDefaultPolicySelectionConfig.Enabled
        if ($value -eq $true) {
            Log-Message "vSAN cluster `'$cluster`' has automatic policy management enabled ($value)" -Level "FAIL" -Control 'vsan-9.auto-policy-management'
        } else {
            Log-Message "vSAN cluster `'$cluster`' has automatic policy management disabled ($value)" -Level "PASS" -Control 'vsan-9.auto-policy-management'
        }
        }

        if ($null -ne $vsanCfg.VsanEsaConfigInfo) {
            if (Test-Control 'vsan-9.auto-raid') {
            $value = $vsanCfg.VsanEsaConfigInfo.AutoRAIDConfig.AssumeAutoManagedRAID
            if ($value -eq $true) {
                Log-Message "vSAN ESA cluster `'$cluster`' has Auto-RAID enabled ($value)" -Level "PASS" -Control 'vsan-9.auto-raid'
            } else {
                Log-Message "vSAN ESA cluster `'$cluster`' does not have Auto-RAID enabled ($value)" -Level "FAIL" -Control 'vsan-9.auto-raid'
            }
            }

            if (Test-Control 'vsan-9.managed-disk-claim') {
            $value = $vsanCfg.VsanEsaConfigInfo.HclDiskClaimEnabled
            if ($value -eq $true) {
                Log-Message "vSAN ESA cluster `'$cluster`' has managed disk claim enabled ($value)" -Level "FAIL" -Control 'vsan-9.managed-disk-claim'
            } else {
                Log-Message "vSAN ESA cluster `'$cluster`' has managed disk claim disabled ($value)" -Level "PASS" -Control 'vsan-9.managed-disk-claim'
            }
            }
        }
    } catch {
        Log-Message "Failed to check vSAN cluster configuration system for cluster '$cluster': $_" -Level "ERROR"
    }
}

#####################
# Test vSAN Health Check HCL internet connectivity (vCenter-wide) (vsan-9.hcl-internet)
if (Test-Control 'vsan-9.hcl-internet') {
    try {
        $vsanphview = Get-VsanView -Id "VsanPhoneHomeSystem-vsan-phonehome-system"
        $value = $vsanphview.QueryVsanCloudHealthStatus().InternetConnectivity
        if ($value -ne $true) {
            Log-Message "vSAN Health Check internet connectivity is disabled ($value)" -Level "PASS" -Control 'vsan-9.hcl-internet'
        } else {
            $vsanhealthview = Get-VsanView -Id "VsanVcClusterHealthSystem-vsan-cluster-health-system"
            $proxy = $vsanhealthview.VsanHealthQueryVsanProxyConfig()
            if (-not [string]::IsNullOrEmpty($proxy.Host)) {
                Log-Message "vSAN Health Check internet connectivity is enabled with a proxy ($($proxy.Host))" -Level "PASS" -Control 'vsan-9.hcl-internet'
            } else {
                Log-Message "vSAN Health Check internet connectivity is enabled without a proxy ($value)" -Level "FAIL" -Control 'vsan-9.hcl-internet'
            }
        }
    } catch {
        Log-Message "Failed to check vSAN Health Check internet connectivity: $_" -Level "ERROR"
    }
}

#####################
# Record vCenter version and build for lifecycle review (vcenter-9.supported, vcenter-9.vami-updates)
try {
    $value = (Get-View ServiceInstance).Content.About
    if (Test-Control 'vcenter-9.supported') {
        Log-Message "vCenter version $($value.Version) build $($value.Build). Compare against the lifecycle policy on the Broadcom Support Portal." -Level "INFO" -Control 'vcenter-9.supported'
    }
    if (Test-Control 'vcenter-9.vami-updates') {
        Log-Message "vCenter version $($value.Version) build $($value.Build). Compare against the latest available patches on the Broadcom Support Portal." -Level "INFO" -Control 'vcenter-9.vami-updates'
    }
} catch {
    Log-Message "Failed to read vCenter version information: $_" -Level "ERROR"
}

#####################
# Test vCenter TLS profile (vcenter-9.tls-ciphers)
if (Test-Control 'vcenter-9.tls-ciphers') {
    try {
        $value = (Invoke-GetTlsProfilesGlobal).Profile
        if ($value -eq 'NIST_2024_TLS_13_ONLY') {
            Log-Message "vCenter TLS profile is configured correctly ($value)" -Level "PASS" -Control 'vcenter-9.tls-ciphers'
        } else {
            Log-Message "vCenter TLS profile is not configured correctly ($value)" -Level "FAIL" -Control 'vcenter-9.tls-ciphers'
        }
    } catch {
        Log-Message "Failed to check vCenter TLS profile: $_" -Level "ERROR"
    }
}

#####################
Log-Message "Audit of $name completed at $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")" -Level "INFO"