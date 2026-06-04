<#
    VMware vSphere Key Provider Change Utility

    This script is provided as an example of how to programmatically change key providers in VMware vSphere and VMware Cloud Foundation.
    It will reset the key provider for all clusters, virtual machines, vSAN datastores, and ESXi hosts to the specified key provider.

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
        # Key Provider Name
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$NewKeyProviderName
)

#####################
# Accept EULA and terms to continue
Function Accept-EULA() {
    Write-Output "[EULA]  This software is provided as is and any express or implied warranties, including," 
    Write-Output "[EULA]  but not limited to, the implied warranties of merchantability and fitness for a particular" 
    Write-Output "[EULA]  purpose are disclaimed. In no event shall the copyright holder or contributors be liable" 
    Write-Output "[EULA]  for any direct, indirect, incidental, special, exemplary, or consequential damages (including," 
    Write-Output "[EULA]  but not limited to, procurement of substitute goods or services; loss of use, data, or" 
    Write-Output "[EULA]  profits; or business interruption) however caused and on any theory of liability, whether" 
    Write-Output "[EULA]  in contract, strict liability, or tort (including negligence or otherwise) arising in any" 
    Write-Output "[EULA]  way out of the use of this software, even if advised of the possibility of such damage." 
    Write-Output "[EULA]  The provider makes no claims, promises, or guarantees about the accuracy, completeness, or" 
    Write-Output "[EULA]  adequacy of this sample. Organizations should engage appropriate legal, business, technical," 
    Write-Output "[EULA]  and audit expertise within their specific organization for review of requirements and" 
    Write-Output "[EULA]  effectiveness of implementations. You acknowledge that there may be performance or other" 
    Write-Output "[EULA]  considerations, and that this example may make assumptions which may not be valid in your" 
    Write-Output "[EULA]  environment or organization." 
    Write-Output "[EULA]" 
    Write-Output "[EULA]  This software is not supported."    
    Write-Output "[EULA]" 
    Write-Output "[EULA]  Make backups of all configurations and data before using this tool. Where prompted, monitor" 
    Write-Output "[EULA]  task progress directly in the vSphere Client." 
    Write-Output "[EULA]" 
    Write-Output "[EULA]  Press any key to accept all terms and risk. Use CTRL+C to exit."
    $null = $host.UI.RawUI.FlushInputBuffer()
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

Function Do-Pause() {
    Write-Host "[WAIT]  Check the vSphere Client to make sure all tasks have completed, then press a key." -ForegroundColor Yellow
    $null = $host.UI.RawUI.FlushInputBuffer()
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

#####################
# Check to see if we have the required version of VMware.PowerCLI
Function Check-PowerCLI() {
    # Because of the change between VMware.PowerCLI and VCF.PowerCLI, omitting this check.
}

#####################
# Check to see if we are attached to a supported vCenter Server
Function Check-vCenter() {
    if ($global:DefaultVIServers.Count -ne 1) {
        Write-Output "[ERROR] Connect to a single vCenter Server (use Connect-VIServer) prior to running this script."
        Exit
    }

    $vcVersion = $global:DefaultVIServers.Version
    if ($vcVersion -lt '7.0.0') {
        Write-Output "[ERROR] vCenter Server is not the correct version for this script."
        Exit
    }
}

#####################
# Check to see if we are attached to supported hosts. Older hosts might work but things change.
Function Check-Hosts()
{
    $ESXi = Get-VMHost
    foreach ($hostVersion in $ESXi.Version) {
        if (($hostVersion -lt '7.0.0')) {
            Write-Output "[ERROR] This script requires vSphere 7 or 8 throughout the environment." 
            Write-Output "[ERROR] There is at least one host attached that is downlevel ($hostVersion). Exiting." 
            Exit
        }
    }    
}

#######################################################################################################
Write-Output "[INFO]  VMware Key Provider Change Tool v9.0.0`n"

Accept-EULA
Check-PowerCLI
Check-vCenter
Check-Hosts

$keyprovider = Get-KeyProvider -Name $NewKeyProviderName -ErrorAction SilentlyContinue
if ($null -eq $keyprovider) {
    Write-Output "[ERROR] $NewKeyProviderName is not a valid key provider. Exiting."
    Exit
}

# Pre-flight: check vSAN health and resync status
Write-Output "`n[INFO]  Checking vSAN cluster health."
foreach ($cluster in Get-Cluster) {
    $clusterinfo = Get-VsanClusterConfiguration -Cluster $cluster
    if ($clusterinfo.EncryptionEnabled) {
        try {
            $health = Test-VsanClusterHealth -Cluster $cluster -ErrorAction Stop
            if ($health.OverallHealth -eq 'red') {
                Write-Host "[ERROR] Cluster $($cluster.Name) vSAN health is RED. Cannot safely rekey. Exiting." -ForegroundColor Red
                Exit
            } elseif ($health.OverallHealth -eq 'yellow') {
                Write-Host "[WARN]  Cluster $($cluster.Name) vSAN health is YELLOW. Proceeding with caution." -ForegroundColor Yellow
            } else {
                Write-Output "[INFO]  Cluster $($cluster.Name) vSAN health is GREEN."
            }
        } catch {
            Write-Host "[WARN]  Unable to check vSAN health for $($cluster.Name): $_" -ForegroundColor Yellow
        }

        $resync = Get-VsanResyncingComponent -Cluster $cluster -ErrorAction SilentlyContinue
        if ($resync) {
            $count = @($resync).Count
            Write-Host "[ERROR] Cluster $($cluster.Name) has $count active vSAN resync component(s). Cannot safely rekey." -ForegroundColor Red
            Write-Host "[ERROR] Wait for resync to complete before running this script. Exiting." -ForegroundColor Red
            Exit
        }
    }
}

$errors = @()

# Set the specified key provider as the default
Write-Output "`n[REKEY] Setting $keyprovider as the default key provider for vCenter."
Set-KeyProvider -KeyProvider $keyprovider -DefaultForSystem -Confirm:$false -ErrorAction Stop | Out-Null

# Remove custom key providers from clusters, to use the vCenter default
# This is a little ugly but you don't want to have something still using the old key provider
Write-Output "`n[INFO]  Removing custom key providers from clusters to prefer vCenter defaults."
foreach ($cluster in Get-Cluster) {
    try {
        Write-Output "[REKEY] Setting cluster $cluster to the vCenter default key provider."
        Remove-EntityDefaultKeyProvider -Entity $cluster -Confirm:$false -ErrorAction Stop | Out-Null
    } catch {
        Write-Output "[ERROR] Failed to remove custom key provider from cluster $($cluster.Name): $_"
        $errors += "Cluster-$($cluster.Name)"
    }
}

Do-Pause

# All VMs to the new key provider, shallow rekey
Write-Output "`n[INFO]  Rekeying virtual machines."
$allVMs = Get-VM
$rekeyVMs = @()

foreach ($vm in $allVMs) {
    $vmview = Get-View $vm
    if ($vmview.Config.KeyId) {
        $rekeyVMs += [PSCustomObject]@{ VM = $vm; View = $vmview }
    } else {
        Write-Output "[SKIP]  $vm is not encrypted"
    }
}

foreach ($entry in $rekeyVMs) {
    $vm = $entry.VM
    $vmview = $entry.View

    # Check if any hard disks are encrypted, or if this is vTPM-only
    $hasEncryptedDisks = $false
    foreach ($device in $vmview.Config.Hardware.Device) {
        if ($device -is [VMware.Vim.VirtualDisk] -and $device.Backing.KeyId) {
            $hasEncryptedDisks = $true
            break
        }
    }

    try {
        if ($hasEncryptedDisks) {
            Write-Output "[REKEY] Rekeying $vm to $keyprovider"
            Set-VM -VM $vm -KeyProvider $keyprovider -Confirm:$false -ErrorAction Stop | Out-Null
        } else {
            Write-Output "[REKEY] Rekeying $vm to $keyprovider (vTPM only)"
            Set-VM -VM $vm -KeyProvider $keyprovider -SkipHardDisks -Confirm:$false -ErrorAction Stop | Out-Null
        }
    } catch {
        Write-Output "[ERROR] Failed to rekey VM $($vm.Name): $_"
        $errors += "VM-$($vm.Name)"
    }
}

# Templates - must convert to VM, rekey, then convert back
Write-Output "`n[INFO]  Rekeying templates."
$allTemplates = Get-Template
$rekeyTemplates = @()

foreach ($template in $allTemplates) {
    $templateView = Get-View $template
    if ($templateView.Config.KeyId) {
        $rekeyTemplates += [PSCustomObject]@{ Template = $template; View = $templateView }
    } else {
        Write-Output "[SKIP]  Template $($template.Name) is not encrypted"
    }
}

foreach ($entry in $rekeyTemplates) {
    $template = $entry.Template
    $templateView = $entry.View

    $hasEncryptedDisks = $false
    foreach ($device in $templateView.Config.Hardware.Device) {
        if ($device -is [VMware.Vim.VirtualDisk] -and $device.Backing.KeyId) {
            $hasEncryptedDisks = $true
            break
        }
    }

    try {
        Write-Output "[REKEY] Converting template $($template.Name) to VM for rekey"
        Set-Template -Template $template -ToVM -Confirm:$false -ErrorAction Stop | Out-Null
        $vm = Get-VM -Name $template.Name -ErrorAction Stop

        if ($hasEncryptedDisks) {
            Write-Output "[REKEY] Rekeying $($template.Name) to $keyprovider"
            Set-VM -VM $vm -KeyProvider $keyprovider -Confirm:$false -ErrorAction Stop | Out-Null
        } else {
            Write-Output "[REKEY] Rekeying $($template.Name) to $keyprovider (vTPM only)"
            Set-VM -VM $vm -KeyProvider $keyprovider -SkipHardDisks -Confirm:$false -ErrorAction Stop | Out-Null
        }

        Write-Output "[REKEY] Converting $($template.Name) back to template"
        Set-VM -VM $vm -ToTemplate -Confirm:$false -ErrorAction Stop | Out-Null
    } catch {
        Write-Output "[ERROR] Failed to rekey template $($template.Name): $_"
        Write-Output "[WARN]  Template $($template.Name) may have been left as a VM -- check the vSphere Client"
        $errors += "Template-$($template.Name)"
    }
}

Do-Pause

# All vSAN datastores to the new key provider
Write-Output "`n[INFO]  Shallow rekeying vSAN datastores."
foreach ($cluster in Get-Cluster) {
    $clusterinfo = Get-VsanClusterConfiguration -Cluster $cluster
    if ($clusterinfo.EncryptionEnabled) {
        try {
            Write-Output "[REKEY] Setting vSAN key provider in $cluster to $keyprovider"
            Start-VsanEncryptionConfiguration -Cluster $cluster -KeyProvider $keyprovider -Confirm:$false -ErrorAction Stop | Out-Null
            Write-Output "[REKEY] Shallow rekeying vSAN in $cluster"
            Start-VsanEncryptionConfiguration -Cluster $cluster -ShallowRekey -Confirm:$false -ErrorAction Stop | Out-Null
        } catch {
            Write-Output "[ERROR] Failed to rekey vSAN in $($cluster.Name): $_"
            $errors += "vSAN-$($cluster.Name)"
        }
    } else {
        Write-Output "[SKIP]  $cluster does not have an encrypted vSAN datastore"
    }
}

Do-Pause

# All hosts to the new key provider
Write-Output "`n[INFO]  Rekeying ESXi hosts."
foreach ($vmhost in Get-VMHost) {
    if ($vmhost.ConnectionState -ne 'Connected') {
        Write-Output "[WARN]  $vmhost is not connected or in maintenance mode"
    } else {
        $vmhostview = Get-View $vmhost
        if ($vmhostview.Runtime.CryptoKeyId) {
            try {
                Write-Output "[REKEY] Rekeying $vmhost to $keyprovider"
                Set-VMHost -VMHost $vmhost -KeyProvider $keyprovider -Confirm:$false -ErrorAction Stop | Out-Null
            } catch {
                Write-Output "[ERROR] Failed to rekey host $($vmhost.Name): $_"
                $errors += "Host-$($vmhost.Name)"
            }
        } else {
            Write-Output "[SKIP]  $vmhost is not participating in encryption"
        }
    }
}

# Check for encrypted First Class Disks (FCDs)
Write-Output "`n[INFO]  Checking for encrypted First Class Disks."
try {
    foreach ($datastore in Get-Datastore) {
        $fcds = Get-VDisk -Datastore $datastore -ErrorAction SilentlyContinue
        foreach ($fcd in $fcds) {
            if ($fcd.ExtensionData.Config.Backing.KeyId) {
                Write-Output "[WARN]  FCD $($fcd.Name) on $($datastore.Name) is encrypted and requires manual rekey via storage policy"
            }
        }
    }
} catch {
    Write-Output "[WARN]  Unable to enumerate First Class Disks (Get-VDisk may not be available): $_"
}

# Verification
Write-Output "`n[INFO]  Verifying key provider changes."
foreach ($vm in Get-VM) {
    $vmview = Get-View $vm
    if ($vmview.Config.KeyId) {
        $vmProvider = $vmview.Config.KeyId.ProviderId | Select-Object -ExpandProperty Id
        if ($vmProvider -ne $NewKeyProviderName) {
            Write-Output "[WARN]  VM $($vm.Name) is still using key provider $vmProvider"
        }
    }
}

foreach ($template in Get-Template) {
    $templateView = Get-View $template
    if ($templateView.Config.KeyId) {
        $templateProvider = $templateView.Config.KeyId.ProviderId | Select-Object -ExpandProperty Id
        if ($templateProvider -ne $NewKeyProviderName) {
            Write-Output "[WARN]  Template $($template.Name) is still using key provider $templateProvider"
        }
    }
}

foreach ($cluster in Get-Cluster) {
    $clusterinfo = Get-VsanClusterConfiguration -Cluster $cluster
    if ($clusterinfo.EncryptionEnabled -and $clusterinfo.KeyProvider) {
        $vsanProvider = $clusterinfo.KeyProvider | Select-Object -ExpandProperty Name
        if ($vsanProvider -ne $NewKeyProviderName) {
            Write-Output "[WARN]  vSAN cluster $($cluster.Name) is still using key provider $vsanProvider"
        }
    }
}

foreach ($vmhost in Get-VMHost) {
    if ($vmhost.ConnectionState -eq 'Connected') {
        $vmhostview = Get-View $vmhost
        if ($vmhostview.Runtime.CryptoKeyId) {
            $hostProvider = $vmhostview.Runtime.CryptoKeyId.ProviderId | Select-Object -ExpandProperty Id
            if ($hostProvider -ne $NewKeyProviderName) {
                Write-Output "[WARN]  Host $($vmhost.Name) is still using key provider $hostProvider"
            }
        }
    }
}

if ($errors.Count -gt 0) {
    Write-Output "`n[WARN]  The following objects had errors during rekey:"
    foreach ($e in $errors) {
        Write-Output "[WARN]  $e"
    }
} else {
    Write-Output "`n[INFO]  All rekey operations completed successfully."
}