# Companion Guide to NIST SP 800-207 for VMware Cloud Foundation 9.1 -- SCG Hardening Controls

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://csrc.nist.gov/pubs/sp/800/207/final

This guidance evolves. Please check the current revision at: https://brcm.tech/vcf-compliance

## Disclaimer

This kit is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.

This material is provided as is and any express or implied warranties, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose are disclaimed. In no event shall the copyright holder or contributors be liable for any direct, indirect, incidental, special, exemplary, or consequential damages (including, but not limited to, procurement of substitute goods or services; loss of use, data, or profits; or business interruption) however caused and on any theory of liability, whether in contract, strict liability, or tort (including negligence or otherwise) arising in any way out of the use of this software, even if advised of the possibility of such damage. The provider makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of this sample. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations. You acknowledge that there may be performance or other considerations, and that these examples may make assumptions which may not be valid in your environment or organization.

## Third Party Identifiers and Mappings

This document includes regulatory compliance and security control identifiers from external sources as a convenience to end users. This does not constitute endorsement, in either direction.

There is not a one-to-one mapping of product capabilities to third-party controls. A product capability, or set of capabilities, may be applicable to multiple controls. Conversely, a control may be satisfied with the use of multiple capabilities.

Control identifier numbers have been included from the Secure Controls Framework, version 2026.1, under the terms of the Creative Commons Attribution-NoDerivatives 4.0 International Public License. No modifications have been made to the control identifier numbers under the terms of the license.

https://securecontrolsframework.com/

## SCG Hardening Controls Relevant to This Framework

68 Security Configuration Guide controls map to this framework through the SCF crosswalk, grouped below by product component.

### Automation

#### automation-9.oidc-settings

Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** Tenet 2

### ESX

#### esx-9.ad-admin-group-autoadd

The ESX host must not automatically grant administrative permissions to Active Directory groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** Tenet 3

#### esx-9.cpu-hyperthread-warning

The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-01.4

**Mapped Framework Controls:** Tenet 7

#### esx-9.entropy

The ESX host must use sufficient entropy for cryptographic operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** Tenet 2

#### esx-9.firewall-incoming-default

The ESX host must configure the firewall to block network traffic by default.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04.1

**Mapped Framework Controls:** Tenet 4

#### esx-9.firewall-restrict-access

Configure the ESX host firewall to only allow traffic from authorized networks.

**Implementation Priority:** P0

**Bridging SCF Controls:** NET-04.1

**Mapped Framework Controls:** Tenet 4

#### esx-9.hardware-cpu-amd-cc

Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** Tenet 2

#### esx-9.hardware-cpu-intel-cc

Enable Intel SGX and TDX in system firmware where available.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** Tenet 2

#### esx-9.hardware-management-log-forwarding

Forward hardware management controller logs to a central log server.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02, MON-02.2

**Mapped Framework Controls:** Tenet 5, Tenet 7

#### esx-9.iscsi-mutual-chap

Enable bidirectional/mutual CHAP authentication for iSCSI traffic.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** IAC-04

**Mapped Framework Controls:** Tenet 2, Tenet 3, Tenet 4

#### esx-9.lockdown-dcui-access

Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** Tenet 3

#### esx-9.lockdown-exception-users

Keep the Lockdown Mode Exception Users list to the minimum necessary.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** Tenet 3

#### esx-9.log-audit-forwarding

The ESX host must transmit audit records to a remote host.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02

**Mapped Framework Controls:** Tenet 5, Tenet 7

#### esx-9.log-forwarding

The ESX host must forward system and audit logs to a remote log collection point.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02

**Mapped Framework Controls:** Tenet 5, Tenet 7

#### esx-9.log-forwarding-tls-ciphers

The ESX host must verify certificates for TLS remote logging endpoints.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** Tenet 2

#### esx-9.network-bpdu

Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** Tenet 4

#### esx-9.network-dvfilter

Use of the dvFilter network APIs must be restricted on the ESX host.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** Tenet 4

#### esx-9.network-rpf-promisc

The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** Tenet 4

#### esx-9.network-standard-reject-forged-transmit

Reject forged transmits on standard switches and port groups.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** Tenet 4

#### esx-9.network-standard-reject-mac-changes

Reject guest MAC address changes on standard switches and port groups.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** Tenet 4

#### esx-9.network-standard-reject-promiscuous-mode

Reject promiscuous mode on standard switches and port groups.

**Implementation Priority:** P2, Upon Feature Enablement

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** Tenet 4

#### esx-9.nfs-traffic-protection

Protect NFS datastore traffic on the ESX host using encryption or network isolation.

**Implementation Priority:** P1, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** Tenet 2

#### esx-9.shell-warning

The ESX host must not suppress warnings that the local or remote shell is enabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-01.4

**Mapped Framework Controls:** Tenet 7

#### esx-9.tls-ciphers

The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** Tenet 2

#### esx-9.vmk-storage

The ESX host must protect the confidentiality and integrity of transmitted storage traffic.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** Tenet 2

#### esx-9.vmk-vmotion

The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** Tenet 2

#### esx-9.vmotion-encryption-offload

Accelerate vMotion encryption using available hardware offload on ESX hosts.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** Tenet 2

#### guest-9.tools-log-forwarding

The guest OS must send VMware Tools logs to the system log service.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02

**Mapped Framework Controls:** Tenet 5, Tenet 7

#### vm-9.dvfilter

Virtual machines must limit access through the dvFilter API.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** Tenet 4

#### vm-9.ft-encrypted

Virtual machines must require encryption for Fault Tolerance.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** Tenet 2

