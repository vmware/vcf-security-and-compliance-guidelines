# Companion Guide to the NIST Cybersecurity Framework (CSF) 2.0 for VMware Cloud Foundation 9.1 -- Framework Controls by SCG Coverage

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://www.nist.gov/cyberframework

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

26 framework controls have at least one Security Configuration Guide hardening control mapped to them through the SCF crosswalk.

### Control DE.AE-03

> Information is correlated from multiple sources

**Bridging SCF Controls:** MON-02

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.

### Control DE.AE-06

> Information on adverse events is provided to authorized staff and tools  [Withdrawn: Incorporated into DE.AE-06]

**Bridging SCF Controls:** MON-02

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.

### Control DE.CM-01

> Networks and network services are monitored to find potentially adverse events  [Withdrawn: Incorporated into DE.CM-01, DE.CM-09]  [Withdrawn: Incorporated into DE.CM-01, DE.CM-03, DE.CM-06, DE.CM-09]

**Bridging SCF Controls:** MON-01.4

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.

### Control GV.SC

> A cybersecurity supply chain risk management program, strategy, objectives, policies, and processes are established and agreed to by organizational stakeholders  Cybersecurity roles and responsibilities for suppliers, customers, and partners are established, communicated, and coordinated internally and externally  Cybersecurity supply chain risk management is integrated into cybersecurity and enterprise risk management, risk assessment, and improvement processes  Suppliers are known and prioritized by criticality  Requirements to address cybersecurity risks in supply chains are established, prioritized, and integrated into contracts and other types of agreements with suppliers and other relevant third parties  Planning and due diligence are performed to reduce risks before entering into formal supplier or other third-party relationships  The risks posed by a supplier, their products and services, and other third parties are understood, recorded, prioritized, assessed, responded to, and monitored over the course of the relationship  Relevant suppliers and other third parties are included in incident planning, response, and recovery activities  Supply chain security practices are integrated into cybersecurity and enterprise risk management programs, and their performance is monitored throughout the technology product and service life cycle  Cybersecurity supply chain risk management plans include provisions for activities that occur after the conclusion of a partnership or service agreement  [Withdrawn: Incorporated into GV.RR-02, GV.SC-02]  [Withdrawn: Incorporated into GV.RM-05, GV.SC-01, GV.SC-06, GV.SC-09, GV.SC-10]  [Withdrawn: Incorporated into GV.OC-02, GV.SC-03, GV.SC-04, GV.SC-07, ID.RA-10]  [Withdrawn: Moved to GV.SC-05]  [Withdrawn: Incorporated into GV.SC-07, ID.RA-10]  [Withdrawn: Incorporated into GV.SC-08, ID.IM-02]

**Bridging SCF Controls:** TPM-03

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control GV.SC-06

> Planning and due diligence are performed to reduce risks before entering into formal supplier or other third-party relationships  [Withdrawn: Incorporated into GV.RM-05, GV.SC-01, GV.SC-06, GV.SC-09, GV.SC-10]

**Bridging SCF Controls:** TPM-03, TPM-04

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control GV.SC-07

> The risks posed by a supplier, their products and services, and other third parties are understood, recorded, prioritized, assessed, responded to, and monitored over the course of the relationship  [Withdrawn: Incorporated into GV.OC-02, GV.SC-03, GV.SC-04, GV.SC-07, ID.RA-10]  [Withdrawn: Incorporated into GV.SC-07, ID.RA-10]

**Bridging SCF Controls:** TPM-03, TPM-04

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control ID.RA-07

> Changes and exceptions are managed, assessed for risk impact, recorded, and tracked  [Withdrawn: Incorporated into PR.PS-01, ID.RA-07]

**Bridging SCF Controls:** CHG-02, CHG-04

**Relevant SCG Controls:**

- esx-9.hardware-management-config-lock -- Lock the hardware management controller configuration after provisioning.
- guest-9.tools-add-feature -- The guest OS must disable automatic addition of optional VMware Tools features.
- guest-9.tools-allow-transforms -- The guest OS must disable MSI transforms in VMware Tools auto-upgrades.
- guest-9.tools-globalconf -- The guest OS must deactivate GlobalConf unless required.
- guest-9.tools-prevent-recustomization -- The guest OS must prevent re-customization of an already-deployed VM.
- guest-9.tools-remove-feature -- The guest OS must disable automatic removal of optional VMware Tools features.
- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.
- vsan-9.managed-disk-claim -- vSAN must disable managed disk claims.

