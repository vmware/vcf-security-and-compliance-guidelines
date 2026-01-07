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
    [switch]$RemediateTLSCiphers = $false
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
Log-Message "VMware ESX Host Security Settings Remediation Utility 9.0.1" -Level "INFO"
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
Log-Message "script (lines 106-117). By doing so, you accept any and all risk this" -Level "ERROR"
Log-Message "script and these commands may pose to your environment." -Level "ERROR"
Exit

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
    'Security.PasswordQualityControl' = @{ Expected = 'similar=deny retry=3 min=disabled,disabled,disabled,disabled,15'; Comparator = 'eq' }
    'Security.PasswordHistory' = @{ Expected = 5; Comparator = 'ge' }
    'Security.PasswordMaxDays' = @{ Expected = 99999; Comparator = 'eq' }
    'Config.HostAgent.vmacore.soap.sessionTimeout' = @{ Expected = 10; Comparator = 'le' }
    'Config.HostAgent.plugins.solo.enableMob' = @{ Expected = $false; Comparator = 'eq' }
    'Config.HostAgent.plugins.hostsvc.esxAdminsGroupAutoAdd' = @{ Expected = $false; Comparator = 'eq' }
    'Config.HostAgent.plugins.vimsvc.authValidateInterval' = @{ Expected = 90; Comparator = 'ge' }
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
    'Mem.ShareForceSalting' = @{ Expected = 2; Comparator = 'eq' }
    'Mem.MemEagerZero' = @{ Expected = 1; Comparator = 'eq' }
    'Mem.EncryptTierNvme' = @{ Expected = 1; Comparator = 'eq' }
    'VMkernel.Boot.execInstalledOnly' = @{ Expected = $true; Comparator = 'eq' }
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
        try {
            Get-AdvancedSetting -Entity $obj "$($param.Name)" | Set-AdvancedSetting -Value $expected -Confirm:$false -ErrorAction Stop | Out-Null
            Log-Message "$name`: $($param.Name) has been updated ($vmval -> $expected)" -Level "UPDATE"
        }
        catch {
            Log-Message "$name`: $($param.Name) could not be updated ($vmval)" -Level "FAIL"
        }
    }
}

#####################
# Tests for banners
$scg_banner = @{

    'Annotations.WelcomeMessage' = ''
    'Config.Etc.Issue' = ''

}

$sample_banner = "****************************************************************************`n* Authorized users only. Actual or attempted unauthorized use of this      *`n* system is prohibited and may result in criminal, civil, security, or     *`n* administrative proceedings and/or penalties. Use of this information     *`n* system indicates consent to monitoring and recording, without notice     *`n* or permission. Users have no expectation of privacy. Any information     *`n* stored on or transiting this system, or obtained by monitoring and/or    *`n* recording, may be disclosed to law enforcement and/or used in accordance *`n* with Federal law, State statute, and organization policy. If you are not *`n* an authorized user of this system, exit the system at this time.         *`n****************************************************************************`n"

foreach ($param in $scg_banner.GetEnumerator() )
{
    $vmval = (Get-AdvancedSetting -Entity $obj "$($param.Name)").Value

    if ($vmval -eq $($param.Value)) {
        try {
            Get-AdvancedSetting -Entity $obj "$($param.Name)" | Set-AdvancedSetting -Value $sample_banner -Confirm:$false -ErrorAction Stop | Out-Null
            Log-Message "$name`: $($param.Name) has been updated ($vmval -> $sample_banner)" -Level "UPDATE"
        }
        catch {
            Log-Message "$name`: $($param.Name) could not be updated ($vmval)" -Level "FAIL"
        }
    } else {
        Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS"
    }
}

#####################
# Test Log Filters
$value = $ESXcli.system.syslog.config.logfilter.get.invoke() | Select -ExpandProperty LogFilteringEnabled 
if ($value -eq 'false') {
    Log-Message "$name`: Log filtering is deactivated ($value)" -Level "PASS"
} else {
    try {
        $arguments = $esxcli.system.syslog.config.logfilter.set.CreateArgs()
        $arguments.logfilteringenabled = $false
        $ESXcli.system.syslog.config.logfilter.set.invoke($arguments) | Out-Null
        Log-Message "$name`: Log filtering has been updated ($value -> false)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: Log filtering could not be updated ($value)" -Level "FAIL"
    }
}

