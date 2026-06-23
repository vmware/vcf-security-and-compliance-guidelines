# Companion Guide to PCI DSS 4.0.1 for VMware Cloud Foundation 9.1 -- Framework Controls by SCG Coverage

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://docs-prv.pcisecuritystandards.org/PCI%20DSS/Standard/PCI-DSS-v4_0_1.pdf

This guidance evolves. Please check the current revision at: https://brcm.tech/vcf-compliance

## Disclaimer

This kit is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.

This material is provided as is and any express or implied warranties, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose are disclaimed. In no event shall the copyright holder or contributors be liable for any direct, indirect, incidental, special, exemplary, or consequential damages (including, but not limited to, procurement of substitute goods or services; loss of use, data, or profits; or business interruption) however caused and on any theory of liability, whether in contract, strict liability, or tort (including negligence or otherwise) arising in any way out of the use of this software, even if advised of the possibility of such damage. The provider makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of this sample. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations. You acknowledge that there may be performance or other considerations, and that these examples may make assumptions which may not be valid in your environment or organization.

## Third Party Identifiers and Mappings

This document includes regulatory compliance and security control identifiers from external sources as a convenience to end users. This does not constitute endorsement, in either direction.

There is not a one-to-one mapping of product capabilities to third-party controls. A product capability, or set of capabilities, may be applicable to multiple controls. Conversely, a control may be satisfied with the use of multiple capabilities.

Control identifier numbers have been included from the Secure Controls Framework, version 2026.1, under the terms of the Creative Commons Attribution-NoDerivatives 4.0 International Public License. No modifications have been made to the control identifier numbers under the terms of the license.

https://securecontrolsframework.com/

## Framework Controls With Relevant SCG Hardening Controls

156 framework controls have at least one Security Configuration Guide hardening control mapped to them through the SCF crosswalk.

### Control 1.1

> 1.1 Processes and mechanisms for installing and maintaining network security controls are defined and understood.

**Bridging SCF Controls:** CFG-02, NET-04

**Relevant SCG Controls:**

- esx-9.network-bpdu -- Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.network-rpf-promisc -- The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.
- esx-9.network-standard-reject-forged-transmit -- Reject forged transmits on standard switches and port groups.
- esx-9.network-standard-reject-mac-changes -- Reject guest MAC address changes on standard switches and port groups.
- esx-9.network-standard-reject-promiscuous-mode -- Reject promiscuous mode on standard switches and port groups.
- vcenter-9.network-reject-promiscuous-mode-dvportgroup -- Reject promiscuous mode on distributed switches and port groups.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-vgt -- Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.

### Control 1.2.1

> 1.2.1 Configuration standards for NSC rulesets are:  • Defined.  • Implemented.  • Maintained.

**Bridging SCF Controls:** CFG-02, NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 1.2.2

> 1.2.2 All changes to network connections and to configurations of NSCs are approved and managed in accordance with the change control process defined at Requirement 6.5.1.  Applicability Notes  Changes to network connections include the addition, removal, or modification of a connection.   Changes to NSC configurations include those related to the component itself as well as those affecting how it performs its security function.

**Bridging SCF Controls:** CHG-02

**Relevant SCG Controls:**

- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.

### Control 1.2.3

> 1.2.3 An accurate network diagram(s) is maintained that shows all connections between the CDE and other networks, including any wireless networks.  Applicability Notes  A current network diagram(s) or other technical or topological solution that identifies network connections and devices can be used to meet this requirement.

**Bridging SCF Controls:** NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 1.2.4

> 1.2.4 An accurate data-flow diagram(s) is maintained that meets the following:   • Shows all account data flows across systems and networks.  • Updated as needed upon changes to the environment.  Applicability Notes  A data-flow diagram(s) or other technical or topological solution that identifies flows of account data across systems and networks can be used to meet this requirement.

**Bridging SCF Controls:** NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 1.2.5

> 1.2.5 All services, protocols and ports allowed are identified, approved, and have a defined business need.

**Bridging SCF Controls:** CFG-03, NET-06

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.ceip-disable -- Disable the ESX Customer Experience Improvement Program.
- esx-9.deactivate-mob -- The ESX Managed Object Browser (MOB) must be disabled.
- esx-9.deactivate-shell -- The ESX Shell must be disabled.
- esx-9.forensic-snapshots -- Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- esx-9.hardware-ports -- Disable or physically protect unused external server ports.
- esx-9.hardware-virtual-nic -- The ESX host must not enable virtual hardware management network interfaces.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.snmp -- The SNMP service on the ESX host must not be configured to start automatically.
- esx-9.ssh -- The ESX host's SSH service must be deactivated except for temporary diagnostic use.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- guest-9.tools-deactivate-appinfo -- The guest OS must deactivate Appinfo information gathering unless required.
- guest-9.tools-deactivate-containerinfo -- The guest OS must deactivate ContainerInfo unless required.
- guest-9.tools-deactivate-guestoperations -- The guest OS must deactivate Guest Operations unless required.
- guest-9.tools-deactivate-gueststoreupgrade -- The guest OS must deactivate Guest Store Upgrade operations unless required.
- guest-9.tools-deactivate-servicediscovery -- The guest OS must deactivate Service Discovery unless required.
- installer-9.security -- The VCF Installer appliance must be removed or powered off after deployment completes, unless it has been converted into the SDDC Manager.
- nsx-9.ceip-disable -- Disable the NSX Manager Customer Experience Improvement Program.
- nsx-9.dhcp-disable -- NSX Tier-0 Gateway must not enable DHCP unless it is required.
- nsx-9.multicast-disable -- NSX Tier-0 Gateway must disable multicast and PIM where they are not required.
- nsx-9.snmp -- NSX Manager must not use SNMP v1 or v2c.
- nsx-9.ssh -- The NSX Manager SSH service must be deactivated except for temporary diagnostic use.
- nsx-9.t1-dhcp-disable -- Disable Tier-1 Gateway DHCP service when not in use.
- nsx-9.t1-multicast-disable -- Disable Tier-1 Gateway multicast when not in use.
- operations-9.ceip-disable -- Disable the VCF Operations Customer Experience Improvement Program.
- operations-9.in-page-feedback -- Disable VCF Operations in-page feedback.
- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.
- vcenter-9.ceip-disable -- Disable the vCenter Customer Experience Improvement Program.
- vcenter-9.client-feedback -- Disable vSphere Client in-product feedback.
- vcenter-9.client-telemetry -- Disable vSphere Client UI telemetry.
- vcenter-9.network-restrict-discovery-protocol -- Disable CDP/LLDP discovery protocols on distributed switches unless required.
- vcenter-9.snmp -- Disable SNMP v1 and v2c receivers on vCenter.
- vcenter-9.ssh -- Deactivate SSH access to the vCenter appliance except for temporary diagnostic use.
- vcenter-9.vds-health-check-disable -- Disable the vSphere Distributed Switch health check when not troubleshooting.
- vm-9.deactivate-console-copy -- Virtual machines must have console copy operations deactivated.
- vm-9.deactivate-console-paste -- Virtual machines must have console paste operations deactivated.
- vm-9.deactivate-disk-shrinking-shrink -- Virtual machines must have virtual disk shrinking operations deactivated.
- vm-9.deactivate-disk-shrinking-wiper -- Virtual machines must have virtual disk wiping operations deactivated.
- vm-9.deactivate-non-essential-3d-features -- Virtual machines must have 3D graphics features deactivated when not required.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vm-9.efi-boot-types -- Virtual machines must prevent booting from unauthorized sources.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.isolation-tools-dnd-deactivate -- Virtual machines must have console drag and drop operations deactivated.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.
- vm-9.persistent-disk -- Virtual machines must not use independent, nonpersistent disks.
- vm-9.remove-unnecessary-devices -- Virtual machines must remove unnecessary virtual hardware.
- vm-9.restrict-host-info -- Virtual machines must not be able to obtain host information from the hypervisor.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 1.2.6

> 1.2.6 Security features are defined and implemented for all services, protocols, and ports that are in use and considered to be insecure, such that the risk is mitigated.

**Bridging SCF Controls:** CFG-02, CFG-03, NET-06

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.ceip-disable -- Disable the ESX Customer Experience Improvement Program.
- esx-9.deactivate-mob -- The ESX Managed Object Browser (MOB) must be disabled.
- esx-9.deactivate-shell -- The ESX Shell must be disabled.
- esx-9.forensic-snapshots -- Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- esx-9.hardware-ports -- Disable or physically protect unused external server ports.
- esx-9.hardware-virtual-nic -- The ESX host must not enable virtual hardware management network interfaces.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.snmp -- The SNMP service on the ESX host must not be configured to start automatically.
- esx-9.ssh -- The ESX host's SSH service must be deactivated except for temporary diagnostic use.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- guest-9.tools-deactivate-appinfo -- The guest OS must deactivate Appinfo information gathering unless required.
- guest-9.tools-deactivate-containerinfo -- The guest OS must deactivate ContainerInfo unless required.
- guest-9.tools-deactivate-guestoperations -- The guest OS must deactivate Guest Operations unless required.
- guest-9.tools-deactivate-gueststoreupgrade -- The guest OS must deactivate Guest Store Upgrade operations unless required.
- guest-9.tools-deactivate-servicediscovery -- The guest OS must deactivate Service Discovery unless required.
- installer-9.security -- The VCF Installer appliance must be removed or powered off after deployment completes, unless it has been converted into the SDDC Manager.
- nsx-9.ceip-disable -- Disable the NSX Manager Customer Experience Improvement Program.
- nsx-9.dhcp-disable -- NSX Tier-0 Gateway must not enable DHCP unless it is required.
- nsx-9.multicast-disable -- NSX Tier-0 Gateway must disable multicast and PIM where they are not required.
- nsx-9.snmp -- NSX Manager must not use SNMP v1 or v2c.
- nsx-9.ssh -- The NSX Manager SSH service must be deactivated except for temporary diagnostic use.
- nsx-9.t1-dhcp-disable -- Disable Tier-1 Gateway DHCP service when not in use.
- nsx-9.t1-multicast-disable -- Disable Tier-1 Gateway multicast when not in use.
- operations-9.ceip-disable -- Disable the VCF Operations Customer Experience Improvement Program.
- operations-9.in-page-feedback -- Disable VCF Operations in-page feedback.
- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.
- vcenter-9.ceip-disable -- Disable the vCenter Customer Experience Improvement Program.
- vcenter-9.client-feedback -- Disable vSphere Client in-product feedback.
- vcenter-9.client-telemetry -- Disable vSphere Client UI telemetry.
- vcenter-9.network-restrict-discovery-protocol -- Disable CDP/LLDP discovery protocols on distributed switches unless required.
- vcenter-9.snmp -- Disable SNMP v1 and v2c receivers on vCenter.
- vcenter-9.ssh -- Deactivate SSH access to the vCenter appliance except for temporary diagnostic use.
- vcenter-9.vds-health-check-disable -- Disable the vSphere Distributed Switch health check when not troubleshooting.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.deactivate-console-copy -- Virtual machines must have console copy operations deactivated.
- vm-9.deactivate-console-paste -- Virtual machines must have console paste operations deactivated.
- vm-9.deactivate-disk-shrinking-shrink -- Virtual machines must have virtual disk shrinking operations deactivated.
- vm-9.deactivate-disk-shrinking-wiper -- Virtual machines must have virtual disk wiping operations deactivated.
- vm-9.deactivate-non-essential-3d-features -- Virtual machines must have 3D graphics features deactivated when not required.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vm-9.efi-boot-types -- Virtual machines must prevent booting from unauthorized sources.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.isolation-tools-dnd-deactivate -- Virtual machines must have console drag and drop operations deactivated.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.
- vm-9.persistent-disk -- Virtual machines must not use independent, nonpersistent disks.
- vm-9.remove-unnecessary-devices -- Virtual machines must remove unnecessary virtual hardware.
- vm-9.restrict-host-info -- Virtual machines must not be able to obtain host information from the hypervisor.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 1.2.7

> 1.2.7 Configurations of NSCs are reviewed at least once every six months to confirm they are relevant and effective.

**Bridging SCF Controls:** CFG-03.1, NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- nsx-9.inactive-interfaces -- NSX Tier-0 Gateway must remove inactive interfaces.
- nsx-9.routing-protocols-unused -- Disable Tier-0 Gateway routing protocols that are not in use.
- nsx-9.t1-inactive-interfaces -- Remove inactive interfaces and stale linked segments from Tier-1 Gateways.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 1.2.8

> 1.2.8 Configuration files for NSCs are:   • Secured from unauthorized access.   • Kept consistent with active network configurations.   Applicability Notes  Any file or setting used to configure or synchronize NSCs is considered to be a “configuration file.” This includes files, automated and system-based controls, scripts, settings, infrastructure as code, or other parameters that are backed up, archived, or stored remotely.

**Bridging SCF Controls:** CHG-04, NET-06

**Relevant SCG Controls:**

- esx-9.hardware-management-config-lock -- Lock the hardware management controller configuration after provisioning.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- guest-9.tools-add-feature -- The guest OS must disable automatic addition of optional VMware Tools features.
- guest-9.tools-allow-transforms -- The guest OS must disable MSI transforms in VMware Tools auto-upgrades.
- guest-9.tools-globalconf -- The guest OS must deactivate GlobalConf unless required.
- guest-9.tools-prevent-recustomization -- The guest OS must prevent re-customization of an already-deployed VM.
- guest-9.tools-remove-feature -- The guest OS must disable automatic removal of optional VMware Tools features.
- vsan-9.managed-disk-claim -- vSAN must disable managed disk claims.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 1.3

> 1.3 Network access to and from the cardholder data environment is restricted.

**Bridging SCF Controls:** IAC-21, NET-04, NET-04.1, NET-06

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.firewall-incoming-default -- The ESX host must configure the firewall to block network traffic by default.
- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.network-bpdu -- Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.network-rpf-promisc -- The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.
- esx-9.network-standard-reject-forged-transmit -- Reject forged transmits on standard switches and port groups.
- esx-9.network-standard-reject-mac-changes -- Reject guest MAC address changes on standard switches and port groups.
- esx-9.network-standard-reject-promiscuous-mode -- Reject promiscuous mode on standard switches and port groups.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.network-reject-promiscuous-mode-dvportgroup -- Reject promiscuous mode on distributed switches and port groups.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-vgt -- Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.
- vcf-9.perimeter-firewall -- Limit access to VCF component management interfaces with perimeter firewalls.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 1.3.1

