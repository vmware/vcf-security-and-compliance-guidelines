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
    # Skip safety checks except for appliances
    [Parameter(Mandatory=$false)]
    [switch]$NoSafetyChecksExceptAppliances = $false,
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
    'guest-9.tools-updates'
    'vm-9.deactivate-console-copy'
    'vm-9.deactivate-console-paste'
    'vm-9.deactivate-disk-shrinking-shrink'
    'vm-9.deactivate-disk-shrinking-wiper'
    'vm-9.deactivate-non-essential-3d-features'
    'vm-9.dvfilter'
    'vm-9.efi-boot-types'
    'vm-9.ft-encrypted'
    'vm-9.isolation-device-connectable-deactivate'
    'vm-9.isolation-tools-dnd-deactivate'
    'vm-9.limit-console-connections'
    'vm-9.limit-setinfo-size'
    'vm-9.log-enable'
    'vm-9.log-retention'
    'vm-9.log-rotation-size'
    'vm-9.pci-passthrough'
    'vm-9.remove-unnecessary-devices'
    'vm-9.restrict-host-info'
    'vm-9.secure-boot'
    'vm-9.transparentpagesharing-inter-vm-enabled'
    'vm-9.virtual-hardware'
    'vm-9.vmotion-encrypted'
    'vm-9.vmrc-lock'
)
foreach ($requested in $Controls) {
    if ($requested -notin $coveredControls) {
        Write-Log "Requested control '$requested' is not covered by this script." -Level "WARNING" -OutputFileName $OutputFileName
    }
}

#######################################################################################################

$currentDateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Log-Message "VMware Virtual Machine Security Settings Audit Utility 9.1.0" -Level "INFO"
Log-Message "Audit of $name started at $currentDateTime from $env:COMPUTERNAME by $env:USERNAME" -Level "INFO"

# Accept EULA and terms to continue
if ($false -eq $AcceptEULA) {
    Accept-EULA
    Log-Message "EULA accepted." -Level "INFO"
} else {
    Log-Message "EULA accepted." -Level "INFO"
}

# Safety checks
if (($false -eq $NoSafetyChecks) -and ($false -eq $NoSafetyChecksExceptAppliances)) {
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
        Log-Message "$name`: If you wish to audit this component anyhow, use the -NoSafetyChecks flag." -Level "ERROR"
        Log-Message "$name`: (-NoSafetyChecksExceptAppliances keeps this appliance check enabled.)" -Level "ERROR"
        Exit
    }
}

#####################
# Test for Secure Boot (vm-9.secure-boot)
if (Test-Control 'vm-9.secure-boot') {
    $value = $obj.ExtensionData.Config.BootOptions.EfiSecureBootEnabled
    if ($value -eq $true) {
        Log-Message "$name`: Secure Boot configured ($value)" -Level "PASS" -Control 'vm-9.secure-boot'
    } else {
        Log-Message "$name`: VM does not have Secure Boot configured ($value)" -Level "FAIL" -Control 'vm-9.secure-boot'
    }
}

#####################
# Test for VM Hardware version (vm-9.virtual-hardware)
if (Test-Control 'vm-9.virtual-hardware') {
    $value = $view.Config.Version
    $vmxNum = [int]($value -replace 'vmx-','')
    if ($vmxNum -ge 17) {
        Log-Message "$name`: VM hardware version meets the vmx-17 minimum ($value)" -Level "PASS" -Control 'vm-9.virtual-hardware'
    } else {
        Log-Message "$name`: VM hardware version is below the vmx-17 minimum ($value)" -Level "FAIL" -Control 'vm-9.virtual-hardware'
    }
}

