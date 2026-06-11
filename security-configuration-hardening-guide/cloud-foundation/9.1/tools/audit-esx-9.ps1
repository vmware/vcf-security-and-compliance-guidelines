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
    # CSV Output File Name
    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [string]$CSVOutputFileName,
    # Accept-EULA
    [Parameter(Mandatory=$false)]
    [switch]$AcceptEULA,
    # Skip safety checks
    [Parameter(Mandatory=$false)]
    [switch]$NoSafetyChecks,
    # Audit only these SCG control IDs (default: all)
    [Parameter(Mandatory=$false)]
    [string[]]$Controls,
    # Skip these SCG control IDs
    [Parameter(Mandatory=$false)]
    [string[]]$ExcludeControls
)

# Import common functions
Import-Module "$PSScriptRoot\scg-common.psm1" -Force

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
    'esx-9.account-lockout-duration'
    'esx-9.account-lockout-max-attempts'
    'esx-9.account-password-history'
    'esx-9.ad-admin-group-autoadd'
    'esx-9.ad-admin-group-name'
    'esx-9.ad-admin-validate-interval'
    'esx-9.api-soap-timeout'
    'esx-9.ceip-disable'
    'esx-9.cpu-hyperthread-warning'
    'esx-9.dcui-timeout'
    'esx-9.deactivate-mob'
    'esx-9.deactivate-shell'
    'esx-9.disable-accounts-dcui'
    'esx-9.entropy'
    'esx-9.etc-issue'
    'esx-9.firewall-incoming-default'
    'esx-9.firewall-restrict-access'
    'esx-9.forensic-snapshots'
    'esx-9.hardware-cpu-intel-txt'
    'esx-9.hardware-secureboot'
    'esx-9.hardware-tpm'
    'esx-9.hardware-virtual-nic'
    'esx-9.key-persistence'
    'esx-9.lockdown-dcui-access'
    'esx-9.lockdown-exception-users'
    'esx-9.lockdown-mode'
    'esx-9.log-audit-forwarding'
    'esx-9.log-audit-local'
    'esx-9.log-audit-local-capacity'
    'esx-9.log-audit-persistent'
    'esx-9.log-filter'
    'esx-9.log-forwarding'
    'esx-9.log-forwarding-tls-ciphers'
    'esx-9.log-forwarding-tls-x509'
    'esx-9.log-level'
    'esx-9.log-persistent'
    'esx-9.login-message'
    'esx-9.memeagerzero'
    'esx-9.memory-tiering-encryption'
    'esx-9.network-bpdu'
    'esx-9.network-dvfilter'
    'esx-9.network-rpf-promisc'
    'esx-9.network-standard-reject-forged-transmit'
    'esx-9.network-standard-reject-mac-changes'
    'esx-9.network-standard-reject-promiscuous-mode'
    'esx-9.network-vgt'
    'esx-9.password-complexity'
    'esx-9.password-max-age'
    'esx-9.secureboot-enforcement'
    'esx-9.session-timeout'
    'esx-9.shell-interactive-timeout'
    'esx-9.shell-timeout'
    'esx-9.shell-warning'
    'esx-9.snmp'
    'esx-9.ssh'
    'esx-9.supported'
    'esx-9.time'
    'esx-9.tls-ciphers'
    'esx-9.tpm-configuration'
    'esx-9.transparent-page-sharing'
    'esx-9.updates'
    'esx-9.vib-acceptance-level-supported'
    'esx-9.vib-trusted-binaries'
    'esx-9.vmk-management'
    'esx-9.vmotion-encryption-offload'
)
foreach ($requested in $Controls) {
    if ($requested -notin $coveredControls) {
        Write-Log "Requested control '$requested' is not covered by this script." -Level "WARNING" -OutputFileName $OutputFileName
    }
}

#######################################################################################################

$currentDateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Log-Message "VMware ESX Host Security Settings Audit Utility 9.1.0" -Level "INFO"
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
# Comparators: eq = equal, ge = greater or equal (more secure), le = less or equal (more secure),
# le-nonzero = less or equal but not zero (for timeouts where 0 disables the timeout entirely)
$scg_adv = @{
    'Security.AccountUnlockTime' = @{ Expected = 900; Comparator = 'ge'; Control = 'esx-9.account-lockout-duration' }
    'Security.AccountLockFailures' = @{ Expected = 5; Comparator = 'le'; Control = 'esx-9.account-lockout-max-attempts' }
    'Security.PasswordQualityControlPwquality' = @{ Expected = 'retry=3 dcredit=-1 ucredit=-1 lcredit=-1 ocredit=-1 minlen=15 difok=4 enforce_for_root'; Comparator = 'eq'; Control = 'esx-9.password-complexity' }
    'Security.PasswordHistory' = @{ Expected = 5; Comparator = 'ge'; Control = 'esx-9.account-password-history' }
    'Security.PasswordMaxDays' = @{ Expected = 99999; Comparator = 'eq'; Control = 'esx-9.password-max-age' }
    'Config.HostAgent.vmacore.soap.sessionTimeout' = @{ Expected = 15; Comparator = 'le-nonzero'; Control = 'esx-9.api-soap-timeout' }
    'Config.HostAgent.plugins.solo.enableMob' = @{ Expected = $false; Comparator = 'eq'; Control = 'esx-9.deactivate-mob' }
    'Config.HostAgent.plugins.hostsvc.esxAdminsGroupAutoAdd' = @{ Expected = $false; Comparator = 'eq'; Control = 'esx-9.ad-admin-group-autoadd' }
    'Config.HostAgent.plugins.vimsvc.authValidateInterval' = @{ Expected = 90; Comparator = 'ge'; Control = 'esx-9.ad-admin-validate-interval' }
    'UserVars.DcuiTimeOut' = @{ Expected = 600; Comparator = 'le-nonzero'; Control = 'esx-9.dcui-timeout' }
    'UserVars.SuppressHyperthreadWarning' = @{ Expected = 0; Comparator = 'eq'; Control = 'esx-9.cpu-hyperthread-warning' }
    'UserVars.SuppressShellWarning' = @{ Expected = 0; Comparator = 'eq'; Control = 'esx-9.shell-warning' }
    'UserVars.HostClientSessionTimeout' = @{ Expected = 900; Comparator = 'le-nonzero'; Control = 'esx-9.session-timeout' }
    'Net.BMCNetworkEnable' = @{ Expected = 0; Comparator = 'eq'; Control = 'esx-9.hardware-virtual-nic' }
    'DCUI.Access' = @{ Expected = 'root'; Comparator = 'eq'; Control = 'esx-9.lockdown-dcui-access' }
    'Syslog.global.auditRecord.storageEnable' = @{ Expected = $true; Comparator = 'eq'; Control = 'esx-9.log-audit-local' }
    'Syslog.global.auditRecord.storageCapacity' = @{ Expected = 100; Comparator = 'ge'; Control = 'esx-9.log-audit-local-capacity' }
    'Syslog.global.auditRecord.remoteEnable' = @{ Expected = $true; Comparator = 'eq'; Control = 'esx-9.log-audit-forwarding' }
    'Config.HostAgent.log.level' = @{ Expected = 'info'; Comparator = 'eq'; Control = 'esx-9.log-level' }
    'Syslog.global.certificate.checkSSLCerts' = @{ Expected = $true; Comparator = 'eq'; Control = 'esx-9.log-forwarding-tls-ciphers' }
    'Syslog.global.certificate.strictX509Compliance' = @{ Expected = $true; Comparator = 'eq'; Control = 'esx-9.log-forwarding-tls-x509' }
    'Net.BlockGuestBPDU' = @{ Expected = 1; Comparator = 'eq'; Control = 'esx-9.network-bpdu' }
    'Net.DVFilterBindIpAddress' = @{ Expected = ''; Comparator = 'eq'; Control = 'esx-9.network-dvfilter' }
    'UserVars.ESXiShellInteractiveTimeOut' = @{ Expected = 900; Comparator = 'le-nonzero'; Control = 'esx-9.shell-interactive-timeout' }
    'UserVars.ESXiShellTimeOut' = @{ Expected = 600; Comparator = 'le-nonzero'; Control = 'esx-9.shell-timeout' }
    'Mem.ShareForceSalting' = @{ Expected = 2; Comparator = 'eq'; Control = 'esx-9.transparent-page-sharing' }
    'Mem.MemEagerZero' = @{ Expected = 1; Comparator = 'eq'; Control = 'esx-9.memeagerzero' }
    'Mem.EncryptTierNvme' = @{ Expected = 1; Comparator = 'eq'; Control = 'esx-9.memory-tiering-encryption' }
    'VMkernel.Boot.execInstalledOnly' = @{ Expected = $true; Comparator = 'eq'; Control = 'esx-9.vib-trusted-binaries' }
    'UserVars.HostClientCEIPOptIn' = @{ Expected = 2; Comparator = 'eq'; Control = 'esx-9.ceip-disable' }
    'Config.HostAgent.plugins.vmsvc.allowForensicSnapshots' = @{ Expected = $false; Comparator = 'eq'; Control = 'esx-9.forensic-snapshots' }
    'Net.ReversePathFwdCheckPromisc' = @{ Expected = 1; Comparator = 'eq'; Control = 'esx-9.network-rpf-promisc' }
    'Migrate.VMotionEncryptionOffload' = @{ Expected = 1; Comparator = 'eq'; Control = 'esx-9.vmotion-encryption-offload' }
}

