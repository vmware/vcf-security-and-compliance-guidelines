<#
    Script Name: VMware vSphere Virtual Machine Security Settings Audit Utility
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
Log-Message "VMware Virtual Machine Security Settings Audit Utility 8.0.3" -Level "INFO"
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

$scg_num = @{
    'RemoteDisplay.maxConnections' = @{ Expected = 1; Comparator = 'eq'; Default = $false }
    'tools.setInfo.sizeLimit' = @{ Expected = 1048576; Comparator = 'le'; Default = $true }
    'log.keepOld' = @{ Expected = 10; Comparator = 'eq'; Default = $true }
    'log.rotateSize' = @{ Expected = 2048000; Comparator = 'eq'; Default = $true }
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

foreach ($param in $scg_num.GetEnumerator()) {
    $vmval = (Get-AdvancedSetting -Entity $obj "$($param.Name)").Value
    $expected = $param.Value.Expected
    $comparator = $param.Value.Comparator
    $isDefault = $param.Value.Default

    if ([string]::IsNullOrEmpty($vmval)) {
        if ($isDefault) {
            Log-Message "$name`: $($param.Name) not configured and is using secure defaults" -Level "PASS"
        } else {
            Log-Message "$name`: $($param.Name) not configured" -Level "FAIL"
        }
    } else {
        $pass = switch ($comparator) {
            'eq' { $vmval -eq $expected }
            'ge' { $vmval -ge $expected }
            'le' { $vmval -le $expected }
        }

        if ($pass) {
            Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS"
        } else {
            Log-Message "$name`: $($param.Name) configured incorrectly ($vmval, expected $comparator $expected)" -Level "FAIL"
        }
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