#####################
# Test for VMware Tools currency (guest-9.tools-updates)
if (Test-Control 'guest-9.tools-updates') {
    $value = $view.Guest.ToolsVersionStatus2
    $toolsver = $obj.Guest.ToolsVersion
    switch ($value) {
        'guestToolsCurrent' { Log-Message "$name`: VMware Tools is current ($toolsver)" -Level "PASS" -Control 'guest-9.tools-updates' }
        'guestToolsNeedUpgrade' { Log-Message "$name`: VMware Tools is out of date ($toolsver)" -Level "FAIL" -Control 'guest-9.tools-updates' }
        'guestToolsUnmanaged' { Log-Message "$name`: VMware Tools is managed by the guest, such as open-vm-tools. Verify currency through guest OS patching ($toolsver)" -Level "INFO" -Control 'guest-9.tools-updates' }
        Default { Log-Message "$name`: VMware Tools status is $value ($toolsver). Verify the guest runs a current version." -Level "INFO" -Control 'guest-9.tools-updates' }
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
    
    'isolation.tools.copy.disable' = @{ Mode = 'T-OR-NP'; Control = 'vm-9.deactivate-console-copy' }
    'isolation.tools.paste.disable' = @{ Mode = 'T-OR-NP'; Control = 'vm-9.deactivate-console-paste' }
    'isolation.tools.diskShrink.disable' = @{ Mode = 'T-OR-NP'; Control = 'vm-9.deactivate-disk-shrinking-shrink' }
    'isolation.tools.diskWiper.disable' = @{ Mode = 'T-OR-NP'; Control = 'vm-9.deactivate-disk-shrinking-wiper' }
    'mks.enable3d' = @{ Mode = 'F-OR-NP'; Control = 'vm-9.deactivate-non-essential-3d-features' }
    'tools.guestlib.enableHostInfo' = @{ Mode = 'F-OR-NP'; Control = 'vm-9.restrict-host-info' }
    'tools.guest.desktop.autolock' = @{ Mode = 'T-OR-NP'; Control = 'vm-9.vmrc-lock' }
    'isolation.device.connectable.disable' = @{ Mode = 'T-OR-NP'; Control = 'vm-9.isolation-device-connectable-deactivate' }
    'isolation.tools.dnd.disable' = @{ Mode = 'T-OR-NP'; Control = 'vm-9.isolation-tools-dnd-deactivate' }
    'sched.mem.pshare.salt' = @{ Mode = 'NP'; Control = 'vm-9.transparentpagesharing-inter-vm-enabled' }
    
}    

$scg_num = @{
    'RemoteDisplay.maxConnections' = @{ Expected = 1; Comparator = 'eq'; Default = $false; Control = 'vm-9.limit-console-connections' }
    'tools.setInfo.sizeLimit' = @{ Expected = 1048576; Comparator = 'le'; Default = $true; Control = 'vm-9.limit-setinfo-size' }
    'log.keepOld' = @{ Expected = 10; Comparator = 'eq'; Default = $true; Control = 'vm-9.log-retention' }
    'log.rotateSize' = @{ Expected = 2048000; Comparator = 'eq'; Default = $true; Control = 'vm-9.log-rotation-size' }
}

foreach ($param in $scg_bool.GetEnumerator() )
{
    if (-not (Test-Control $param.Value.Control)) { continue }
    $vmval = (Get-AdvancedSetting -Entity $obj "$($param.Name)").Value

    switch ($($param.Value.Mode)) {
        'T-OR-NP' { 
            switch ($vmval) {
                'TRUE' {  Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS" -Control $param.Value.Control  }
                'FALSE' { Log-Message "$name`: $($param.Name) configured incorrectly ($vmval)" -Level "FAIL" -Control $param.Value.Control  }
                '' {      Log-Message "$name`: $($param.Name) not configured and is using secure defaults ($vmval)" -Level "PASS" -Control $param.Value.Control  }
                Default { Log-Message "$name`: $($param.Name) configured to something unexpected ($vmval)" -Level "FAIL" -Control $param.Value.Control  }
            }
        }
        'F-OR-NP' { 
            switch ($vmval) {
                'TRUE' {  Log-Message "$name`: $($param.Name) configured incorrectly ($vmval)" -Level "FAIL" -Control $param.Value.Control  }
                'FALSE' { Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS" -Control $param.Value.Control  }
                '' {      Log-Message "$name`: $($param.Name) not configured and is using secure defaults ($vmval)" -Level "PASS" -Control $param.Value.Control  }
                Default { Log-Message "$name`: $($param.Name) configured to something unexpected ($vmval)" -Level "FAIL" -Control $param.Value.Control  }
            }
        }
        'TRUE' { 
            switch ($vmval) {
                'TRUE' {  Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS" -Control $param.Value.Control  }
                'FALSE' { Log-Message "$name`: $($param.Name) configured incorrectly ($vmval)" -Level "FAIL" -Control $param.Value.Control  }
                '' {      Log-Message "$name`: $($param.Name) not configured ($vmval)" -Level "FAIL" -Control $param.Value.Control  }
                Default { Log-Message "$name`: $($param.Name) configured to something unexpected ($vmval)" -Level "FAIL" -Control $param.Value.Control  }
            }
        }
        'FALSE' { 
            switch ($vmval) {
                'TRUE' {  Log-Message "$name`: $($param.Name) configured incorrectly ($vmval)" -Level "FAIL" -Control $param.Value.Control  }
                'FALSE' { Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS" -Control $param.Value.Control  }
                '' {      Log-Message "$name`: $($param.Name) not configured ($vmval)" -Level "FAIL" -Control $param.Value.Control  }
                Default { Log-Message "$name`: $($param.Name) configured to something unexpected ($vmval)" -Level "FAIL" -Control $param.Value.Control  }
            }
        }
        'NP' { 
            if ($vmval) {
                Log-Message "$name`: $($param.Name) configured incorrectly ($vmval)." -Level "FAIL" -Control $param.Value.Control
            } else {
                Log-Message "$name`: $($param.Name) not configured ($vmval)." -Level "PASS" -Control $param.Value.Control
            }
            }
        Default { Log-Message "$name`: $($param.Name) configured to something unexpected ($vmval)" -Level "FAIL" -Control $param.Value.Control  }
    }
}

foreach ($param in $scg_num.GetEnumerator()) {
    if (-not (Test-Control $param.Value.Control)) { continue }
    $vmval = (Get-AdvancedSetting -Entity $obj "$($param.Name)").Value
    $expected = $param.Value.Expected
    $comparator = $param.Value.Comparator
    $isDefault = $param.Value.Default

    if ([string]::IsNullOrEmpty($vmval)) {
        if ($isDefault) {
            Log-Message "$name`: $($param.Name) not configured and is using secure defaults" -Level "PASS" -Control $param.Value.Control
        } else {
            Log-Message "$name`: $($param.Name) not configured" -Level "FAIL" -Control $param.Value.Control
        }
    } else {
        # Advanced setting values come back as strings; compare numerically, not lexicographically
        $numval = [int64]0
        if ([int64]::TryParse([string]$vmval, [ref]$numval)) {
            $pass = switch ($comparator) {
                'eq' { $numval -eq $expected }
                'ge' { $numval -ge $expected }
                'le' { $numval -le $expected }
            }
        } else {
            $pass = $false
        }

        if ($pass) {
            Log-Message "$name`: $($param.Name) configured correctly ($vmval)" -Level "PASS" -Control $param.Value.Control
        } else {
            Log-Message "$name`: $($param.Name) configured incorrectly ($vmval, expected $comparator $expected)" -Level "FAIL" -Control $param.Value.Control
        }
    }
}

#####################
# Test for vMotion encryption (vm-9.vmotion-encrypted)
if (Test-Control 'vm-9.vmotion-encrypted') {
    $value = $obj.ExtensionData.Config.MigrateEncryption
    switch($value) {
        'required' { Log-Message "$name`: Encrypted vMotion configured correctly ($value)" -Level "PASS" -Control 'vm-9.vmotion-encrypted'  }
        'opportunistic' { Log-Message "$name`: Encrypted vMotion defaults configured ($value)." -Level "FAIL" -Control 'vm-9.vmotion-encrypted'  }
        Default { Log-Message "$name`: Encrypted vMotion not configured ($value)" -Level "FAIL" -Control 'vm-9.vmotion-encrypted'  }
    }
}

#####################
# Test for Fault Tolerance encryption (vm-9.ft-encrypted)
if (Test-Control 'vm-9.ft-encrypted') {
    $value = $obj.ExtensionData.Config.FtEncryptionMode
    switch($value) {
        'ftEncryptionRequired' { Log-Message "$name`: Encrypted Fault Tolerance configured correctly ($value)" -Level "PASS" -Control 'vm-9.ft-encrypted'  }
        'ftEncryptionOpportunistic' { Log-Message "$name`: Encrypted Fault Tolerance defaults configured ($value)" -Level "FAIL" -Control 'vm-9.ft-encrypted'  }
        Default { Log-Message "$name`: Encrypted Fault Tolerance not configured ($value)" -Level "FAIL" -Control 'vm-9.ft-encrypted'  }
    }
}

#####################
# Test for VM logging (vm-9.log-enable)
if (Test-Control 'vm-9.log-enable') {
    $value = $obj.ExtensionData.Config.Flags.EnableLogging
    switch($value) {
        'True' { Log-Message "$name`: Diagnostic logging configured correctly ($value)" -Level "PASS" -Control 'vm-9.log-enable'  }
        Default { Log-Message "$name`: Diagnostic logging not configured ($value)" -Level "FAIL" -Control 'vm-9.log-enable'  }
    }
}

#####################
# Test for dvFilters (vm-9.dvfilter)
if (Test-Control 'vm-9.dvfilter') {
    $value = Get-AdvancedSetting -Entity $obj 'ethernet*.filter*.name*'
    if ($NULL -eq $value) {
        Log-Message "$name`: dvFilters not configured ($value)" -Level "PASS" -Control 'vm-9.dvfilter'
    } else {
        Log-Message "$name`: dvFilters configured, verify they are legitimate ($value)" -Level "FAIL" -Control 'vm-9.dvfilter'
    }
}

#####################
# Test for passthrough devices (vm-9.pci-passthrough)
if (Test-Control 'vm-9.pci-passthrough') {
    $value = $obj | Get-PassthroughDevice
    if ($NULL -eq $value) {
        Log-Message "$name`: Passthrough hardware devices not configured" -Level "PASS" -Control 'vm-9.pci-passthrough'
    } else {
        Log-Message "$name`: Passthrough hardware configured. Evaluate and remove if not necessary." -Level "FAIL" -Control 'vm-9.pci-passthrough'
    }
}

#####################
# Test for unnecessary devices (vm-9.remove-unnecessary-devices)
if (Test-Control 'vm-9.remove-unnecessary-devices') {
    $UnnecessaryHardware = "VirtualUSBController|VirtualUSBXHCIController|VirtualParallelPort|VirtualFloppy|VirtualSerialPort|VirtualHdAudioCard|VirtualAHCIController|VirtualEnsoniq1371|VirtualCdrom"

    $view.Config.Hardware.Device | Where-Object {$_.GetType().Name -match $UnnecessaryHardware} | Foreach-Object {
        $devname = $_.GetType().Name
        Log-Message "$name`: $devname device present. Evaluate and remove if not necessary." -Level "FAIL" -Control 'vm-9.remove-unnecessary-devices'
    }
}

#####################
# Test for BIOS boot classes (vm-9.efi-boot-types)
if (Test-Control 'vm-9.efi-boot-types') {
    $value = (Get-AdvancedSetting -Entity $obj "bios.bootDeviceClasses").Value
    if ($value -eq "allow:hd") {
        Log-Message "$name`: VM only permitted to boot from virtual HDD. ($value)" -Level "PASS" -Control 'vm-9.efi-boot-types'
    } else {
        Log-Message "$name`: VM permitted to boot from all possible sources. ($value)" -Level "FAIL" -Control 'vm-9.efi-boot-types'
    }
}

Log-Message "$name`: Audit of $name completed at $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")" -Level "INFO"