#####################
# Test DCUI user
$value = $ESXcli.system.account.list.Invoke() | Where-Object { $_.UserID -eq 'dcui' } | Select-Object -ExpandProperty Shellaccess
if ($value -eq 'false') {
    Log-Message "$name`: DCUI user has shell access deactivated ($value)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.system.account.set.CreateArgs()
        $arguments.id = 'dcui'
        $arguments.shellaccess = "false"
        $ESXcli.system.account.set.Invoke($arguments) | Out-Null
        Log-Message "$name`: DCUI user has been updated ($value -> false)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: DCUI user could not be updated ($value)" -Level "FAIL"
    }
}

#####################
# Test Entropy Sources
$value1 = $ESXcli.system.settings.kernel.list.Invoke() | Where-Object {$_.Name -eq "disableHwrng"} | Select-Object -ExpandProperty Configured
$value2 = $ESXcli.system.settings.kernel.list.Invoke() | Where-Object {$_.Name -eq "entropySources"} | Select-Object -ExpandProperty Configured

if ($value1 -eq 'FALSE' -and $value2 -eq '0') {
    Log-Message "$name`: Entropy sources configured correctly ($value1, $value2)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.system.settings.kernel.set.CreateArgs()
        $arguments.setting = "disableHwrng"
        $arguments.value = "FALSE"
        $ESXcli.system.settings.kernel.set.invoke($arguments) | Out-Null
        $arguments.setting = "entropySources"
        $arguments.value = "0"
        $ESXcli.system.settings.kernel.set.invoke($arguments) | Out-Null
        Log-Message "$name`: Entropy sources have been updated ($value1, $value2 -> FALSE, 0)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: Entropy sources could not be updated ($value1, $value2)" -Level "FAIL"
    }
}

#####################
# Test Host Secure Boot Enforcement
$value = $ESXcli.system.settings.encryption.get.Invoke() | Select-Object -ExpandProperty RequireSecureBoot
if ($value -eq 'true') {
    Log-Message "$name`: Secure Boot enforcement is enabled ($value)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.system.settings.encryption.set.CreateArgs()
        $arguments.requiresecureboot = $true
        $ESXcli.system.settings.encryption.set.Invoke($arguments) | Out-Null
        Log-Message "$name`: Secure Boot TPM-based enforcement has been enabled ($value -> true)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: Secure Boot TPM-based enforcement could not be enabled ($value)" -Level "FAIL"
    }
}

#####################
# Test TPM Configuration Encryption
$value = $ESXcli.system.settings.encryption.get.Invoke() | Select-Object -ExpandProperty Mode
if ($value -eq 'TPM') {
    Log-Message "$name`: TPM configuration encryption is enabled ($value)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.system.settings.encryption.set.CreateArgs()
        $arguments.mode = "TPM"
        $ESXcli.system.settings.encryption.set.Invoke($arguments) | Out-Null
        Log-Message "$name`: TPM configuration encryption has been enabled ($value -> TPM)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: TPM configuration encryption could not be enabled ($value)" -Level "FAIL"
    }
}

#####################
# Test Software Acceptance Level (VMwareCertified, VMwareAccepted, PartnerSupported, CommunitySupported)
$value = $ESXcli.software.acceptance.get.Invoke()
if (($value -eq 'PartnerSupported') -or ($value -eq 'VMwareCertified') -or ($value -eq 'VMwareAccepted')) {
    Log-Message "$name`: Host Image Profile Acceptance Level is configured correctly ($value)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.software.acceptance.set.CreateArgs()
        $arguments.level = "PartnerSupported" # VMwareCertified, VMwareAccepted, PartnerSupported, CommunitySupported
        $ESXcli.software.acceptance.set.Invoke($arguments) | Out-Null
        Log-Message "$name`: Host Image Profile Acceptance Level has been updated ($value -> PartnerSupported)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: Host Image Profile Acceptance Level could not be configured ($value)" -Level "FAIL"
    }
}

