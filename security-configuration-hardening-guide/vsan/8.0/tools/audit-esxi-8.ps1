<#
    Script Name: VMware vSphere ESX Host Security Settings Audit Utility
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
    # ESX Host Name
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
Log-Message "VMware ESX Host Security Settings Audit Utility 8.0.3" -Level "INFO"
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
# Read the ESX host into objects and views once to save time & resources
$obj = Get-VMHost $name -ErrorAction Stop
$view = Get-View -VIObject $obj
$ESXcli = Get-EsxCli -VMHost $obj -V2


#####################
# Tests for advanced parameters
# Comparators: eq = equal, ge = greater or equal (more secure), le = less or equal (more secure)
$scg_adv = @{
    'Security.AccountUnlockTime' = @{ Expected = 900; Comparator = 'ge' }
    'Security.AccountLockFailures' = @{ Expected = 5; Comparator = 'le' }
    'Security.PasswordQualityControl' = @{ Expected = 'similar=deny retry=3 min=disabled,disabled,disabled,disabled,15 max=64'; Comparator = 'eq' }
    'Security.PasswordHistory' = @{ Expected = 5; Comparator = 'ge' }
    'Security.PasswordMaxDays' = @{ Expected = 9999; Comparator = 'eq' }
    'Config.HostAgent.vmacore.soap.sessionTimeout' = @{ Expected = 10; Comparator = 'le' }
    'Config.HostAgent.plugins.solo.enableMob' = @{ Expected = $false; Comparator = 'eq' }
    'UserVars.DcuiTimeOut' = @{ Expected = 600; Comparator = 'le' }
    'UserVars.SuppressHyperthreadWarning' = @{ Expected = 0; Comparator = 'eq' }
    'UserVars.SuppressShellWarning' = @{ Expected = 0; Comparator = 'eq' }
    'UserVars.HostClientSessionTimeout' = @{ Expected = 900; Comparator = 'le' }
    'Net.BMCNetworkEnable' = @{ Expected = 0; Comparator = 'eq' }
    'DCUI.Access' = @{ Expected = 'root'; Comparator = 'eq' }
    'Syslog.global.auditRecord.storageEnable' = @{ Expected = $true; Comparator = 'eq' }
    'Syslog.global.auditRecord.storageCapacity' = @{ Expected = 100; Comparator = 'ge' }
    'Syslog.global.auditRecord.remoteEnable' = @{ Expected = $true; Comparator = 'eq' }
    'Config.HostAgent.log.level' = @{ Expected = 'info'; Comparator = 'eq' }
    'Syslog.global.logLevel' = @{ Expected = 'error'; Comparator = 'eq' }
    'Syslog.global.certificate.checkSSLCerts' = @{ Expected = $true; Comparator = 'eq' }
    'Syslog.global.certificate.strictX509Compliance' = @{ Expected = $true; Comparator = 'eq' }
    'Net.BlockGuestBPDU' = @{ Expected = 1; Comparator = 'eq' }
    'Net.DVFilterBindIpAddress' = @{ Expected = ''; Comparator = 'eq' }
    'UserVars.ESXiShellInteractiveTimeOut' = @{ Expected = 900; Comparator = 'le' }
    'UserVars.ESXiShellTimeOut' = @{ Expected = 600; Comparator = 'le' }
    'UserVars.ESXiVPsDisabledProtocols' = @{ Expected = "sslv3,tlsv1,tlsv1.1"; Comparator = 'eq' }
    'Mem.ShareForceSalting' = @{ Expected = 2; Comparator = 'eq' }
    'VMkernel.Boot.execInstalledOnly' = @{ Expected = $true; Comparator = 'eq' }
    'Mem.MemEagerZero' = @{ Expected = 1; Comparator = 'eq' }
}

foreach ($param in $scg_adv.GetEnumerator()) {
    $vmval = (Get-AdvancedSetting -Entity $obj "$($param.Name)").Value
    $expected = $param.Value.Expected
    $comparator = $param.Value.Comparator

    $pass = switch ($comparator) {
        'eq' { $vmval -eq $expected }
        'ge' { $vmval -ge $expected }
        'le' { $vmval -le $expected }
    }

    if ($pass) {
        Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS"
    } else {
        Log-Message "$name`: $($param.Name) not configured correctly ($vmval)" -Level "FAIL"
    }
}

