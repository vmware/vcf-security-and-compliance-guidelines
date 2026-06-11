<#
    Script Name: VMware vSphere ESX Host Security Settings Remediation Utility
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
    # Remediate standard virtual network switches
    [Parameter(Mandatory=$false)]
    [switch]$RemediateStandardSwitches = $false,
    # Enable lockdown mode
    [Parameter(Mandatory=$false)]
    [switch]$EnableLockdownMode = $false,
    # Remediate TLS ciphers
    [Parameter(Mandatory=$false)]
    [switch]$RemediateTLSCiphers = $false,
    # Remediate only these SCG control IDs (default: all)
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
    'esx-9.forensic-snapshots'
    'esx-9.hardware-virtual-nic'
    'esx-9.key-persistence'
    'esx-9.lockdown-dcui-access'
    'esx-9.lockdown-exception-users'
    'esx-9.lockdown-mode'
    'esx-9.log-audit-forwarding'
    'esx-9.log-audit-local'
    'esx-9.log-audit-local-capacity'
    'esx-9.log-filter'
    'esx-9.log-forwarding-tls-ciphers'
    'esx-9.log-forwarding-tls-x509'
    'esx-9.log-level'
    'esx-9.login-message'
    'esx-9.memeagerzero'
    'esx-9.memory-tiering-encryption'
    'esx-9.network-bpdu'
    'esx-9.network-dvfilter'
    'esx-9.network-rpf-promisc'
    'esx-9.network-standard-reject-forged-transmit'
    'esx-9.network-standard-reject-mac-changes'
    'esx-9.network-standard-reject-promiscuous-mode'
    'esx-9.password-complexity'
    'esx-9.password-max-age'
    'esx-9.secureboot-enforcement'
    'esx-9.session-timeout'
    'esx-9.shell-interactive-timeout'
    'esx-9.shell-timeout'
    'esx-9.shell-warning'
    'esx-9.snmp'
    'esx-9.ssh'
    'esx-9.time'
    'esx-9.tls-ciphers'
    'esx-9.tpm-configuration'
    'esx-9.transparent-page-sharing'
    'esx-9.vib-acceptance-level-supported'
    'esx-9.vib-trusted-binaries'
    'esx-9.vmotion-encryption-offload'
)
foreach ($requested in $Controls) {
    if ($requested -notin $coveredControls) {
        Write-Log "Requested control '$requested' is not covered by this script." -Level "WARNING" -OutputFileName $OutputFileName
    }
}

#######################################################################################################

$currentDateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Log-Message "VMware ESX Host Security Settings Remediation Utility 9.1.0" -Level "INFO"
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
# in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided "AS IS."
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
Log-Message "It may also set things that require host reboots." -Level "ERROR"
Log-Message "If you accept the risk, please remove or comment this section of the" -Level "ERROR"
Log-Message "script (lines 181-192). By doing so, you accept any and all risk this" -Level "ERROR"
Log-Message "script and these commands may pose to your environment." -Level "ERROR"
Exit

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
        try {
            Get-AdvancedSetting -Entity $obj "$($param.Name)" | Set-AdvancedSetting -Value $expected -Confirm:$false -ErrorAction Stop | Out-Null
            Log-Message "$name`: $($param.Name) has been updated ($vmval -> $expected)" -Level "UPDATE" -Control $param.Value.Control
        }
        catch {
            Log-Message "$name`: $($param.Name) could not be updated ($vmval)" -Level "FAIL" -Control $param.Value.Control
        }
    }
}

#####################
# Remediate esxAdminsGroup if still set to default (esx-9.ad-admin-group-name)
if (Test-Control 'esx-9.ad-admin-group-name') {
    $value = (Get-AdvancedSetting -Entity $obj "Config.HostAgent.plugins.hostsvc.esxAdminsGroup").Value
    if ($value -eq 'ESX Admins') {
        try {
            $randomGroup = -join ((65..90) + (97..122) | Get-Random -Count 10 | ForEach-Object {[char]$_})
            Get-AdvancedSetting -Entity $obj "Config.HostAgent.plugins.hostsvc.esxAdminsGroup" | Set-AdvancedSetting -Value $randomGroup -Confirm:$false -ErrorAction Stop | Out-Null
            Log-Message "$name`: Config.HostAgent.plugins.hostsvc.esxAdminsGroup has been updated ($value -> $randomGroup)" -Level "UPDATE" -Control 'esx-9.ad-admin-group-name'
        }
        catch {
            Log-Message "$name`: Config.HostAgent.plugins.hostsvc.esxAdminsGroup could not be updated ($value)" -Level "FAIL" -Control 'esx-9.ad-admin-group-name'
        }
    } else {
        Log-Message "$name`: Config.HostAgent.plugins.hostsvc.esxAdminsGroup configured correctly ($value)" -Level "PASS" -Control 'esx-9.ad-admin-group-name'
    }
}