### Control ID.RA-09

> The authenticity and integrity of hardware and software are assessed prior to acquisition and use  [Withdrawn: Incorporated into ID.RA-09, DE.CM-09]

**Bridging SCF Controls:** AST-18, TDA-01.2

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.vib-acceptance-level-supported -- The ESX host image profile acceptance level must be PartnerSupported or higher.
- operations-9.unsigned-pak -- VCF Operations must disable unsigned management pack installation.

### Control PR.AA

> Identities and credentials for authorized users, services, and hardware are managed by the organization  Identities are proofed and bound to credentials based on the context of interactions  Users, services, and hardware are authenticated  Identity assertions are protected, conveyed, and verified  Access permissions, entitlements, and authorizations are defined in a policy, managed, enforced, and reviewed, and incorporate the principles of least privilege and separation of duties  Physical access to assets is managed, monitored, and enforced commensurate with risk  [Withdrawn: Incorporated into PR.AA-01, PR.AA-05]  [Withdrawn: Moved to PR.AA-06]  [Withdrawn: Incorporated into PR.AA-03, PR.AA-05, PR.IR-01]  [Withdrawn: Moved to PR.AA-05]  [Withdrawn: Moved to PR.AA-02]  [Withdrawn: Moved to PR.AA-03]  [Withdrawn: Incorporated into PR.AA-06, PR.IR-01]

**Bridging SCF Controls:** IAC-01.2

**Relevant SCG Controls:**

- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.

### Control PR.AA-01

> Identities and credentials for authorized users, services, and hardware are managed by the organization  [Withdrawn: Incorporated into PR.AA-01, PR.AA-05]

**Bridging SCF Controls:** IAC-02, IAC-04

**Relevant SCG Controls:**

- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control PR.AA-03

> Users, services, and hardware are authenticated  [Withdrawn: Incorporated into PR.AA-03, PR.AA-05, PR.IR-01]  [Withdrawn: Moved to PR.AA-03]

**Bridging SCF Controls:** IAC-01.2, IAC-02, IAC-04

**Relevant SCG Controls:**

- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control PR.AA-04

> Identity assertions are protected, conveyed, and verified

**Bridging SCF Controls:** IAC-01.2

**Relevant SCG Controls:**

- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.

### Control PR.AA-05

> Access permissions, entitlements, and authorizations are defined in a policy, managed, enforced, and reviewed, and incorporate the principles of least privilege and separation of duties  [Withdrawn: Incorporated into PR.AA-01, PR.AA-05]  [Withdrawn: Incorporated into PR.AA-03, PR.AA-05, PR.IR-01]  [Withdrawn: Moved to PR.AA-05]

**Bridging SCF Controls:** IAC-01.2, IAC-02, IAC-04, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control PR.DS-01

> The confidentiality, integrity, and availability of data-at-rest are protected  [Withdrawn: Incorporated into PR.DS-01, PR.DS-02, PR.DS-10]  [Withdrawn: Incorporated into PR.DS-01, DE.CM-09]  [Withdrawn: Incorporated into PR.DS-01, PR.PS-01]

**Bridging SCF Controls:** CRY-01, CRY-01.1, CRY-05

**Relevant SCG Controls:**

- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- esx-9.memory-tiering-encryption -- The ESX host should encrypt data written to tiered memory devices.
- esx-9.tpm-configuration -- The ESX host must require TPM-based configuration encryption.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.
- vsan-9.encryption-rest -- vSAN must protect data at rest.

### Control PR.DS-02

> The confidentiality, integrity, and availability of data-in-transit are protected  [Withdrawn: Incorporated into PR.DS-01, PR.DS-02, PR.DS-10]

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

### Control PR.DS-10

> [Withdrawn: Incorporated into PR.DS-01, PR.DS-02, PR.DS-10]  The confidentiality, integrity, and availability of data-in-use are protected

**Bridging SCF Controls:** CFG-02, CRY-01, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control PR.DS-11

> Backups of data are created, protected, maintained, and tested  [Withdrawn: Moved to PR.DS-11]

**Bridging SCF Controls:** BCD-11

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.

### Control PR.IR-04

