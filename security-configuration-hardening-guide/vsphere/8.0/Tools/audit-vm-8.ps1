<#
    Script Name: VMware vSphere Virtual Machine Security Settings Audit Utility
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
    [switch]$NoSafetyChecks,
    # Skip safety checks except for appliances
    [Parameter(Mandatory=$false)]
    [switch]$NoSafetyChecksExceptAppliances = $false
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
Log-Message "VMware Virtual Machine Security Settings Audit Utility 803-20241115-01" -Level "INFO"
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
# Test for Secure Boot
$value = $obj.ExtensionData.Config.BootOptions.EfiSecureBootEnabled
if ($value -eq $true) {
    Log-Message "$name`: Secure Boot configured ($value)" -Level "PASS"
} else {
    Log-Message "$name`: VM does not have Secure Boot configured ($value)" -Level "FAIL"
}

#####################
# Test for VM Hardware version
$value = $view.Config.Version
switch ($value) {
    'vmx-19' { Log-Message "$name`: VM is VM Hardware 19 (vSphere 7) ($value)" -Level "PASS"  }
    'vmx-20' { Log-Message "$name`: VM is VM Hardware 20 (vSphere 8) ($value)" -Level "PASS"  }
    'vmx-21' { Log-Message "$name`: VM is VM Hardware 21 (vSphere 8) ($value)" -Level "PASS"  }
    Default { Log-Message "$name`: VM Hardware version should be version 19 or later ($value)" -Level "FAIL"  }
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

foreach ($param in $scg_bool.GetEnumerator() )
{
    $vmval = (Get-AdvancedSetting -Entity $obj "$($param.Name)").Value

    switch ($($param.Value)) {
        'T-OR-NP' { 
            switch ($vmval) {
                'TRUE' {  Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS"  }
                'FALSE' { Log-Message "$name`: $($param.Name) configured incorrectly ($vmval)" -Level "FAIL"  }
                '' {      Log-Message "$name`: $($param.Name) not configured and is using secure defaults ($vmval)" -Level "PASS"  }
                Default { Log-Message "$name`: $($param.Name) configured to something unexpected ($vmval)" -Level "FAIL"  }
            }
        }
        'F-OR-NP' { 
            switch ($vmval) {
                'TRUE' {  Log-Message "$name`: $($param.Name) configured incorrectly ($vmval)" -Level "FAIL"  }
                'FALSE' { Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS"  }
                '' {      Log-Message "$name`: $($param.Name) not configured and is using secure defaults ($vmval)" -Level "PASS"  }
                Default { Log-Message "$name`: $($param.Name) configured to something unexpected ($vmval)" -Level "FAIL"  }
            }
        }
        'TRUE' { 
            switch ($vmval) {
                'TRUE' {  Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS"  }
                'FALSE' { Log-Message "$name`: $($param.Name) configured incorrectly ($vmval)" -Level "FAIL"  }
                '' {      Log-Message "$name`: $($param.Name) not configured ($vmval)" -Level "FAIL"  }
                Default { Log-Message "$name`: $($param.Name) configured to something unexpected ($vmval)" -Level "FAIL"  }
            }
        }
        'FALSE' { 
            switch ($vmval) {
                'TRUE' {  Log-Message "$name`: $($param.Name) configured incorrectly ($vmval)" -Level "FAIL"  }
                'FALSE' { Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS"  }
                '' {      Log-Message "$name`: $($param.Name) not configured ($vmval)" -Level "FAIL"  }
                Default { Log-Message "$name`: $($param.Name) configured to something unexpected ($vmval)" -Level "FAIL"  }
            }
        }
        'NP' { 
            if ($vmval) {
                Log-Message "$name`: $($param.Name) configured incorrectly ($vmval)." -Level "FAIL"
            } else {
                Log-Message "$name`: $($param.Name) not configured ($vmval)." -Level "PASS"
            }
            }
        Default { Log-Message "$name`: $($param.Name) configured to something unexpected ($vmval)" -Level "FAIL"  }
    }
}

foreach ($param in $scg_num_nondefault.GetEnumerator() )
{
    $vmval = (Get-AdvancedSetting -Entity $obj "$($param.Name)").Value

    if ($vmval -eq $($param.Value)) {
        Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS"
    } else {
        Log-Message "$name`: $($param.Name) configured incorrectly ($vmval)." -Level "FAIL"
    }
}

foreach ($param in $scg_num_default.GetEnumerator() )
{
    $vmval = (Get-AdvancedSetting -Entity $obj "$($param.Name)").Value

    if ($vmval -eq $($param.Value)) {
        Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS"
    } elseif (!$vmval) {
        Log-Message "$name`: $($param.Name) not configured ($vmval)" -Level "PASS"
    } else {
        Log-Message "$name`: $($param.Name) configured incorrectly ($vmval)" -Level "FAIL"
    }
}

#####################
# Test for vMotion encryption
$value = $obj.ExtensionData.Config.MigrateEncryption
switch($value) {
    'required' { Log-Message "$name`: Encrypted vMotion configured correctly ($value)" -Level "PASS"  }
    'opportunistic' { Log-Message "$name`: Encrypted vMotion defaults configured ($value)." -Level "FAIL"  }
    Default { Log-Message "$name`: Encrypted vMotion not configured ($value)" -Level "FAIL"  }
}

#####################
# Test for Fault Tolerance encryption
$value = $obj.ExtensionData.Config.FtEncryptionMode
switch($value) {
    'ftEncryptionRequired' { Log-Message "$name`: Encrypted Fault Tolerance configured correctly ($value)" -Level "PASS"  }
    'ftEncryptionOpportunistic' { Log-Message "$name`: Encrypted Fault Tolerance defaults configured ($value)" -Level "FAIL"  }
    Default { Log-Message "$name`: Encrypted Fault Tolerance not configured ($value)" -Level "FAIL"  }
}

#####################
# Test for VM logging
$value = $obj.ExtensionData.Config.Flags.EnableLogging
switch($value) {
    'True' { Log-Message "$name`: Diagnostic logging configured correctly ($value)" -Level "PASS"  }
    Default { Log-Message "$name`: Diagnostic logging not configured ($value)" -Level "FAIL"  }
}

#####################
# Test for dvFilters
$value = Get-AdvancedSetting -Entity $obj 'ethernet*.filter*.name*'
if ($NULL -eq $value) {
    Log-Message "$name`: dvFilters not configured ($value)" -Level "PASS"
} else {
    Log-Message "$name`: dvFilters configured, verify they are legitimate ($value)" -Level "FAIL"
}

#####################
# Test for passthrough devices
$value = $obj | Get-PassthroughDevice
if ($NULL -eq $value) {
    Log-Message "$name`: Passthrough hardware devices not configured" -Level "PASS"
} else {
    Log-Message "$name`: Passthrough hardware configured. Evaluate and remove if not necessary." -Level "FAIL"
}

#####################
# Test for unnecessary devices
$UnnecessaryHardware = "VirtualUSBController|VirtualUSBXHCIController|VirtualParallelPort|VirtualFloppy|VirtualSerialPort|VirtualHdAudioCard|VirtualAHCIController|VirtualEnsoniq1371|VirtualCdrom"

$view.Config.Hardware.Device | Where-Object {$_.GetType().Name -match $UnnecessaryHardware} | Foreach-Object {
    $devname = $_.GetType().Name
    Log-Message "$name`: $devname device present. Evaluate and remove if not necessary." -Level "FAIL"
}

#####################
# Test for BIOS boot classes
$value = (Get-AdvancedSetting -Entity $obj "bios.bootDeviceClasses").Value
if ($value -eq "allow:hd") {
    Log-Message "$name`: VM only permitted to boot from virtual HDD. ($value)" -Level "PASS"
} else {
    Log-Message "$name`: VM permitted to boot from all possible sources. ($value)" -Level "FAIL"
}

Log-Message "$name`: Audit of $name completed at $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")" -Level "INFO"