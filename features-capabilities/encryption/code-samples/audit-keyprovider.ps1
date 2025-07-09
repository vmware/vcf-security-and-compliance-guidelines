<#
    VMware vSphere Key Provider Audit Utility

    This script is provided as an example of how to read encryption information from VMware vSphere and VMware Cloud Foundation.

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

Function Do-Pause() {
    Write-Output "[WAIT]  Check the vSphere Client to make sure all tasks have completed, then press a key." 
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
Write-Output "[INFO]  VMware Key Provider Audit Tool v9.0.0`n"

Check-PowerCLI
Check-vCenter
Check-Hosts

$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

foreach ($kp in Get-KeyProvider) {
    Write-Output "[PROVIDER] $($kp.name) is $($kp.Type) and DefaultForSystem is $($kp.DefaultForSystem)"
}

Write-Output ""

foreach ($VM in Get-VM) {
    if ($vm.ExtensionData.Config.KeyId) { 
        $provider = $vm.ExtensionData.Config.KeyId.ProviderID | Select-Object -ExpandProperty Id
        Write-Output "[VM] $($vm.name) is using key provider $provider"
    } else {
        Write-Output "[VM] $($vm.name) does not have encryption enabled"
    }
}

Write-Output ""

foreach ($cluster in Get-Cluster) {
    $clusterinfo = Get-VsanClusterConfiguration -Cluster $cluster
    $provider = $clusterinfo.KeyProvider | Select-Object -ExpandProperty Name

    if ($clusterinfo.EncryptionEnabled) {
        Write-Output "[VSAN] Cluster $($clusterinfo.Name) is using key provider $provider"
    } else {
        Write-Output "[VSAN] Cluster $($clusterinfo.Name) does not have encryption enabled"
    }
}

Write-Output ""

foreach ($vmhost in Get-VMHost) {
    if ($vmhost.ConnectionState -ne 'Connected') {
        Write-Output "[WARN]  $vmhost is not connected or in maintenance mode"
    } else {
        $vmhostview = Get-View $vmhost
        if ($vmhostview.Runtime.CryptoKeyId) {
            $provider = $vmhostview.Runtime.CryptoKeyId.ProviderId | Select-Object -ExpandProperty Id
            Write-Output "[HOST] Host $vmhost is using key provider $provider"
        } else {
            Write-Output "[HOST] Host $vmhost is not participating in encryption"
        }
    }
}