#####################
# Test the menagerie of SSH configuration settings
$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'ciphers'} | Select-Object -ExpandProperty Value
if ($value -eq 'aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr') {
    Log-Message "$name`: SSH ciphers configured correctly ($value)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
        $arguments.keyword = 'ciphers'
        $arguments.value = 'aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr'
        $ESXcli.system.ssh.server.config.set.Invoke($arguments)| Out-Null
        Log-Message "$name`: SSH ciphers have been updated ($value -> aes256-gcm@openssh.com,...)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: SSH ciphers could not be configured ($value)" -Level "FAIL"
    }
}

$value = $ESXcli.system.security.fips140.ssh.get.Invoke() | Select-Object -ExpandProperty Enabled
if ($value -eq 'true') {
    Log-Message "$name`: SSH has FIPS mode enabled ($value)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.system.security.fips140.ssh.set.CreateArgs()
        $arguments.enable = $true
        $ESXcli.system.security.fips140.ssh.set.Invoke($arguments) | Out-Null
        Log-Message "$name`: SSH FIPS mode has been updated ($value -> true)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: SSH FIPS mode could not be configured ($value)" -Level "FAIL"
    }
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'gatewayports'} | Select-Object -ExpandProperty Value
if ($value -eq 'no') {
    Log-Message "$name`: SSH gatewayports configured correctly ($value)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
        $arguments.keyword = 'gatewayports'
        $arguments.value = 'no'
        $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
        Log-Message "$name`: SSH gatewayports has been updated ($value -> no)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: SSH gatewayports could not be configured ($value)" -Level "FAIL"
    }
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'hostbasedauthentication'} | Select-Object -ExpandProperty Value
if ($value -eq 'no') {
    Log-Message "$name`: SSH hostbasedauthentication configured correctly ($value)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
        $arguments.keyword = 'hostbasedauthentication'
        $arguments.value = 'no'
        $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
        Log-Message "$name`: SSH hostbasedauthentication has been updated ($value -> no)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: SSH hostbasedauthentication could not be configured ($value)" -Level "FAIL"
    }
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'clientalivecountmax'} | Select-Object -ExpandProperty Value
if ($value -eq '3') {
    Log-Message "$name`: SSH clientalivecountmax configured correctly ($value)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
        $arguments.keyword = 'clientalivecountmax'
        $arguments.value = '3'
        $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
        Log-Message "$name`: SSH clientalivecountmax has been updated ($value -> 3)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: SSH clientalivecountmax could not be configured ($value)" -Level "FAIL"
    }
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'clientaliveinterval'} | Select-Object -ExpandProperty Value
if ($value -eq '200') {
    Log-Message "$name`: SSH clientaliveinterval configured correctly ($value)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
        $arguments.keyword = 'clientaliveinterval'
        $arguments.value = '200'
        $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
        Log-Message "$name`: SSH clientaliveinterval has been updated ($value -> 200)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: SSH clientaliveinterval could not be configured ($value)" -Level "FAIL"
    }
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'banner'} | Select-Object -ExpandProperty Value
if ($value -eq '/etc/issue') {
    Log-Message "$name`: SSH banner configured correctly ($value)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
        $arguments.keyword = 'banner'
        $arguments.value = '/etc/issue'
        $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
        Log-Message "$name`: SSH banner has been updated ($value -> /etc/issue)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: SSH banner could not be configured ($value)" -Level "FAIL"
    }
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'ignorerhosts'} | Select-Object -ExpandProperty Value
if ($value -eq 'yes') {
    Log-Message "$name`: SSH ignorerhosts configured correctly ($value)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
        $arguments.keyword = 'ignorerhosts'
        $arguments.value = 'yes'
        $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
        Log-Message "$name`: SSH ignorerhosts has been updated ($value -> yes)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: SSH ignorerhosts could not be configured ($value)" -Level "FAIL"
    }
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'allowstreamlocalforwarding'} | Select-Object -ExpandProperty Value
if ($value -eq 'no') {
    Log-Message "$name`: SSH allowstreamlocalforwarding configured correctly ($value)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
        $arguments.keyword = 'allowstreamlocalforwarding'
        $arguments.value = 'no'
        $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
        Log-Message "$name`: SSH allowstreamlocalforwarding has been updated ($value -> no)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: SSH allowstreamlocalforwarding could not be configured ($value)" -Level "FAIL"
    }
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'allowtcpforwarding'} | Select-Object -ExpandProperty Value
if ($value -eq 'no') {
    Log-Message "$name`: SSH allowtcpforwarding configured correctly ($value)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
        $arguments.keyword = 'allowtcpforwarding'
        $arguments.value = 'no'
        $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
        Log-Message "$name`: SSH allowtcpforwarding has been updated ($value -> no)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: SSH allowtcpforwarding could not be configured ($value)" -Level "FAIL"
    }
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'permittunnel'} | Select-Object -ExpandProperty Value
if ($value -eq 'no') {
    Log-Message "$name`: SSH permittunnel configured correctly ($value)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
        $arguments.keyword = 'permittunnel'
        $arguments.value = 'no'
        $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
        Log-Message "$name`: SSH permittunnel has been updated ($value -> no)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: SSH permittunnel could not be configured ($value)" -Level "FAIL"
    }
}