foreach ($param in $scg_adv.GetEnumerator()) {
    if (-not (Test-Control $param.Value.Control)) { continue }
    $vmval = (Get-AdvancedSetting -Entity $obj "$($param.Name)").Value
    $expected = $param.Value.Expected
    $comparator = $param.Value.Comparator

    $pass = switch ($comparator) {
        'eq' { $vmval -eq $expected }
        'ge' { $vmval -ge $expected }
        'le' { $vmval -le $expected }
        'le-nonzero' { ($vmval -gt 0) -and ($vmval -le $expected) }
    }

    if ($pass) {
        Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS" -Control $param.Value.Control
    } else {
        Log-Message "$name`: $($param.Name) not configured correctly ($vmval)" -Level "FAIL" -Control $param.Value.Control
    }
}

#####################
# Tests for things that should not be set a certain way
$scg_not = @{
    'Annotations.WelcomeMessage' = @{ Expected = ''; Control = 'esx-9.login-message' }
    'Config.Etc.issue' = @{ Expected = ''; Control = 'esx-9.etc-issue' }
    'Syslog.global.logHost' = @{ Expected = ''; Control = 'esx-9.log-forwarding' }
    'Config.HostAgent.plugins.hostsvc.esxAdminsGroup' = @{ Expected = 'ESX Admins'; Control = 'esx-9.ad-admin-group-name' }
}

foreach ($param in $scg_not.GetEnumerator() )
{
    if (-not (Test-Control $param.Value.Control)) { continue }
    $vmval = (Get-AdvancedSetting -Entity $obj "$($param.Name)").Value

    if ($vmval -eq $($param.Value.Expected)) {
        Log-Message "$name`: $($param.Name) not configured correctly ($vmval)" -Level "FAIL" -Control $param.Value.Control
    } else {
        Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS" -Control $param.Value.Control
    }
}

#####################
# Test local log output locations for persistence (esx-9.log-persistent, esx-9.log-audit-persistent)
if ((Test-Control 'esx-9.log-persistent') -or (Test-Control 'esx-9.log-audit-persistent')) {
    $persistent = $ESXcli.system.syslog.config.get.Invoke() | Select-Object -ExpandProperty LocalLogOutputIsPersistent
    $localsyslog = $ESXcli.system.syslog.config.get.Invoke() | Select-Object -ExpandProperty LocalLogOutput
    $localauditlog = $obj | Get-AdvancedSetting Syslog.global.auditRecord.storageDirectory | Select-Object -ExpandProperty Value

    if (Test-Control 'esx-9.log-persistent') {
        if ($persistent) {
            Log-Message "$name`: Local log location is persistent ($localsyslog)" -Level "PASS" -Control 'esx-9.log-persistent'
        } else {
            Log-Message "$name`: Local log location is not persistent ($localsyslog)" -Level "FAIL" -Control 'esx-9.log-persistent'
        }
    }

    if (Test-Control 'esx-9.log-audit-persistent') {
        if (($localsyslog -like "/scratch*") -and ($localauditlog -like "*scratch*") -and ($persistent)) {
            Log-Message "$name`: Local audit log location is persistent ($localsyslog, $localauditlog)" -Level "PASS" -Control 'esx-9.log-audit-persistent'
        } else {
            Log-Message "$name`: Local audit log location is not persistent ($localsyslog, $localauditlog)" -Level "FAIL" -Control 'esx-9.log-audit-persistent'
        }
    }
}

#####################
# Test Log Filters (esx-9.log-filter)
if (Test-Control 'esx-9.log-filter') {
    $value = $ESXcli.system.syslog.config.logfilter.get.invoke() | Select-Object -ExpandProperty LogFilteringEnabled
    if ($value -eq 'false') {
        Log-Message "$name`: Log filtering is deactivated ($value)" -Level "PASS" -Control 'esx-9.log-filter'
    } else {
        Log-Message "$name`: Log filtering is enabled ($value)" -Level "FAIL" -Control 'esx-9.log-filter'
    }
}