#####################
# Tests for banners
$scg_banner = @{

    'Annotations.WelcomeMessage' = @{ Expected = ''; Control = 'esx-9.login-message' }
    'Config.Etc.issue' = @{ Expected = ''; Control = 'esx-9.etc-issue' }

}

$sample_banner = "****************************************************************************`n* Authorized users only. Actual or attempted unauthorized use of this      *`n* system is prohibited and may result in criminal, civil, security, or     *`n* administrative proceedings and/or penalties. Use of this information     *`n* system indicates consent to monitoring and recording, without notice     *`n* or permission. Users have no expectation of privacy. Any information     *`n* stored on or transiting this system, or obtained by monitoring and/or    *`n* recording, may be disclosed to law enforcement and/or used in accordance *`n* with Federal law, State statute, and organization policy. If you are not *`n* an authorized user of this system, exit the system at this time.         *`n****************************************************************************`n"

foreach ($param in $scg_banner.GetEnumerator() )
{
    if (-not (Test-Control $param.Value.Control)) { continue }
    $vmval = (Get-AdvancedSetting -Entity $obj "$($param.Name)").Value

    if ($vmval -eq $($param.Value.Expected)) {
        try {
            Get-AdvancedSetting -Entity $obj "$($param.Name)" | Set-AdvancedSetting -Value $sample_banner -Confirm:$false -ErrorAction Stop | Out-Null
            Log-Message "$name`: $($param.Name) has been updated ($vmval -> $sample_banner)" -Level "UPDATE" -Control $param.Value.Control
        }
        catch {
            Log-Message "$name`: $($param.Name) could not be updated ($vmval)" -Level "FAIL" -Control $param.Value.Control
        }
    } else {
        Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS" -Control $param.Value.Control
    }
}

#####################
# Test Log Filters (esx-9.log-filter)
if (Test-Control 'esx-9.log-filter') {
    $value = $ESXcli.system.syslog.config.logfilter.get.invoke() | Select-Object -ExpandProperty LogFilteringEnabled 
    if ($value -eq 'false') {
        Log-Message "$name`: Log filtering is deactivated ($value)" -Level "PASS" -Control 'esx-9.log-filter'
    } else {
        try {
            $arguments = $esxcli.system.syslog.config.logfilter.set.CreateArgs()
            $arguments.logfilteringenabled = $false
            $ESXcli.system.syslog.config.logfilter.set.invoke($arguments) | Out-Null
            Log-Message "$name`: Log filtering has been updated ($value -> false)" -Level "UPDATE" -Control 'esx-9.log-filter'
        }
        catch {
            Log-Message "$name`: Log filtering could not be updated ($value)" -Level "FAIL" -Control 'esx-9.log-filter'
        }
    }
}

#####################
# Test DCUI user (esx-9.disable-accounts-dcui)
if (Test-Control 'esx-9.disable-accounts-dcui') {
    $value = $ESXcli.system.account.list.Invoke() | Where-Object { $_.UserID -eq 'dcui' } | Select-Object -ExpandProperty Shellaccess
    if ($value -eq 'false') {
        Log-Message "$name`: DCUI user has shell access deactivated ($value)" -Level "PASS" -Control 'esx-9.disable-accounts-dcui'
    } else {
        try {
            $arguments = $ESXcli.system.account.set.CreateArgs()
            $arguments.id = 'dcui'
            $arguments.shellaccess = "false"
            $ESXcli.system.account.set.Invoke($arguments) | Out-Null
            Log-Message "$name`: DCUI user has been updated ($value -> false)" -Level "UPDATE" -Control 'esx-9.disable-accounts-dcui'
        }
        catch {
            Log-Message "$name`: DCUI user could not be updated ($value)" -Level "FAIL" -Control 'esx-9.disable-accounts-dcui'
        }
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
        try {
            $arguments = $ESXcli.system.settings.kernel.set.CreateArgs()
            $arguments.setting = "disableHwrng"
            $arguments.value = "FALSE"
            $ESXcli.system.settings.kernel.set.invoke($arguments) | Out-Null
            $arguments.setting = "entropySources"
            $arguments.value = "0"
            $ESXcli.system.settings.kernel.set.invoke($arguments) | Out-Null
            Log-Message "$name`: Entropy sources have been updated ($value1, $value2 -> FALSE, 0)" -Level "UPDATE" -Control 'esx-9.entropy'
        }
        catch {
            Log-Message "$name`: Entropy sources could not be updated ($value1, $value2)" -Level "FAIL" -Control 'esx-9.entropy'
        }
    }
}

