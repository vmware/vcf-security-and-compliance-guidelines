<#
    Script Name: VMware vSphere ESXi Host Security Settings Remediation Utility

    SOFTWARE LICENSE AGREEMENT
    ==========================
    Copyright (c) CA, Inc. All rights reserved.

    You are hereby granted a non-exclusive, worldwide, royalty-free license under CA, Inc.’s copyrights to use,
    copy, modify, and distribute this software in source code or binary form for use in connection with CA, Inc. products.

    This copyright notice shall be included in all copies or substantial portions of the software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
    TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
    THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
    CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
    DEALINGS IN THE SOFTWARE.

    DISCLAIMER
    ==========

    This software is intended to provide general guidance for organizations that
    are considering Broadcom solutions. The information contained in this document
    is for educational and informational purposes only. This repository is not intended
    to provide advice and is provided “AS IS.” Broadcom makes no claims, promises, or
    guarantees about the accuracy, completeness, or adequacy of the information contained
    herein. Organizations should engage appropriate legal, business, technical, and audit
    expertise within their specific organization for review of requirements and
    effectiveness of implementations.

    This material is provided as is and any express or implied warranties, including,
    but not limited to, the implied warranties of merchantability and fitness for a
    particular purpose are disclaimed. In no event shall the copyright holder or
    contributors be liable for any direct, indirect, incidental, special, exemplary,
    or consequential damages (including, but not limited to, procurement of substitute
    goods or services; loss of use, data, or profits; or business interruption) however
    caused and on any theory of liability, whether in contract, strict liability, or
    tort (including negligence or otherwise) arising in any way out of the use of this
    software, even if advised of the possibility of such damage. The provider makes no
    claims, promises, or guarantees about the accuracy, completeness, or adequacy of this
    sample. Organizations should engage appropriate legal, business, technical, and audit
    expertise within their specific organization for review of requirements and
    effectiveness of implementations. You acknowledge that there may be performance or
    other considerations, and that these examples may make assumptions which may
    not be valid in your environment or organization.

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
Log-Message "VMware ESXi Host Security Settings Remediation Utility 803-20240625-01" -Level "INFO"
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
Log-Message "It may also set things that require host reboots." -Level "ERROR"
Log-Message "If you accept the risk, please remove or comment this section of the" -Level "ERROR"
Log-Message "script (lines 209-232). By doing so, you accept any and all risk this" -Level "ERROR"
Log-Message "script and these commands may pose to your environment." -Level "ERROR"
Exit

#####################
# Read the ESXi host into objects and views once to save time & resources
$obj = Get-VMHost $name -ErrorAction Stop
$view = Get-View -VIObject $obj
$ESXcli = Get-EsxCli -VMHost $obj -V2

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
        try {
            Get-AdvancedSetting -Entity $obj "$($param.Name)" | Set-AdvancedSetting -Value $($param.Value) -Confirm:$false -ErrorAction Stop | Out-Null
            Log-Message "$name`: $($param.Name) has been updated ($vmval -> $($param.Value))" -Level "UPDATE"
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
        $success = $true
    }
    catch {
        Log-Message "$name`: Log filtering could not be updated ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: Log filtering has been updated ($value -> false)" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: DCUI user could not be updated ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: DCUI user has been updated ($value -> false)" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: Entropy sources could not be updated ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: Entropy sources have been updated ($value1, $value2 -> FALSE, 0)" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: Secure Boot TPM-based enforcement could not be enabled ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: Secure Boot TPM-based enforcement has been enabled ($value -> true)" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: TPM configuration encryption could not be enabled ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: TPM configuration encryption has been enabled ($value -> TPM)" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: Host Image Profile Acceptance Level could not be configured ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: Host Image Profile Acceptance Level has been updated ($value -> PartnerSupported)" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: SSH ciphers could not be configured ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: SSH ciphers have been updated ($value -> $($arguments.value))" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: SSH FIPS mode could not be configured ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: SSH FIPS mode has been updated ($value -> $($arguments.enable))" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: SSH gatewayports could not be configured ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: SSH gatewayports has been updated ($value -> $($arguments.value))" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: SSH hostbasedauthentication could not be configured ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: SSH hostbasedauthentication has been updated ($value -> $($arguments.value))" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: SSH clientalivecountmax could not be configured ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: SSH clientalivecountmax has been updated ($value -> $($arguments.value))" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: SSH clientaliveinterval could not be configured ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: SSH clientaliveinterval has been updated ($value -> $($arguments.value))" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: SSH banner could not be configured ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: SSH banner has been updated ($value -> $($arguments.value))" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: SSH ignorerhosts could not be configured ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: SSH ignorerhosts has been updated ($value -> $($arguments.value))" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: SSH allowstreamlocalforwarding could not be configured ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: SSH allowstreamlocalforwarding has been updated ($value -> $($arguments.value))" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: SSH allowtcpforwarding could not be configured ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: SSH allowtcpforwarding has been updated ($value -> $($arguments.value))" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: SSH permittunnel could not be configured ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: SSH permittunnel has been updated ($value -> $($arguments.value))" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: SSH permituserenvironment could not be configured ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: SSH permituserenvironment has been updated ($value -> $($arguments.value))" -Level "UPDATE"
        $success = $false
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
        $success = $true
    }
    catch {
        Log-Message "$name`: NTP client could not be configured ($value)" -Level "FAIL"
    }
    
    if ($success) {
        Log-Message "$name`: NTP client has been configured with sample values (0.pool.ntp.org, 1.pool.ntp.org, 2.pool.ntp.org, 3.pool.ntp.org)" -Level "UPDATE"
        $success = $false
    }
} else {
    Log-Message "$name`: NTP client already configured ($value)" -Level "PASS"
}

