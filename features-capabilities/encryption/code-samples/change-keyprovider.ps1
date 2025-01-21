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
    Start-Sleep -Seconds 10
    Write-Output "[WAIT]  Check the vSphere Client to make sure all tasks have completed, then press a key." 
    $null = $host.UI.RawUI.FlushInputBuffer()
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

#####################
# Check to see if we have the required version of VMware.PowerCLI
Function Check-PowerCLI() {
    $installedVersion = (Get-InstalledModule -Name 'VMware.PowerCLI' -AllVersions -ErrorAction SilentlyContinue).Version | Sort-Object -Desc | Select-Object -First 1
    if ('13.1.0' -gt $installedVersion) {
        Write-Output "[ERROR] This script requires PowerCLI 13.1 or newer. Current version is $installedVersion" 
        Write-Output "[ERROR] Instructions for installation & upgrade can be found at https://developer.vmware.com/powercli" 
        Exit
    }
}

#####################
# Check to see if we are attached to a single supported vCenter Server
Function Check-vCenter() {
    if ($global:DefaultVIServers.Count -lt 1) {
        Write-Output "[ERROR] Please connect to a vCenter Server (use Connect-VIServer) prior to running this script. Thank you." 
        Exit
    }

    # Cannot override these, they're important.
    if (($global:DefaultVIServers.Count -lt 1) -or ($global:DefaultVIServers.Count -gt 1)) {
        Write-Output "[ERROR] Connect to a single vCenter Server (use Connect-VIServer) prior to running this script." 
        Exit
    }

    $vcVersion = $global:DefaultVIServers.Version
    if (($vcVersion -lt '7.0.0') -or ($vcVersion -gt '8.0.3')) {
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
        if (($hostVersion -lt '7.0.0') -or ($hostVersion -gt '8.0.3')) {
            Write-Output "[ERROR] This script requires vSphere 7 or 8 throughout the environment." 
            Write-Output "[ERROR] There is at least one host attached that is downlevel ($hostVersion). Exiting." 
            Exit
        }
    }    
}

#######################################################################################################
Write-Output "[INFO]  VMware Key Provider Change Tool v8.0.3`n"

Accept-EULA
Check-PowerCLI
Check-vCenter
Check-Hosts

$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

Write-Output ""

$keyprovider = Get-KeyProvider -Name $NewKeyProviderName -ErrorAction SilentlyContinue
if ($null -eq $keyprovider) {
    Write-Output "[ERROR] $NewKeyProviderName is not a valid key provider. Exiting." 
    Exit
}

# Set the specified key provider as the default
Write-Output "`n[REKEY] Setting $keyprovider as the default key provider for vCenter."
Set-KeyProvider -KeyProvider $keyprovider -DefaultForSystem -Confirm:$false -ErrorAction Stop | Out-Null

# Remove custom key providers from clusters, to use the vCenter default
# This is a little ugly but you don't want to have something still using the old key provider
Write-Output "`n[INFO]  Removing custom key providers from clusters to prefer vCenter defaults."
foreach ($cluster in Get-Cluster) {
    Write-Output "[REKEY] Setting cluster $cluster to the vCenter default key provider."
    Remove-EntityDefaultKeyProvider -Entity $cluster -Confirm:$false -ErrorAction Stop | Out-Null
}

Do-Pause

# All VMs to the new key provider, shallow rekey
Write-Output "`n[INFO]  Shallow rekeying virtual machines."
foreach ($vm in Get-VM) {
    $vmview = Get-View $vm
    if ($vmview.Config.KeyId) {
        Write-Output "[REKEY] Rekeying $vm to $keyprovider"
        Set-VM -VM $vm -KeyProvider $keyprovider -SkipHardDisks -Confirm:$false -ErrorAction Stop | Out-Null
    } else {
        Write-Output "[SKIP]  $vm is not encrypted, skipping"
    }
}

Do-Pause

# All vSAN datastores to the new key provider
Write-Output "`n[INFO]  Shallow rekeying vSAN datastores"
foreach ($cluster in Get-Cluster) {
    $clusterinfo = Get-VsanClusterConfiguration -Cluster $cluster
    if ($clusterinfo.EncryptionEnabled) {
        Write-Output "[REKEY] Rekeying vSAN datastores in $cluster to $keyprovider"
        Start-VsanEncryptionConfiguration -Cluster $cluster -KeyProvider $keyprovider -Confirm:$false -ErrorAction Stop | Out-Null
        Start-VsanEncryptionConfiguration -Cluster $cluster -ShallowRekey -Confirm:$false -ErrorAction Stop | Out-Null
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
            Write-Output "[REKEY] Rekeying $vmhost to $keyprovider"
            Set-VMHost -VMHost $vmhost -KeyProvider $keyprovider -Confirm:$false -ErrorAction Stop | Out-Null
        } else {
            Write-Output "[SKIP]  $vmhost is not participating in encryption"
        }
    }
}