#####################
# Test Host Secure Boot Enforcement (esx-9.secureboot-enforcement)
if (Test-Control 'esx-9.secureboot-enforcement') {
    $value = $ESXcli.system.settings.encryption.get.Invoke() | Select-Object -ExpandProperty RequireSecureBoot
    if ($value -eq 'true') {
        Log-Message "$name`: Secure Boot enforcement is enabled ($value)" -Level "PASS" -Control 'esx-9.secureboot-enforcement'
    } else {
        try {
            $arguments = $ESXcli.system.settings.encryption.set.CreateArgs()
            $arguments.requiresecureboot = $true
            $ESXcli.system.settings.encryption.set.Invoke($arguments) | Out-Null
            Log-Message "$name`: Secure Boot TPM-based enforcement has been enabled ($value -> true)" -Level "UPDATE" -Control 'esx-9.secureboot-enforcement'
        }
        catch {
            Log-Message "$name`: Secure Boot TPM-based enforcement could not be enabled ($value)" -Level "FAIL" -Control 'esx-9.secureboot-enforcement'
        }
    }
}

#####################
# Test TPM Configuration Encryption (esx-9.tpm-configuration)
if (Test-Control 'esx-9.tpm-configuration') {
    $value = $ESXcli.system.settings.encryption.get.Invoke() | Select-Object -ExpandProperty Mode
    if ($value -eq 'TPM') {
        Log-Message "$name`: TPM configuration encryption is enabled ($value)" -Level "PASS" -Control 'esx-9.tpm-configuration'
    } else {
        try {
            $arguments = $ESXcli.system.settings.encryption.set.CreateArgs()
            $arguments.mode = "TPM"
            $ESXcli.system.settings.encryption.set.Invoke($arguments) | Out-Null
            Log-Message "$name`: TPM configuration encryption has been enabled ($value -> TPM)" -Level "UPDATE" -Control 'esx-9.tpm-configuration'
        }
        catch {
            Log-Message "$name`: TPM configuration encryption could not be enabled ($value)" -Level "FAIL" -Control 'esx-9.tpm-configuration'
        }
    }
}

#####################
# Test Software Acceptance Level (VMwareCertified, VMwareAccepted, PartnerSupported, CommunitySupported) (esx-9.vib-acceptance-level-supported)
if (Test-Control 'esx-9.vib-acceptance-level-supported') {
    $value = $ESXcli.software.acceptance.get.Invoke()
    if (($value -eq 'PartnerSupported') -or ($value -eq 'VMwareCertified') -or ($value -eq 'VMwareAccepted')) {
        Log-Message "$name`: Host Image Profile Acceptance Level is configured correctly ($value)" -Level "PASS" -Control 'esx-9.vib-acceptance-level-supported'
    } else {
        try {
            $arguments = $ESXcli.software.acceptance.set.CreateArgs()
            $arguments.level = "PartnerSupported" # VMwareCertified, VMwareAccepted, PartnerSupported, CommunitySupported
            $ESXcli.software.acceptance.set.Invoke($arguments) | Out-Null
            Log-Message "$name`: Host Image Profile Acceptance Level has been updated ($value -> PartnerSupported)" -Level "UPDATE" -Control 'esx-9.vib-acceptance-level-supported'
        }
        catch {
            Log-Message "$name`: Host Image Profile Acceptance Level could not be configured ($value)" -Level "FAIL" -Control 'esx-9.vib-acceptance-level-supported'
        }
    }
}