$value = $ESXcli.system.ssh.server.config.list.invoke() | Where-Object {$_.Key -eq 'permituserenvironment'} | Select-Object -ExpandProperty Value
if ($value -eq 'no') {
    Log-Message "$name`: SSH permituserenvironment configured correctly ($value)" -Level "PASS"
} else {
    try {
        $arguments = $ESXcli.system.ssh.server.config.set.CreateArgs()
        $arguments.keyword = 'permituserenvironment'
        $arguments.value = 'no'
        $ESXcli.system.ssh.server.config.set.Invoke($arguments) | Out-Null
        Log-Message "$name`: SSH permituserenvironment has been updated ($value -> no)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: SSH permituserenvironment could not be configured ($value)" -Level "FAIL"
    }
}

#####################
# Test NTP configurations (service enablement is tested later)
$value = $obj | Get-VMHostNtpServer
if ($null -eq $value) {
    try {
        $ntp0 = "0.pool.ntp.org"
        $ntp1 = "1.pool.ntp.org"
        $ntp2 = "2.pool.ntp.org"
        $ntp3 = "3.pool.ntp.org"

        $obj | Add-VMHostNTPServer -NtpServer $ntp0 , $ntp1 , $ntp2 , $ntp3 -Confirm:$false | Out-Null
        Log-Message "$name`: NTP client has been configured with sample values (0.pool.ntp.org, 1.pool.ntp.org, 2.pool.ntp.org, 3.pool.ntp.org)" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: NTP client could not be configured ($value)" -Level "FAIL"
    }
} else {
    Log-Message "$name`: NTP client already configured ($value)" -Level "PASS"
}

#####################
# Test ESX services
$services_should_be_false = "sfcbd-watchdog", "TSM", "slpd", "snmpd", "TSM-SSH"

foreach ($service in $services_should_be_false) {
    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Running
    if ($value -eq $false) {
        Log-Message "$name`: $service is not running ($value)" -Level "PASS"
    } else {
        try {
            $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Stop-VMHostService -Confirm:$false | Out-Null
            Log-Message "$name`: $service has been stopped ($value -> false)" -Level "UPDATE"
        }
        catch {
            Log-Message "$name`: $service could not be stopped ($value)" -Level "FAIL"
        }
    }

    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Policy
    if ($value -eq 'off') {
        Log-Message "$name`: $service is not configured to start ($value)" -Level "PASS"
    } else {
        try {
            $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Set-VMHostService -Policy "off" -Confirm:$false | Out-Null
            Log-Message "$name`: $service has been configured ($value -> off)" -Level "UPDATE"
        }
        catch {
            Log-Message "$name`: $service could not be configured ($value)" -Level "FAIL"
        }
    }
}