> 1.3.1 Inbound traffic to the CDE is restricted as follows:   • To only traffic that is necessary,   • All other traffic is specifically denied.

**Bridging SCF Controls:** NET-04, NET-04.1, NET-06

**Relevant SCG Controls:**

- esx-9.firewall-incoming-default -- The ESX host must configure the firewall to block network traffic by default.
- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- esx-9.network-bpdu -- Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.network-rpf-promisc -- The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.
- esx-9.network-standard-reject-forged-transmit -- Reject forged transmits on standard switches and port groups.
- esx-9.network-standard-reject-mac-changes -- Reject guest MAC address changes on standard switches and port groups.
- esx-9.network-standard-reject-promiscuous-mode -- Reject promiscuous mode on standard switches and port groups.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.network-reject-promiscuous-mode-dvportgroup -- Reject promiscuous mode on distributed switches and port groups.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-vgt -- Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.
- vcf-9.perimeter-firewall -- Limit access to VCF component management interfaces with perimeter firewalls.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 1.3.2

> 1.3.2 Outbound traffic from the CDE is restricted as follows:   • To only traffic that is necessary.  • All other traffic is specifically denied.

**Bridging SCF Controls:** NET-03.5, NET-04, NET-04.1, NET-06

**Relevant SCG Controls:**

- esx-9.firewall-incoming-default -- The ESX host must configure the firewall to block network traffic by default.
- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- esx-9.network-bpdu -- Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.network-rpf-promisc -- The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.
- esx-9.network-standard-reject-forged-transmit -- Reject forged transmits on standard switches and port groups.
- esx-9.network-standard-reject-mac-changes -- Reject guest MAC address changes on standard switches and port groups.
- esx-9.network-standard-reject-promiscuous-mode -- Reject promiscuous mode on standard switches and port groups.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.network-reject-promiscuous-mode-dvportgroup -- Reject promiscuous mode on distributed switches and port groups.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-restrict-port-mirroring -- Remove unauthorized port mirroring sessions on distributed switches.
- vcenter-9.network-vgt -- Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.
- vcf-9.perimeter-firewall -- Limit access to VCF component management interfaces with perimeter firewalls.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 1.3.3

> 1.3.3 NSCs are installed between all wireless networks and the CDE, regardless of whether the wireless network is a CDE, such that:   • All wireless traffic from wireless networks into the CDE is denied by default.  • Only wireless traffic with an authorized business purpose is allowed into the CDE.

**Bridging SCF Controls:** NET-03, NET-04.1, NET-06

**Relevant SCG Controls:**

- esx-9.firewall-incoming-default -- The ESX host must configure the firewall to block network traffic by default.
- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- nsx-9.ibgp-source-loopback -- Configure Tier-0 Gateway iBGP peering to use the loopback address as the source.
- nsx-9.reverse-path-forwarding -- NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.network-mac-learning -- Disable MAC learning on distributed switch port groups unless a workload requires it.
- vcenter-9.network-reject-forged-transmit-dvportgroup -- Reject forged transmits on distributed switches and port groups.
- vcenter-9.network-reject-mac-changes-dvportgroup -- Reject guest MAC address changes on distributed switches and port groups.
- vcenter-9.network-reset-port -- Reset distributed switch port configuration when a virtual machine disconnects.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-restrict-port-level-overrides -- Disallow per-port policy overrides on distributed port groups, except port blocking.
- vcenter-9.network-restrict-port-mirroring -- Remove unauthorized port mirroring sessions on distributed switches.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.
- vcf-9.perimeter-firewall -- Limit access to VCF component management interfaces with perimeter firewalls.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 1.4

> 1.4 Network connections between trusted and untrusted networks are controlled.

**Bridging SCF Controls:** CFG-03, NET-03

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.ceip-disable -- Disable the ESX Customer Experience Improvement Program.
- esx-9.deactivate-mob -- The ESX Managed Object Browser (MOB) must be disabled.
- esx-9.deactivate-shell -- The ESX Shell must be disabled.
- esx-9.forensic-snapshots -- Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- esx-9.hardware-ports -- Disable or physically protect unused external server ports.
- esx-9.hardware-virtual-nic -- The ESX host must not enable virtual hardware management network interfaces.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.snmp -- The SNMP service on the ESX host must not be configured to start automatically.
- esx-9.ssh -- The ESX host's SSH service must be deactivated except for temporary diagnostic use.
- guest-9.tools-deactivate-appinfo -- The guest OS must deactivate Appinfo information gathering unless required.
- guest-9.tools-deactivate-containerinfo -- The guest OS must deactivate ContainerInfo unless required.
- guest-9.tools-deactivate-guestoperations -- The guest OS must deactivate Guest Operations unless required.
- guest-9.tools-deactivate-gueststoreupgrade -- The guest OS must deactivate Guest Store Upgrade operations unless required.
- guest-9.tools-deactivate-servicediscovery -- The guest OS must deactivate Service Discovery unless required.
- installer-9.security -- The VCF Installer appliance must be removed or powered off after deployment completes, unless it has been converted into the SDDC Manager.
- nsx-9.ceip-disable -- Disable the NSX Manager Customer Experience Improvement Program.
- nsx-9.dhcp-disable -- NSX Tier-0 Gateway must not enable DHCP unless it is required.
- nsx-9.ibgp-source-loopback -- Configure Tier-0 Gateway iBGP peering to use the loopback address as the source.
- nsx-9.multicast-disable -- NSX Tier-0 Gateway must disable multicast and PIM where they are not required.
- nsx-9.reverse-path-forwarding -- NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.
- nsx-9.snmp -- NSX Manager must not use SNMP v1 or v2c.
- nsx-9.ssh -- The NSX Manager SSH service must be deactivated except for temporary diagnostic use.
- nsx-9.t1-dhcp-disable -- Disable Tier-1 Gateway DHCP service when not in use.
- nsx-9.t1-multicast-disable -- Disable Tier-1 Gateway multicast when not in use.
- operations-9.ceip-disable -- Disable the VCF Operations Customer Experience Improvement Program.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- operations-9.in-page-feedback -- Disable VCF Operations in-page feedback.
- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.
- vcenter-9.ceip-disable -- Disable the vCenter Customer Experience Improvement Program.
- vcenter-9.client-feedback -- Disable vSphere Client in-product feedback.
- vcenter-9.client-telemetry -- Disable vSphere Client UI telemetry.
- vcenter-9.network-mac-learning -- Disable MAC learning on distributed switch port groups unless a workload requires it.
- vcenter-9.network-reject-forged-transmit-dvportgroup -- Reject forged transmits on distributed switches and port groups.
- vcenter-9.network-reject-mac-changes-dvportgroup -- Reject guest MAC address changes on distributed switches and port groups.
- vcenter-9.network-reset-port -- Reset distributed switch port configuration when a virtual machine disconnects.
- vcenter-9.network-restrict-discovery-protocol -- Disable CDP/LLDP discovery protocols on distributed switches unless required.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-restrict-port-level-overrides -- Disallow per-port policy overrides on distributed port groups, except port blocking.
- vcenter-9.network-restrict-port-mirroring -- Remove unauthorized port mirroring sessions on distributed switches.
- vcenter-9.snmp -- Disable SNMP v1 and v2c receivers on vCenter.
- vcenter-9.ssh -- Deactivate SSH access to the vCenter appliance except for temporary diagnostic use.
- vcenter-9.vds-health-check-disable -- Disable the vSphere Distributed Switch health check when not troubleshooting.
- vm-9.deactivate-console-copy -- Virtual machines must have console copy operations deactivated.
- vm-9.deactivate-console-paste -- Virtual machines must have console paste operations deactivated.
- vm-9.deactivate-disk-shrinking-shrink -- Virtual machines must have virtual disk shrinking operations deactivated.
- vm-9.deactivate-disk-shrinking-wiper -- Virtual machines must have virtual disk wiping operations deactivated.
- vm-9.deactivate-non-essential-3d-features -- Virtual machines must have 3D graphics features deactivated when not required.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vm-9.efi-boot-types -- Virtual machines must prevent booting from unauthorized sources.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.isolation-tools-dnd-deactivate -- Virtual machines must have console drag and drop operations deactivated.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.
- vm-9.persistent-disk -- Virtual machines must not use independent, nonpersistent disks.
- vm-9.remove-unnecessary-devices -- Virtual machines must remove unnecessary virtual hardware.
- vm-9.restrict-host-info -- Virtual machines must not be able to obtain host information from the hypervisor.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.

### Control 1.4.1

> 1.4.1 NSCs are implemented between trusted and untrusted networks.

**Bridging SCF Controls:** CFG-03, NET-03, NET-06, NET-09

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.ceip-disable -- Disable the ESX Customer Experience Improvement Program.
- esx-9.deactivate-mob -- The ESX Managed Object Browser (MOB) must be disabled.
- esx-9.deactivate-shell -- The ESX Shell must be disabled.
- esx-9.forensic-snapshots -- Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- esx-9.hardware-ports -- Disable or physically protect unused external server ports.
- esx-9.hardware-virtual-nic -- The ESX host must not enable virtual hardware management network interfaces.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.snmp -- The SNMP service on the ESX host must not be configured to start automatically.
- esx-9.ssh -- The ESX host's SSH service must be deactivated except for temporary diagnostic use.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- guest-9.tools-deactivate-appinfo -- The guest OS must deactivate Appinfo information gathering unless required.
- guest-9.tools-deactivate-containerinfo -- The guest OS must deactivate ContainerInfo unless required.
- guest-9.tools-deactivate-guestoperations -- The guest OS must deactivate Guest Operations unless required.
- guest-9.tools-deactivate-gueststoreupgrade -- The guest OS must deactivate Guest Store Upgrade operations unless required.
- guest-9.tools-deactivate-servicediscovery -- The guest OS must deactivate Service Discovery unless required.
- installer-9.security -- The VCF Installer appliance must be removed or powered off after deployment completes, unless it has been converted into the SDDC Manager.
- nsx-9.bgp-encryption -- Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.
- nsx-9.ceip-disable -- Disable the NSX Manager Customer Experience Improvement Program.
- nsx-9.dhcp-disable -- NSX Tier-0 Gateway must not enable DHCP unless it is required.
- nsx-9.ibgp-source-loopback -- Configure Tier-0 Gateway iBGP peering to use the loopback address as the source.
- nsx-9.multicast-disable -- NSX Tier-0 Gateway must disable multicast and PIM where they are not required.
- nsx-9.ospf-encryption -- NSX Tier-0 Gateway must enable OSPF authentication.
- nsx-9.reverse-path-forwarding -- NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.
- nsx-9.snmp -- NSX Manager must not use SNMP v1 or v2c.
- nsx-9.ssh -- The NSX Manager SSH service must be deactivated except for temporary diagnostic use.
- nsx-9.t1-dhcp-disable -- Disable Tier-1 Gateway DHCP service when not in use.
- nsx-9.t1-multicast-disable -- Disable Tier-1 Gateway multicast when not in use.
- operations-9.ceip-disable -- Disable the VCF Operations Customer Experience Improvement Program.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- operations-9.in-page-feedback -- Disable VCF Operations in-page feedback.
- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.
- vcenter-9.ceip-disable -- Disable the vCenter Customer Experience Improvement Program.
- vcenter-9.client-feedback -- Disable vSphere Client in-product feedback.
- vcenter-9.client-telemetry -- Disable vSphere Client UI telemetry.
- vcenter-9.network-mac-learning -- Disable MAC learning on distributed switch port groups unless a workload requires it.
- vcenter-9.network-reject-forged-transmit-dvportgroup -- Reject forged transmits on distributed switches and port groups.
- vcenter-9.network-reject-mac-changes-dvportgroup -- Reject guest MAC address changes on distributed switches and port groups.
- vcenter-9.network-reset-port -- Reset distributed switch port configuration when a virtual machine disconnects.
- vcenter-9.network-restrict-discovery-protocol -- Disable CDP/LLDP discovery protocols on distributed switches unless required.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-restrict-port-level-overrides -- Disallow per-port policy overrides on distributed port groups, except port blocking.
- vcenter-9.network-restrict-port-mirroring -- Remove unauthorized port mirroring sessions on distributed switches.
- vcenter-9.snmp -- Disable SNMP v1 and v2c receivers on vCenter.
- vcenter-9.ssh -- Deactivate SSH access to the vCenter appliance except for temporary diagnostic use.
- vcenter-9.vds-health-check-disable -- Disable the vSphere Distributed Switch health check when not troubleshooting.
- vm-9.deactivate-console-copy -- Virtual machines must have console copy operations deactivated.
- vm-9.deactivate-console-paste -- Virtual machines must have console paste operations deactivated.
- vm-9.deactivate-disk-shrinking-shrink -- Virtual machines must have virtual disk shrinking operations deactivated.
- vm-9.deactivate-disk-shrinking-wiper -- Virtual machines must have virtual disk wiping operations deactivated.
- vm-9.deactivate-non-essential-3d-features -- Virtual machines must have 3D graphics features deactivated when not required.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vm-9.efi-boot-types -- Virtual machines must prevent booting from unauthorized sources.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.isolation-tools-dnd-deactivate -- Virtual machines must have console drag and drop operations deactivated.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.
- vm-9.persistent-disk -- Virtual machines must not use independent, nonpersistent disks.
- vm-9.remove-unnecessary-devices -- Virtual machines must remove unnecessary virtual hardware.
- vm-9.restrict-host-info -- Virtual machines must not be able to obtain host information from the hypervisor.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 1.4.2

> 1.4.2 Inbound traffic from untrusted networks to trusted networks is restricted to:   • Communications with system components that are authorized to provide publicly accessible services, protocols, and ports.  • Stateful responses to communications initiated by system components in a trusted network.  • All other traffic is denied.  Applicability Notes  The intent of this requirement is to address communication sessions between trusted and untrusted networks, rather than the specifics of protocols.  This requirement does not limit the use of UDP or other connectionless network protocols if state is maintained by the NSC.