#####################
# Test DCUI user (esx-9.disable-accounts-dcui)
if (Test-Control 'esx-9.disable-accounts-dcui') {
    $value = $ESXcli.system.account.list.Invoke() | Where-Object { $_.UserID -eq 'dcui' } | Select-Object -ExpandProperty Shellaccess
    if ($value -eq 'false') {
        Log-Message "$name`: DCUI user has shell access deactivated ($value)" -Level "PASS" -Control 'esx-9.disable-accounts-dcui'
    } else {
        Log-Message "$name`: DCUI user has shell access enabled ($value)" -Level "FAIL" -Control 'esx-9.disable-accounts-dcui'
    }
}

#####################
# Test Entropy Sources (esx-9.entropy)
if (Test-Control 'esx-9.entropy') {
    $value1 = $ESXcli.system.settings.kernel.list.Invoke() | Where-Object {$_.Name -eq "disableHwrng"} | Select-Object -ExpandProperty Configured
    $value2 = $ESXcli.system.settings.kernel.list.Invoke() | Where-Object {$_.Name -eq "entropySources"} | Select-Object -ExpandProperty Configured

    if ($value1 -eq 'FALSE' -and $value2 -eq '0') {
        Log-Message "$name`: Entropy sources configured correctly ($value1, $value2)" -Level "PASS" -Control 'esx-9.entropy'
    } else {
        Log-Message "$name`: Entropy sources not configured correctly ($value1, $value2)" -Level "FAIL" -Control 'esx-9.entropy'
    }
}

#####################
# Test Host Secure Boot capability (esx-9.hardware-secureboot)
if (Test-Control 'esx-9.hardware-secureboot') {
    $value = $view.Capability.UefiSecureBoot
    if ($value -eq 'true') {
        Log-Message "$name`: Secure Boot is enabled on the host ($value)" -Level "PASS" -Control 'esx-9.hardware-secureboot'
    } else {
        Log-Message "$name`: Secure Boot is not enabled on the host ($value)" -Level "FAIL" -Control 'esx-9.hardware-secureboot'
    }
}

#####################
# Test Host Secure Boot Enforcement (esx-9.secureboot-enforcement)
if (Test-Control 'esx-9.secureboot-enforcement') {
    $value = $ESXcli.system.settings.encryption.get.Invoke() | Select-Object -ExpandProperty RequireSecureBoot
    if ($value -eq 'true') {
        Log-Message "$name`: Secure Boot TPM-based enforcement is enabled ($value)" -Level "PASS" -Control 'esx-9.secureboot-enforcement'
    } else {
        Log-Message "$name`: Secure Boot TPM-based enforcement is not enabled ($value)" -Level "FAIL" -Control 'esx-9.secureboot-enforcement'
    }
}

#####################
# Test for TPM Configuration Encryption  (esx-9.tpm-configuration)
if (Test-Control 'esx-9.tpm-configuration') {
    $value = $ESXcli.system.settings.encryption.get.Invoke() | Select-Object -ExpandProperty Mode
    if ($value -eq 'TPM') {
        Log-Message "$name`: TPM configuration encryption is enabled ($value)" -Level "PASS" -Control 'esx-9.tpm-configuration'
    } else {
        Log-Message "$name`: TPM configuration encryption is not enabled ($value)" -Level "FAIL" -Control 'esx-9.tpm-configuration'
    }
}

#####################
# Test for Key Persistence (esx-9.key-persistence)
if (Test-Control 'esx-9.key-persistence') {
    $value = $ESXcli.system.security.keypersistence.get.invoke() | Select-Object -ExpandProperty Enabled
    if ($value -eq 'false') {
        Log-Message "$name`: Key persistence is not enabled ($value)" -Level "PASS" -Control 'esx-9.key-persistence'
    } else {
        Log-Message "$name`: Key persistence is enabled ($value)" -Level "FAIL" -Control 'esx-9.key-persistence'
    }
}

#####################
# Test the TLS Profile (esx-9.tls-ciphers)
if (Test-Control 'esx-9.tls-ciphers') {
    $value = $ESXcli.system.tls.server.get.invoke() | Select-Object -ExpandProperty Profile
    if ($value -eq 'NIST_2024_TLS_13_ONLY') {
        Log-Message "$name`: TLS profile is configured correctly ($value)" -Level "PASS" -Control 'esx-9.tls-ciphers'
    } else {
        Log-Message "$name`: TLS profile is not configured correctly ($value)" -Level "FAIL" -Control 'esx-9.tls-ciphers'
    }
}