#####################
# Tests for things that should not be set a certain way
$scg_not = @{

    'Annotations.WelcomeMessage' = ''
    'Config.Etc.Issue' = ''
    'Syslog.global.logHost' = ''

}

foreach ($param in $scg_not.GetEnumerator() )
{
    $vmval = (Get-AdvancedSetting -Entity $obj "$($param.Name)").Value

    if ($vmval -eq $($param.Value)) {
        Log-Message "$name`: $($param.Name) not configured correctly ($vmval)" -Level "FAIL"
    } else {
        Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS"
    }
}

#####################
# Test local log output locations for persistence
$persistent = $ESXcli.system.syslog.config.get.Invoke() | Select-Object -ExpandProperty LocalLogOutputIsPersistent
$localsyslog = $ESXcli.system.syslog.config.get.Invoke() | Select-Object -ExpandProperty LocalLogOutput
$localauditlog = $obj | Get-AdvancedSetting Syslog.global.auditRecord.storageDirectory | Select-Object -ExpandProperty Value

if ($persistent) {
    Log-Message "$name`: Local log location is persistent ($localsyslog)" -Level "PASS"
} else {
    Log-Message "$name`: Local log location is not persistent ($localsyslog)" -Level "FAIL"
}

if (($localsyslog -like "/scratch*") -and ($localauditlog -like "*scratch*") -and ($persistent)) {
    Log-Message "$name`: Local audit log location is persistent ($localsyslog, $localauditlog)" -Level "PASS"
} else {
    Log-Message "$name`: Local audit log location is not persistent ($localsyslog, $localauditlog)" -Level "FAIL"
}

#####################
# Test Log Filters
$value = $ESXcli.system.syslog.config.logfilter.get.invoke() | Select -ExpandProperty LogFilteringEnabled 
if ($value -eq 'false') {
    Log-Message "$name`: Log filtering is deactivated ($value)" -Level "PASS"
} else {
    Log-Message "$name`: Log filtering is enabled ($value)" -Level "FAIL"
}

#####################
# Test DCUI user
$value = $ESXcli.system.account.list.Invoke() | Where-Object { $_.UserID -eq 'dcui' } | Select-Object -ExpandProperty Shellaccess
if ($value -eq 'false') {
    Log-Message "$name`: DCUI user has shell access deactivated ($value)" -Level "PASS"
} else {
    Log-Message "$name`: DCUI user has shell access enabled ($value)" -Level "FAIL"
}

#####################
# Test Entropy Sources
$value1 = $ESXcli.system.settings.kernel.list.Invoke() | Where-Object {$_.Name -eq "disableHwrng"} | Select-Object -ExpandProperty Configured
$value2 = $ESXcli.system.settings.kernel.list.Invoke() | Where-Object {$_.Name -eq "entropySources"} | Select-Object -ExpandProperty Configured

if ($value1 -eq 'FALSE' -and $value2 -eq '0') {
    Log-Message "$name`: Entropy sources configured correctly ($value1, $value2)" -Level "PASS"
} else {
    Log-Message "$name`: Entropy sources not configured correctly ($value1, $value2)" -Level "FAIL"
}

#####################
# Test Host Secure Boot capability
$value = $view.Capability.UefiSecureBoot
if ($value -eq 'true') {
    Log-Message "$name`: Secure Boot is enabled on the host ($value)" -Level "PASS"
} else {
    Log-Message "$name`: Secure Boot is not enabled on the host ($value)" -Level "FAIL"
}

#####################
# Test Host Secure Boot Enforcement
$value = $ESXcli.system.settings.encryption.get.Invoke() | Select-Object -ExpandProperty RequireSecureBoot
if ($value -eq 'true') {
    Log-Message "$name`: Secure Boot TPM-based enforcement is enabled ($value)" -Level "PASS"
} else {
    Log-Message "$name`: Secure Boot TPM-based enforcement is not enabled ($value)" -Level "FAIL"
}

#####################
# Test for TPM Configuration Encryption 
$value = $ESXcli.system.settings.encryption.get.Invoke() | Select-Object -ExpandProperty Mode
if ($value -eq 'TPM') {
    Log-Message "$name`: TPM configuration encryption is enabled ($value)" -Level "PASS"
} else {
    Log-Message "$name`: TPM configuration encryption is not enabled ($value)" -Level "FAIL"
}