#####################
# Test the menagerie of SSH configuration settings (esx-9.ssh)
if (Test-Control 'esx-9.ssh') {
    # Query the SSH server configuration once; each setting below is checked against this pre-change state
    $sshServerConfig = $ESXcli.system.ssh.server.config.list.invoke()

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'ciphers'} | Select-Object -ExpandProperty Value
    if ($value -eq 'aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr') {
        Log-Message "$name`: SSH ciphers configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        try {
            $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
            $arguments.keyword = 'ciphers'
            $arguments.value = 'aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr'
            $ESXcli.system.ssh.server.config.set.Invoke($arguments)| Out-Null
            Log-Message "$name`: SSH ciphers have been updated ($value -> aes256-gcm@openssh.com,...)" -Level "UPDATE" -Control 'esx-9.ssh'
        }
        catch {
            Log-Message "$name`: SSH ciphers could not be configured ($value)" -Level "FAIL" -Control 'esx-9.ssh'
        }
    }

    $value = $ESXcli.system.security.fips140.ssh.get.Invoke() | Select-Object -ExpandProperty Enabled
    if ($value -eq 'true') {
        Log-Message "$name`: SSH has FIPS mode enabled ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        try {
            $arguments = $ESXcli.system.security.fips140.ssh.set.CreateArgs()
            $arguments.enable = $true
            $ESXcli.system.security.fips140.ssh.set.Invoke($arguments) | Out-Null
            Log-Message "$name`: SSH FIPS mode has been updated ($value -> true)" -Level "UPDATE" -Control 'esx-9.ssh'
        }
        catch {
            Log-Message "$name`: SSH FIPS mode could not be configured ($value)" -Level "FAIL" -Control 'esx-9.ssh'
        }
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'gatewayports'} | Select-Object -ExpandProperty Value
    if ($value -eq 'no') {
        Log-Message "$name`: SSH gatewayports configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        try {
            $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
            $arguments.keyword = 'gatewayports'
            $arguments.value = 'no'
            $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
            Log-Message "$name`: SSH gatewayports has been updated ($value -> no)" -Level "UPDATE" -Control 'esx-9.ssh'
        }
        catch {
            Log-Message "$name`: SSH gatewayports could not be configured ($value)" -Level "FAIL" -Control 'esx-9.ssh'
        }
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'hostbasedauthentication'} | Select-Object -ExpandProperty Value
    if ($value -eq 'no') {
        Log-Message "$name`: SSH hostbasedauthentication configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        try {
            $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
            $arguments.keyword = 'hostbasedauthentication'
            $arguments.value = 'no'
            $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
            Log-Message "$name`: SSH hostbasedauthentication has been updated ($value -> no)" -Level "UPDATE" -Control 'esx-9.ssh'
        }
        catch {
            Log-Message "$name`: SSH hostbasedauthentication could not be configured ($value)" -Level "FAIL" -Control 'esx-9.ssh'
        }
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'clientalivecountmax'} | Select-Object -ExpandProperty Value
    if ($value -eq '3') {
        Log-Message "$name`: SSH clientalivecountmax configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        try {
            $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
            $arguments.keyword = 'clientalivecountmax'
            $arguments.value = '3'
            $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
            Log-Message "$name`: SSH clientalivecountmax has been updated ($value -> 3)" -Level "UPDATE" -Control 'esx-9.ssh'
        }
        catch {
            Log-Message "$name`: SSH clientalivecountmax could not be configured ($value)" -Level "FAIL" -Control 'esx-9.ssh'
        }
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'clientaliveinterval'} | Select-Object -ExpandProperty Value
    if ($value -eq '200') {
        Log-Message "$name`: SSH clientaliveinterval configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        try {
            $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
            $arguments.keyword = 'clientaliveinterval'
            $arguments.value = '200'
            $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
            Log-Message "$name`: SSH clientaliveinterval has been updated ($value -> 200)" -Level "UPDATE" -Control 'esx-9.ssh'
        }
        catch {
            Log-Message "$name`: SSH clientaliveinterval could not be configured ($value)" -Level "FAIL" -Control 'esx-9.ssh'
        }
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'banner'} | Select-Object -ExpandProperty Value
    if ($value -eq '/etc/issue') {
        Log-Message "$name`: SSH banner configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        try {
            $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
            $arguments.keyword = 'banner'
            $arguments.value = '/etc/issue'
            $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
            Log-Message "$name`: SSH banner has been updated ($value -> /etc/issue)" -Level "UPDATE" -Control 'esx-9.ssh'
        }
        catch {
            Log-Message "$name`: SSH banner could not be configured ($value)" -Level "FAIL" -Control 'esx-9.ssh'
        }
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'ignorerhosts'} | Select-Object -ExpandProperty Value
    if ($value -eq 'yes') {
        Log-Message "$name`: SSH ignorerhosts configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        try {
            $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
            $arguments.keyword = 'ignorerhosts'
            $arguments.value = 'yes'
            $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
            Log-Message "$name`: SSH ignorerhosts has been updated ($value -> yes)" -Level "UPDATE" -Control 'esx-9.ssh'
        }
        catch {
            Log-Message "$name`: SSH ignorerhosts could not be configured ($value)" -Level "FAIL" -Control 'esx-9.ssh'
        }
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'allowstreamlocalforwarding'} | Select-Object -ExpandProperty Value
    if ($value -eq 'no') {
        Log-Message "$name`: SSH allowstreamlocalforwarding configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        try {
            $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
            $arguments.keyword = 'allowstreamlocalforwarding'
            $arguments.value = 'no'
            $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
            Log-Message "$name`: SSH allowstreamlocalforwarding has been updated ($value -> no)" -Level "UPDATE" -Control 'esx-9.ssh'
        }
        catch {
            Log-Message "$name`: SSH allowstreamlocalforwarding could not be configured ($value)" -Level "FAIL" -Control 'esx-9.ssh'
        }
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'allowtcpforwarding'} | Select-Object -ExpandProperty Value
    if ($value -eq 'no') {
        Log-Message "$name`: SSH allowtcpforwarding configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        try {
            $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
            $arguments.keyword = 'allowtcpforwarding'
            $arguments.value = 'no'
            $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
            Log-Message "$name`: SSH allowtcpforwarding has been updated ($value -> no)" -Level "UPDATE" -Control 'esx-9.ssh'
        }
        catch {
            Log-Message "$name`: SSH allowtcpforwarding could not be configured ($value)" -Level "FAIL" -Control 'esx-9.ssh'
        }
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'permittunnel'} | Select-Object -ExpandProperty Value
    if ($value -eq 'no') {
        Log-Message "$name`: SSH permittunnel configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        try {
            $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
            $arguments.keyword = 'permittunnel'
            $arguments.value = 'no'
            $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
            Log-Message "$name`: SSH permittunnel has been updated ($value -> no)" -Level "UPDATE" -Control 'esx-9.ssh'
        }
        catch {
            Log-Message "$name`: SSH permittunnel could not be configured ($value)" -Level "FAIL" -Control 'esx-9.ssh'
        }
    }

    $value = $sshServerConfig | Where-Object {$_.Key -eq 'permituserenvironment'} | Select-Object -ExpandProperty Value
    if ($value -eq 'no') {
        Log-Message "$name`: SSH permituserenvironment configured correctly ($value)" -Level "PASS" -Control 'esx-9.ssh'
    } else {
        try {
            $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
            $arguments.keyword = 'permituserenvironment'
            $arguments.value = 'no'
            $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
            Log-Message "$name`: SSH permituserenvironment has been updated ($value -> no)" -Level "UPDATE" -Control 'esx-9.ssh'
        }
        catch {
            Log-Message "$name`: SSH permituserenvironment could not be configured ($value)" -Level "FAIL" -Control 'esx-9.ssh'
        }
    }
}