#####################
# Test Software Acceptance Level (VMwareCertified, VMwareAccepted, PartnerSupported, CommunitySupported) (esx-9.vib-acceptance-level-supported)
if (Test-Control 'esx-9.vib-acceptance-level-supported') {
    $value = $ESXcli.software.acceptance.get.Invoke()
    if (($value -eq 'PartnerSupported') -or ($value -eq 'VMwareCertified') -or ($value -eq 'VMwareAccepted')) {
        Log-Message "$name`: Host Image Profile Acceptance Level is configured correctly ($value)" -Level "PASS" -Control 'esx-9.vib-acceptance-level-supported'
    } else {
        Log-Message "$name`: Host Image Profile Acceptance Level is not configured correctly ($value)" -Level "FAIL" -Control 'esx-9.vib-acceptance-level-supported'
    }
}

#####################
# Test the menagerie of SSH configuration settings (esx-9.ssh)
if (Test-Control 'esx-9.ssh') {
    # Query the SSH server configuration once; it is filtered repeatedly below
    $sshServerConfig = $ESXcli.system.ssh.server.config.list.invoke()

    $value = $ESXcli.system.security.fips140.ssh.get.Invoke() | Select-Object -ExpandProperty Enabled
    if ($value -eq 'true') {
        Log-Message "$name`: SSH has FIPS mode enabled ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        Log-Message "$name`: SSH does not have FIPS mode enabled ($value)" -Level "FAIL" -Control 'esx-9.ssh'
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'ciphers'} | Select-Object -ExpandProperty Value
    if ($value -eq 'aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr') {
        Log-Message "$name`: SSH ciphers configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        Log-Message "$name`: SSH ciphers not configured correctly ($value)" -Level "FAIL" -Control 'esx-9.ssh'
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'gatewayports'} | Select-Object -ExpandProperty Value
    if ($value -eq 'no') {
        Log-Message "$name`: SSH gatewayports configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        Log-Message "$name`: SSH gatewayports not configured correctly ($value)" -Level "FAIL" -Control 'esx-9.ssh'
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'hostbasedauthentication'} | Select-Object -ExpandProperty Value
    if ($value -eq 'no') {
        Log-Message "$name`: SSH hostbasedauthentication configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        Log-Message "$name`: SSH hostbasedauthentication not configured correctly ($value)" -Level "FAIL" -Control 'esx-9.ssh'
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'clientalivecountmax'} | Select-Object -ExpandProperty Value
    if ($value -eq '3') {
        Log-Message "$name`: SSH clientalivecountmax configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        Log-Message "$name`: SSH clientalivecountmax not configured correctly ($value)" -Level "FAIL" -Control 'esx-9.ssh'
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'clientaliveinterval'} | Select-Object -ExpandProperty Value
    if ($value -eq '200') {
        Log-Message "$name`: SSH clientaliveinterval configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        Log-Message "$name`: SSH clientaliveinterval not configured correctly ($value)" -Level "FAIL" -Control 'esx-9.ssh'
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'banner'} | Select-Object -ExpandProperty Value
    if ($value -eq '/etc/issue') {
        Log-Message "$name`: SSH banner configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        Log-Message "$name`: SSH banner not configured correctly ($value)" -Level "FAIL" -Control 'esx-9.ssh'
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'ignorerhosts'} | Select-Object -ExpandProperty Value
    if ($value -eq 'yes') {
        Log-Message "$name`: SSH ignorerhosts configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        Log-Message "$name`: SSH ignorerhosts not configured correctly ($value)" -Level "FAIL" -Control 'esx-9.ssh'
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'allowstreamlocalforwarding'} | Select-Object -ExpandProperty Value
    if ($value -eq 'no') {
        Log-Message "$name`: SSH allowstreamlocalforwarding configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        Log-Message "$name`: SSH allowstreamlocalforwarding not configured correctly ($value)" -Level "FAIL" -Control 'esx-9.ssh'
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'allowtcpforwarding'} | Select-Object -ExpandProperty Value
    if ($value -eq 'no') {
        Log-Message "$name`: SSH allowtcpforwarding configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        Log-Message "$name`: SSH allowtcpforwarding not configured correctly ($value)" -Level "FAIL" -Control 'esx-9.ssh'
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'permittunnel'} | Select-Object -ExpandProperty Value
    if ($value -eq 'no') {
        Log-Message "$name`: SSH permittunnel configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        Log-Message "$name`: SSH permittunnel not configured correctly ($value)" -Level "FAIL" -Control 'esx-9.ssh'
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'permituserenvironment'} | Select-Object -ExpandProperty Value
    if ($value -eq 'no') {
        Log-Message "$name`: SSH permituserenvironment configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        Log-Message "$name`: SSH permituserenvironment not configured correctly ($value)" -Level "FAIL" -Control 'esx-9.ssh'
    }
}

#####################
# Test ESX services (esx-9.deactivate-shell, esx-9.snmp, esx-9.ssh)
$services_should_be_false = @{
    'TSM' = 'esx-9.deactivate-shell'
    'snmpd' = 'esx-9.snmp'
    'TSM-SSH' = 'esx-9.ssh'
}