#####################
# Test for Key Persistence
$value = $ESXcli.system.security.keypersistence.get.invoke() | Select-Object -ExpandProperty Enabled
if ($value -eq 'false') {
    Log-Message "$name`: Key persistence is not enabled ($value)" -Level "PASS"
} else {
    Log-Message "$name`: Key persistence is enabled ($value)" -Level "FAIL"
}

#####################
# Test the TLS Profile
$value = $ESXcli.system.tls.server.get.invoke() | Select-Object -ExpandProperty Profile
if ($value -eq 'NIST_2024') {
    Log-Message "$name`: TLS profile is configured correctly ($value)" -Level "PASS"
} else {
    Log-Message "$name`: TLS profile is not configured correctly ($value)" -Level "FAIL"
}

#####################
# Test Software Acceptance Level (VMwareCertified, VMwareAccepted, PartnerSupported, CommunitySupported)
$value = $ESXcli.software.acceptance.get.Invoke()
if (($value -eq 'PartnerSupported') -or ($value -eq 'VMwareCertified') -or ($value -eq 'VMwareAccepted')) {
    Log-Message "$name`: Host Image Profile Acceptance Level is configured correctly ($value)" -Level "PASS"
} else {
    Log-Message "$name`: Host Image Profile Acceptance Level is not configured correctly ($value)" -Level "FAIL"
}

#####################
# Test authentication configuration
$value = $obj | Get-VMHostAuthentication | Select-Object -ExpandProperty Domain
if ($null -eq $value) {
    Log-Message "$name`: Active Directory integration is configured correctly ($value)" -Level "PASS"
} else {
    Log-Message "$name`: Active Directory integration is not configured correctly ($value)" -Level "FAIL"
}

#####################
# Test the menagerie of SSH configuration settings
$value = $ESXcli.system.security.fips140.ssh.get.Invoke() | Select-Object -ExpandProperty Enabled
if ($value -eq 'true') {
    Log-Message "$name`: SSH has FIPS mode enabled ($value)" -Level "PASS"
} else {
    Log-Message "$name`: SSH does not have FIPS mode enabled ($value)" -Level "FAIL"
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'ciphers'} | Select-Object -ExpandProperty Value
if ($value -eq 'aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr') {
    Log-Message "$name`: SSH ciphers configured correctly ($value)" -Level "PASS"
} else {
    Log-Message "$name`: SSH ciphers not configured correctly ($value)" -Level "FAIL"
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'gatewayports'} | Select-Object -ExpandProperty Value
if ($value -eq 'no') {
    Log-Message "$name`: SSH gatewayports configured correctly ($value)" -Level "PASS"
} else {
    Log-Message "$name`: SSH gatewayports not configured correctly ($value)" -Level "FAIL"
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'hostbasedauthentication'} | Select-Object -ExpandProperty Value
if ($value -eq 'no') {
    Log-Message "$name`: SSH hostbasedauthentication configured correctly ($value)" -Level "PASS"
} else {
    Log-Message "$name`: SSH hostbasedauthentication not configured correctly ($value)" -Level "FAIL"
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'clientalivecountmax'} | Select-Object -ExpandProperty Value
if ($value -eq '3') {
    Log-Message "$name`: SSH clientalivecountmax configured correctly ($value)" -Level "PASS"
} else {
    Log-Message "$name`: SSH clientalivecountmax not configured correctly ($value)" -Level "FAIL"
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'clientaliveinterval'} | Select-Object -ExpandProperty Value
if ($value -eq '200') {
    Log-Message "$name`: SSH clientaliveinterval configured correctly ($value)" -Level "PASS"
} else {
    Log-Message "$name`: SSH clientaliveinterval not configured correctly ($value)" -Level "FAIL"
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'banner'} | Select-Object -ExpandProperty Value
if ($value -eq '/etc/issue') {
    Log-Message "$name`: SSH banner configured correctly ($value)" -Level "PASS"
} else {
    Log-Message "$name`: SSH banner not configured correctly ($value)" -Level "FAIL"
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'ignorerhosts'} | Select-Object -ExpandProperty Value
if ($value -eq 'yes') {
    Log-Message "$name`: SSH ignorerhosts configured correctly ($value)" -Level "PASS"
} else {
    Log-Message "$name`: SSH ignorerhosts not configured correctly ($value)" -Level "FAIL"
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'allowstreamlocalforwarding'} | Select-Object -ExpandProperty Value
if ($value -eq 'no') {
    Log-Message "$name`: SSH allowstreamlocalforwarding configured correctly ($value)" -Level "PASS"
} else {
    Log-Message "$name`: SSH allowstreamlocalforwarding not configured correctly ($value)" -Level "FAIL"
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'allowtcpforwarding'} | Select-Object -ExpandProperty Value
if ($value -eq 'no') {
    Log-Message "$name`: SSH allowtcpforwarding configured correctly ($value)" -Level "PASS"
} else {
    Log-Message "$name`: SSH allowtcpforwarding not configured correctly ($value)" -Level "FAIL"
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'permittunnel'} | Select-Object -ExpandProperty Value
if ($value -eq 'no') {
    Log-Message "$name`: SSH permittunnel configured correctly ($value)" -Level "PASS"
} else {
    Log-Message "$name`: SSH permittunnel not configured correctly ($value)" -Level "FAIL"
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'permituserenvironment'} | Select-Object -ExpandProperty Value
if ($value -eq 'no') {
    Log-Message "$name`: SSH permituserenvironment configured correctly ($value)" -Level "PASS"
} else {
    Log-Message "$name`: SSH permituserenvironment not configured correctly ($value)" -Level "FAIL"
}