#####################
# Test NTP configurations (service enablement is tested later) (esx-9.time)
if (Test-Control 'esx-9.time') {
    $value = $obj | Get-VMHostNtpServer
    if ($null -eq $value) {
        try {
            $ntp0 = "0.pool.ntp.org"
            $ntp1 = "1.pool.ntp.org"
            $ntp2 = "2.pool.ntp.org"
            $ntp3 = "3.pool.ntp.org"

            $obj | Add-VMHostNTPServer -NtpServer $ntp0 , $ntp1 , $ntp2 , $ntp3 -Confirm:$false | Out-Null
            Log-Message "$name`: NTP client has been configured with sample values (0.pool.ntp.org, 1.pool.ntp.org, 2.pool.ntp.org, 3.pool.ntp.org)" -Level "UPDATE" -Control 'esx-9.time'
        }
        catch {
            Log-Message "$name`: NTP client could not be configured ($value)" -Level "FAIL" -Control 'esx-9.time'
        }
    } else {
        Log-Message "$name`: NTP client already configured ($value)" -Level "PASS" -Control 'esx-9.time'
    }
}

#####################
# Test ESX services
$services_should_be_false = @{
    'TSM' = 'esx-9.deactivate-shell'
    'snmpd' = 'esx-9.snmp'
    'TSM-SSH' = 'esx-9.ssh'
}