foreach ($service in $services_should_be_false.GetEnumerator()) {
    if (-not (Test-Control $service.Value)) { continue }
    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service.Name} | Select-Object -ExpandProperty Running
    if ($value -eq $false) {
        Log-Message "$name`: $($service.Name) is not running ($value)" -Level "PASS" -Control $service.Value
    } else {
        Log-Message "$name`: $($service.Name) is running ($value)" -Level "FAIL" -Control $service.Value
    }

    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service.Name} | Select-Object -ExpandProperty Policy
    if ($value -eq 'off') {
        Log-Message "$name`: $($service.Name) is not configured to start ($value)" -Level "PASS" -Control $service.Value
    } else {
        Log-Message "$name`: $($service.Name) is configured to start ($value)" -Level "FAIL" -Control $service.Value
    }
}

#####################
# Test NTP services (esx-9.time)
if (Test-Control 'esx-9.time') {
    # You might also have PTP, in which case this may fail but your environment is alright.
    $services_should_be_true = "ntpd"

    foreach ($service in $services_should_be_true) {
        $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Running
        if ($value -eq $true) {
            Log-Message "$name`: $service is running ($value)" -Level "PASS" -Control 'esx-9.time'
        } else {
            Log-Message "$name`: $service is not running ($value)" -Level "FAIL" -Control 'esx-9.time'
        }

        $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Policy
        if ($value -eq 'on') {
            Log-Message "$name`: $service is configured to start ($value)" -Level "PASS" -Control 'esx-9.time'
        } else {
            Log-Message "$name`: $service is not configured to start ($value)" -Level "FAIL" -Control 'esx-9.time'
        }
    }
}

#####################
# Test NTP configurations (esx-9.time)
if (Test-Control 'esx-9.time') {
    $value = $obj | Get-VMHostNtpServer
    if ($null -eq $value) {
        Log-Message "$name`: NTP client not configured ($value)" -Level "FAIL" -Control 'esx-9.time'
    } else {
        Log-Message "$name`: NTP client configured ($value)" -Level "PASS" -Control 'esx-9.time'
    }
}

#####################
# Test lockdown mode (esx-9.lockdown-exception-users, esx-9.lockdown-mode)
if (Test-Control 'esx-9.lockdown-exception-users') {
    $value = ((Get-View($view).ConfigManager.HostAccessManager)).QueryLockdownExceptions()
    $allowedExceptionUsers = @('da-user', 'lldpVim-user', 'mux_user', 'nsx-user')

    # Check if all exception users are in the allowed list
    $hasDisallowedUsers = $false
    if ($value) {
        foreach ($user in $value) {
            if ($user -notin $allowedExceptionUsers) {
                $hasDisallowedUsers = $true
                break
            }
        }
    }

    if (-not $hasDisallowedUsers) {
        Log-Message "$name`: Lockdown Mode exception users configured correctly ($value)" -Level "PASS" -Control 'esx-9.lockdown-exception-users'
    } else {
        Log-Message "$name`: Lockdown Mode exception users contains disallowed users ($value)" -Level "FAIL" -Control 'esx-9.lockdown-exception-users'
    }
}

if (Test-Control 'esx-9.lockdown-mode') {
    $value = (Get-View ($view).ConfigManager.HostAccessManager).LockdownMode
    if ($value -eq 'lockdownDisabled') {
        Log-Message "$name`: Lockdown Mode is not configured correctly ($value)" -Level "FAIL" -Control 'esx-9.lockdown-mode'
    } else {
        Log-Message "$name`: Lockdown Mode is configured correctly ($value)" -Level "PASS" -Control 'esx-9.lockdown-mode'
    }
}

#####################
# Test Standard Switches (esx-9.network-standard-reject-promiscuous-mode, esx-9.network-standard-reject-mac-changes,
# esx-9.network-standard-reject-forged-transmit, esx-9.network-vgt; selecting any of these runs the group)
$stdSwitchControls = @('esx-9.network-standard-reject-promiscuous-mode', 'esx-9.network-standard-reject-mac-changes', 'esx-9.network-standard-reject-forged-transmit', 'esx-9.network-vgt')
$switches = if ($stdSwitchControls | Where-Object { Test-Control $_ }) { Get-VirtualSwitch -VMHost $obj -Standard } else { @() }

