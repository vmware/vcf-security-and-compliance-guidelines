<#
    Script Name: VMware vSphere Virtual Machine Security Settings Remediation Utility
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
    # Virtual Machine Name
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
    [switch]$NoSafetyChecks = $false,
    # Skip safety checks except for appliances
    [Parameter(Mandatory=$false)]
    [switch]$NoSafetyChecksExceptAppliances = $false,
    # Remove extra devices
    [Parameter(Mandatory=$false)]
    [switch]$RemoveExtraDevices = $false,
    # Update Virtual Machine Hardware version
    [Parameter(Mandatory=$false)]
    [switch]$UpdateHardwareVersion = $false,
    # Take a snapshot before proceeding
    [Parameter(Mandatory=$false)]
    [switch]$TakeSnapshot = $false
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
            break
    }
}

Function Do-Pause() {
    Log-Message "Check the vSphere Client to make sure all tasks have completed, then press a key." -Level "INFO"
    $null = $host.UI.RawUI.FlushInputBuffer()
    while ($true) {
        $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
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
Log-Message "VMware Virtual Machine Security Settings Remediation Utility 803-20241115-01" -Level "INFO"
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
Log-Message "script (lines 212-234). By doing so, you accept any and all risk this" -Level "ERROR"
Log-Message "script and these commands may pose to your environment." -Level "ERROR"
Exit

#####################
# Read the VM into objects and views once to save time & resources
$obj = Get-VM $name -ErrorAction Stop
$view = Get-View -VIObject $obj
$hosts = Get-VMHost

# Broadcom/VMware support policy does not permit changes to VMware virtual appliances
if (($NoSafetyChecks -eq $false) -or ($NoSafetyChecksExceptAppliances -eq $true)) {
    #####################
    # Is this a VMware appliance or vCLS container (CRX)?
    $flag = $false
    if ($obj | Select-Object -ExpandProperty Notes | Select-String -Pattern "VMware" -AllMatches) { $flag = $true}
    if ($obj | Select-Object -ExpandProperty Notes | Select-String -Pattern "vSphere Cluster Service" -AllMatches) { $flag = $true}
    if ($obj | Select-Object -ExpandProperty Name | Select-String -Pattern "vCLS-" -AllMatches) { $flag = $true}

    if ($flag) {
        Log-Message "$name`: The specified object may be a VMware virtual appliance or vCLS container." -Level "ERROR"
        Log-Message "$name`: Altering these types of objects is not supported and may result in operational issues." -Level "ERROR"
        Log-Message "$name`: vCLS Containers are managed by the vSphere Cluster Service and cannot be altered." -Level "ERROR"
        Log-Message "$name`: If you wish to audit this component anyhow consider the -NoSafetyChecks" -Level "ERROR"
        Log-Message "$name`: or the -NoSafetyChecksExceptAppliances flag." -Level "ERROR"
        Exit
    }
}

#####################
# Take a snapshot before proceeding
if ($TakeSnapshot) {
    try {
        $obj | New-Snapshot -Name "Security Configuration Guide Remediation" -Description "Snapshot taken before security remediation" -Confirm:$false | Out-Null
        Log-Message "$name`: Snapshot taken, as requested. Do not forget to remove it after verifying the remediation." -Level "INFO"
    }
    catch {
        Log-Message "$name`: Failed to take a snapshot before remediation`: $_" -Level "ERROR"
        Exit
    }
}

#####################
# Tests for advanced parameters
#
# Parameter guidelines for configurations requiring boolean values:
#
# T-OR-NP = The setting should be configured as TRUE or not present, where the default of TRUE will take over.
# F-OR-NP = The setting should be configured as FALSE or not present, where the default of FALSE will take over.
# TRUE = The setting should be configured as TRUE.
# FALSE = The setting should be configured as FALSE.
# NP = The setting should not be configured at all.
#

$scg_bool = @{
    
    'isolation.tools.copy.disable' = 'T-OR-NP'
    'isolation.tools.paste.disable' = 'T-OR-NP'
    'isolation.tools.diskShrink.disable' = 'T-OR-NP'
    'isolation.tools.diskWiper.disable' = 'T-OR-NP'
    'mks.enable3d' = 'F-OR-NP'
    'tools.guestlib.enableHostInfo' = 'F-OR-NP'
    'tools.guest.desktop.autolock' = 'T-OR-NP'
    'isolation.device.connectable.disable' = 'T-OR-NP'
    'isolation.tools.dnd.disable' = 'T-OR-NP'
    'sched.mem.pshare.salt' = 'NP'
    
}    

$scg_num_nondefault = @{
    
    'RemoteDisplay.maxConnections' = 1

}

$scg_num_default = @{
    
    'tools.setInfo.sizeLimit' = 1048576
    'log.keepOld' = 10
    'log.rotateSize' = 2048000

}

foreach ($param in $scg_bool.GetEnumerator()) {
    try {
        $vmval = (Get-AdvancedSetting -Entity $obj "$($param.Name)").Value
        switch ($($param.Value)) {
            'T-OR-NP' {
                if ([string]::IsNullOrEmpty($vmval)) {
                    Log-Message "$name`: $($param.Name) configured correctly (default)" -Level "PASS"
                } else {
                    Get-AdvancedSetting -Entity $obj -Name $param.Name | Remove-AdvancedSetting -Confirm:$false | Out-Null
                    Log-Message "$name`: $($param.Name) removed to prefer default ($vmval -> default)" -Level "UPDATE"
                }
            }
            'F-OR-NP' {
                if ([string]::IsNullOrEmpty($vmval)) {
                    Log-Message "$name`: $($param.Name) configured correctly (default)" -Level "PASS"
                } else {
                    Get-AdvancedSetting -Entity $obj -Name $param.Name | Remove-AdvancedSetting -Confirm:$false | Out-Null
                    Log-Message "$name`: $($param.Name) removed to prefer default ($vmval -> default)" -Level "UPDATE"
                }
            }
            'TRUE' {
                if ([string]::IsNullOrEmpty($vmval)) {
                    New-AdvancedSetting -Entity $obj -Name $param.Name -Value $true -Confirm:$false | Out-Null
                    Log-Message "$name`: $($param.Name) updated (undefined -> TRUE)" -Level "UPDATE"
                } elseif ($vmval -eq 'TRUE') {
                    Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS"
                } else {
                    Get-AdvancedSetting -Entity $obj -Name $param.Name | Set-AdvancedSetting -Value $true -Confirm:$false | Out-Null
                    Log-Message "$name`: $($param.Name) updated ($vmval -> TRUE)" -Level "UPDATE"
                }
            }
            'FALSE' {
                if ([string]::IsNullOrEmpty($vmval)) {
                    New-AdvancedSetting -Entity $obj -Name $param.Name -Value $false -Confirm:$false | Out-Null
                    Log-Message "$name`: $($param.Name) updated (undefined -> FALSE)" -Level "UPDATE"
                } elseif ($vmval -eq 'FALSE') {
                    Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS"
                } else {
                    Get-AdvancedSetting -Entity $obj -Name $param.Name | Set-AdvancedSetting -Value $false -Confirm:$false | Out-Null
                    Log-Message "$name`: $($param.Name) updated ($vmval -> FALSE)" -Level "UPDATE"
                }
            }
            'NP' {
                if ([string]::IsNullOrEmpty($vmval)) {
                    Log-Message "$name`: $($param.Name) not configured (default)" -Level "PASS"
                } else {
                    Get-AdvancedSetting -Entity $obj -Name $param.Name | Remove-AdvancedSetting -Confirm:$false | Out-Null
                    Log-Message "$name`: $($param.Name) removed to prefer default ($vmval -> default)" -Level "UPDATE"
                }
            }
        }
    } catch {
        Log-Message "$name`: An error occurred while checking or setting $($param.Name) ($vmval)" -Level "ERROR"
    }
}

foreach ($param in $scg_num_nondefault.GetEnumerator()) {
    try {
        $vmval = (Get-AdvancedSetting -Entity $obj "$($param.Name)").Value
        if ($vmval -eq $($param.Value)) {
            Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS"
        } elseif ([string]::IsNullOrEmpty($vmval)) { 
            New-AdvancedSetting -Entity $obj -Name $param.Name -Value $param.Value -Confirm:$false | Out-Null
            Log-Message "$name`: $($param.Name) updated ($vmval -> $($param.Value))" -Level "UPDATE"
        } else{
            Get-AdvancedSetting -Entity $obj -Name $param.Name | Set-AdvancedSetting -Value $param.Value -Confirm:$false | Out-Null
            Log-Message "$name`: $($param.Name) updated ($vmval -> $($param.Value))" -Level "UPDATE"
        }
    } catch {
        Log-Message "$name`: An error occurred while checking or setting $($param.Name) ($vmval)" -Level "ERROR"
    }
}

foreach ($param in $scg_num_default.GetEnumerator()) {
    try {
        $vmval = (Get-AdvancedSetting -Entity $obj "$($param.Name)").Value
        if ([string]::IsNullOrEmpty($vmval)) {
            Log-Message "$name`: $($param.Name) configured correctly (default)" -Level "PASS"
        } else {
            Get-AdvancedSetting -Entity $obj -Name $param.Name | Remove-AdvancedSetting -Confirm:$false | Out-Null
            Log-Message "$name`: $($param.Name) removed to prefer default ($vmval -> default)" -Level "UPDATE"
        }
    } catch {
        Log-Message "$name`: An error occurred while checking or setting $($param.Name) ($vmval)" -Level "ERROR"
    }
}

#####################
# Test for vMotion encryption
try {
    $value = $obj.ExtensionData.Config.MigrateEncryption
    switch ($value) {
        'required' { Log-Message "$name`: Encrypted vMotion configured correctly ($value)" -Level "PASS"  }
        Default {
            $spec = New-Object VMware.Vim.VirtualMachineConfigSpec
            $spec.MigrateEncryption = 'required'
            $view.ReconfigVM_Task($spec) | Out-Null
            Log-Message "$name`: Encrypted vMotion set to required ($value -> required)." -Level "UPDATE"
        }
    }
} catch {
    Log-Message "$name`: An error occurred while checking or setting Encrypted vMotion." -Level "ERROR"
}

#####################
# Test for Fault Tolerance encryption
try {
    $value = $obj.ExtensionData.Config.FtEncryptionMode
    switch ($value) {
        'ftEncryptionRequired' { Log-Message "$name`: Encrypted Fault Tolerance configured correctly ($value)" -Level "PASS"  }
        Default {
            $spec = New-Object VMware.Vim.VirtualMachineConfigSpec
            $spec.FtEncryptionMode = 'ftEncryptionRequired'
            $view.ReconfigVM_Task($spec) | Out-Null
            Log-Message "$name`: Encrypted Fault Tolerance set to required ($value -> ftEncryptionRequired)" -Level "UPDATE"
        }
    }
} catch {
    Log-Message "$name`: An error occurred while checking or setting Encrypted Fault Tolerance ($value)" -Level "ERROR"
}

#####################
# Test for VM logging
try {
    $value = $obj.ExtensionData.Config.Flags.EnableLogging
    switch ($value) {
        'True' { Log-Message "$name`: Diagnostic logging configured correctly ($value)" -Level "PASS"  }
        Default {
            $spec = New-Object VMware.Vim.VirtualMachineConfigSpec
            $spec.Flags = New-Object VMware.Vim.VirtualMachineFlagInfo
            $spec.Flags.EnableLogging = $true
            $view.ReconfigVM_Task($spec) | Out-Null
            Log-Message "$name`: Diagnostic logging enabled ($value -> TRUE)" -Level "UPDATE"
        }
    }
} catch {
    Log-Message "$name`: An error occurred while checking or setting diagnostic logging ($value)" -Level "ERROR"
}

#####################
# Test for BIOS boot classes
try {
    $value = (Get-AdvancedSetting -Entity $obj "bios.bootDeviceClasses").Value
    if ([string]::IsNullOrEmpty($value)) {
        New-AdvancedSetting -Entity $obj -Name bios.bootDeviceClasses -Value "allow:hd" -Confirm:$false | Out-Null
        Log-Message "$name`: BIOS boot device classes updated (undefined -> allow:hd)" -Level "UPDATE"
    } elseif ($value -eq "allow:hd") {
        Log-Message "$name`: VM only permitted to boot from virtual HDD ($value)" -Level "PASS"
    } else {
        Get-AdvancedSetting -Entity $obj -Name bios.bootDeviceClasses | Set-AdvancedSetting -Value "allow:hd" -Confirm:$false | Out-Null
        Log-Message "$name`: BIOS boot device classes updates ($value -> allow:hd)" -Level "UPDATE"
    }
} catch {
    Log-Message "$name`: An error occurred while checking or setting BIOS boot device classes ($value)" -Level "ERROR"
}

#####################
# Remove extra devices if requested
if ($RemoveExtraDevices) {
    $ExtraHardware = "VirtualCdrom|VirtualUSBController|VirtualUSBXHCIController|VirtualParallelPort|VirtualFloppy|VirtualSerialPort|VirtualHdAudioCard|VirtualEnsoniq1371"
    $view.Config.Hardware.Device | Where-Object {$_.GetType().Name -match $ExtraHardware} | Foreach-Object {
        try {
            $devname = $_.GetType().Name
            Log-Message "$name`: Removing the $devname device" -Level "UPDATE"
            $Config = New-Object VMware.Vim.VirtualMachineConfigSpec
            $Config.DeviceChange = New-Object VMware.Vim.VirtualDeviceConfigSpec
            $Config.DeviceChange[0] = New-Object VMware.Vim.VirtualDeviceConfigSpec
            $Config.DeviceChange[0].Operation = "remove"
            $Config.DeviceChange[0].Device = $_
            $obj.ExtensionData.ReconfigVM($Config) | Out-Null
        }
        catch {
            Log-Message "$name`: An error occurred while removing $devname`: $_" -Level "ERROR"
        }
    }

    # AHCI controller has to be removed after the CD-ROM is removed, so we'll just do it again. Not elegant, but it's understandable!
    # This will continue to fail if there is a virtual disk attached to the AHCI controller, though. We will not automatically remove HDDs.
    $obj = Get-VM $name -ErrorAction Stop
    $view = Get-View -VIObject $obj
    $ExtraHardware = "VirtualAHCIController"
    $view.Config.Hardware.Device | Where-Object {$_.GetType().Name -match $ExtraHardware} | Foreach-Object {
        try {
            $devname = $_.GetType().Name
            Log-Message "$name`: Removing the $devname device" -Level "UPDATE"
            $Config = New-Object VMware.Vim.VirtualMachineConfigSpec
            $Config.DeviceChange = New-Object VMware.Vim.VirtualDeviceConfigSpec
            $Config.DeviceChange[0] = New-Object VMware.Vim.VirtualDeviceConfigSpec
            $Config.DeviceChange[0].Operation = "remove"
            $Config.DeviceChange[0].Device = $_
            $obj.ExtensionData.ReconfigVM($Config) | Out-Null
        }
        catch {
            Log-Message "$name`: An error occurred while removing $devname`: $_" -Level "ERROR"
        }
    }
}

#####################
# Update Virtual Machine Hardware version, if requested
if (($UpdateHardwareVersion) -and ($obj.ExtensionData.Config.Version -ne 'vmx-21')) {
    try {
        $obj | Set-VM -HardwareVersion vmx-21 -Confirm:$false | Out-Null
        Log-Message "$name`: Updating Virtual Machine Hardware version to version 21" -Level "UPDATE"
    }
    catch {
        Log-Message "$name`: Failed to upgrade VM hardware level`: $_" -Level "ERROR"
    }
}

Log-Message "Remediation of $name completed at $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")" -Level "INFO"
Log-Message "Re-run the corresponding audit script to verify the remediation." -Level "INFO"
Log-Message "Remember to address security controls that are not covered by these tools." -Level "INFO"