**Bridging SCF Controls:** CFG-03, NET-03, NET-03.1, NET-04, NET-04.1, NET-06

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.ceip-disable -- Disable the ESX Customer Experience Improvement Program.
- esx-9.deactivate-mob -- The ESX Managed Object Browser (MOB) must be disabled.
- esx-9.deactivate-shell -- The ESX Shell must be disabled.
- esx-9.firewall-incoming-default -- The ESX host must configure the firewall to block network traffic by default.
- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- esx-9.forensic-snapshots -- Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- esx-9.hardware-ports -- Disable or physically protect unused external server ports.
- esx-9.hardware-virtual-nic -- The ESX host must not enable virtual hardware management network interfaces.
- esx-9.network-bpdu -- Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.network-rpf-promisc -- The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.
- esx-9.network-standard-reject-forged-transmit -- Reject forged transmits on standard switches and port groups.
- esx-9.network-standard-reject-mac-changes -- Reject guest MAC address changes on standard switches and port groups.
- esx-9.network-standard-reject-promiscuous-mode -- Reject promiscuous mode on standard switches and port groups.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.snmp -- The SNMP service on the ESX host must not be configured to start automatically.
- esx-9.ssh -- The ESX host's SSH service must be deactivated except for temporary diagnostic use.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- guest-9.tools-deactivate-appinfo -- The guest OS must deactivate Appinfo information gathering unless required.
- guest-9.tools-deactivate-containerinfo -- The guest OS must deactivate ContainerInfo unless required.
- guest-9.tools-deactivate-guestoperations -- The guest OS must deactivate Guest Operations unless required.
- guest-9.tools-deactivate-gueststoreupgrade -- The guest OS must deactivate Guest Store Upgrade operations unless required.
- guest-9.tools-deactivate-servicediscovery -- The guest OS must deactivate Service Discovery unless required.
- installer-9.security -- The VCF Installer appliance must be removed or powered off after deployment completes, unless it has been converted into the SDDC Manager.
- nsx-9.api-rate-limits -- Configure NSX Manager API rate and concurrency limits.
- nsx-9.ceip-disable -- Disable the NSX Manager Customer Experience Improvement Program.
- nsx-9.dhcp-disable -- NSX Tier-0 Gateway must not enable DHCP unless it is required.
- nsx-9.ibgp-source-loopback -- Configure Tier-0 Gateway iBGP peering to use the loopback address as the source.
- nsx-9.multicast-disable -- NSX Tier-0 Gateway must disable multicast and PIM where they are not required.
- nsx-9.reverse-path-forwarding -- NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.
- nsx-9.snmp -- NSX Manager must not use SNMP v1 or v2c.
- nsx-9.ssh -- The NSX Manager SSH service must be deactivated except for temporary diagnostic use.
- nsx-9.t1-dhcp-disable -- Disable Tier-1 Gateway DHCP service when not in use.
- nsx-9.t1-multicast-disable -- Disable Tier-1 Gateway multicast when not in use.
- operations-9.ceip-disable -- Disable the VCF Operations Customer Experience Improvement Program.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- operations-9.in-page-feedback -- Disable VCF Operations in-page feedback.
- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.
- vcenter-9.ceip-disable -- Disable the vCenter Customer Experience Improvement Program.
- vcenter-9.client-feedback -- Disable vSphere Client in-product feedback.
- vcenter-9.client-telemetry -- Disable vSphere Client UI telemetry.
- vcenter-9.network-mac-learning -- Disable MAC learning on distributed switch port groups unless a workload requires it.
- vcenter-9.network-reject-forged-transmit-dvportgroup -- Reject forged transmits on distributed switches and port groups.
- vcenter-9.network-reject-mac-changes-dvportgroup -- Reject guest MAC address changes on distributed switches and port groups.
- vcenter-9.network-reject-promiscuous-mode-dvportgroup -- Reject promiscuous mode on distributed switches and port groups.
- vcenter-9.network-reset-port -- Reset distributed switch port configuration when a virtual machine disconnects.
- vcenter-9.network-restrict-discovery-protocol -- Disable CDP/LLDP discovery protocols on distributed switches unless required.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-restrict-port-level-overrides -- Disallow per-port policy overrides on distributed port groups, except port blocking.
- vcenter-9.network-restrict-port-mirroring -- Remove unauthorized port mirroring sessions on distributed switches.
- vcenter-9.network-vgt -- Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.
- vcenter-9.snmp -- Disable SNMP v1 and v2c receivers on vCenter.
- vcenter-9.ssh -- Deactivate SSH access to the vCenter appliance except for temporary diagnostic use.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.
- vcenter-9.vds-health-check-disable -- Disable the vSphere Distributed Switch health check when not troubleshooting.
- vcf-9.perimeter-firewall -- Limit access to VCF component management interfaces with perimeter firewalls.
- vm-9.deactivate-console-copy -- Virtual machines must have console copy operations deactivated.
- vm-9.deactivate-console-paste -- Virtual machines must have console paste operations deactivated.
- vm-9.deactivate-disk-shrinking-shrink -- Virtual machines must have virtual disk shrinking operations deactivated.
- vm-9.deactivate-disk-shrinking-wiper -- Virtual machines must have virtual disk wiping operations deactivated.
- vm-9.deactivate-non-essential-3d-features -- Virtual machines must have 3D graphics features deactivated when not required.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vm-9.efi-boot-types -- Virtual machines must prevent booting from unauthorized sources.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.isolation-tools-dnd-deactivate -- Virtual machines must have console drag and drop operations deactivated.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.
- vm-9.persistent-disk -- Virtual machines must not use independent, nonpersistent disks.
- vm-9.remove-unnecessary-devices -- Virtual machines must remove unnecessary virtual hardware.
- vm-9.restrict-host-info -- Virtual machines must not be able to obtain host information from the hypervisor.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 1.4.3

> 1.4.3 Anti-spoofing measures are implemented to detect and block forged source IP addresses from entering the trusted network.

**Bridging SCF Controls:** NET-04

**Relevant SCG Controls:**

- esx-9.network-bpdu -- Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.network-rpf-promisc -- The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.
- esx-9.network-standard-reject-forged-transmit -- Reject forged transmits on standard switches and port groups.
- esx-9.network-standard-reject-mac-changes -- Reject guest MAC address changes on standard switches and port groups.
- esx-9.network-standard-reject-promiscuous-mode -- Reject promiscuous mode on standard switches and port groups.
- vcenter-9.network-reject-promiscuous-mode-dvportgroup -- Reject promiscuous mode on distributed switches and port groups.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-vgt -- Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.

### Control 1.4.5

> 1.4.5 The disclosure of internal IP addresses and routing information is limited to only authorized parties.

**Bridging SCF Controls:** NET-03.3

**Relevant SCG Controls:**

- vcenter-9.network-restrict-discovery-protocol -- Disable CDP/LLDP discovery protocols on distributed switches unless required.
- vcenter-9.vds-health-check-disable -- Disable the vSphere Distributed Switch health check when not troubleshooting.

### Control 1.5.1

> 1.5.1 Security controls are implemented on any computing devices, including company- and employee-owned devices, that connect to both untrusted networks (including the Internet) and the CDE as follows.   • Specific configuration settings are defined to prevent threats being introduced into the entity’s network.   • Security controls are actively running.  • Security controls are not alterable by users of the computing devices unless specifically documented and authorized by management on a case-by-case basis for a limited period.  Applicability Notes  These security controls may be temporarily disabled only if there is legitimate technical need, as authorized by management on a case-by-case basis. If these security controls need to be disabled for a specific purpose, it must be formally authorized. Additional security measures may also need to be implemented for the period during which these security controls are not active.  This requirement applies to employee-owned and company-owned computing devices. Systems that cannot be managed by corporate policy introduce weaknesses and provide opportunities that malicious individuals may exploit.

**Bridging SCF Controls:** END-05

**Relevant SCG Controls:**

- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.

### Control 2.2

> 2.2 System components are configured and managed securely.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 2.2.1

> 2.2.1 Configuration standards are developed, implemented, and maintained to:  • Cover all system components.  • Address all known security vulnerabilities.   • Be consistent with industry-accepted system hardening standards or vendor hardening recommendations.   • Be updated as new vulnerability issues are identified, as defined in Requirement 6.3.1.  • Be applied when new systems are configured and verified as in place before or immediately after a system component is connected to a production environment.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 2.2.2

> 2.2.2 Vendor default accounts are managed as follows:  • If the vendor default account(s) will be used, the default password is changed per Requirement 8.3.6.  • If the vendor default account(s) will not be used, the account is removed or disabled.  Applicability Notes  This applies to ALL vendor default accounts and passwords, including, but not limited to, those used by operating systems, software that provides security services, application and system accounts, point-of-sale (POS) terminals, payment applications, and Simple Network Management Protocol (SNMP) defaults.  This requirement also applies where a system component is not installed within an entity’s environment, for example, software and applications that are part of the CDE and are accessed via a cloud subscription service.

**Bridging SCF Controls:** IAC-10.8

**Relevant SCG Controls:**

- esx-9.ad-admin-group-name -- The ESX host must not use the default "ESX Admins" Active Directory group.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- sddc-9.api-admin -- SDDC Manager must configure the API admin account.

### Control 2.2.4

> 2.2.4 Only necessary services, protocols, daemons, and functions are enabled, and all unnecessary functionality is removed or disabled.

**Bridging SCF Controls:** CFG-03

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.ceip-disable -- Disable the ESX Customer Experience Improvement Program.
- esx-9.deactivate-mob -- The ESX Managed Object Browser (MOB) must be disabled.
- esx-9.deactivate-shell -- The ESX Shell must be disabled.
- esx-9.forensic-snapshots -- Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- esx-9.hardware-ports -- Disable or physically protect unused external server ports.
- esx-9.hardware-virtual-nic -- The ESX host must not enable virtual hardware management network interfaces.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.snmp -- The SNMP service on the ESX host must not be configured to start automatically.
- esx-9.ssh -- The ESX host's SSH service must be deactivated except for temporary diagnostic use.
- guest-9.tools-deactivate-appinfo -- The guest OS must deactivate Appinfo information gathering unless required.
- guest-9.tools-deactivate-containerinfo -- The guest OS must deactivate ContainerInfo unless required.
- guest-9.tools-deactivate-guestoperations -- The guest OS must deactivate Guest Operations unless required.
- guest-9.tools-deactivate-gueststoreupgrade -- The guest OS must deactivate Guest Store Upgrade operations unless required.
- guest-9.tools-deactivate-servicediscovery -- The guest OS must deactivate Service Discovery unless required.
- installer-9.security -- The VCF Installer appliance must be removed or powered off after deployment completes, unless it has been converted into the SDDC Manager.
- nsx-9.ceip-disable -- Disable the NSX Manager Customer Experience Improvement Program.
- nsx-9.dhcp-disable -- NSX Tier-0 Gateway must not enable DHCP unless it is required.
- nsx-9.multicast-disable -- NSX Tier-0 Gateway must disable multicast and PIM where they are not required.
- nsx-9.snmp -- NSX Manager must not use SNMP v1 or v2c.
- nsx-9.ssh -- The NSX Manager SSH service must be deactivated except for temporary diagnostic use.
- nsx-9.t1-dhcp-disable -- Disable Tier-1 Gateway DHCP service when not in use.
- nsx-9.t1-multicast-disable -- Disable Tier-1 Gateway multicast when not in use.
- operations-9.ceip-disable -- Disable the VCF Operations Customer Experience Improvement Program.
- operations-9.in-page-feedback -- Disable VCF Operations in-page feedback.
- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.
- vcenter-9.ceip-disable -- Disable the vCenter Customer Experience Improvement Program.
- vcenter-9.client-feedback -- Disable vSphere Client in-product feedback.
- vcenter-9.client-telemetry -- Disable vSphere Client UI telemetry.
- vcenter-9.network-restrict-discovery-protocol -- Disable CDP/LLDP discovery protocols on distributed switches unless required.
- vcenter-9.snmp -- Disable SNMP v1 and v2c receivers on vCenter.
- vcenter-9.ssh -- Deactivate SSH access to the vCenter appliance except for temporary diagnostic use.
- vcenter-9.vds-health-check-disable -- Disable the vSphere Distributed Switch health check when not troubleshooting.
- vm-9.deactivate-console-copy -- Virtual machines must have console copy operations deactivated.
- vm-9.deactivate-console-paste -- Virtual machines must have console paste operations deactivated.
- vm-9.deactivate-disk-shrinking-shrink -- Virtual machines must have virtual disk shrinking operations deactivated.
- vm-9.deactivate-disk-shrinking-wiper -- Virtual machines must have virtual disk wiping operations deactivated.
- vm-9.deactivate-non-essential-3d-features -- Virtual machines must have 3D graphics features deactivated when not required.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vm-9.efi-boot-types -- Virtual machines must prevent booting from unauthorized sources.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.isolation-tools-dnd-deactivate -- Virtual machines must have console drag and drop operations deactivated.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.
- vm-9.persistent-disk -- Virtual machines must not use independent, nonpersistent disks.
- vm-9.remove-unnecessary-devices -- Virtual machines must remove unnecessary virtual hardware.
- vm-9.restrict-host-info -- Virtual machines must not be able to obtain host information from the hypervisor.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.

### Control 2.2.7

> 2.2.7 All non-console administrative access is encrypted using strong cryptography.  Applicability Notes  This includes administrative access via browser-based interfaces and application programming interfaces (APIs).

**Bridging SCF Controls:** CRY-01

**Relevant SCG Controls:**

- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

### Control 2.3.1

> 2.3.1 For wireless environments connected to the CDE or transmitting account data, all wireless vendor defaults are changed at installation or are confirmed to be secure, including but not limited to:  • Default wireless encryption keys.  • Passwords on wireless access points.  • SNMP defaults,  • Any other security-related wireless vendor defaults.  Applicability Notes  This includes, but is not limited to, default wireless encryption keys, passwords on wireless access points, SNMP defaults, and any other security-related wireless vendor defaults.

**Bridging SCF Controls:** IAC-10.8

**Relevant SCG Controls:**

- esx-9.ad-admin-group-name -- The ESX host must not use the default "ESX Admins" Active Directory group.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- sddc-9.api-admin -- SDDC Manager must configure the API admin account.

### Control 2.3.2

> 2.3.2 For wireless environments connected to the CDE or transmitting account data, wireless encryption keys are changed as follows:   • Whenever personnel with knowledge of the key leave the company or the role for which the knowledge was necessary.  • Whenever a key is suspected of or known to be compromised.

**Bridging SCF Controls:** CRY-09.3

**Relevant SCG Controls:**

- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.

### Control 3.3.2

