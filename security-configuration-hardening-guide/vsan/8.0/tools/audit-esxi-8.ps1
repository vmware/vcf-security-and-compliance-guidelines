<#
    Script Name: VMware vSphere ESXi Host Security Settings Audit Utility
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
    # ESXi Host Name
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
Log-Message "VMware ESXi Host Security Settings Audit Utility 803-20241115-01" -Level "INFO"
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
    Check-PowerCLI
    Check-vCenter
    Check-Hosts
} else {
    Log-Message "Safety checks skipped." -Level "INFO"
}

#####################
# Read the ESXi host into objects and views once to save time & resources
$obj = Get-VMHost $name -ErrorAction Stop
$view = Get-View -VIObject $obj
$ESXcli = Get-EsxCli -VMHost $obj -V2

if ($NoSafetyChecks -eq $false) {
    #####################
    # Check to see if the host is the right version
    if ([version]'8.0.3' -gt $obj.Version) {
        Log-Message "$name`: This script is designed for VMware ESXi 8.0.3. Please upgrade the specified host." -Level "ERROR"
        Exit
    }
}

#####################
# Tests for advanced parameters
$scg_adv = @{
    
    'Security.AccountUnlockTime' = 900
    'Security.AccountLockFailures' = 5
    'Security.PasswordQualityControl' = 'similar=deny retry=3 min=disabled,disabled,disabled,disabled,15 max=64'
    'Security.PasswordHistory' = 5
    'Security.PasswordMaxDays' = 9999
    'Config.HostAgent.vmacore.soap.sessionTimeout' = 30
    'Config.HostAgent.plugins.solo.enableMob' = $false
    'UserVars.DcuiTimeOut' = 600
    'UserVars.SuppressHyperthreadWarning' = 0
    'UserVars.SuppressShellWarning' = 0
    'UserVars.HostClientSessionTimeout' = 900
    'Net.BMCNetworkEnable' = 0
    'DCUI.Access' = 'root'
    'Syslog.global.auditRecord.storageEnable' = $true
    'Syslog.global.auditRecord.storageCapacity' = 100
    'Syslog.global.auditRecord.remoteEnable' = $true
    'Config.HostAgent.log.level' = 'info'
    'Syslog.global.logLevel' = 'info'
    'Syslog.global.certificate.checkSSLCerts' = $true
    'Syslog.global.certificate.strictX509Compliance' = $true
    'Net.BlockGuestBPDU' = 1
    'Net.DVFilterBindIpAddress' = ''
    'UserVars.ESXiShellInteractiveTimeOut' = 900
    'UserVars.ESXiShellTimeOut' = 600
    'UserVars.ESXiVPsDisabledProtocols' = "sslv3,tlsv1,tlsv1.1"
    'Mem.ShareForceSalting' = 2
    'VMkernel.Boot.execInstalledOnly' = $true
    'Mem.MemEagerZero' = 1

}

foreach ($param in $scg_adv.GetEnumerator() )
{
    $vmval = (Get-AdvancedSetting -Entity $obj "$($param.Name)").Value

    if ($vmval -eq $($param.Value)) {
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
    Log-Message "$name`: Local log location is persistent ($value)" -Level "PASS"
} else {
    Log-Message "$name`: Local log location is not persistent ($value)" -Level "FAIL"
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
# Check only available with PowerCLI 13.3 and newer.
if ([version]'13.3.0' -le $installedVersion) {
    $value = $view.Capability.UefiSecureBoot
    if ($value -eq 'true') {
        Log-Message "$name`: Secure Boot is enabled on the host ($value)" -Level "PASS"
    } else {
        Log-Message "$name`: Secure Boot is not enabled on the host ($value)" -Level "FAIL"
    }
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
# Test ESXi services
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