$services_should_be_true = "ntpd"

foreach ($service in $services_should_be_true) {
    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Running
    if ($value -eq $true) {
        Log-Message "$name`: $service is running ($value)" -Level "PASS"
    } else {
        try {
            $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Start-VMHostService -Confirm:$false | Out-Null
            Log-Message "$name`: $service has been started ($value -> true)" -Level "UPDATE"
        }
        catch {
            Log-Message "$name`: $service could not be started ($value)" -Level "FAIL"
        }
    }

    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Policy
    if ($value -eq 'on') {
        Log-Message "$name`: $service is configured to start ($value)" -Level "PASS"
    } else {
        try {
            $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Set-VMHostService -Policy "on" -Confirm:$false | Out-Null
            Log-Message "$name`: $service has been configured to start ($value -> on)" -Level "UPDATE"
        }
        catch {
            Log-Message "$name`: $service could not be configured ($value)" -Level "FAIL"
        }
    }
}

#####################
# Enable lockdown mode, if requested
if ($EnableLockdownMode) {
    $value = ((Get-View($view).ConfigManager.HostAccessManager)).QueryLockdownExceptions()
    if ([string]::IsNullOrEmpty($value)) {
        Log-Message "$name`: Lockdown Mode exception users configured correctly ($value)" -Level "PASS"
    } else {
        try {
            ((Get-View($view).ConfigManager.HostAccessManager)).UpdateLockdownExceptions($NULL)
            Log-Message "$name`: Lockdown Mode exception users have been configured ($value -> NULL)" -Level "UPDATE"
        }
        catch {
            Log-Message "$name`: Lockdown Mode exception users could not be configured ($value)" -Level "FAIL"
        }
    }

    $value = (Get-View ($view).ConfigManager.HostAccessManager).LockdownMode
    if ($value -eq 'lockdownDisabled') {
        try {
            ((Get-View($view).ConfigManager.HostAccessManager)).ChangeLockdownMode('lockdownNormal')
            Log-Message "$name`: Lockdown Mode has been configured ($value -> lockdownNormal)" -Level "UPDATE"
        }
        catch {
            Log-Message "$name`: Lockdown Mode could not be configured ($value)" -Level "FAIL"
        }
    } else {
        Log-Message "$name`: Lockdown Mode is configured correctly ($value)" -Level "PASS"
    }
}