> 3.3.2 SAD that is stored electronically prior to completion of authorization is encrypted using strong cryptography.   Applicability Notes  Whether SAD is permitted to be stored prior to authorization is determined by the organizations that manage compliance programs (for example, payment brands and acquirers). Contact these organizations for any additional criteria.  This requirement applies to all storage of SAD, even if no PAN is present in the environment.   Refer to Requirement 3.2.1 for an additional requirement that applies if SAD is stored prior to completion of authorization.  Issuers and companies that support issuing services, where there is a legitimate and documented business need to store SAD, are not required to meet this requirement. A legitimate business need is one that is necessary for the performance of the function being provided by or for the issuer.   Refer to Requirement 3.3.3 for requirements specifically for these entities.   This requirement does not replace how PIN blocks are required to be managed, nor does it mean that a properly encrypted PIN block needs to be encrypted again.   This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** CRY-01, CRY-05

**Relevant SCG Controls:**

- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- esx-9.memory-tiering-encryption -- The ESX host should encrypt data written to tiered memory devices.
- esx-9.tpm-configuration -- The ESX host must require TPM-based configuration encryption.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.
- vsan-9.encryption-rest -- vSAN must protect data at rest.

### Control 3.4

> 3.4 Access to displays of full PAN and ability to copy PAN are restricted.

**Bridging SCF Controls:** IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 3.4.2

> 3.4.2 When using remote-access technologies, technical controls prevent copy and/or relocation of PAN for all personnel, except for those with documented, explicit authorization and a legitimate, defined business need.  Applicability Notes  Storing or relocating PAN onto local hard drives, removable electronic media, and other storage devices brings these devices into scope for PCI DSS.  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** IAC-21, NET-14

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 3.5

> 3.5 PAN is secured wherever it is stored.

**Bridging SCF Controls:** CRY-05

**Relevant SCG Controls:**

- esx-9.memory-tiering-encryption -- The ESX host should encrypt data written to tiered memory devices.
- esx-9.tpm-configuration -- The ESX host must require TPM-based configuration encryption.
- vsan-9.encryption-rest -- vSAN must protect data at rest.

### Control 3.5.1.1

> 3.5.1.1 Hashes used to render PAN unreadable (per the first bullet of Requirement 3.5.1), are keyed cryptographic hashes of the entire PAN, with associated key-management processes and procedures in accordance with Requirements 3.6 and 3.7.  Applicability Notes  All Applicability Notes for Requirement 3.5.1 also apply to this requirement.  Key-management processes and procedures (Requirements 3.6 and 3.7) do not apply to system components used to generate individual keyed hashes of a PAN for comparison to another system if:  • The system components only have access to one hash value at a time (hash values are not stored on the system)  AND  • There is no other account data stored on the same system as the hashes.  This requirement is considered a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment. This requirement will replace the bullet in Requirement 3.5.1 for one-way hashes once its effective date is reached.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 3.5.1.2

> 3.5.1.2 If disk-level or partition-level encryption (rather than file-, column-, or field-level database encryption) is used to render PAN unreadable, it is implemented only as follows :  • On removable electronic media  OR  • If used for non-removable electronic media, PAN is also rendered unreadable via another mechanism that meets Requirement 3.5.1.   Note: Disk or partition encryption implementations must also meet all other PCI DSS encryption and key-management requirements.   Applicability Notes  This requirement applies to any encryption method that provides clear-text PAN automatically when a system runs, even though an authorized user has not specifically requested that data.  While disk or partition encryption may still be present on these types of devices, it cannot be the only mechanism used to protect PAN stored on those systems. Any stored PAN must also be rendered unreadable per Requirement 3.5.1—for example, through truncation or a data-level encryption mechanism. Full disk encryption helps to protect data in the event of physical loss of a disk and therefore its use is appropriate only for removable electronic media storage devices.  Media that is part of a data center architecture (for example, hot-swappable drives, bulk tape-backups) is considered non-removable electronic media to which Requirement 3.5.1 applies.   Disk or partition encryption implementations must also meet all other PCI DSS encryption and key-management requirements.   For issuers and companies that support issuing services: This requirement does not apply to PANs being accessed for real-time transaction processing. However, it does apply to PANs stored for other purposes.  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** CRY-05

**Relevant SCG Controls:**

- esx-9.memory-tiering-encryption -- The ESX host should encrypt data written to tiered memory devices.
- esx-9.tpm-configuration -- The ESX host must require TPM-based configuration encryption.
- vsan-9.encryption-rest -- vSAN must protect data at rest.

### Control 3.5.1.3

> 3.5.1.3 If disk-level or partition-level encryption is used (rather than file-, column-, or field--level database encryption) to render PAN unreadable, it is managed as follows:,   • Logical access is managed separately and independently of native operating system authentication and access control mechanisms.   • Decryption keys are not associated with user accounts.   • Authentication factors (passwords, passphrases, or cryptographic keys) that allow access to unencrypted data are stored securely.  Applicability Notes  Disk or partition encryption implementations must also meet all other PCI DSS encryption and key-management requirements.

**Bridging SCF Controls:** CRY-05

**Relevant SCG Controls:**

- esx-9.memory-tiering-encryption -- The ESX host should encrypt data written to tiered memory devices.
- esx-9.tpm-configuration -- The ESX host must require TPM-based configuration encryption.
- vsan-9.encryption-rest -- vSAN must protect data at rest.

### Control 3.6

> 3.6 Cryptographic keys used to protect stored account data are secured.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 3.6.1

> 3.6.1 Procedures are defined and implemented to protect cryptographic keys used to protect stored account data against disclosure and misuse that include:   • Access to keys is restricted to the fewest number of custodians necessary.   • Key-encrypting keys are at least as strong as the data-encrypting keys they protect.   • Key-encrypting keys are stored separately from data-encrypting keys.   • Keys are stored securely in the fewest possible locations and forms.  Applicability Notes  This requirement applies to keys used to protect stored account data and to key-encrypting keys used to protect data-encrypting keys.  The requirement to protect keys used to protect stored account data from disclosure and misuse applies to both data-encrypting keys and key-encrypting keys. Because one key-encrypting key may grant access to many data-encrypting keys, the key-encrypting keys require strong protection measures.

**Bridging SCF Controls:** CRY-08.1, CRY-09, CRY-09.3

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 3.6.1.1

> 3.6.1.1 Additional requirement for service providers only: A documented description of the cryptographic architecture is maintained that includes:   • Details of all algorithms, protocols, and keys used for the protection of stored account data, including key strength and expiry date.  • Preventing the use of the same cryptographic keys in production and test environments. This bullet is a best practice until its effective date; refer to Applicability Notes below for details.  • Description of the key usage for each key.   • Inventory of any hardware security modules (HSMs), key management systems (KMS), and other secure cryptographic devices (SCDs) used for key management, including type and location of devices, to support meeting Requirement 12.3.4.  Applicability Notes  This requirement applies only when the entity being assessed is a service provider.  In cloud HSM implementations, responsibility for the cryptographic architecture according to this Requirement will be shared between the cloud provider and the cloud customer.  The bullet above (for including, in the cryptographic architecture, that the use of the same cryptographic keys in production and test is prevented) is a best practice until 31 March 2025, after which it will be required as part of Requirement 3.6.1.1 and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 3.6.1.2

> 3.6.1.2 Secret and private keys used to protect stored account data are stored in one (or more) of the following forms at all times:   • Encrypted with a key-encrypting key that is at least as strong as the data-encrypting key, and that is stored separately from the data-encrypting key.   • Within a secure cryptographic device (SCD), such as a hardware security module (HSM) or PTS-approved point-of-interaction device.   • As at least two full-length key components or key shares, in accordance with an industry-accepted method.   Applicability Notes  It is not required that public keys be stored in one of these forms.  Cryptographic keys stored as part of a key management system (KMS) that employs SCDs are acceptable.   A cryptographic key that is split into two parts does not meet this requirement. Secret or private keys stored as key components or key shares must be generated via one of the following:   • Using an approved random number generator and within an SCD,   OR  • According to ISO 19592 or equivalent industry standard for generation of secret key shares.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 3.6.1.3

> 3.6.1.3 Access to cleartext cryptographic key components is restricted to the fewest number of custodians necessary.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 3.6.1.4

> 3.6.1.4 Cryptographic keys are stored in the fewest possible locations.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 3.7

> 3.7 Where cryptography is used to protect stored account data, key management processes and procedures covering all aspects of the key lifecycle are defined and implemented.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 3.7.1

> 3.7.1 Key-management policies and procedures are implemented to include generation of strong cryptographic keys used to protect stored account data.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 3.7.2

> 3.7.2 Key-management policies and procedures are implemented to include secure distribution of cryptographic keys used to protect stored account data.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 3.7.3

> 3.7.3 Key-management policies and procedures are implemented to include secure storage of cryptographic keys used to protect stored account data.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 3.7.4

> 3.7.4 Key management policies and procedures are implemented for cryptographic key changes for keys that have reached the end of their cryptoperiod, as defined by the associated application vendor or key owner, and based on industry best practices and guidelines, including the following:  • A defined cryptoperiod for each key type in use.  • A process for key changes at the end of the defined cryptoperiod.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 3.7.5

> 3.7.5 Key management policies procedures are implemented to include the retirement, replacement, or destruction of keys used to protect stored account data, as deemed necessary when:   • The key has reached the end of its defined cryptoperiod.  • The integrity of the key has been weakened, including when personnel with knowledge of a cleartext key component leaves the company, or the role for which the key component was known.  • The key is suspected of or known to be compromised.   Retired or replaced keys are not used for encryption operations.  Applicability Notes  If retired or replaced cryptographic keys need to be retained, these keys must be securely archived (for example, by using a key-encryption key).

**Bridging SCF Controls:** CRY-04, CRY-09, CRY-09.3

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- nsx-9.bgp-encryption -- Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.
- nsx-9.ospf-encryption -- NSX Tier-0 Gateway must enable OSPF authentication.
- operations-9.logs-ssl-api -- Enable SSL for API log ingestion in VCF Operations.
- operations-9.logs-ssl-syslog -- Enable SSL for syslog log ingestion in VCF Operations.
- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.
- vm-9.ft-encrypted -- Virtual machines must require encryption for Fault Tolerance.
- vm-9.vmotion-encrypted -- Virtual machines must require encryption for vMotion.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 3.7.6

> 3.7.6 Where manual cleartext cryptographic key-management operations are performed by personnel, key-management policies and procedures are implemented including managing these operations using split knowledge and dual control.   Applicability Notes  This control is applicable for manual key-management operations.   A cryptographic key that is simply split into two parts does not meet this requirement. Secret or private keys stored as key components or key shares must be generated via one of the following:   • Using an approved random number generator and within a secure cryptographic device (SCD), such as a hardware security module (HSM) or PTS-approved point-of-interaction device,   OR  • According to ISO 19592 or equivalent industry standard for generation of secret key shares.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 3.7.7

> 3.7.7 Key management policies and procedures are implemented to include the prevention of unauthorized substitution of cryptographic keys.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 4.1

> 4.1 Processes and mechanisms for performing activities in Requirement 4 are defined and understood.

**Bridging SCF Controls:** NET-12

**Relevant SCG Controls:**

- nsx-9.snmp -- NSX Manager must not use SNMP v1 or v2c.
- vcenter-9.snmp -- Disable SNMP v1 and v2c receivers on vCenter.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

### Control 4.2

> 4.2 PAN is protected with strong cryptography during transmission.

**Bridging SCF Controls:** CRY-03

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.tls-ciphers -- The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- esx-9.vmotion-encryption-offload -- Accelerate vMotion encryption using available hardware offload on ESX hosts.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- nsx-9.tls-ciphers -- NSX Manager must use TLS with approved protocol versions and cipher suites.
- operations-9.logs-ssl-api -- Enable SSL for API log ingestion in VCF Operations.
- operations-9.logs-ssl-syslog -- Enable SSL for syslog log ingestion in VCF Operations.
- vcenter-9.smtp -- Send vCenter notification email over a secure SMTP connection.
- vcenter-9.tls-ciphers -- vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- vm-9.ft-encrypted -- Virtual machines must require encryption for Fault Tolerance.
- vm-9.vmotion-encrypted -- Virtual machines must require encryption for vMotion.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 4.2.1

> 4.2.1 Strong cryptography and security protocols are implemented as follows to safeguard PAN during transmission over open, public networks:  • Only trusted keys and certificates are accepted.  • Certificates used to safeguard PAN during transmission over open, public networks are confirmed as valid and are not expired or revoked. This bullet is a best practice until its effective date; refer to applicability notes below for details.  • The protocol in use supports only secure versions or configurations and does not support fallback to, or use of insecure versions, algorithms, key sizes, or implementations.  • The encryption strength is appropriate for the encryption methodology in use.   Applicability Notes  A self-signed certificate may also be acceptable if the certificate is issued by an internal CA within the organization, the certificate’s author is confirmed, and the certificate is verified—for example, via hash or signature—and has not expired.   The bullet above (for confirming that certificates used to safeguard PAN during transmission over open, public networks are valid and are not expired or revoked) is a best practice until 31 March 2025, after which it will be required as part of Requirement 4.2.1 and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** CRY-03, NET-12

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.tls-ciphers -- The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- esx-9.vmotion-encryption-offload -- Accelerate vMotion encryption using available hardware offload on ESX hosts.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- nsx-9.snmp -- NSX Manager must not use SNMP v1 or v2c.
- nsx-9.tls-ciphers -- NSX Manager must use TLS with approved protocol versions and cipher suites.
- operations-9.logs-ssl-api -- Enable SSL for API log ingestion in VCF Operations.
- operations-9.logs-ssl-syslog -- Enable SSL for syslog log ingestion in VCF Operations.
- vcenter-9.smtp -- Send vCenter notification email over a secure SMTP connection.
- vcenter-9.snmp -- Disable SNMP v1 and v2c receivers on vCenter.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.
- vcenter-9.tls-ciphers -- vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- vm-9.ft-encrypted -- Virtual machines must require encryption for Fault Tolerance.
- vm-9.vmotion-encrypted -- Virtual machines must require encryption for vMotion.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 4.2.1.1

> 4.2.1.1 An inventory of the entity’s trusted keys and certificates is maintained.  Applicability Notes  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 4.2.1.2

> 4.2.1.2 Wireless networks transmitting PAN or connected to the CDE use industry best practices to implement strong cryptography for authentication and transmission.