#### vm-9.isolation-device-connectable-deactivate

Virtual machines must prevent unauthorized removal, connection, and modification of devices.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** Tenet 3

#### vm-9.pci-passthrough

Virtual machines must limit PCI device passthrough functionality.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** Tenet 3

#### vm-9.vmotion-encrypted

Virtual machines must require encryption for vMotion.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** Tenet 2

### NSX

#### nsx-9.bgp-encryption

Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-04

**Mapped Framework Controls:** Tenet 2

#### nsx-9.load-balancer-fips

Enable FIPS-validated cryptography for NSX load balancers.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-01, CRY-03

**Mapped Framework Controls:** Tenet 2

#### nsx-9.ospf-encryption

NSX Tier-0 Gateway must enable OSPF authentication.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-04

**Mapped Framework Controls:** Tenet 2

#### nsx-9.tls-ciphers

NSX Manager must use TLS with approved protocol versions and cipher suites.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** Tenet 2

### Operations

#### operations-9.credential-ownership-enforcement

VCF Operations must enable credential ownership enforcement.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-08

**Mapped Framework Controls:** Tenet 4

#### operations-9.firewall-hardening

VCF Operations must enable firewall hardening.

**Implementation Priority:** P0

**Bridging SCF Controls:** NET-04.1

**Mapped Framework Controls:** Tenet 4

#### operations-9.log-collection

Configure VCF Operations log collection for all deployed components.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02, MON-02.2

**Mapped Framework Controls:** Tenet 5, Tenet 7

#### operations-9.logs-authenticated-ingestion

Require authenticated log ingestion in VCF Operations.

**Implementation Priority:** P0

**Bridging SCF Controls:** NET-04.12

**Mapped Framework Controls:** Tenet 4

#### operations-9.logs-ssl-api

Enable SSL for API log ingestion in VCF Operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** Tenet 2

#### operations-9.logs-ssl-syslog

Enable SSL for syslog log ingestion in VCF Operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** Tenet 2

### Protection and Recovery

#### pnr-9.log-forwarding

The VCF Protection and Recovery appliance must forward its logs to a central log server.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02

**Mapped Framework Controls:** Tenet 5, Tenet 7

### vCenter

#### vcenter-9.administration-sso-groups

VMware vCenter must separate authentication and authorization for administrators.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-01.2

**Mapped Framework Controls:** Tenet 2, Tenet 3, Tenet 4, Tenet 6

#### vcenter-9.content-library-authentication

VMware vCenter must require authentication for published content libraries.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** IAC-20.1

**Mapped Framework Controls:** Tenet 3

#### vcenter-9.log-forwarding

VMware vCenter must forward its logs to a central log server.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02

**Mapped Framework Controls:** Tenet 5, Tenet 7

#### vcenter-9.network-reject-promiscuous-mode-dvportgroup

Reject promiscuous mode on distributed switches and port groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** Tenet 4

#### vcenter-9.network-reset-port

Reset distributed switch port configuration when a virtual machine disconnects.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-06

**Mapped Framework Controls:** Tenet 5

#### vcenter-9.network-restrict-netflow-usage

Send distributed switch NetFlow data only to authorized collectors.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** Tenet 4

#### vcenter-9.network-restrict-port-level-overrides

Disallow per-port policy overrides on distributed port groups, except port blocking.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-06

**Mapped Framework Controls:** Tenet 5

#### vcenter-9.network-vgt

Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** Tenet 4

#### vcenter-9.smtp

Send vCenter notification email over a secure SMTP connection.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** Tenet 2

#### vcenter-9.snmp3

Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** Tenet 2

#### vcenter-9.tls-ciphers

vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** Tenet 2

#### vcenter-9.vami-firewall-restrict-access

Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.

**Implementation Priority:** P0

**Bridging SCF Controls:** NET-04.1

**Mapped Framework Controls:** Tenet 4

### VCF

#### vcf-9.mfa

Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-02

**Mapped Framework Controls:** Tenet 3

#### vcf-9.perimeter-firewall

Limit access to VCF component management interfaces with perimeter firewalls.

**Implementation Priority:** P0

**Bridging SCF Controls:** NET-04.1

**Mapped Framework Controls:** Tenet 4

#### vcf-9.permissions-roles

Review and right-size accounts, permissions, and role assignments across all VCF components.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** Tenet 3

#### vcf-9.secure-baseline

Apply the controls in this guidance, and document the rationale for any deviations.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-02, CFG-02.7

**Mapped Framework Controls:** Tenet 5

### vSAN

#### vsan-9.auto-policy-management

vSAN automatic policy management must remain disabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** CHG-02

**Mapped Framework Controls:** Tenet 5

#### vsan-9.encryption-transit-esa

vSAN must protect data in transit between hosts.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** Tenet 2

#### vsan-9.encryption-transit-osa

vSAN must protect data in transit between hosts.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** Tenet 2

#### vsan-9.file-services-access-control-nfs

NFS file shares on vSAN File Services must be configured to restrict access.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-04, NET-04.1

**Mapped Framework Controls:** Tenet 4

#### vsan-9.file-services-authentication-smb

SMB file shares on vSAN File Services must require protocol encryption.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** Tenet 2

#### vsan-9.force-provisioning

vSAN must not provision storage when storage policy requirements cannot be met.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-06

**Mapped Framework Controls:** Tenet 5

#### vsan-9.iscsi-mutual-chap

vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** IAC-04

**Mapped Framework Controls:** Tenet 2, Tenet 3, Tenet 4

#### vsan-9.storage-cluster-traffic-protection

vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** Tenet 2
