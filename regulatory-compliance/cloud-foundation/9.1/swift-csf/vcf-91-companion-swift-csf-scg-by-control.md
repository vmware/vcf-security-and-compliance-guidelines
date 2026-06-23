# Companion Guide to the SWIFT Customer Security Controls Framework for VMware Cloud Foundation 9.1 -- Framework Controls by SCG Coverage

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://www.swift.com/myswift/customer-security-programme-csp

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

22 framework controls have at least one Security Configuration Guide hardening control mapped to them through the SCF crosswalk.

### Control 1.1

> SWIFT Environment Protection

**Bridging SCF Controls:** NET-04, NET-04.1, NET-06, NET-06.1, NET-06.4

**Relevant SCG Controls:**

- esx-9.firewall-incoming-default -- The ESX host must configure the firewall to block network traffic by default.
- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- esx-9.hardware-management-authentication -- Use strong, isolated identity management on hardware management controllers.
- esx-9.network-bpdu -- Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.network-rpf-promisc -- The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.
- esx-9.network-standard-reject-forged-transmit -- Reject forged transmits on standard switches and port groups.
- esx-9.network-standard-reject-mac-changes -- Reject guest MAC address changes on standard switches and port groups.
- esx-9.network-standard-reject-promiscuous-mode -- Reject promiscuous mode on standard switches and port groups.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-management -- The ESX host must isolate management communications.
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

### Control 1.2

> Operating System Privileged Account Control

**Bridging SCF Controls:** IAC-16, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 1.3

> Virtualisation Platform Protection

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 1.4

> Restriction of Internet Access

**Bridging SCF Controls:** NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 1.5

> Customer Environment Protection

**Bridging SCF Controls:** NET-03, NET-04, NET-04.1, NET-06, NET-14

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
- nsx-9.ibgp-source-loopback -- Configure Tier-0 Gateway iBGP peering to use the loopback address as the source.
- nsx-9.reverse-path-forwarding -- NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.
- vcenter-9.network-mac-learning -- Disable MAC learning on distributed switch port groups unless a workload requires it.
- vcenter-9.network-reject-forged-transmit-dvportgroup -- Reject forged transmits on distributed switches and port groups.
- vcenter-9.network-reject-mac-changes-dvportgroup -- Reject guest MAC address changes on distributed switches and port groups.
- vcenter-9.network-reject-promiscuous-mode-dvportgroup -- Reject promiscuous mode on distributed switches and port groups.
- vcenter-9.network-reset-port -- Reset distributed switch port configuration when a virtual machine disconnects.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-restrict-port-level-overrides -- Disallow per-port policy overrides on distributed port groups, except port blocking.
- vcenter-9.network-restrict-port-mirroring -- Remove unauthorized port mirroring sessions on distributed switches.
- vcenter-9.network-vgt -- Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.
- vcf-9.perimeter-firewall -- Limit access to VCF component management interfaces with perimeter firewalls.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 2.1

> Internal Data Flow Security

**Bridging SCF Controls:** CRY-03, CRY-04

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.tls-ciphers -- The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- esx-9.vmotion-encryption-offload -- Accelerate vMotion encryption using available hardware offload on ESX hosts.
- nsx-9.bgp-encryption -- Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- nsx-9.ospf-encryption -- NSX Tier-0 Gateway must enable OSPF authentication.
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

### Control 2.2

> Security Updates

**Bridging SCF Controls:** VPM-04, VPM-04.1, VPM-05, VPM-05.8

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.supported -- vCenter must run a version that has not reached End of General Support.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control 2.3

> System Hardening

**Bridging SCF Controls:** CFG-02, CFG-03, IAC-21

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.ceip-disable -- Disable the ESX Customer Experience Improvement Program.
- esx-9.deactivate-mob -- The ESX Managed Object Browser (MOB) must be disabled.
- esx-9.deactivate-shell -- The ESX Shell must be disabled.
- esx-9.forensic-snapshots -- Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- esx-9.hardware-ports -- Disable or physically protect unused external server ports.
- esx-9.hardware-virtual-nic -- The ESX host must not enable virtual hardware management network interfaces.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
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
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
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

### Control 2.4

> Back Office Data Flow Security: Ensure the confidentiality, integrity, and mutual authenticity of data flows between local or remote SWIFT infrastructure components and the back-office first hops they connect to.

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

### Control 2.5A

> External Transmission Data Protection: Protect the confidentiality of SWIFT-related sensitive data transmitted or stored outside of the secure zone as part of operational processes.