foreach ($serviceEntry in $services_should_be_false.GetEnumerator()) {
    if (-not (Test-Control $serviceEntry.Value)) { continue }
    $service = $serviceEntry.Name
    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Running
    if ($value -eq $false) {
        Log-Message "$name`: $service is not running ($value)" -Level "PASS" -Control $serviceEntry.Value
    } else {
        try {
            $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Stop-VMHostService -Confirm:$false | Out-Null
            Log-Message "$name`: $service has been stopped ($value -> false)" -Level "UPDATE" -Control $serviceEntry.Value
        }
        catch {
            Log-Message "$name`: $service could not be stopped ($value)" -Level "FAIL" -Control $serviceEntry.Value
        }
    }

    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Policy
    if ($value -eq 'off') {
        Log-Message "$name`: $service is not configured to start ($value)" -Level "PASS" -Control $serviceEntry.Value
    } else {
        try {
            $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Set-VMHostService -Policy "off" -Confirm:$false | Out-Null
            Log-Message "$name`: $service has been configured ($value -> off)" -Level "UPDATE" -Control $serviceEntry.Value
        }
        catch {
            Log-Message "$name`: $service could not be configured ($value)" -Level "FAIL" -Control $serviceEntry.Value
        }
    }
}

$services_should_be_true = "ntpd"

foreach ($service in $services_should_be_true) {
    if (-not (Test-Control 'esx-9.time')) { continue }
    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Running
    if ($value -eq $true) {
        Log-Message "$name`: $service is running ($value)" -Level "PASS" -Control 'esx-9.time'
    } else {
        try {
            $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Start-VMHostService -Confirm:$false | Out-Null
            Log-Message "$name`: $service has been started ($value -> true)" -Level "UPDATE" -Control 'esx-9.time'
        }
        catch {
            Log-Message "$name`: $service could not be started ($value)" -Level "FAIL" -Control 'esx-9.time'
        }
    }

    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Policy
    if ($value -eq 'on') {
        Log-Message "$name`: $service is configured to start ($value)" -Level "PASS" -Control 'esx-9.time'
    } else {
        try {
            $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Set-VMHostService -Policy "on" -Confirm:$false | Out-Null
            Log-Message "$name`: $service has been configured to start ($value -> on)" -Level "UPDATE" -Control 'esx-9.time'
        }
        catch {
            Log-Message "$name`: $service could not be configured ($value)" -Level "FAIL" -Control 'esx-9.time'
        }
    }
}

#####################
# Enable lockdown mode, if requested
if ($EnableLockdownMode) {
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
        try {
            ((Get-View($view).ConfigManager.HostAccessManager)).ChangeLockdownMode('lockdownNormal')
            Log-Message "$name`: Lockdown Mode has been configured ($value -> lockdownNormal)" -Level "UPDATE" -Control 'esx-9.lockdown-mode'
        }
        catch {
            Log-Message "$name`: Lockdown Mode could not be configured ($value)" -Level "FAIL" -Control 'esx-9.lockdown-mode'
        }
    } else {
        Log-Message "$name`: Lockdown Mode is configured correctly ($value)" -Level "PASS" -Control 'esx-9.lockdown-mode'
    }
  }
}