foreach ($switch in $switches) {
    $value = $switch | Get-SecurityPolicy | Select-Object -ExpandProperty AllowPromiscuous
    if ($value -eq $false) {
        Log-Message "$name`: Standard switch `'$switch`' is not configured to allow promiscuous mode ($value)" -Level "PASS" -Control 'esx-9.network-standard-reject-promiscuous-mode'
    } else {
        Log-Message "$name`: Standard switch `'$switch`' is configured to allow promiscuous mode ($value)" -Level "FAIL" -Control 'esx-9.network-standard-reject-promiscuous-mode'
    }

    $value = $switch | Get-SecurityPolicy | Select-Object -ExpandProperty MacChanges
    if ($value -eq $false) {
        Log-Message "$name`: Standard switch `'$switch`' is not configured to allow MAC address changes ($value)" -Level "PASS" -Control 'esx-9.network-standard-reject-mac-changes'
    } else {
        Log-Message "$name`: Standard switch `'$switch`' is configured to allow MAC address changes ($value)" -Level "FAIL" -Control 'esx-9.network-standard-reject-mac-changes'
    }

    $value = $switch | Get-SecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
    if ($value -eq $false) {
        Log-Message "$name`: Standard switch `'$switch`' is not configured to allow forged transmits ($value)" -Level "PASS" -Control 'esx-9.network-standard-reject-forged-transmit'
    } else {
        Log-Message "$name`: Standard switch `'$switch`' is configured to allow forged transmits ($value)" -Level "FAIL" -Control 'esx-9.network-standard-reject-forged-transmit'
    }

    $portgroups = Get-VirtualPortGroup -VirtualSwitch $switch
    foreach ($portgroup in $portgroups) {
        $value = $portgroup | Get-SecurityPolicy | Select-Object -ExpandProperty AllowPromiscuous
        if ($value -eq $false) {
            Log-Message "$name`: Standard portgroup `'$portgroup`' is not configured to allow promiscuous mode ($value)" -Level "PASS" -Control 'esx-9.network-standard-reject-promiscuous-mode'
        } else {
            Log-Message "$name`: Standard portgroup `'$portgroup`' is configured to allow promiscuous mode ($value)" -Level "FAIL" -Control 'esx-9.network-standard-reject-promiscuous-mode'
        }
    
        $value = $portgroup | Get-SecurityPolicy | Select-Object -ExpandProperty MacChanges
        if ($value -eq $false) {
            Log-Message "$name`: Standard portgroup `'$portgroup`' is not configured to allow MAC address changes ($value)" -Level "PASS" -Control 'esx-9.network-standard-reject-mac-changes'
        } else {
            Log-Message "$name`: Standard portgroup `'$portgroup`' is configured to allow MAC address changes ($value)" -Level "FAIL" -Control 'esx-9.network-standard-reject-mac-changes'
        }
    
        $value = $portgroup | Get-SecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
        if ($value -eq $false) {
            Log-Message "$name`: Standard portgroup `'$portgroup`' is not configured to allow forged transmits ($value)" -Level "PASS" -Control 'esx-9.network-standard-reject-forged-transmit'
        } else {
            Log-Message "$name`: Standard portgroup `'$portgroup`' is configured to allow forged transmits ($value)" -Level "FAIL" -Control 'esx-9.network-standard-reject-forged-transmit'
        }

        $value = $portgroup | Select-Object -ExpandProperty VLanID
        if ($value -eq 4095) {
            Log-Message "$name`: Standard portgroup `'$portgroup`' is configured to allow VLAN 4095 ($value)" -Level "FAIL" -Control 'esx-9.network-vgt'
        } else {
            Log-Message "$name`: Standard portgroup `'$portgroup`' is not configured to allow VLAN 4095 ($value)" -Level "PASS" -Control 'esx-9.network-vgt'
        }
       
        if (($value -eq 1) -or ($null -eq $value)) {
            Log-Message "$name`: Standard portgroup `'$portgroup`' may be configured to use a default VLAN and should be assessed ($value)" -Level "FAIL" -Control 'esx-9.network-vgt'
        } else {
            Log-Message "$name`: Standard portgroup `'$portgroup`' does not appear to be configured to use a default VLAN ($value)" -Level "PASS" -Control 'esx-9.network-vgt'
        }
    }

}

#####################
# Test VMkernel NIC service separation (esx-9.vmk-management)
$vmks = if (Test-Control 'esx-9.vmk-management') { $obj | Get-VMHostNetworkAdapter -VMKernel } else { @() }
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
                Log-Message "$name`: VMkernel NIC `'$vmk`' has management configured alongside other services and should be assessed ($valueStr)" -Level "FAIL" -Control 'esx-9.vmk-management'
        } else {
            Log-Message "$name`: VMkernel NIC `'$vmk`' has only management configured ($valueStr)" -Level "PASS" -Control 'esx-9.vmk-management'
        }
    } else {
        Log-Message "$name`: VMkernel NIC `'$vmk`' is not configured for management ($valueStr)" -Level "PASS" -Control 'esx-9.vmk-management'
    }
}