**Bridging SCF Controls:** CRY-03, CRY-04, CRY-05

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.memory-tiering-encryption -- The ESX host should encrypt data written to tiered memory devices.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.tls-ciphers -- The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- esx-9.tpm-configuration -- The ESX host must require TPM-based configuration encryption.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- esx-9.vmotion-encryption-offload -- Accelerate vMotion encryption using available hardware offload on ESX hosts.
- nsx-9.bgp-encryption -- Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- nsx-9.ospf-encryption -- NSX Tier-0 Gateway must enable OSPF authentication.
- nsx-9.tls-ciphers -- NSX Manager must use TLS with approved protocol versions and cipher suites.
- operations-9.logs-ssl-api -- Enable SSL for API log ingestion in VCF Operations.
- operations-9.logs-ssl-syslog -- Enable SSL for syslog log ingestion in VCF Operations.
- vcenter-9.smtp -- Send vCenter notification email over a secure SMTP connection.
- vcenter-9.tls-ciphers -- vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- vm-9.ft-encrypted -- Virtual machines must require encryption for Fault Tolerance.
- vm-9.vmotion-encrypted -- Virtual machines must require encryption for vMotion.
- vsan-9.encryption-rest -- vSAN must protect data at rest.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 2.6

> Operator Session Confidentiality and Integrity

**Bridging SCF Controls:** CRY-01, CRY-03, CRY-04

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.tls-ciphers -- The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- esx-9.vmotion-encryption-offload -- Accelerate vMotion encryption using available hardware offload on ESX hosts.
- nsx-9.bgp-encryption -- Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- nsx-9.ospf-encryption -- NSX Tier-0 Gateway must enable OSPF authentication.
- nsx-9.tls-ciphers -- NSX Manager must use TLS with approved protocol versions and cipher suites.
- operations-9.logs-ssl-api -- Enable SSL for API log ingestion in VCF Operations.
- operations-9.logs-ssl-syslog -- Enable SSL for syslog log ingestion in VCF Operations.
- vcenter-9.smtp -- Send vCenter notification email over a secure SMTP connection.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.
- vcenter-9.tls-ciphers -- vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- vm-9.ft-encrypted -- Virtual machines must require encryption for Fault Tolerance.
- vm-9.vmotion-encrypted -- Virtual machines must require encryption for vMotion.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 2.7

> Vulnerability Scanning

**Bridging SCF Controls:** VPM-04

**Relevant SCG Controls:**

- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.

### Control 2.8

> Critical Activity Outsourcing: Ensure the protection of the local SWIFT infrastructure from risks exposed by the outsourcing of critical activities.

**Bridging SCF Controls:** TPM-03, TPM-04

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control 2.10

> Application Hardening

**Bridging SCF Controls:** CFG-02, CFG-02.7, CFG-03, IAC-20, IAC-21

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.ceip-disable -- Disable the ESX Customer Experience Improvement Program.
- esx-9.deactivate-mob -- The ESX Managed Object Browser (MOB) must be disabled.
- esx-9.deactivate-shell -- The ESX Shell must be disabled.
- esx-9.forensic-snapshots -- Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- esx-9.hardware-ports -- Disable or physically protect unused external server ports.
- esx-9.hardware-virtual-nic -- The ESX host must not enable virtual hardware management network interfaces.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.snmp -- The SNMP service on the ESX host must not be configured to start automatically.
- esx-9.ssh -- The ESX host's SSH service must be deactivated except for temporary diagnostic use.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
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
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.
- vcenter-9.ceip-disable -- Disable the vCenter Customer Experience Improvement Program.
- vcenter-9.client-feedback -- Disable vSphere Client in-product feedback.
- vcenter-9.client-telemetry -- Disable vSphere Client UI telemetry.
- vcenter-9.network-restrict-discovery-protocol -- Disable CDP/LLDP discovery protocols on distributed switches unless required.
- vcenter-9.snmp -- Disable SNMP v1 and v2c receivers on vCenter.
- vcenter-9.ssh -- Deactivate SSH access to the vCenter appliance except for temporary diagnostic use.
- vcenter-9.vds-health-check-disable -- Disable the vSphere Distributed Switch health check when not troubleshooting.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
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

### Control 4.1

> Password Policy

**Bridging SCF Controls:** CFG-02, IAC-10, IAC-10.1

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
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 5.1

> Logical Access Control: Enforce the security principles of need-to-know access, least privilege, and separation of duties for operator accounts.

**Bridging SCF Controls:** IAC-20, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 5.2

> Token Management

**Bridging SCF Controls:** CFG-02, CRY-01

**Relevant SCG Controls:**

- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 5.4

> Physical and Logical Password Storage

**Bridging SCF Controls:** IAC-10

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.

### Control 6.1

> Malware Protection

**Bridging SCF Controls:** MON-02, MON-02.2

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.

### Control 6.2

> Software Integrity

**Bridging SCF Controls:** MON-02, MON-02.2

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.

### Control 6.3

> Database Integrity

**Bridging SCF Controls:** MON-02, MON-02.2

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.

### Control 6.4

> Logging and Monitoring

**Bridging SCF Controls:** MON-02, MON-02.2, MON-08, MON-10

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-audit-local-capacity -- The ESX host must store audit records for a time period consistent with your records retention policy.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.action-history-retention -- Retain VCF Operations remediation action history for an appropriate interval.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- operations-9.log-retention -- Configure the VCF Operations log retention period.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.events-database-retention -- VMware vCenter must retain task and event data for an appropriate interval.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.
- vm-9.log-retention -- Virtual machines must limit the number of retained diagnostic logs.