#####################
# Test ESXi services
$services_should_be_false = "sfcbd-watchdog", "TSM", "slpd", "snmpd", "TSM-SSH"

foreach ($service in $services_should_be_false) {
    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Running
    if ($value -eq $false) {
        Log-Message "$name`: $service is not running ($value)" -Level "PASS"
    } else {
        try {
            $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Stop-VMHostService -Confirm:$false | Out-Null
            $success = $true
        }
        catch {
            Log-Message "$name`: $service could not be stopped ($value)" -Level "FAIL"
        }
        
        if ($success) {
            Log-Message "$name`: $service has been stopped ($value -> false)" -Level "UPDATE"
            $success = $false
        }
    }

    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Policy
    if ($value -eq 'off') {
        Log-Message "$name`: $service is not configured to start ($value)" -Level "PASS"
    } else {
        try {
            $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Set-VMHostService -Policy "off" -Confirm:$false | Out-Null
            $success = $true
        }
        catch {
            Log-Message "$name`: $service could not be configured ($value)" -Level "FAIL"
        }
        
        if ($success) {
            Log-Message "$name`: $service has been configured ($value -> off)" -Level "UPDATE"
            $success = $false
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
            $success = $true
        }
        catch {
            Log-Message "$name`: $service could not be started ($value)" -Level "FAIL"
        }
        
        if ($success) {
            Log-Message "$name`: $service has been started ($value -> true)" -Level "UPDATE"
            $success = $false
        }
    }

    $value = $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Select-Object -ExpandProperty Policy
    if ($value -eq 'on') {
        Log-Message "$name`: $service is configured to start ($value)" -Level "PASS"
    } else {
        try {
            $obj | Get-VMHostService | Where-Object {$_.Key -eq $service} | Set-VMHostService -Policy "on" -Confirm:$false | Out-Null
            $success = $true
        }
        catch {
            Log-Message "$name`: $service could not be configured ($value)" -Level "FAIL"
        }
        
        if ($success) {
            Log-Message "$name`: $service has been configured to start ($value -> on)" -Level "UPDATE"
            $success = $false
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
            $success = $true
        }
        catch {
            Log-Message "$name`: Lockdown Mode exception users could not be configured ($value)" -Level "FAIL"
        }
        
        if ($success) {
            Log-Message "$name`: Lockdown Mode exception users have been configured ($value -> NULL)" -Level "UPDATE"
            $success = $false
        }
    }
    
    $value = (Get-View ($view).ConfigManager.HostAccessManager).LockdownMode
    if ($value -eq 'lockdownDisabled') {
        try {
            ((Get-View($view).ConfigManager.HostAccessManager)).ChangeLockdownMode('lockdownNormal')
            $success = $true
        }
        catch {
            Log-Message "$name`: Lockdown Mode could not be configured ($value)" -Level "FAIL"
        }
        
        if ($success) {
            Log-Message "$name`: Lockdown Mode has been configured ($value -> lockdownNormal)" -Level "UPDATE"
            $success = $false
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
                $success = $true
            }
            catch {
                Log-Message "$name`: Standard switch `'$switch`' cannot be updated to disallow promiscuous mode ($value)" -Level "FAIL"
            }
            
            if ($success) {
                Log-Message "$name`: Standard switch `'$switch`' is updated to disallow promiscuous mode ($value -> false)" -Level "UPDATE"
                $success = $false
            }
        }

        $value = $switch | Get-SecurityPolicy | Select-Object -ExpandProperty MacChanges
        if ($value -eq $false) {
            Log-Message "$name`: Standard switch `'$switch`' is not configured to allow MAC address changes ($value)" -Level "PASS"
        } else {
            try {
                $switch | Get-SecurityPolicy | Set-SecurityPolicy -MacChanges $false -Confirm:$false | Out-Null
                $success = $true
            }
            catch {
                Log-Message "$name`: Standard switch `'$switch`' cannot be updated to disallow MAC address changes ($value)" -Level "FAIL"
            }
            
            if ($success) {
                Log-Message "$name`: Standard switch `'$switch`' is updated to disallow MAC address changes ($value -> false)" -Level "UPDATE"
                $success = $false
            } 
        }

        $value = $switch | Get-SecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
        if ($value -eq $false) {
            Log-Message "$name`: Standard switch `'$switch`' is not configured to allow forged transmits ($value)" -Level "PASS"
        } else {
            try {
                $switch | Get-SecurityPolicy | Set-SecurityPolicy -ForgedTransmits $false -Confirm:$false | Out-Null
                $success = $true
            }
            catch {
                Log-Message "$name`: Standard switch `'$switch`' cannot be updated to disallow MAC forged transmits ($value)" -Level "FAIL"
            }
            
            if ($success) {
                Log-Message "$name`: Standard switch `'$switch`' is updated to disallow MAC forged transmits ($value -> false)" -Level "UPDATE"
                $success = $false
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
                    $success = $true
                }
                catch {
                    Log-Message "$name`: Standard portgroup `'$portgroup`' cannot be updated to disallow promiscuous mode ($value)" -Level "FAIL"
                }
                
                if ($success) {
                    Log-Message "$name`: Standard portgroup `'$portgroup`' is updated to disallow promiscuous mode ($value -> false)" -Level "UPDATE"
                    $success = $false
                }
            }
        
            $value = $portgroup | Get-SecurityPolicy | Select-Object -ExpandProperty MacChanges
            if ($value -eq $false) {
                Log-Message "$name`: Standard portgroup `'$portgroup`' is not configured to allow MAC address changes ($value)" -Level "PASS"
            } else {
                try {
                    $portgroup | Get-SecurityPolicy | Set-SecurityPolicy -MacChanges $false -Confirm:$false | Out-Null
                    $success = $true
                }
                catch {
                    Log-Message "$name`: Standard portgroup `'$portgroup`' cannot be updated to disallow MAC address changes ($value)" -Level "FAIL"
                }
                
                if ($success) {
                    Log-Message "$name`: Standard portgroup `'$portgroup`' is updated to disallow MAC address changes ($value -> false)" -Level "UPDATE"
                    $success = $false
                } 
            }
        
            $value = $portgroup | Get-SecurityPolicy | Select-Object -ExpandProperty ForgedTransmits
            if ($value -eq $false) {
                Log-Message "$name`: Standard portgroup `'$portgroup`' is not configured to allow forged transmits ($value)" -Level "PASS"
            } else {
                try {
                    $portgroup | Get-SecurityPolicy | Set-SecurityPolicy -ForgedTransmits $false -Confirm:$false | Out-Null
                    $success = $true
                }
                catch {
                    Log-Message "$name`: Standard portgroup `'$portgroup`' cannot be updated to disallow MAC forged transmits ($value)" -Level "FAIL"
                }
                
                if ($success) {
                    Log-Message "$name`: Standard portgroup `'$portgroup`' is updated to disallow MAC forged transmits ($value -> false)" -Level "UPDATE"
                    $success = $false
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
            $success = $true
        }
        catch {
            Log-Message "$name`: TLS profile could not be updated ($value)" -Level "FAIL"
        }
        
        if ($success) {
            Log-Message "$name`: TLS profile has been updated ($value -> NIST_2024)" -Level "UPDATE"
            $success = $false
        }
    }
}

Log-Message "Remediation of $name completed at $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")" -Level "INFO"
Log-Message "Re-run the corresponding audit script to verify the remediation." -Level "INFO"
Log-Message "Remember to address security controls that are not covered by these tools." -Level "INFO"