#####################
# Test Standard Switches, if requested
if ($RemediateStandardSwitches) {

    $switches = Get-VirtualSwitch -VMHost $obj -Standard

    foreach ($switch in $switches) {
        $value = $switch | Get-SecurityPolicy | Select-Object -ExpandProperty AllowPromiscuous
        if ($value -eq $false) {
            Log-Message "$name`: Standard switch `'$switch`' is not configured to allow promiscuous mode ($value)" -Level "PASS"
        } else {
            try {
                $switch | Get-SecurityPolicy | Set-SecurityPolicy -AllowPromiscuous $false -Confirm:$false | Out-Null
                Log-Message "$name`: Standard switch `'$switch`' is updated to disallow promiscuous mode ($value -> false)" -Level "UPDATE"
            }
            catch {
                Log-Message "$name`: Standard switch `'$switch`' cannot be updated to disallow promiscuous mode ($value)" -Level "FAIL"
            }
        }

        $value = $switch | Get-SecurityPolicy | Select-Object -ExpandProperty MacChanges
        if ($value -eq $false) {
            Log-Message "$name`: Standard switch `'$switch`' is not configured to allow MAC address changes ($value)" -Level "PASS"
        } else {
            try {
                $switch | Get-SecurityPolicy | Set-SecurityPolicy -MacChanges $false -Confirm:$false | Out-Null
                Log-Message "$name`: Standard switch `'$switch`' is updated to disallow MAC address changes ($value -> false)" -Level "UPDATE"
            }
            catch {
                Log-Message "$name`: Standard switch `'$switch`' cannot be updated to disallow MAC address changes ($value)" -Level "FAIL"
            }
        }

        $value = $switch | Get-SecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
        if ($value -eq $false) {
            Log-Message "$name`: Standard switch `'$switch`' is not configured to allow forged transmits ($value)" -Level "PASS"
        } else {
            try {
                $switch | Get-SecurityPolicy | Set-SecurityPolicy -ForgedTransmits $false -Confirm:$false | Out-Null
                Log-Message "$name`: Standard switch `'$switch`' is updated to disallow MAC forged transmits ($value -> false)" -Level "UPDATE"
            }
            catch {
                Log-Message "$name`: Standard switch `'$switch`' cannot be updated to disallow MAC forged transmits ($value)" -Level "FAIL"
            }
        }

        $portgroups = Get-VirtualPortGroup -VirtualSwitch $switch -Standard
        foreach ($portgroup in $portgroups) {
            $value = $portgroup | Get-SecurityPolicy | Select-Object -ExpandProperty AllowPromiscuous
            if ($value -eq $false) {
                Log-Message "$name`: Standard portgroup `'$portgroup`' is not configured to allow promiscuous mode ($value)" -Level "PASS"
            } else {
                try {
                    $portgroup | Get-SecurityPolicy | Set-SecurityPolicy -AllowPromiscuous $false -Confirm:$false | Out-Null
                    Log-Message "$name`: Standard portgroup `'$portgroup`' is updated to disallow promiscuous mode ($value -> false)" -Level "UPDATE"
                }
                catch {
                    Log-Message "$name`: Standard portgroup `'$portgroup`' cannot be updated to disallow promiscuous mode ($value)" -Level "FAIL"
                }
            }

            $value = $portgroup | Get-SecurityPolicy | Select-Object -ExpandProperty MacChanges
            if ($value -eq $false) {
                Log-Message "$name`: Standard portgroup `'$portgroup`' is not configured to allow MAC address changes ($value)" -Level "PASS"
            } else {
                try {
                    $portgroup | Get-SecurityPolicy | Set-SecurityPolicy -MacChanges $false -Confirm:$false | Out-Null
                    Log-Message "$name`: Standard portgroup `'$portgroup`' is updated to disallow MAC address changes ($value -> false)" -Level "UPDATE"
                }
                catch {
                    Log-Message "$name`: Standard portgroup `'$portgroup`' cannot be updated to disallow MAC address changes ($value)" -Level "FAIL"
                }
            }

            $value = $portgroup | Get-SecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
            if ($value -eq $false) {
                Log-Message "$name`: Standard portgroup `'$portgroup`' is not configured to allow forged transmits ($value)" -Level "PASS"
            } else {
                try {
                    $portgroup | Get-SecurityPolicy | Set-SecurityPolicy -ForgedTransmits $false -Confirm:$false | Out-Null
                    Log-Message "$name`: Standard portgroup `'$portgroup`' is updated to disallow MAC forged transmits ($value -> false)" -Level "UPDATE"
                }
                catch {
                    Log-Message "$name`: Standard portgroup `'$portgroup`' cannot be updated to disallow MAC forged transmits ($value)" -Level "FAIL"
                }
            }
        }
    }
}

#####################
# Test TLS profile
if ($RemediateTLSCiphers) {
    $value = $ESXcli.system.tls.server.get.invoke() | Select-Object -ExpandProperty Profile
    if ($value -eq 'NIST_2024') {
        Log-Message "$name`: TLS profile is configured correctly ($value)" -Level "PASS"
    } else {
        try {
            $arguments = $ESXcli.system.tls.server.set.CreateArgs()
            $arguments.profile = "NIST_2024"
            $ESXcli.system.tls.server.set.invoke($arguments) | Out-Null
            Log-Message "$name`: TLS profile has been updated ($value -> NIST_2024)" -Level "UPDATE"
        }
        catch {
            Log-Message "$name`: TLS profile could not be updated ($value)" -Level "FAIL"
        }
    }
}

Log-Message "Remediation of $name completed at $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")" -Level "INFO"
Log-Message "Re-run the corresponding audit script to verify the remediation." -Level "INFO"
Log-Message "Remember to address security controls that are not covered by these tools." -Level "INFO"