**Bridging SCF Controls:** CRY-03

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.tls-ciphers -- The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- esx-9.vmotion-encryption-offload -- Accelerate vMotion encryption using available hardware offload on ESX hosts.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- nsx-9.tls-ciphers -- NSX Manager must use TLS with approved protocol versions and cipher suites.
- operations-9.logs-ssl-api -- Enable SSL for API log ingestion in VCF Operations.
- operations-9.logs-ssl-syslog -- Enable SSL for syslog log ingestion in VCF Operations.
- vcenter-9.smtp -- Send vCenter notification email over a secure SMTP connection.
- vcenter-9.tls-ciphers -- vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- vm-9.ft-encrypted -- Virtual machines must require encryption for Fault Tolerance.
- vm-9.vmotion-encrypted -- Virtual machines must require encryption for vMotion.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 6.3.3

> 6.3.3 All system components are protected from known vulnerabilities by installing applicable security patches/updates as follows:   • Patches/updates for critical vulnerabilities (identified according to the risk ranking process at Requirement 6.3.1) are installed within one month of release.  • All other applicable security patches/updates are installed within an appropriate time frame as determined by the entity’s assessment of the criticality of the risk to the environment as identified according to the risk ranking process at Requirement 6.3.1

**Bridging SCF Controls:** VPM-04, VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control 6.4.2

> 6.4.2 For public-facing web applications, an automated technical solution is deployed that continually detects and prevents web-based attacks, with at least the following:  • Is installed in front of public-facing web applications and is configured to detect and prevent web-based attacks.  • Actively running and up to date as applicable.   • Generating audit logs.  • Configured to either block web-based attacks or generate an alert that is immediately investigated.   Applicability Notes  This new requirement will replace Requirement 6.4.1 once its effective date is reached.  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** MON-03

**Relevant SCG Controls:**

- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control 6.5

> 6.5 Changes to all system components are managed securely.

**Bridging SCF Controls:** CHG-02

**Relevant SCG Controls:**

- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.

### Control 6.5.1

> 6.5.1 Changes to all system components in the production environment are made according to established procedures that include:   • Reason for, and description of, the change.   • Documentation of security impact.   • Documented change approval by authorized parties.  • Testing to verify that the change does not adversely impact system security.  • For bespoke and custom software changes, all updates are tested for compliance with Requirement 6.2.4 before being deployed into production.   • Procedures to address failures and return to a secure state.

**Bridging SCF Controls:** CHG-02

**Relevant SCG Controls:**

- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.

### Control 6.5.2

> 6.5.2 Upon completion of a significant change, all applicable PCI DSS requirements are confirmed to be in place on all new or changed systems and networks, and documentation is updated as applicable.  Applicability Notes  These significant changes should also be captured and reflected in the entity’s annual PCI DSS scope confirmation activity per Requirement 12.5.2.

**Bridging SCF Controls:** IAC-10.8

**Relevant SCG Controls:**

- esx-9.ad-admin-group-name -- The ESX host must not use the default "ESX Admins" Active Directory group.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- sddc-9.api-admin -- SDDC Manager must configure the API admin account.

### Control 6.5.6

> 6.5.6 Test data and test accounts are removed from system components before the system goes into production.

**Bridging SCF Controls:** CHG-02

**Relevant SCG Controls:**

- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.

### Control 7.1

> 7.1 Processes and mechanisms for restricting access to system components and cardholder data by business need to know are defined and understood.

**Bridging SCF Controls:** IAC-02, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 7.2

> 7.2 Access to system components and data is appropriately defined and assigned.

**Bridging SCF Controls:** IAC-02, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 7.2.1

> 7.2.1 An access control model is defined and includes granting access as follows:  • Appropriate access depending on the entity’s business and access needs.   • Access to system components and data resources that is based on users’ job classification and functions.   • The least privileges required (for example, user, administrator) to perform a job function.

**Bridging SCF Controls:** IAC-02, IAC-20, IAC-20.1, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcenter-9.content-library-authentication -- VMware vCenter must require authentication for published content libraries.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 7.2.2

> 7.2.2 Access is assigned to users, including privileged users, based on:   • Job classification and function.  • Least privileges necessary to perform job responsibilities.

**Bridging SCF Controls:** IAC-20, IAC-20.1, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcenter-9.content-library-authentication -- VMware vCenter must require authentication for published content libraries.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 7.2.3

> 7.2.3 Required privileges are approved by authorized personnel.

**Bridging SCF Controls:** IAC-07, IAC-16

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.

### Control 7.2.4

> 7.2.4 All user accounts and related access privileges, including third-party/vendor accounts, are reviewed as follows:  • At least once every six months  • To ensure user accounts and access remain appropriate based on job function.   • Any inappropriate access is addressed.  • Management acknowledges that access remains appropriate.   Applicability Notes  This requirement applies to all user accounts and related access privileges, including those used by personnel and third parties/vendors, and accounts used to access third-party cloud services.   See Requirements 7.2.5 and 7.2.5.1 and 8.6.1 through 8.6.3 for controls for application and system accounts.  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** IAC-17

**Relevant SCG Controls:**

- esx-9.ad-admin-validate-interval -- The ESX host must not disable validation of users and groups.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.

### Control 7.2.5

> 7.2.5 All application and system accounts and related access privileges are assigned and managed as follows:  • Based on the least privileges necessary for the operability of the system or application.  • Access is limited to the systems, applications, or processes that specifically require their use.   Applicability Notes  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** IAC-16, IAC-20, IAC-20.1, NET-14

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.
- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.
- vcenter-9.content-library-authentication -- VMware vCenter must require authentication for published content libraries.

### Control 7.2.5.1

> 7.2.5.1 All access by application and system accounts and related access privileges are reviewed as follows:  • Periodically (at the frequency defined in the entity’s targeted risk analysis, which is performed according to all elements specified in Requirement 12.3.1).  • The application/ system access remains appropriate for the function being performed.   • Any inappropriate access is addressed.  • Management acknowledges that access remains appropriate.  Applicability Notes  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** IAC-17

**Relevant SCG Controls:**

- esx-9.ad-admin-validate-interval -- The ESX host must not disable validation of users and groups.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.

### Control 7.2.6

> 7.2.6 All user access to query repositories of stored cardholder data is restricted as follows:  • Via applications or other programmatic methods, with access and allowed actions based on user roles and least privileges.  • Only the responsible administrator(s) can directly access or query repositories of stored CHD.  Applicability Notes  This requirement applies to controls for user access to query repositories of stored cardholder data.   See Requirements 7.2.5 and 7.2.5.1 and 8.6.1 through 8.6.3 for controls for application and system accounts.

**Bridging SCF Controls:** IAC-20, IAC-20.1, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcenter-9.content-library-authentication -- VMware vCenter must require authentication for published content libraries.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 7.3

> 7.3 Logical access to system components and data is managed via an access control system(s).

**Bridging SCF Controls:** IAC-02, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 7.3.1

> 7.3.1 An access control system(s) is in place that restricts access based on a user’s need to know and covers all system components.

**Bridging SCF Controls:** IAC-02, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 7.3.2

> 7.3.2 The access control system(s) is configured to enforce privileges assigned to individuals, applications, and systems based on job classification and function.

**Bridging SCF Controls:** IAC-02, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 7.3.3

> 7.3.3 The access control system(s) is set to “deny all” by default.

**Bridging SCF Controls:** IAC-02, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 8.1

> 8.1 Processes and mechanisms to perform activities in Requirement 8 are defined and understood.

**Bridging SCF Controls:** IAC-02

**Relevant SCG Controls:**

- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control 8.2

> 8.2 User identification and related accounts for users and administrators are strictly managed throughout an account’s lifecycle.

**Bridging SCF Controls:** IAC-02

**Relevant SCG Controls:**

- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control 8.2.2

> 8.2.2 Group, shared, or generic IDs, or other shared authentication credentials are only used when necessary on an exception basis, and are managed as follows:  • ID use is prevented unless needed for an exceptional circumstance.  • Use is limited to the time needed for the exceptional circumstance.  • Business justification for use is documented.  • Use is explicitly approved by management.   • Individual user identity is confirmed before access to an account is granted.  • Every action taken is attributable to an individual user.   Applicability Notes  This requirement is not intended to apply to user accounts within point-of-sale terminals that have access to only one card number at a time to facilitate a single transaction.

**Bridging SCF Controls:** IAC-15.5

**Relevant SCG Controls:**

- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.

### Control 8.2.3

> 8.2.3 Additional requirement for service providers only: Service providers with remote access to customer premises use unique authentication factors for each customer premises.  Applicability Notes  This requirement applies only when the entity being assessed is a service provider.  This requirement is not intended to apply to service providers accessing their own shared services environments, where multiple customer environments are hosted.  If service provider employees use shared authentication factors to remotely access customer premises, these factors must be unique per customer and managed in accordance with Requirement 8.2.2.

**Bridging SCF Controls:** NET-14, TPM-04

**Relevant SCG Controls:**

- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.
- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control 8.2.4

> 8.2.4 Addition, deletion, and modification of user IDs, authentication factors, and other identifier objects are managed as follows:  • Authorized with the appropriate approval.  • Implemented with only the privileges specified on the documented approval.  Applicability Notes  This requirement applies to all user accounts, including employees, contractors, consultants, temporary workers and third-party vendors.

**Bridging SCF Controls:** IAC-07, IAC-10

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.

### Control 8.2.6

> 8.2.6 Inactive user accounts are removed or disabled within 90 days of inactivity.

**Bridging SCF Controls:** IAC-15.3

**Relevant SCG Controls:**

- fleet-9.jit-inactivity -- Configure an inactivity expiry for Just-In-Time users.

### Control 8.2.7

> 8.2.7 Accounts used by third parties to access, support, or maintain system components via remote access are managed as follows:  • Enabled only during the time period needed and disabled when not in use.  • Use is monitored for unexpected activity.

**Bridging SCF Controls:** NET-14

**Relevant SCG Controls:**

- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.

### Control 8.2.8

> 8.2.8 If a user session has been idle for more than 15 minutes, the user is required to re-authenticate to re-activate the terminal or session.  Applicability Notes  This requirement is not intended to apply to user accounts on point-of-sale terminals that have access to only one card number at a time to facilitate a single transaction.  This requirement is not meant to prevent legitimate activities from being performed while the console/PC is unattended.

**Bridging SCF Controls:** IAC-24, IAC-25

**Relevant SCG Controls:**

- esx-9.api-soap-timeout -- The ESX host must configure a session timeout for the vSphere API.
- esx-9.dcui-timeout -- Set a timeout to automatically terminate idle DCUI sessions on the ESX host.
- esx-9.session-timeout -- The ESX Host Client must enforce an idle session timeout.
- esx-9.shell-interactive-timeout -- Configure the inactivity timeout to automatically terminate idle ESX host shells.
- esx-9.shell-timeout -- Set a timeout to limit how long the ESX Shell and SSH services are allowed to run.
- networks-9.session-timeout -- VCF Operations for Networks must enforce an idle session timeout.
- nsx-9.session-timeout -- NSX Manager must enforce an idle session timeout on its API and CLI.
- operations-9.session-timeout -- VCF Operations must enforce an idle session timeout.
- vcenter-9.session-timeout -- Enforce an idle session timeout for the vSphere Client.
- vm-9.vmrc-lock -- Virtual machines must be configured to lock when the last console connection is closed.

### Control 8.3

> 8.3 Strong authentication for users and administrators is established and managed.

**Bridging SCF Controls:** IAC-02, IAC-10, IAC-10.1

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control 8.3.1

> 8.3.1 All user access to system components for users and administrators is authenticated via at least one of the following authentication factors:  • Something you know, such as a password or passphrase.  • Something you have, such as a token device or smart card.  • Something you are, such as a biometric element.  Applicability Notes  This requirement is not intended to apply to user accounts on point-of-sale terminals that have access to only one card number at a time to facilitate a single transaction.  This requirement does not supersede multi-factor authentication (MFA) requirements but applies to those in-scope systems not otherwise subject to MFA requirements.  A digital certificate is a valid option for “something you have” if it is unique for a particular user.

**Bridging SCF Controls:** IAC-10, IAC-10.1, IAC-10.2

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.log-forwarding-tls-x509 -- The ESX host must use strict x509 verification for TLS-enabled remote logging endpoints.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.certificates-validation -- VCF Operations must activate certificate validation.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control 8.3.2

> 8.3.2 Strong cryptography is used to render all authentication factors unreadable during transmission and storage on all system components.

**Bridging SCF Controls:** CFG-02, CRY-01, CRY-03, CRY-05

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.memory-tiering-encryption -- The ESX host should encrypt data written to tiered memory devices.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.tls-ciphers -- The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- esx-9.tpm-configuration -- The ESX host must require TPM-based configuration encryption.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- esx-9.vmotion-encryption-offload -- Accelerate vMotion encryption using available hardware offload on ESX hosts.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- nsx-9.tls-ciphers -- NSX Manager must use TLS with approved protocol versions and cipher suites.
- operations-9.logs-ssl-api -- Enable SSL for API log ingestion in VCF Operations.
- operations-9.logs-ssl-syslog -- Enable SSL for syslog log ingestion in VCF Operations.
- vcenter-9.smtp -- Send vCenter notification email over a secure SMTP connection.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.
- vcenter-9.tls-ciphers -- vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.ft-encrypted -- Virtual machines must require encryption for Fault Tolerance.
- vm-9.vmotion-encrypted -- Virtual machines must require encryption for vMotion.
- vsan-9.encryption-rest -- vSAN must protect data at rest.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 8.3.3

> 8.3.3 User identity is verified before modifying any authentication factor.

**Bridging SCF Controls:** IAC-02, IAC-10, IAC-10.1

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control 8.3.4

> 8.3.4 Invalid authentication attempts are limited by:   • Locking out the user ID after not more than 10 attempts.  • Setting the lockout duration to a minimum of 30 minutes or until the user’s identity is confirmed.   Applicability Notes  This requirement is not intended to apply to user accounts on point-of-sale terminals that have access to only one card number at a time to facilitate a single transaction.

**Bridging SCF Controls:** IAC-22

**Relevant SCG Controls:**

- esx-9.account-lockout-duration -- The ESX host must enforce an unlock timeout.
- esx-9.account-lockout-max-attempts -- The ESX host must enforce a limit on consecutive invalid logon attempts by a user.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.account-lockout-max-attempts -- NSX Manager must enforce an account lockout after consecutive failed authentication attempts.
- operations-9.account-lockout -- VCF Operations must lock accounts after consecutive failed logon attempts.
- vcenter-9.account-lockout-duration -- Set the vCenter account auto-unlock interval.
- vcenter-9.account-lockout-max-attempts -- Lock vCenter accounts after repeated failed login attempts.
- vcenter-9.account-lockout-reset -- Set the vCenter failed-login counting interval.

### Control 8.3.5