#####################
# Test Standard Switches, if requested
$standardSwitchControls = @(
    'esx-9.network-standard-reject-promiscuous-mode'
    'esx-9.network-standard-reject-mac-changes'
    'esx-9.network-standard-reject-forged-transmit'
)
if ($RemediateStandardSwitches -and ($standardSwitchControls | Where-Object { Test-Control $_ })) {

    $switches = Get-VirtualSwitch -VMHost $obj -Standard

    foreach ($switch in $switches) {
        $value = $switch | Get-SecurityPolicy | Select-Object -ExpandProperty AllowPromiscuous
        if ($value -eq $false) {
            Log-Message "$name`: Standard switch `'$switch`' is not configured to allow promiscuous mode ($value)" -Level "PASS" -Control 'esx-9.network-standard-reject-promiscuous-mode'
        } else {
            try {
                $switch | Get-SecurityPolicy | Set-SecurityPolicy -AllowPromiscuous $false -Confirm:$false | Out-Null
                Log-Message "$name`: Standard switch `'$switch`' is updated to disallow promiscuous mode ($value -> false)" -Level "UPDATE" -Control 'esx-9.network-standard-reject-promiscuous-mode'
            }
            catch {
                Log-Message "$name`: Standard switch `'$switch`' cannot be updated to disallow promiscuous mode ($value)" -Level "FAIL" -Control 'esx-9.network-standard-reject-promiscuous-mode'
            }
        }

        $value = $switch | Get-SecurityPolicy | Select-Object -ExpandProperty MacChanges
        if ($value -eq $false) {
            Log-Message "$name`: Standard switch `'$switch`' is not configured to allow MAC address changes ($value)" -Level "PASS" -Control 'esx-9.network-standard-reject-mac-changes'
        } else {
            try {
                $switch | Get-SecurityPolicy | Set-SecurityPolicy -MacChanges $false -Confirm:$false | Out-Null
                Log-Message "$name`: Standard switch `'$switch`' is updated to disallow MAC address changes ($value -> false)" -Level "UPDATE" -Control 'esx-9.network-standard-reject-mac-changes'
            }
            catch {
                Log-Message "$name`: Standard switch `'$switch`' cannot be updated to disallow MAC address changes ($value)" -Level "FAIL" -Control 'esx-9.network-standard-reject-mac-changes'
            }
        }

        $value = $switch | Get-SecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
        if ($value -eq $false) {
            Log-Message "$name`: Standard switch `'$switch`' is not configured to allow forged transmits ($value)" -Level "PASS" -Control 'esx-9.network-standard-reject-forged-transmit'
        } else {
            try {
                $switch | Get-SecurityPolicy | Set-SecurityPolicy -ForgedTransmits $false -Confirm:$false | Out-Null
                Log-Message "$name`: Standard switch `'$switch`' is updated to disallow MAC forged transmits ($value -> false)" -Level "UPDATE" -Control 'esx-9.network-standard-reject-forged-transmit'
            }
            catch {
                Log-Message "$name`: Standard switch `'$switch`' cannot be updated to disallow MAC forged transmits ($value)" -Level "FAIL" -Control 'esx-9.network-standard-reject-forged-transmit'
            }
        }

        $portgroups = Get-VirtualPortGroup -VirtualSwitch $switch -Standard
        foreach ($portgroup in $portgroups) {
            $value = $portgroup | Get-SecurityPolicy | Select-Object -ExpandProperty AllowPromiscuous
            if ($value -eq $false) {
                Log-Message "$name`: Standard portgroup `'$portgroup`' is not configured to allow promiscuous mode ($value)" -Level "PASS" -Control 'esx-9.network-standard-reject-promiscuous-mode'
            } else {
                try {
                    $portgroup | Get-SecurityPolicy | Set-SecurityPolicy -AllowPromiscuous $false -Confirm:$false | Out-Null
                    Log-Message "$name`: Standard portgroup `'$portgroup`' is updated to disallow promiscuous mode ($value -> false)" -Level "UPDATE" -Control 'esx-9.network-standard-reject-promiscuous-mode'
                }
                catch {
                    Log-Message "$name`: Standard portgroup `'$portgroup`' cannot be updated to disallow promiscuous mode ($value)" -Level "FAIL" -Control 'esx-9.network-standard-reject-promiscuous-mode'
                }
            }

            $value = $portgroup | Get-SecurityPolicy | Select-Object -ExpandProperty MacChanges
            if ($value -eq $false) {
                Log-Message "$name`: Standard portgroup `'$portgroup`' is not configured to allow MAC address changes ($value)" -Level "PASS" -Control 'esx-9.network-standard-reject-mac-changes'
            } else {
                try {
                    $portgroup | Get-SecurityPolicy | Set-SecurityPolicy -MacChanges $false -Confirm:$false | Out-Null
                    Log-Message "$name`: Standard portgroup `'$portgroup`' is updated to disallow MAC address changes ($value -> false)" -Level "UPDATE" -Control 'esx-9.network-standard-reject-mac-changes'
                }
                catch {
                    Log-Message "$name`: Standard portgroup `'$portgroup`' cannot be updated to disallow MAC address changes ($value)" -Level "FAIL" -Control 'esx-9.network-standard-reject-mac-changes'
                }
            }

            $value = $portgroup | Get-SecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
            if ($value -eq $false) {
                Log-Message "$name`: Standard portgroup `'$portgroup`' is not configured to allow forged transmits ($value)" -Level "PASS" -Control 'esx-9.network-standard-reject-forged-transmit'
            } else {
                try {
                    $portgroup | Get-SecurityPolicy | Set-SecurityPolicy -ForgedTransmits $false -Confirm:$false | Out-Null
                    Log-Message "$name`: Standard portgroup `'$portgroup`' is updated to disallow MAC forged transmits ($value -> false)" -Level "UPDATE" -Control 'esx-9.network-standard-reject-forged-transmit'
                }
                catch {
                    Log-Message "$name`: Standard portgroup `'$portgroup`' cannot be updated to disallow MAC forged transmits ($value)" -Level "FAIL" -Control 'esx-9.network-standard-reject-forged-transmit'
                }
            }
        }
    }
}