#####################
# Test ESX services
$services_should_be_false = "sfcbd-watchdog", "TSM", "slpd", "snmpd", "TSM-SSH"

foreach ($service in $services_should_be_false) {
    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Running
    if ($value -eq $false) {
        Log-Message "$name`: $service is not running ($value)" -Level "PASS"
    } else {
        Log-Message "$name`: $service is running ($value)" -Level "FAIL"
    }

    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Policy
    if ($value -eq 'off') {
        Log-Message "$name`: $service is not configured to start ($value)" -Level "PASS"
    } else {
        Log-Message "$name`: $service is configured to start ($value)" -Level "FAIL"
    }
}

#####################
# Test NTP services
# You might also have PTP, in which case this may fail but your environment is alright.
$services_should_be_true = "ntpd"

foreach ($service in $services_should_be_true) {
    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Running
    if ($value -eq $true) {
        Log-Message "$name`: $service is running ($value)" -Level "PASS"
    } else {
        Log-Message "$name`: $service is not running ($value)" -Level "FAIL"
    }

    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Policy
    if ($value -eq 'on') {
        Log-Message "$name`: $service is configured to start ($value)" -Level "PASS"
    } else {
        Log-Message "$name`: $service is not configured to start ($value)" -Level "FAIL"
    }
}

#####################
# Test NTP configurations
$value = $obj | Get-VMHostNtpServer
if ($null -eq $value) {
    Log-Message "$name`: NTP client not configured ($value)" -Level "FAIL"
} else {
    Log-Message "$name`: NTP client configured ($value)" -Level "PASS"
}

#####################
# Test lockdown mode
$value = ((Get-View($view).ConfigManager.HostAccessManager)).QueryLockdownExceptions()
if ([string]::IsNullOrEmpty($value)) {
    Log-Message "$name`: Lockdown Mode exception users configured correctly ($value)" -Level "PASS"
} else {
    Log-Message "$name`: Lockdown Mode exception users not configured correctly ($value)" -Level "FAIL"
}

$value = (Get-View ($view).ConfigManager.HostAccessManager).LockdownMode
if ($value -eq 'lockdownDisabled') {
    Log-Message "$name`: Lockdown Mode is not configured correctly ($value)" -Level "FAIL"
} else {
    Log-Message "$name`: Lockdown Mode is configured correctly ($value)" -Level "PASS"
}

#####################
# Test Standard Switches
$switches = Get-VirtualSwitch -VMHost $obj -Standard