> 8.3.5 If passwords/passphrases are used as authentication factors to meet Requirement 8.3.1, they are set and reset for each user as follows:   • Set to a unique value for first-time use and upon reset.  • Forced to be changed immediately after the first use.

**Bridging SCF Controls:** IAC-07, IAC-10, IAC-10.1

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control 8.3.6

> 8.3.6 If passwords/passphrases are used as authentication factors to meet Requirement 8.3.1, they meet the following minimum level of complexity:   • A minimum length of 12 characters (or IF the system does not support 12 characters, a minimum length of eight characters).  • Contain both numeric and alphabetic characters.  Applicability Notes  This requirement is not intended to apply to:   • User accounts on point-of-sale terminals that have access to only one card number at a time to facilitate a single transaction.  • Application or system accounts, which are governed by requirements in section 8.6.  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.  Until 31 March 2025, passwords must be a minimum length of seven characters in accordance with PCI DSS v3.2.1 Requirement 8.2.3.

**Bridging SCF Controls:** IAC-10.1

**Relevant SCG Controls:**

- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control 8.3.7

> 8.3.7 Individuals are not allowed to submit a new password/passphrase that is the same as any of the last four passwords/passphrases used.  Applicability Notes  This requirement is not intended to apply to user accounts on point-of-sale terminals that have access to only one card number at a time to facilitate a single transaction.

**Bridging SCF Controls:** IAC-10, IAC-10.1

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control 8.3.9

> 8.3.9 If passwords/passphrases are used as the only authentication factor for user access (i.e., in any single-factor authentication implementation) then either:  • Passwords/passphrases are changed at least once every 90 days,   OR  • The security posture of accounts is dynamically analyzed, and real-time access to resources is automatically determined accordingly.   Applicability Notes  This requirement does not apply to in-scope system components where MFA is used.  This requirement is not intended to apply to user accounts on point-of-sale terminals that have access to only one card number at a time to facilitate a single transaction.  This requirement does not apply to service providers’ customer accounts but does apply to accounts for service provider personnel.

**Bridging SCF Controls:** IAC-02, IAC-10, IAC-10.1

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control 8.3.10.1

> 8.3.10.1 Additional requirement for service providers only: If passwords/passphrases are used as the only authentication factor for customer user access (i.e., in any single-factor authentication implementation) then either:  • Passwords/passphrases are changed at least once every 90 days,   OR  • The security posture of accounts is dynamically analyzed, and real-time access to resources is automatically determined accordingly.  Applicability Notes  This requirement applies only when the entity being assessed is a service provider.  This requirement does not apply to accounts of consumer users accessing their own payment card information.  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.  Until this requirement is effective on 31 March 2025, service providers may meet either Requirement 8.3.10 or 8.3.10.1.

**Bridging SCF Controls:** IAC-10, IAC-10.1

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control 8.3.11

> 8.3.11 Where authentication factors such as physical or logical security tokens, smart cards, or certificates are used:   • Factors are assigned to an individual user and not shared among multiple users.   • Physical and/or logical controls ensure only the intended user can use that factor to gain access.

**Bridging SCF Controls:** IAC-10, IAC-10.2

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.log-forwarding-tls-x509 -- The ESX host must use strict x509 verification for TLS-enabled remote logging endpoints.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- operations-9.certificates-validation -- VCF Operations must activate certificate validation.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.

### Control 8.4.1

> 8.4.1 MFA is implemented for all non-console access into the CDE for personnel with administrative access.   Applicability Notes  The requirement for MFA for non-console administrative access applies to all personnel with elevated or increased privileges accessing the CDE via a non-console connection—that is, via logical access occurring over a network interface rather than via a direct, physical connection.

**Bridging SCF Controls:** IAC-06.1

**Relevant SCG Controls:**

- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control 8.4.2

> 8.4.2 MFA is implemented for all non-console access into the CDE.  Applicability Notes  This requirement does not apply to:   • Application or system accounts performing automated functions.  • User accounts on point-of-sale terminals that have access to only one card number at a time to facilitate a single transaction.  • User accounts that are only authenticated with phishing-resistant authentication factors.  MFA is required for both types of access specified in Requirements 8.4.2 and 8.4.3. Therefore, applying MFA to one type of access does not replace the need to apply another instance of MFA to the other type of access. If an individual first connects to the entity’s network via remote access, and then later initiates a connection into the CDE from within the network, per this requirement the individual would authenticate using MFA twice, once when connecting via remote access to the entity’s network and once when connecting from the entity’s network into the CDE.  The MFA requirements apply for all types of system components, including cloud, hosted systems, and on-premises applications, network security devices, workstations, servers, and endpoints, and includes access directly to an entity’s networks or systems as well as web-based access to an application or function.   MFA for access into the CDE can be implemented at the network or system/application level; it does not have to be applied at both levels. For example, if MFA is used when a user connects to the CDE network, it does not have to be used when the user logs into each system or application within the CDE.  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** IAC-06.1

**Relevant SCG Controls:**

- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control 8.4.3

> 8.4.3 MFA is implemented for all remote network access originating from outside the entity’s network that could access or impact the CDE.  Applicability Notes  The requirement for MFA for remote access originating from outside the entity’s network applies to all user accounts that can access the network remotely, where that remote access leads to or could lead to access into the CDE. This includes all remote access by personnel (users and administrators), and third parties (including, but not limited to, vendors, suppliers, service providers, and customers).  If remote access is to a part of the entity’s network that is properly segmented from the CDE, such that remote users cannot access or impact the CDE, MFA for remote access to that part of the network is not required. However, MFA is required for any remote access to networks with access to the CDE and is recommended for all remote access to the entity’s networks.  The MFA requirements apply for all types of system components, including cloud, hosted systems, and on-premises applications, network security devices, workstations, servers, and endpoints, and includes access directly to an entity’s networks or systems as well as web-based access to an application or function.

**Bridging SCF Controls:** IAC-06.1

**Relevant SCG Controls:**

- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control 8.5

> 8.5 Multi-factor authentication is implemented to secure access to the CDE.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 8.6

> 8.6 Use of application and system accounts and associated authentication factors are strictly managed.

**Bridging SCF Controls:** IAC-15.7, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.disable-accounts-dcui -- The ESX host must disable shell access for the dcui account.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- nsx-9.disable-accounts -- Disable unused NSX Manager local accounts.
- vcenter-9.disable-accounts -- VMware vCenter must have unnecessary or unused user accounts disabled or removed.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 8.6.1

> 8.6.1 If accounts used by systems or applications can be used for interactive login, they are managed as follows:   • Interactive use is prevented unless needed for an exceptional circumstance.  • Interactive use is limited to the time needed for the exceptional circumstance.  • Business justification for interactive use is documented.  • Interactive use is explicitly approved by management.   • Individual user identity is confirmed before access to account is granted.  • Every action taken is attributable to an individual user.   Applicability Notes  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** IAC-15.7, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.disable-accounts-dcui -- The ESX host must disable shell access for the dcui account.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- nsx-9.disable-accounts -- Disable unused NSX Manager local accounts.
- vcenter-9.disable-accounts -- VMware vCenter must have unnecessary or unused user accounts disabled or removed.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 8.6.3

> 8.6.3 Passwords/passphrases for any application and system accounts are protected against misuse as follows:   • Passwords/passphrases are changed periodically (at the frequency defined in the entity’s targeted risk analysis, which is performed according to all elements specified in Requirement 12.3.1) and upon suspicion or confirmation of compromise.  • Passwords/passphrases are constructed with sufficient complexity appropriate for how frequently the entity changes the passwords/passphrases.   Applicability Notes  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** IAC-10, IAC-10.1

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control 9.4

> 9.4 Media with cardholder data is securely stored, accessed, distributed, and destroyed.

**Bridging SCF Controls:** CRY-05

**Relevant SCG Controls:**

- esx-9.memory-tiering-encryption -- The ESX host should encrypt data written to tiered memory devices.
- esx-9.tpm-configuration -- The ESX host must require TPM-based configuration encryption.
- vsan-9.encryption-rest -- vSAN must protect data at rest.

### Control 9.4.1.1

> 9.4.1.1 Offline media backups with cardholder data are stored in a secure location.

**Bridging SCF Controls:** BCD-11

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.

### Control 9.4.1.2

> 9.4.1.2 The security of the offline media backup location(s) with cardholder data is reviewed at least once every 12 months.

**Bridging SCF Controls:** BCD-11

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.

### Control 10.2

> 10.2 Audit logs are implemented to support the detection of anomalies and suspicious activity, and the forensic analysis of events.

**Bridging SCF Controls:** CFG-02, MON-01.4, MON-03, MON-07

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- nsx-9.timezone-utc -- Set NSX Manager timezone to UTC for consistent audit timestamps.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control 10.2.1

> 10.2.1 Audit logs are enabled and active for all system components and cardholder data.

**Bridging SCF Controls:** CFG-02, MON-03

**Relevant SCG Controls:**

- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control 10.2.1.1

> 10.2.1.1 Audit logs capture all individual user access to cardholder data.

**Bridging SCF Controls:** CFG-02, MON-03

**Relevant SCG Controls:**

- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control 10.2.1.2

> 10.2.1.2 Audit logs capture all actions taken by any individual with administrative access, including any interactive use of application or system accounts.

**Bridging SCF Controls:** CFG-02, MON-03

**Relevant SCG Controls:**

- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control 10.2.1.3

> 10.2.1.3 Audit logs capture all access to audit logs.

**Bridging SCF Controls:** CFG-02, MON-03

**Relevant SCG Controls:**

- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control 10.2.1.4

> 10.2.1.4 Audit logs capture all invalid logical access attempts.

**Bridging SCF Controls:** CFG-02, MON-03

**Relevant SCG Controls:**

- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control 10.2.1.5

> 10.2.1.5 Audit logs capture all changes to identification and authentication credentials including, but not limited to:  • Creation of new accounts.  • Elevation of privileges.  • All changes, additions, or deletions to accounts with administrative access.

**Bridging SCF Controls:** CFG-02, MON-03

**Relevant SCG Controls:**

- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control 10.2.1.6

> 10.2.1.6 Audit logs capture the following:   • All initialization of new audit logs, and   • All starting, stopping, or pausing of the existing audit logs.

**Bridging SCF Controls:** CFG-02, MON-03

**Relevant SCG Controls:**

- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control 10.2.1.7

> 10.2.1.7 Audit logs capture all creation and deletion of system-level objects.

**Bridging SCF Controls:** CFG-02, MON-03

**Relevant SCG Controls:**

- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control 10.2.2

> 10.2.2 Audit logs record the following details for each auditable event:  • User identification.  • Type of event.  • Date and time.  • Success and failure indication.  • Origination of event.  • Identity or name of affected data, system component, resource, or service (for example, name and protocol).

**Bridging SCF Controls:** CFG-02, MON-03

**Relevant SCG Controls:**

- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control 10.3

> 10.3 Audit logs are protected from destruction and unauthorized modifications.

**Bridging SCF Controls:** MON-08

**Relevant SCG Controls:**

- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.

### Control 10.3.1

> 10.3.1 Read access to audit logs files is limited to those with a job-related need.

**Bridging SCF Controls:** MON-08

**Relevant SCG Controls:**

- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.

### Control 10.3.2

> 10.3.2 Audit log files are protected to prevent modifications by individuals.

**Bridging SCF Controls:** MON-08

**Relevant SCG Controls:**

- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.

### Control 10.3.3

> 10.3.3 Audit log files, including those for external-facing technologies, are promptly backed up to a secure, central, internal log server(s) or other media that is difficult to modify.

**Bridging SCF Controls:** MON-02, MON-02.2

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.

### Control 10.4

> 10.4 Audit logs are reviewed to identify anomalies or suspicious activity.

**Bridging SCF Controls:** MON-01.4, MON-02, MON-02.2

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.

### Control 10.4.1

> 10.4.1 The following audit logs are reviewed at least once daily:  • All security events.   • Logs of all system components that store, process, or transmit CHD and/or SAD.  • Logs of all critical system components.  • Logs of all servers and system components that perform security functions (for example, network security controls, intrusion-detection systems/intrusion-prevention systems (IDS/IPS), authentication servers).

**Bridging SCF Controls:** MON-01.4, MON-02, MON-02.2

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.

### Control 10.4.1.1

> 10.4.1.1 Automated mechanisms are used to perform audit log reviews.  Applicability Notes  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** MON-01.4, MON-02, MON-02.2

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.

### Control 10.4.3

> 10.4.3 Exceptions and anomalies identified during the review process are addressed.

**Bridging SCF Controls:** MON-01.4

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.

### Control 10.5

> 10.5 Audit log history is retained and available for analysis.

**Bridging SCF Controls:** MON-10

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.log-audit-local-capacity -- The ESX host must store audit records for a time period consistent with your records retention policy.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.action-history-retention -- Retain VCF Operations remediation action history for an appropriate interval.
- operations-9.log-retention -- Configure the VCF Operations log retention period.
- vcenter-9.events-database-retention -- VMware vCenter must retain task and event data for an appropriate interval.
- vm-9.log-retention -- Virtual machines must limit the number of retained diagnostic logs.

### Control 10.5.1

> 10.5.1 Retain audit log history for at least 12 months, with at least the most recent three months immediately available for analysis.

**Bridging SCF Controls:** MON-10

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.log-audit-local-capacity -- The ESX host must store audit records for a time period consistent with your records retention policy.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.action-history-retention -- Retain VCF Operations remediation action history for an appropriate interval.
- operations-9.log-retention -- Configure the VCF Operations log retention period.
- vcenter-9.events-database-retention -- VMware vCenter must retain task and event data for an appropriate interval.
- vm-9.log-retention -- Virtual machines must limit the number of retained diagnostic logs.

### Control 10.6

> 10.6 Time-synchronization mechanisms support consistent time settings across all systems.

**Bridging SCF Controls:** CFG-02, MON-02.7, MON-07, MON-07.1, SEA-20

**Relevant SCG Controls:**

- esx-9.hardware-management-time -- Synchronize hardware management controller time with organizational reference sources.
- esx-9.time -- The ESX host must synchronize its clock with organizational reference sources.
- fleet-9.time -- Configure fleet-wide time synchronization.
- nsx-9.timezone-utc -- Set NSX Manager timezone to UTC for consistent audit timestamps.
- pnr-9.time -- The VCF Protection and Recovery appliance must synchronize its clock with organizational reference sources.
- vcenter-9.events-remote-logging -- Enable remote logging of vCenter events.
- vcenter-9.time -- vCenter must synchronize its clock with organizational reference sources.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 10.6.1