#####################
# Test firewall default policy (incoming traffic should be blocked by default) (esx-9.firewall-incoming-default)
if (Test-Control 'esx-9.firewall-incoming-default') {
    try {
        $value = $obj | Get-VMHostFirewallDefaultPolicy
        if ($value.IncomingEnabled -eq $false) {
            Log-Message "$name`: Firewall default policy blocks incoming traffic (IncomingEnabled: $($value.IncomingEnabled))" -Level "PASS" -Control 'esx-9.firewall-incoming-default'
        } else {
            Log-Message "$name`: Firewall default policy does not block incoming traffic (IncomingEnabled: $($value.IncomingEnabled))" -Level "FAIL" -Control 'esx-9.firewall-incoming-default'
        }
    } catch {
        Log-Message "$name`: Failed to check firewall default policy: $_" -Level "ERROR" -Control 'esx-9.firewall-incoming-default'
    }
}

#####################
# Test firewall ruleset allowed IP restrictions (enabled rulesets should not allow all IPs) (esx-9.firewall-restrict-access)
if (Test-Control 'esx-9.firewall-restrict-access') {
    try {
        $rulesets = $ESXcli.network.firewall.ruleset.list.invoke() | Where-Object {($_.Enabled -eq $true)}
        $openRulesets = @()
        foreach ($ruleset in $rulesets) {
            $arguments = $ESXcli.network.firewall.ruleset.allowedip.list.CreateArgs()
            $arguments.rulesetid = $ruleset.Name
            $allowed = $ESXcli.network.firewall.ruleset.allowedip.list.invoke($arguments)
            if ($allowed.AllowedIPAddresses -eq 'All') {
                $openRulesets += $ruleset.Name
            }
        }
        if ($openRulesets.Count -eq 0) {
            Log-Message "$name`: All enabled firewall rulesets restrict the source IP addresses they accept connections from" -Level "PASS" -Control 'esx-9.firewall-restrict-access'
        } else {
            Log-Message "$name`: $($openRulesets.Count) enabled firewall ruleset(s) allow connections from all IP addresses ($($openRulesets -join ', '))" -Level "FAIL" -Control 'esx-9.firewall-restrict-access'
        }
    } catch {
        Log-Message "$name`: Failed to check firewall ruleset allowed IPs: $_" -Level "ERROR" -Control 'esx-9.firewall-restrict-access'
    }
}

#####################
# Test for TPM 2.0 presence (esx-9.hardware-tpm)
if (Test-Control 'esx-9.hardware-tpm') {
    $value = $view.Capability.TpmSupported
    $tpmver = $view.Capability.TpmVersion
    if (($value -eq $true) -and ($tpmver -eq '2.0')) {
        Log-Message "$name`: TPM 2.0 is present and enabled ($tpmver)" -Level "PASS" -Control 'esx-9.hardware-tpm'
    } else {
        Log-Message "$name`: TPM 2.0 is not present or not enabled (Supported: $value, Version: $tpmver)" -Level "FAIL" -Control 'esx-9.hardware-tpm'
    }
}

#####################
# Test for Intel TXT (only available on supported Intel platforms) (esx-9.hardware-cpu-intel-txt)
if (Test-Control 'esx-9.hardware-cpu-intel-txt') {
    $value = $view.Capability.TxtEnabled
    if ($value -eq $true) {
        Log-Message "$name`: Intel TXT is enabled ($value)" -Level "PASS" -Control 'esx-9.hardware-cpu-intel-txt'
    } else {
        Log-Message "$name`: Intel TXT is not enabled or not available on this platform ($value). Enable it where the hardware supports it." -Level "INFO" -Control 'esx-9.hardware-cpu-intel-txt'
    }
}

#####################
# Record ESX version and build for lifecycle review (esx-9.supported, esx-9.updates)
if (Test-Control 'esx-9.supported') {
    Log-Message "$name`: ESX version $($obj.Version) build $($obj.Build). Compare against the lifecycle policy on the Broadcom Support Portal." -Level "INFO" -Control 'esx-9.supported'
}
if (Test-Control 'esx-9.updates') {
    Log-Message "$name`: ESX version $($obj.Version) build $($obj.Build). Compare against the latest available patches on the Broadcom Support Portal." -Level "INFO" -Control 'esx-9.updates'
}

Log-Message "$name`: Audit of $name completed at $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")" -Level "INFO"