#####################
# Test TLS profile
if ($RemediateTLSCiphers -and (Test-Control 'esx-9.tls-ciphers')) {
    $value = $ESXcli.system.tls.server.get.invoke() | Select-Object -ExpandProperty Profile
    if ($value -eq 'NIST_2024_TLS_13_ONLY') {
        Log-Message "$name`: TLS profile is configured correctly ($value)" -Level "PASS" -Control 'esx-9.tls-ciphers'
    } else {
        try {
            $arguments = $ESXcli.system.tls.server.set.CreateArgs()
            $arguments.profile = "NIST_2024_TLS_13_ONLY"
            $ESXcli.system.tls.server.set.invoke($arguments) | Out-Null
            Log-Message "$name`: TLS profile has been updated ($value -> NIST_2024_TLS_13_ONLY)" -Level "UPDATE" -Control 'esx-9.tls-ciphers'
        }
        catch {
            Log-Message "$name`: TLS profile could not be updated ($value)" -Level "FAIL" -Control 'esx-9.tls-ciphers'
        }
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
            $arguments = $ESXcli.network.firewall.set.CreateArgs()
            $arguments.defaultaction = $false
            $arguments.enabled = $true
            $ESXcli.network.firewall.set.invoke($arguments) | Out-Null
            Log-Message "$name`: Firewall default policy has been updated to block incoming traffic" -Level "UPDATE" -Control 'esx-9.firewall-incoming-default'
        }
    } catch {
        Log-Message "$name`: Failed to remediate firewall default policy: $_" -Level "FAIL" -Control 'esx-9.firewall-incoming-default'
    }
}

#####################
# Test key persistence (should be disabled; disabling also removes stored keys) (esx-9.key-persistence)
if (Test-Control 'esx-9.key-persistence') {
    try {
        $value = $ESXcli.system.security.keypersistence.get.invoke() | Select-Object -ExpandProperty Enabled
        if ($value -eq 'false') {
            Log-Message "$name`: Key persistence is disabled ($value)" -Level "PASS" -Control 'esx-9.key-persistence'
        } else {
            $arguments = $ESXcli.system.security.keypersistence.disable.CreateArgs()
            $arguments.removeallstoredkeys = $true
            $ESXcli.system.security.keypersistence.disable.invoke($arguments) | Out-Null
            Log-Message "$name`: Key persistence has been disabled and stored keys removed ($value -> false)" -Level "UPDATE" -Control 'esx-9.key-persistence'
        }
    } catch {
        Log-Message "$name`: Failed to remediate key persistence: $_" -Level "FAIL" -Control 'esx-9.key-persistence'
    }
}

Log-Message "Remediation of $name completed at $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")" -Level "INFO"
Log-Message "Re-run the corresponding audit script to verify the remediation." -Level "INFO"
Log-Message "Remember to address security controls that are not covered by these tools." -Level "INFO"