> 10.6.1 System clocks and time are synchronized using time-synchronization technology.   Applicability Notes  Keeping time-synchronization technology current includes managing vulnerabilities and patching the technology according to PCI DSS Requirements 6.3.1 and 6.3.3.

**Bridging SCF Controls:** CFG-02, MON-02.7, MON-07, MON-07.1, SEA-20

**Relevant SCG Controls:**

- esx-9.hardware-management-time -- Synchronize hardware management controller time with organizational reference sources.
- esx-9.time -- The ESX host must synchronize its clock with organizational reference sources.
- fleet-9.time -- Configure fleet-wide time synchronization.
- nsx-9.timezone-utc -- Set NSX Manager timezone to UTC for consistent audit timestamps.
- pnr-9.time -- The VCF Protection and Recovery appliance must synchronize its clock with organizational reference sources.
- vcenter-9.events-remote-logging -- Enable remote logging of vCenter events.
- vcenter-9.time -- vCenter must synchronize its clock with organizational reference sources.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 10.6.2

> 10.6.2 Systems are configured to the correct and consistent time as follows:  • One or more designated time servers are in use.  • Only the designated central time server(s) receives time from external sources.  • Time received from external sources is based on International Atomic Time or Coordinated Universal Time (UTC).  • The designated time server(s) accept time updates only from specific industry-accepted external sources.  • Where there is more than one designated time server, the time servers peer with one another to keep accurate time.  • Internal systems receive time information only from designated central time server(s).

**Bridging SCF Controls:** CFG-02, MON-02.7, MON-07, MON-07.1, SEA-20

**Relevant SCG Controls:**

- esx-9.hardware-management-time -- Synchronize hardware management controller time with organizational reference sources.
- esx-9.time -- The ESX host must synchronize its clock with organizational reference sources.
- fleet-9.time -- Configure fleet-wide time synchronization.
- nsx-9.timezone-utc -- Set NSX Manager timezone to UTC for consistent audit timestamps.
- pnr-9.time -- The VCF Protection and Recovery appliance must synchronize its clock with organizational reference sources.
- vcenter-9.events-remote-logging -- Enable remote logging of vCenter events.
- vcenter-9.time -- vCenter must synchronize its clock with organizational reference sources.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 10.6.3

> 10.6.3 Time synchronization settings and data are protected as follows:   • Access to time data is restricted to only personnel with a business need.  • Any changes to time settings on critical systems are logged, monitored, and reviewed.

**Bridging SCF Controls:** CFG-02, MON-02.7, MON-07, MON-07.1, SEA-20

**Relevant SCG Controls:**

- esx-9.hardware-management-time -- Synchronize hardware management controller time with organizational reference sources.
- esx-9.time -- The ESX host must synchronize its clock with organizational reference sources.
- fleet-9.time -- Configure fleet-wide time synchronization.
- nsx-9.timezone-utc -- Set NSX Manager timezone to UTC for consistent audit timestamps.
- pnr-9.time -- The VCF Protection and Recovery appliance must synchronize its clock with organizational reference sources.
- vcenter-9.events-remote-logging -- Enable remote logging of vCenter events.
- vcenter-9.time -- vCenter must synchronize its clock with organizational reference sources.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 10.7

> 10.7 Failures of critical security control systems are detected, reported, and responded to promptly.

**Bridging SCF Controls:** MON-01.4

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.

### Control 10.7.1

> 10.7.1 Additional requirement for service providers only: Failures of critical security control systems are detected, alerted, and addressed promptly, including but not limited to failure of the following critical security control systems:  • Network security controls   • IDS/IPS   • FIM   • Anti-malware solutions   • Physical access controls   • Logical access controls   • Audit logging mechanisms   • Segmentation controls (if used)   Applicability Notes  This requirement applies only when the entity being assessed is a service provider.  This requirement will be superseded by Requirement 10.7.2 as of 31 March 2025.

**Bridging SCF Controls:** MON-01.4

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.

### Control 10.7.2

> 10.7.2 Failures of critical security control systems are detected, alerted, and addressed promptly, including but not limited to failure of the following critical security control systems:  • Network security controls.  • IDS/IPS.  • Change-detection mechanisms.  • Anti-malware solutions.  • Physical access controls.  • Logical access controls.  • Audit logging mechanisms.  • Segmentation controls (if used).  • Audit log review mechanisms.  • Automated security testing tools (if used).  Applicability Notes  This requirement applies to all entities, including service providers, and will supersede Requirement 10.7.1 as of 31 March 2025. It includes two additional critical security control systems not in Requirement 10.7.1.   This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** MON-01.4

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.

### Control 10.7.3

> 10.7.3 Failures of any critical security control systems are responded to promptly, including but not limited to:   • Restoring security functions.   • Identifying and documenting the duration (date and time from start to end) of the security failure.   • Identifying and documenting the cause(s) of failure, and documenting required remediation.   • Identifying and addressing any security issues that arose during the failure.   • Determining whether further actions are required as a result of the security failure.   • Implementing controls to prevent the cause of failure from reoccurring.   • Resuming monitoring of security controls.  Applicability Notes  This requirement applies only when the entity being assessed is a service provider, until the 31 March 2025, after which this requirement will apply to all entities.  This is a current v3.2.1 requirement that applies to service providers only. However, this requirement is a best practice for all other entities until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** MON-01.4

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.

### Control 11.2

> 11.2 2 An inventory of authorized wireless access points is maintained, including a documented business justification.

**Bridging SCF Controls:** CFG-02, NET-12

**Relevant SCG Controls:**

- nsx-9.snmp -- NSX Manager must not use SNMP v1 or v2c.
- vcenter-9.snmp -- Disable SNMP v1 and v2c receivers on vCenter.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 11.2.1

> 11.2.1 Authorized and unauthorized wireless access points are managed as follows:  • The presence of wireless (Wi-Fi) access points is tested for,   • All authorized and unauthorized wireless access points are detected and identified,   • Testing, detection, and identification occurs at least once every three months.   • If automated monitoring is used, personnel are notified via generated alerts.  Applicability Notes  The requirement applies even when a policy exists that prohibits the use of wireless technology.  Methods used to meet this requirement must be sufficient to detect and identify both authorized and unauthorized devices, including unauthorized devices attached to devices that themselves are authorized.

**Bridging SCF Controls:** NET-03.1

**Relevant SCG Controls:**

- nsx-9.api-rate-limits -- Configure NSX Manager API rate and concurrency limits.

### Control 11.3

> 11.3 External and internal vulnerabilities are regularly identified, prioritized, and addressed.

**Bridging SCF Controls:** VPM-04

**Relevant SCG Controls:**

- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.

### Control 11.4.5

> 11.4.5 If segmentation is used to isolate the CDE from other networks, penetration tests are performed on segmentation controls as follows:  • At least once every 12 months and after any changes to segmentation controls/methods   • Covering all segmentation controls/methods in use.  • According to the entity’s defined penetration testing methodology.  • Confirming that the segmentation controls/methods are operational and effective, and isolate the CDE from all out-of-scope systems.  • Confirming effectiveness of any use of isolation to separate systems with differing security levels (see Requirement 2.2.3).  • Performed by a qualified internal resource or qualified external third party.  • Organizational independence of the tester exists (not required to be a QSA or ASV).

**Bridging SCF Controls:** NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 11.4.6

> 11.4.6 Additional requirement for service providers only: If segmentation is used to isolate the CDE from other networks, penetration tests are performed on segmentation controls as follows:   • At least once every six months and after any changes to segmentation controls/methods.   • Covering all segmentation controls/methods in use.  • According to the entity’s defined penetration testing methodology.  • Confirming that the segmentation controls/methods are operational and effective, and isolate the CDE from all out-of-scope systems.  • Confirming effectiveness of any use of isolation to separate systems with differing security levels (see Requirement 2.2.3).  • Performed by a qualified internal resource or qualified external third party.  • Organizational independence of the tester exists (not required to be a QSA or ASV).  Applicability Notes  This requirement applies only when the entity being assessed is a service provider.

**Bridging SCF Controls:** NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 11.5.1

> 11.5.1 Intrusion-detection and/or intrusion-prevention techniques are used to detect and/or prevent intrusions into the network as follows:   • All traffic is monitored at the perimeter of the CDE.   • All traffic is monitored at critical points in the CDE.   • Personnel are alerted to suspected compromises.   • All intrusion-detection and prevention engines, baselines, and signatures are kept up to date.

**Bridging SCF Controls:** NET-03

**Relevant SCG Controls:**

- nsx-9.ibgp-source-loopback -- Configure Tier-0 Gateway iBGP peering to use the loopback address as the source.
- nsx-9.reverse-path-forwarding -- NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.network-mac-learning -- Disable MAC learning on distributed switch port groups unless a workload requires it.
- vcenter-9.network-reject-forged-transmit-dvportgroup -- Reject forged transmits on distributed switches and port groups.
- vcenter-9.network-reject-mac-changes-dvportgroup -- Reject guest MAC address changes on distributed switches and port groups.
- vcenter-9.network-reset-port -- Reset distributed switch port configuration when a virtual machine disconnects.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-restrict-port-level-overrides -- Disallow per-port policy overrides on distributed port groups, except port blocking.
- vcenter-9.network-restrict-port-mirroring -- Remove unauthorized port mirroring sessions on distributed switches.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.

### Control 11.6.1

> 11.6.1 A change- and tamper-detection mechanism is deployed as follows:  • To alert personnel to unauthorized modification (including indicators of compromise, changes, additions, and deletions) to the security-impacting HTTP headers and the script contents of payment pages as received by the consumer browser.  • The mechanism is configured to evaluate the received HTTP header and payment pages.   • The mechanism functions are performed as follows:   - At least once weeky,   OR   - Periodically (at the frequency defined in the entity’s targeted risk analysis, which is performed according to all elements specified in Requirement 12.3.1).   Applicability Notes  This requirement also applies to entities with a webpage(s) that includes a TPSP’s/payment processor’s embedded payment page/form (for example, one or more inline frames or iframes.)  This requirement does not apply to an entity for scripts in a TPSP’s/payment processor’s embedded payment page/form (for example, one or more iframes), where the entity includes a TPSP’s/payment processor’s payment page/form on its webpage.   Scripts in the TPSP’s/payment processor’s embedded payment page/form are the responsibility of the TPSP/payment processor to manage in accordance with this requirement.  The intention of this requirement is not that an entity installs software in the systems or browsers of its consumers, but rather that the entity uses techniques such as those described under Examples in the PCI DSS Guidance to prevent and detect unexpected script activities.  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** CFG-03.1

**Relevant SCG Controls:**

- nsx-9.inactive-interfaces -- NSX Tier-0 Gateway must remove inactive interfaces.
- nsx-9.routing-protocols-unused -- Disable Tier-0 Gateway routing protocols that are not in use.
- nsx-9.t1-inactive-interfaces -- Remove inactive interfaces and stale linked segments from Tier-1 Gateways.

### Control 12.3.1

> 12.3.1 For each PCI DSS requirement that specifies completion of a targeted risk analysis, the analysis is documented and includes:  • Identification of the assets being protected.   • Identification of the threat(s) that the requirement is protecting against.  • Identification of factors that contribute to the likelihood and/or impact of a threat being realized.   • Resulting analysis that determines, and includes justification for, how the frequency or processes defined by the entity to meet the requirement minimize the likelihood and/or impact of the threat being realized.  • Review of each targeted risk analysis at least once every 12 months to determine whether the results are still valid or if an updated risk analysis is needed  • Performance of updated risk analyses when needed, as determined by the annual review.  Applicability Notes  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** CFG-03.1

**Relevant SCG Controls:**

- nsx-9.inactive-interfaces -- NSX Tier-0 Gateway must remove inactive interfaces.
- nsx-9.routing-protocols-unused -- Disable Tier-0 Gateway routing protocols that are not in use.
- nsx-9.t1-inactive-interfaces -- Remove inactive interfaces and stale linked segments from Tier-1 Gateways.

### Control 12.3.3

> 12.3.3 Cryptographic cipher suites and protocols in use are documented and reviewed at least once every 12 months, including at least the following:  • An up-to-date inventory of all cryptographic cipher suites and protocols in use, including purpose and where used.  • Active monitoring of industry trends regarding continued viability of all cryptographic cipher suites and protocols in use.  • Documentation of a plan to respond to anticipated changes in cryptographic vulnerabilities.  Applicability Notes  The requirement applies to all cryptographic cipher suites and protocols used to meet PCI DSS requirements, including, but not limited to, those used to render PAN unreadable in storage and transmission, to protect passwords, and as part of authenticating access.   This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** CRY-01, CRY-01.5

**Relevant SCG Controls:**

- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- esx-9.tls-ciphers -- The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- nsx-9.tls-ciphers -- NSX Manager must use TLS with approved protocol versions and cipher suites.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.
- vcenter-9.tls-ciphers -- vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.

### Control 12.3.4

> 12.3.4 Hardware and software technologies in use are reviewed at least once every 12 months, including at least the following:  • Analysis that the technologies continue to receive security fixes from vendors promptly.  • Analysis that the technologies continue to support (and do not preclude) the entity’s PCI DSS compliance.  • Documentation of any industry announcements or trends related to a technology, such as when a vendor has announced “end of life” plans for a technology.  • Documentation of a plan, approved by senior management, to remediate outdated technologies, including those for which vendors have announced “end of life” plans.  Applicability Notes  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** CFG-03.1

**Relevant SCG Controls:**

- nsx-9.inactive-interfaces -- NSX Tier-0 Gateway must remove inactive interfaces.
- nsx-9.routing-protocols-unused -- Disable Tier-0 Gateway routing protocols that are not in use.
- nsx-9.t1-inactive-interfaces -- Remove inactive interfaces and stale linked segments from Tier-1 Gateways.

### Control 12.4.2

> 12.4.2 Additional requirement for service providers only: Reviews are performed at least once every three months to confirm personnel are performing their tasks in accordance with all security policies and all operational procedures. Reviews are performed by personnel other than those responsible for performing the given task and include, but not limited to, the following tasks:   • Daily log reviews.   • Configuration reviews for network security controls.   • Applying configuration standards to new systems.   • Responding to security alerts.   •  Change-management processes.  Applicability Notes  This requirement applies only when the entity being assessed is a service provider.

**Bridging SCF Controls:** CFG-03.1, CHG-02