> [Withdrawn: Moved to PR.IR-04]  Adequate resource capacity to ensure availability is maintained

**Bridging SCF Controls:** CAP-01, CAP-02

**Relevant SCG Controls:**

- automation-9.operation-limits -- Configure operation limits in VCF Automation to bound resource-intensive operations.
- nsx-9.api-rate-limits -- Configure NSX Manager API rate and concurrency limits.
- vcenter-9.drs -- VMware vCenter must enable the Distributed Resource Scheduler for resilience and to enable automated patching.
- vcenter-9.network-nioc -- Enable Network I/O Control on distributed switches.
- vm-9.deactivate-disk-shrinking-shrink -- Virtual machines must have virtual disk shrinking operations deactivated.
- vm-9.deactivate-disk-shrinking-wiper -- Virtual machines must have virtual disk wiping operations deactivated.
- vm-9.limit-setinfo-size -- Virtual machines must limit informational messages from the virtual machine to the VMX file.
- vsan-9.automatic-rebalance -- vSAN must enable automatic data rebalancing.
- vsan-9.operations-reserve -- vSAN must reserve space to complete internal maintenance operations.

### Control PR.PS

> [Withdrawn: Incorporated into ID.AM-08, PR.PS-03]  Configuration management practices are established and applied  Software is maintained, replaced, and removed commensurate with risk  Hardware is maintained, replaced, and removed commensurate with risk  Log records are generated and made available for continuous monitoring  Installation and execution of unauthorized software are prevented  Secure software development practices are integrated, and their performance is monitored throughout the software development life cycle  [Withdrawn: Incorporated into PR.PS-01]  [Withdrawn: Incorporated into ID.AM-08, PR.PS-06]  [Withdrawn: Incorporated into PR.PS-01, ID.RA-07]  [Withdrawn: Incorporated into ID.RA-01, PR.PS-02]  [Withdrawn: Incorporated into ID.AM-08, PR.PS-02]  [Withdrawn: Incorporated into PR.PS-04]  [Withdrawn: Incorporated into PR.DS-01, PR.PS-01]

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control PR.PS-02

> Software is maintained, replaced, and removed commensurate with risk  [Withdrawn: Incorporated into ID.RA-01, PR.PS-02]  [Withdrawn: Incorporated into ID.AM-08, PR.PS-02]

**Bridging SCF Controls:** TDA-17, VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.supported -- vCenter must run a version that has not reached End of General Support.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control PR.PS-03

> [Withdrawn: Incorporated into ID.AM-08, PR.PS-03]  Hardware is maintained, replaced, and removed commensurate with risk

**Bridging SCF Controls:** TDA-17

**Relevant SCG Controls:**

- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.
- vcenter-9.supported -- vCenter must run a version that has not reached End of General Support.

### Control PR.PS-04

> Log records are generated and made available for continuous monitoring  [Withdrawn: Incorporated into PR.PS-04]

**Bridging SCF Controls:** MON-01.4, MON-03

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control PR.PS-05

> Installation and execution of unauthorized software are prevented

**Bridging SCF Controls:** CFG-02, CFG-03, CFG-03.2

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
- esx-9.vib-trusted-binaries -- The ESX host must only execute binaries delivered through a signed VIB.
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

### Control RS.AN

> [Withdrawn: Incorporated into RS.MA-02]  [Withdrawn: Incorporated into RS.MA-02, RS.MA-03, RS.MA-04]  Analysis is performed to establish what has taken place during an incident and the root cause of the incident  [Withdrawn: Moved to RS.MA-03]  [Withdrawn: Moved to ID.RA-08]  Actions performed during an investigation are recorded, and the records' integrity and provenance are preserved  Incident data and metadata are collected, and their integrity and provenance are preserved  An incident's magnitude is estimated and validated

**Bridging SCF Controls:** IRO-08

**Relevant SCG Controls:**

- esx-9.forensic-snapshots -- Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.

### Control RS.AN-06

> Actions performed during an investigation are recorded, and the records' integrity and provenance are preserved

**Bridging SCF Controls:** IRO-08

**Relevant SCG Controls:**

- esx-9.forensic-snapshots -- Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.

### Control RS.AN-07

> Incident data and metadata are collected, and their integrity and provenance are preserved

**Bridging SCF Controls:** IRO-08

**Relevant SCG Controls:**

- esx-9.forensic-snapshots -- Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.