foreach ($switch in $switches) {
    $value = $switch | Get-SecurityPolicy | Select-Object -ExpandProperty AllowPromiscuous
    if ($value -eq $false) {
        Log-Message "$name`: Standard switch `'$switch`' is not configured to allow promiscuous mode ($value)" -Level "PASS"
    } else {
        Log-Message "$name`: Standard switch `'$switch`' is configured to allow promiscuous mode ($value)" -Level "FAIL"
    }

    $value = $switch | Get-SecurityPolicy | Select-Object -ExpandProperty MacChanges
    if ($value -eq $false) {
        Log-Message "$name`: Standard switch `'$switch`' is not configured to allow MAC address changes ($value)" -Level "PASS"
    } else {
        Log-Message "$name`: Standard switch `'$switch`' is configured to allow MAC address changes ($value)" -Level "FAIL"
    }

    $value = $switch | Get-SecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
    if ($value -eq $false) {
        Log-Message "$name`: Standard switch `'$switch`' is not configured to allow forged transmits ($value)" -Level "PASS"
    } else {
        Log-Message "$name`: Standard switch `'$switch`' is configured to allow forged transmits ($value)" -Level "FAIL"
    }

    $portgroups = Get-VirtualPortGroup -VirtualSwitch $switch
    foreach ($portgroup in $portgroups) {
        $value = $portgroup | Get-SecurityPolicy | Select-Object -ExpandProperty AllowPromiscuous
        if ($value -eq $false) {
            Log-Message "$name`: Standard portgroup `'$portgroup`' is not configured to allow promiscuous mode ($value)" -Level "PASS"
        } else {
            Log-Message "$name`: Standard portgroup `'$portgroup`' is configured to allow promiscuous mode ($value)" -Level "FAIL"
        }
    
        $value = $portgroup | Get-SecurityPolicy | Select-Object -ExpandProperty MacChanges
        if ($value -eq $false) {
            Log-Message "$name`: Standard portgroup `'$portgroup`' is not configured to allow MAC address changes ($value)" -Level "PASS"
        } else {
            Log-Message "$name`: Standard portgroup `'$portgroup`' is configured to allow MAC address changes ($value)" -Level "FAIL"
        }
    
        $value = $portgroup | Get-SecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
        if ($value -eq $false) {
            Log-Message "$name`: Standard portgroup `'$portgroup`' is not configured to allow forged transmits ($value)" -Level "PASS"
        } else {
            Log-Message "$name`: Standard portgroup `'$portgroup`' is configured to allow forged transmits ($value)" -Level "FAIL"
        }

        $value = $portgroup | Select-Object -ExpandProperty VLanID
        if ($value -eq 4095) {
            Log-Message "$name`: Standard portgroup `'$portgroup`' is configured to allow VLAN 4095 ($value)" -Level "FAIL"
        } else {
            Log-Message "$name`: Standard portgroup `'$portgroup`' is not configured to allow VLAN 4095 ($value)" -Level "PASS"
        }
       
        if (($value -eq 1) -or ($null -eq $value)) {
            Log-Message "$name`: Standard portgroup `'$portgroup`' may be configured to use a default VLAN and should be assessed ($value)" -Level "FAIL"
        } else {
            Log-Message "$name`: Standard portgroup `'$portgroup`' does not appear to be configured to use a default VLAN ($value)" -Level "PASS"
        }
    }

}

$vmks = $obj | Get-VMHostNetworkAdapter -VMKernel
foreach ($vmk in $vmks) {
    $valueObj = $vmk | Select-Object ManagementTrafficEnabled,VMotionEnabled,FaultToleranceLoggingEnabled,
                                    VsanTrafficEnabled,ProvisioningEnabled,VSphereReplicationEnabled,
                                    VSphereReplicationNFCEnabled,VSphereBackupNFCEnabled
    $valueStr = ($valueObj.PSObject.Properties | ForEach-Object { "$($_.Name): $($_.Value)" }) -join ', '

    if ($vmk.ManagementTrafficEnabled) {
        if ($vmk.VMotionEnabled -or
            $vmk.FaultToleranceLoggingEnabled -or
            $vmk.VsanTrafficEnabled -or
            $vmk.ProvisioningEnabled -or
            $vmk.VSphereReplicationEnabled -or
            $vmk.VSphereReplicationNFCEnabled -or
            $vmk.VSphereBackupNFCEnabled) {
                Log-Message "$name`: VMkernel NIC `'$vmk`' has management configured alongside other services and should be assessed ($valueStr)" -Level "FAIL"
        } else {
            Log-Message "$name`: VMkernel NIC `'$vmk`' has only management configured ($valueStr)" -Level "PASS"
        }
    } else {
        Log-Message "$name`: VMkernel NIC `'$vmk`' is not configured for management ($valueStr)" -Level "PASS"
    }
}

Log-Message "$name`: Audit of $name completed at $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")" -Level "INFO"