**Relevant SCG Controls:**

- nsx-9.inactive-interfaces -- NSX Tier-0 Gateway must remove inactive interfaces.
- nsx-9.routing-protocols-unused -- Disable Tier-0 Gateway routing protocols that are not in use.
- nsx-9.t1-inactive-interfaces -- Remove inactive interfaces and stale linked segments from Tier-1 Gateways.
- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.

### Control 12.5.2

> 12.5.2 PCI DSS scope is documented and confirmed by the entity at least once every 12 months and upon significant change to the in-scope environment. At a minimum, the scoping validation includes:  • Identifying all data flows for the various payment stages (for example, authorization, capture settlement, chargebacks, and refunds) and acceptance channels (for example, card-present, card-not-present, and e-commerce).  • Updating all data-flow diagrams per Requirement 1.2.4.  • Identifying all locations where account data is stored, processed, and transmitted, including but not limited to: 1) any locations outside of the currently defined CDE, 2) applications that process CHD, 3) transmissions between systems and networks, and 4) file backups.  • Identifying all system components in the CDE, connected to the CDE, or that could impact security of the CDE.  • Identifying all segmentation controls in use and the environment(s) from which the CDE is segmented, including justification for environments being out of scope.  • Identifying all connections from third-party entities with access to the CDE.  • Confirming that all identified data flows, account data, system components, segmentation controls, and connections from third parties with access to the CDE are included in scope.  Applicability Notes  This annual confirmation of PCI DSS scope is an activity expected to be performed by the entity under assessment, and is not the same, nor is it intended to be replaced by, the scoping confirmation performed by the entity’s assessor during the annual assessment.

**Bridging SCF Controls:** CFG-03.1, NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- nsx-9.inactive-interfaces -- NSX Tier-0 Gateway must remove inactive interfaces.
- nsx-9.routing-protocols-unused -- Disable Tier-0 Gateway routing protocols that are not in use.
- nsx-9.t1-inactive-interfaces -- Remove inactive interfaces and stale linked segments from Tier-1 Gateways.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 12.5.2.1

> 12.5.2.1 Additional requirement for service providers only: PCI DSS scope is documented and confirmed by the entity at least once every six months and after significant changes. At a minimum, the scoping validation includes all the elements specified in Requirement 12.5.2.  Applicability Notes  This requirement applies only when the entity being assessed is a service provider.  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** CFG-03.1

**Relevant SCG Controls:**

- nsx-9.inactive-interfaces -- NSX Tier-0 Gateway must remove inactive interfaces.
- nsx-9.routing-protocols-unused -- Disable Tier-0 Gateway routing protocols that are not in use.
- nsx-9.t1-inactive-interfaces -- Remove inactive interfaces and stale linked segments from Tier-1 Gateways.

### Control 12.6.2

> 12.6.2 The security awareness program is:   • Reviewed at least once every 12 months, and   • Updated as needed to address any new threats and vulnerabilities that may impact the security of the entity’s cardholder data and/or sensitive authentication data, or the information provided to personnel about their role in protecting cardholder data.  Applicability Notes  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** CFG-03.1

**Relevant SCG Controls:**

- nsx-9.inactive-interfaces -- NSX Tier-0 Gateway must remove inactive interfaces.
- nsx-9.routing-protocols-unused -- Disable Tier-0 Gateway routing protocols that are not in use.
- nsx-9.t1-inactive-interfaces -- Remove inactive interfaces and stale linked segments from Tier-1 Gateways.

### Control 12.6.3

> 12.6.3 Personnel receive security awareness training as follows:   • Upon hire and at least once every 12 months.  • Multiple methods of communication are used.  • Personnel acknowledge at least once every 12 months that they have read and understood the information security policy and procedures.

**Bridging SCF Controls:** CFG-03.1

**Relevant SCG Controls:**

- nsx-9.inactive-interfaces -- NSX Tier-0 Gateway must remove inactive interfaces.
- nsx-9.routing-protocols-unused -- Disable Tier-0 Gateway routing protocols that are not in use.
- nsx-9.t1-inactive-interfaces -- Remove inactive interfaces and stale linked segments from Tier-1 Gateways.

### Control 12.8.1

> 12.8.1 A list of all third-party service providers (TPSPs) with which account data is shared or that could affect the security of account data is maintained, including a description for each of the services provided.  Applicability Notes  The use of a PCI DSS compliant TPSP does not make an entity PCI DSS compliant, nor does it remove the entity’s responsibility for its own PCI DSS compliance.

**Bridging SCF Controls:** NET-14

**Relevant SCG Controls:**

- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.

### Control 12.8.2

> 12.8.2 Written agreements with TPSPs are maintained as follows:   • Written agreements are maintained with all TPSPs with which account data is shared or that could affect the security of the CDE.  • Written agreements include acknowledgments from TPSPs that TPSPs are responsible for the security of account data the TPSPs possess or otherwise store, process, or transmit on behalf of the entity, or to the extent that the TPSP could impact the security of the entity’s cardholder data and/or sensitive authentication data.  Applicability Notes  The exact wording of an agreement will depend on the details of the service being provided, and the responsibilities assigned to each party. The agreement does not have to include the exact wording provided in this requirement.  The TPSP’s written acknowledgment is a confirmation that states the TPSP is responsible for the security of the account data it may store, process, or transmit on behalf of the customer or to the extent the TPSP may impact the security of a customer’s cardholder data and/or sensitive authentication data.   Evidence that a TPSP is meeting PCI DSS requirements is not the same as a written acknowledgment specified in this requirement. For example, a PCI DSS Attestation of Compliance (AOC), a declaration on a company’s website, a policy statement, a responsibility matrix, or other evidence not included in a written agreement is not a written acknowledgment.

**Bridging SCF Controls:** TPM-04

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control 12.9

> 12.9 Third-party service providers (TPSPs) support their customers’ PCI DSS compliance.

**Bridging SCF Controls:** TPM-04

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control 12.9.1

> 12.9.1 Additional requirement for service providers only: TPSPs provide written agreements to customers that include acknowledgments that TPSPs are responsible for the security of account data the TPSP possesses or otherwise stores, processes, or transmits on behalf of the customer, or to the extent that the TPSP could impact the security of the customer’s cardholder data and/or sensitive authentication data.  Applicability Notes  This requirement applies only when the entity being assessed is a service provider.  The exact wording of an agreement will depend on the details of the service being provided, and the responsibilities assigned to each party. The agreement does not have to include the exact wording provided in this requirement.  The TPSP’s written acknowledgment is a confirmation that states the TPSP is responsible for the security of the account data it may store, process, or transmit on behalf of the customer or to the extent that the TPSP could impact the security of a customer’s cardholder data and/or sensitive authentication data.   Evidence that a TPSP is meeting PCI DSS requirements is not the same as a written agreement specified in this requirement. For example, a PCI DSS Attestation of Compliance (AOC), a declaration on a company’s website, a policy statement, a responsibility matrix, or other evidence not included in a written agreement is not a written acknowledgment.

**Bridging SCF Controls:** TPM-04

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control 12.9.2

> 12.9.2 Additional requirement for service providers only: TPSPs support their customers’ requests for information to meet Requirements 12.8.4 and 12.8.5 by providing the following upon customer request:  • PCI DSS compliance status information (Requirement 12.8.4).  • Information about which PCI DSS requirements are the responsibility of the TPSP and which are the responsibility of the customer, including any shared responsibilities (Requirement 12.8.5), for any service the TPSP provides that meets a PCI DSS requirement(s) on behalf of customers or that can impact security of customers’ cardholder data and/or sensitive authentication data.  Applicability Notes  This requirement applies only when the entity being assessed is a service provider.

**Bridging SCF Controls:** TPM-04

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control 12.10.1

> 12.10.1 An incident response plan exists and is ready to be activated in the event of a suspected or confirmed security incident. The plan includes, but is not limited to:   • Roles, responsibilities, and communication and contact strategies in the event of a suspected or confirmed security incident, including notification of payment brands and acquirers, at a minimum.  • Incident response procedures with specific containment and mitigation activities for different types of incidents.  • Business recovery and continuity procedures.  • Data backup processes.  • Analysis of legal requirements for reporting compromises.  • Coverage and responses of all critical system components.  • Reference or inclusion of incident response procedures from the payment brands.

**Bridging SCF Controls:** BCD-11

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.

### Control A1.1.4

> A1.1.4 The effectiveness of logical separation controls used to separate customer environments is confirmed at least once every six months via penetration testing.   Applicability Notes  The testing of adequate separation between customers in a multi-tenant service provider environment is in addition to the penetration tests specified in Requirement 11.4.6.  This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment.

**Bridging SCF Controls:** NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control A2.1

> A2.1 POI terminals using SSL and/or early TLS are confirmed as not susceptible to known SSL/TLS exploits.

**Bridging SCF Controls:** CRY-03

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.tls-ciphers -- The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- esx-9.vmotion-encryption-offload -- Accelerate vMotion encryption using available hardware offload on ESX hosts.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- nsx-9.tls-ciphers -- NSX Manager must use TLS with approved protocol versions and cipher suites.
- operations-9.logs-ssl-api -- Enable SSL for API log ingestion in VCF Operations.
- operations-9.logs-ssl-syslog -- Enable SSL for syslog log ingestion in VCF Operations.
- vcenter-9.smtp -- Send vCenter notification email over a secure SMTP connection.
- vcenter-9.tls-ciphers -- vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- vm-9.ft-encrypted -- Virtual machines must require encryption for Fault Tolerance.
- vm-9.vmotion-encrypted -- Virtual machines must require encryption for vMotion.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control A2.1.1

> A2.1.1 Where POS POI terminals at the merchant or payment acceptance location use SSL and/or early TLS, the entity confirms the devices are not susceptible to any known exploits for those protocols.  Applicability Notes  This requirement is intended to apply to the entity with the POS POI terminal, such as a merchant. This requirement is not intended for service providers who serve as the termination or connection point to those POS POI terminals. Requirements A2.1.2 and A2.1.3 apply to POS POI service providers.  The allowance for POS POI terminals that are not currently susceptible to exploits is based on currently known risks. If new exploits are introduced to which POS POI terminals are susceptible, the POS POI terminals will need to be updated immediately.

**Bridging SCF Controls:** CRY-03

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.tls-ciphers -- The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- esx-9.vmotion-encryption-offload -- Accelerate vMotion encryption using available hardware offload on ESX hosts.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- nsx-9.tls-ciphers -- NSX Manager must use TLS with approved protocol versions and cipher suites.
- operations-9.logs-ssl-api -- Enable SSL for API log ingestion in VCF Operations.
- operations-9.logs-ssl-syslog -- Enable SSL for syslog log ingestion in VCF Operations.
- vcenter-9.smtp -- Send vCenter notification email over a secure SMTP connection.
- vcenter-9.tls-ciphers -- vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- vm-9.ft-encrypted -- Virtual machines must require encryption for Fault Tolerance.
- vm-9.vmotion-encrypted -- Virtual machines must require encryption for vMotion.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control A2.1.2

> A2.1.2 Additional requirement for service providers only: All service providers with existing connection points to POS POI terminals that use SSL and/or early TLS as defined in A2.1 have a formal Risk Mitigation and Migration Plan in place that includes:  • Description of usage, including what data is being transmitted, types and number of systems that use and/or support SSL/early TLS, and type of environment.   • Risk-assessment results and risk-reduction controls in place.  • Description of processes to monitor for new vulnerabilities associated with SSL/early TLS.  • Description of change control processes that are implemented to ensure SSL/early TLS is not implemented into new environments.  • Overview of migration project plan to replace SSL/early TLS at a future date.  Applicability Notes  This requirement applies only when the entity being assessed is a service provider.

**Bridging SCF Controls:** CRY-03

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.tls-ciphers -- The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- esx-9.vmotion-encryption-offload -- Accelerate vMotion encryption using available hardware offload on ESX hosts.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- nsx-9.tls-ciphers -- NSX Manager must use TLS with approved protocol versions and cipher suites.
- operations-9.logs-ssl-api -- Enable SSL for API log ingestion in VCF Operations.
- operations-9.logs-ssl-syslog -- Enable SSL for syslog log ingestion in VCF Operations.
- vcenter-9.smtp -- Send vCenter notification email over a secure SMTP connection.
- vcenter-9.tls-ciphers -- vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- vm-9.ft-encrypted -- Virtual machines must require encryption for Fault Tolerance.
- vm-9.vmotion-encrypted -- Virtual machines must require encryption for vMotion.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control A3.2.1

> A3.2.1 PCI DSS scope is documented and confirmed for accuracy at least once every three  months and upon significant changes to the in- scope environment. At a minimum, the scoping  validation includes: • Identifying all data flows for the various payment stages (for example, authorization, capture, settlement, chargebacks, and refunds) and  acceptance channels (for example, card- present, card-not-present, and e-commerce).  • Updating all data-flow diagrams per Requirement 1.2.4. • Identifying all locations where account data is stored, processed, and transmitted, including but not limited to 1) any locations outside of the currently defined CDE, 2) applications that process CHD, 3) transmissions between systems and networks, and 4) file backups. • For any account data found outside of the currently defined CDE, either 1) securely delete it, 2) migrate it into the currently defined CDE, or 3) expand the currently defined CDE to include it. • Identifying all system components in the CDE, connected to the CDE, or that could impact security of the CDE. Identifying all segmentation controls in use and the environment(s) from which the CDE is segmented, including justification for environments being out of scope • Identifying all connections to third-party entities with access to the CDE. • Confirming that all identified data flows, account data, system components, segmentation controls, and connections from third parties with access to the CDE are included in scope. 

**Bridging SCF Controls:** NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control A3.2.4

> A3.2.4 If segmentation is used, PCI DSS scope is confirmed as follows: • Per the entity’s methodology defined at Requirement 11.4.1. • Penetration testing is performed on segmentation controls at least once every six months and after any changes to segmentation controls/methods. • The penetration testing covers all segmentation controls/methods in use. • The penetration testing verifies that segmentation controls/methods are operational  and effective, and isolate the CDE from all out- of-scope systems.

**Bridging SCF Controls:** NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control A3.4.1

> User accounts and access privileges to in- scope system components are reviewed at least once every six months to ensure user accounts and access privileges remain appropriate based on job function, and that all access is authorized.

**Bridging SCF Controls:** IAC-17

**Relevant SCG Controls:**

- esx-9.ad-admin-validate-interval -- The ESX host must not disable validation of users and groups.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
