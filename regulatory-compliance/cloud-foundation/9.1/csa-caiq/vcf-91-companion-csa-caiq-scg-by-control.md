# Companion Guide to the CSA Consensus Assessments Initiative Questionnaire (CAIQ) 4.1.0 for VMware Cloud Foundation 9.1 -- Framework Controls by SCG Coverage

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://cloudsecurityalliance.org/research/cloud-controls-matrix

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

67 framework controls have at least one Security Configuration Guide hardening control mapped to them through the SCF crosswalk.

### Control AIS-02.1

> Are baseline requirements to secure applications established, documented, and maintained?

**Bridging SCF Controls:** CFG-02, CFG-02.7, CFG-03, CFG-03.1

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
- nsx-9.inactive-interfaces -- NSX Tier-0 Gateway must remove inactive interfaces.
- nsx-9.multicast-disable -- NSX Tier-0 Gateway must disable multicast and PIM where they are not required.
- nsx-9.routing-protocols-unused -- Disable Tier-0 Gateway routing protocols that are not in use.
- nsx-9.snmp -- NSX Manager must not use SNMP v1 or v2c.
- nsx-9.ssh -- The NSX Manager SSH service must be deactivated except for temporary diagnostic use.
- nsx-9.t1-dhcp-disable -- Disable Tier-1 Gateway DHCP service when not in use.
- nsx-9.t1-inactive-interfaces -- Remove inactive interfaces and stale linked segments from Tier-1 Gateways.
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

### Control BCR-03.1

> Are strategies being established to reduce the impact of business disruptions, and are resiliency and recovery from business disruptions being improved?

**Bridging SCF Controls:** BCD-02.2, BCD-11.7, BCD-12.2

**Relevant SCG Controls:**

- nsx-9.service-resilience -- When NSX Manager runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.
- operations-9.service-resilience -- When VCF Operations runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.
- vcenter-9.drs -- VMware vCenter must enable the Distributed Resource Scheduler for resilience and to enable automated patching.
- vcenter-9.service-resilience-evc -- Enable Enhanced vMotion Compatibility on vCenter clusters.
- vcenter-9.service-resilience-ha -- Enable vSphere High Availability on clusters.
- vcenter-9.service-resilience-vmotion -- Enable vMotion for live workload migration.
- vsan-9.auto-raid -- vSAN ESA automatic RAID management must remain enabled.

### Control BCR-08.1

> Are backups performed periodically?

**Bridging SCF Controls:** BCD-11, BCD-11.4

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.
- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.

### Control BCR-08.2

> Is the confidentiality, integrity, and availability of the backup ensured?

**Bridging SCF Controls:** BCD-11, BCD-11.4

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.
- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.

### Control BCR-08.3

> Can backups be restored appropriately for resiliency?

**Bridging SCF Controls:** BCD-11, BCD-11.4

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.
- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.

### Control BCR-11.1

> Are business-critical equipment supplemented with both locally redundant and geographically dispersed equipment located at a reasonable minimum distance, in accordance with applicable industry standards?

**Bridging SCF Controls:** BCD-11.7, BCD-12.2

**Relevant SCG Controls:**

- nsx-9.service-resilience -- When NSX Manager runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.
- operations-9.service-resilience -- When VCF Operations runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.
- vcenter-9.service-resilience-ha -- Enable vSphere High Availability on clusters.

### Control CCC-02.1

> Is a defined quality change control, approval and testing process, incorporating baselines, testing, and release standards, established, maintained and implemented?

**Bridging SCF Controls:** CHG-02

**Relevant SCG Controls:**

- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.

### Control CCC-03.1

> Is a change management procedure implemented to manage the risks associated with applying changes to assets, owned, controlled or used by the organization?

**Bridging SCF Controls:** CHG-02

**Relevant SCG Controls:**

- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.

### Control CCC-04.1

> Is a procedure to authorize the addition, removal, update, and management of assets owned, controlled, or used by the organization, implemented and enforced?

**Bridging SCF Controls:** CHG-04

**Relevant SCG Controls:**

- esx-9.hardware-management-config-lock -- Lock the hardware management controller configuration after provisioning.
- guest-9.tools-add-feature -- The guest OS must disable automatic addition of optional VMware Tools features.
- guest-9.tools-allow-transforms -- The guest OS must disable MSI transforms in VMware Tools auto-upgrades.
- guest-9.tools-globalconf -- The guest OS must deactivate GlobalConf unless required.
- guest-9.tools-prevent-recustomization -- The guest OS must prevent re-customization of an already-deployed VM.
- guest-9.tools-remove-feature -- The guest OS must disable automatic removal of optional VMware Tools features.
- vsan-9.managed-disk-claim -- vSAN must disable managed disk claims.

### Control CCC-05.1

> Are provisions to limit changes directly impacting service customer-owned environments (tenants) to explicitly authorized requests included within service level agreements?

**Bridging SCF Controls:** CHG-02

**Relevant SCG Controls:**

- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.

### Control CCC-06.1

> Are change management and configuration baselines established, documented and implemented for all relevant authorized changes on organizational assets?

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control CCC-06.2

> Are the baselines reviewed and updated at least annually or upon significant changes?

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control CCC-08.1

> Is a procedure implemented to manage exceptions, including emergencies, in the change and configuration process?

**Bridging SCF Controls:** CFG-02.7

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control CCC-08.2

> Is the procedure aligned with the requirements of the GRC-04: Policy Exception Process?

**Bridging SCF Controls:** CFG-02.7

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control CCC-09.1

> Is a process to proactively roll back changes to a previously known "good state" defined and implemented in case of errors or security concerns?

**Bridging SCF Controls:** CHG-02

**Relevant SCG Controls:**

- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.

### Control CEK-01.1

> Are cryptography, encryption, and key management policies and procedures established, documented, approved, communicated, applied, evaluated, and maintained?

**Bridging SCF Controls:** CRY-01

**Relevant SCG Controls:**

- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

### Control CEK-01.2

> Are cryptography, encryption, and key management policies and procedures reviewed and updated at least annually, upon significant changes?

**Bridging SCF Controls:** CRY-01

**Relevant SCG Controls:**

- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

### Control CEK-02.1

> Are cryptography, encryption, and key management roles and responsibilities defined and implemented?

**Bridging SCF Controls:** CRY-01

**Relevant SCG Controls:**

- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

### Control CEK-03.1

> Are data protection at-rest and in-transit, and where applicable in use, provided using cryptographic libraries certified to approved standards?

**Bridging SCF Controls:** CRY-01, CRY-03, CRY-05

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
- vm-9.ft-encrypted -- Virtual machines must require encryption for Fault Tolerance.
- vm-9.vmotion-encrypted -- Virtual machines must require encryption for vMotion.
- vsan-9.encryption-rest -- vSAN must protect data at rest.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control CEK-04.1

> Are encryption algorithms following industry standards utilized for protecting data, based on the data classification and associated risks?

**Bridging SCF Controls:** CRY-01

**Relevant SCG Controls:**

- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

### Control CEK-05.1

> Are standard change management procedures established to review, approve, implement and communicate cryptography, encryption, and key management technology changes that accommodate internal and external sources?

**Bridging SCF Controls:** CHG-02

**Relevant SCG Controls:**

- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.

### Control CEK-08.1

> Are service providers providing service customers with the capacity to manage their own data encryption keys?

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control CEK-10.1

> Are cryptographic keys generated using industry-accepted and approved cryptographic libraries that specify algorithm strength and random number generator specifications?

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control CEK-11.1

> Are private keys provisioned for a unique purpose managed, and is cryptography secret?

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control CEK-12.1

> Are cryptographic keys rotated based on a cryptoperiod calculated while considering information disclosure risks and legal and regulatory requirements?

**Bridging SCF Controls:** CRY-09, CRY-09.3

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control CEK-13.1

> Are cryptographic keys revoked and removed before the end of the established cryptoperiod (when a key is compromised, or an entity is no longer part of the organization) per defined, implemented, and evaluated processes, procedures, and technical measures to include legal and regulatory requirement provisions?

**Bridging SCF Controls:** CRY-09, CRY-09.3

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control CEK-14.1

> Are processes, procedures and technical measures to securely destroy cryptographic keys when they are no longer needed, defined, implemented, and evaluated, and include provisions for legal and regulatory requirements?

**Bridging SCF Controls:** CRY-09, CRY-09.3

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control CEK-15.1

> Are processes, procedures, and technical measures to create keys in a pre-activated state (i.e., when they have been generated but not authorized for use) being defined, implemented, and evaluated to include legal and regulatory requirement provisions?

**Bridging SCF Controls:** CRY-09, CRY-09.3

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control CEK-16.1

> Are processes, procedures, and technical measures to monitor, review and approve key transitions (e.g., from any state to/from suspension) being defined, implemented, and evaluated to include legal and regulatory requirement provisions?

**Bridging SCF Controls:** CRY-09, CRY-09.3

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control CEK-17.1

> Are processes, procedures, and technical measures to deactivate keys (at the time of their expiration date) being defined, implemented, and evaluated to include legal and regulatory requirement provisions?

**Bridging SCF Controls:** CRY-09, CRY-09.3

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control CEK-18.1

> Are processes, procedures, and technical measures to manage archived keys in a secure repository (requiring least privilege access) being defined, implemented, and evaluated to include legal and regulatory requirement provisions?

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control CEK-19.1

> Are processes, procedures, and technical measures to use compromised keys to encrypt information in specific scenarios (e.g., only in controlled circumstances and thereafter only for data decryption and never for encryption) defined, implemented, and evaluated to include legal and regulatory requirement provisions?

**Bridging SCF Controls:** CRY-09, CRY-09.3

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control CEK-20.1

> Are processes, procedures, and technical measures to assess operational continuity risks (versus the risk of losing control of keying material and exposing protected data) being defined, implemented, and evaluated to include legal and regulatory requirement provisions?

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control CEK-21.1

> Are key management system processes, procedures, and technical measures being defined, implemented, and evaluated to track and report all cryptographic materials and status changes that include legal and regulatory requirements provisions?

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control DCS-09.1

> Is equipment identification used as a method for connection authentication?

**Bridging SCF Controls:** IAC-04

**Relevant SCG Controls:**

- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control DSP-10.1

> Are processes, procedures, and technical measures defined, implemented, and evaluated to ensure any transfer of personal or sensitive data is protected from unauthorized access and only processed within scope (as permitted by respective laws and regulations)?

**Bridging SCF Controls:** CRY-01, CRY-03

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
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
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

### Control DSP-17.1

> Are processes, procedures, and technical measures defined and implemented to protect sensitive data throughout its lifecycle?

**Bridging SCF Controls:** IAC-20.1

**Relevant SCG Controls:**

- vcenter-9.content-library-authentication -- VMware vCenter must require authentication for published content libraries.

### Control I&S-02.1

> Is resource availability, quality, and capacity planned and monitored in a way that delivers required system performance, as determined by the business?

**Bridging SCF Controls:** CAP-01

**Relevant SCG Controls:**

- vcenter-9.drs -- VMware vCenter must enable the Distributed Resource Scheduler for resilience and to enable automated patching.
- vsan-9.automatic-rebalance -- vSAN must enable automatic data rebalancing.
- vsan-9.operations-reserve -- vSAN must reserve space to complete internal maintenance operations.

### Control I&S-04.1

> Is every host and guest OS, hypervisor, or infrastructure control plane hardened (according to their respective best practices) and supported by technical controls as part of a security baseline?

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control I&S-06.1

> Are applications and infrastructures designed, developed, deployed, and configured such that service customer (tenant) access is appropriately segmented, segregated, monitored, and restricted?

**Bridging SCF Controls:** NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control IAM-05.1

> Is the least privilege principle employed when implementing information system access?

**Bridging SCF Controls:** IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control IAM-06.1

> Is an identity access provisioning process defined and implemented which authorizes, records, and communicates data and assets access changes?

**Bridging SCF Controls:** IAC-07

**Relevant SCG Controls:**

- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.

### Control IAM-07.1

> Is a process in place to de-provision or modify identity access in a timely manner?

**Bridging SCF Controls:** IAC-07

**Relevant SCG Controls:**

- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.

### Control IAM-08.1

> Are reviews and revalidation of identity access for least privilege and separation of duties completed with a frequency commensurate with organizational risk tolerance, and at least annually or upon significant changes?

**Bridging SCF Controls:** IAC-17

**Relevant SCG Controls:**

- esx-9.ad-admin-validate-interval -- The ESX host must not disable validation of users and groups.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.

### Control IAM-09.1

> Are processes, procedures, and technical measures for the segregation of privileged access roles defined, implemented, and evaluated?

**Bridging SCF Controls:** IAC-16, IAC-17

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.ad-admin-validate-interval -- The ESX host must not disable validation of users and groups.
- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.

### Control IAM-10.1

> Is an access process defined and implemented to ensure privileged access roles and rights are granted for a limited period?

**Bridging SCF Controls:** IAC-16, IAC-17

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.ad-admin-validate-interval -- The ESX host must not disable validation of users and groups.
- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.

### Control IAM-10.2

> Are procedures implemented to prevent the accumulation of segregated privileged access?

**Bridging SCF Controls:** IAC-16, IAC-17

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.ad-admin-validate-interval -- The ESX host must not disable validation of users and groups.
- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.

### Control IAM-11.1

> Are processes and procedures for service customers to participate, where applicable, in granting access for agreed, high risk as (defined by the organizational risk assessment) privileged access roles defined, implemented and evaluated?

**Bridging SCF Controls:** IAC-16, IAC-17, TPM-03, TPM-04

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.ad-admin-validate-interval -- The ESX host must not disable validation of users and groups.
- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.
- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.

### Control IAM-13.1

> Are processes, procedures, and technical measures for authenticating access to systems, application, and data assets including multifactor authentication for a least-privileged user and sensitive data access defined, implemented, and evaluated?

**Bridging SCF Controls:** IAC-02, IAC-04, IAC-10.1, IAC-10.2, IAC-21

**Relevant SCG Controls:**

- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.log-forwarding-tls-x509 -- The ESX host must use strict x509 verification for TLS-enabled remote logging endpoints.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.certificates-validation -- VCF Operations must activate certificate validation.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control IAM-13.2

> Are digital certificates or alternatives that achieve an equivalent security level for system identities adopted?

**Bridging SCF Controls:** IAC-02, IAC-04, IAC-10.1, IAC-10.2, IAC-21

**Relevant SCG Controls:**

- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.log-forwarding-tls-x509 -- The ESX host must use strict x509 verification for TLS-enabled remote logging endpoints.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.certificates-validation -- VCF Operations must activate certificate validation.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control IAM-14.1

> Are processes, procedures, and technical measures for the secure management of authentication credentials, including passwords, defined, implemented, and evaluated?

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

### Control IAM-15.1

> Are processes, procedures, and technical measures to verify access to data and system functions authorized, defined, implemented, and evaluated?

**Bridging SCF Controls:** IAC-10, IAC-10.1, IAC-10.4, IAC-10.8

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.ad-admin-group-name -- The ESX host must not use the default "ESX Admins" Active Directory group.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- sddc-9.api-admin -- SDDC Manager must configure the API admin account.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control LOG-02.1

> Are processes, procedures, and technical measures defined, implemented, and evaluated to ensure audit log security and retention?

**Bridging SCF Controls:** MON-08

**Relevant SCG Controls:**

- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.

### Control LOG-03.1

> Are security-related events identified and monitored within applications and the underlying infrastructure?

**Bridging SCF Controls:** MON-01.4

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.

### Control LOG-03.2

> Is a system defined and implemented to generate alerts to responsible stakeholders based on security events and their corresponding metrics?

**Bridging SCF Controls:** MON-01.4

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.

### Control LOG-04.1

> Is audit log access restricted to authorized identities, and are records of that access maintained?

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

### Control LOG-06.1

> Is a reliable time source being used across all relevant information processing systems?

**Bridging SCF Controls:** SEA-20

**Relevant SCG Controls:**

- esx-9.hardware-management-time -- Synchronize hardware management controller time with organizational reference sources.
- esx-9.time -- The ESX host must synchronize its clock with organizational reference sources.
- fleet-9.time -- Configure fleet-wide time synchronization.
- pnr-9.time -- The VCF Protection and Recovery appliance must synchronize its clock with organizational reference sources.
- vcenter-9.time -- vCenter must synchronize its clock with organizational reference sources.

### Control LOG-09.1

> Are audit records generated, and do they contain relevant security information?

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

### Control LOG-10.1

> Are audit records protected from unauthorized access, modification, and deletion?

**Bridging SCF Controls:** MON-08

**Relevant SCG Controls:**

- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.

### Control LOG-11.1

> Are monitoring and internal reporting capabilities established to report on cryptographic operations, encryption, and key management policies, processes, procedures, and controls?

**Bridging SCF Controls:** CRY-01, CRY-09

**Relevant SCG Controls:**

- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control LOG-12.1

> Are key lifecycle management events logged and monitored to enable auditing and reporting on cryptographic keys' usage?

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

### Control TVM-08.1

> Are processes, procedures and technical measures defined, implemented and evaluated based on identified risks to support scheduled and emergency responses to vulnerability identification?

**Bridging SCF Controls:** VPM-04

**Relevant SCG Controls:**

- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.

### Control TVM-10.1

> Is a risk-based method used for the prioritization and mitigation of threats, leveraging an industry-recognized framework to guide threat decision-making and protection measures?

**Bridging SCF Controls:** VPM-04

**Relevant SCG Controls:**

- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.

### Control UEM-06.1

> Are all relevant interactive-use endpoints configured to require an automatic lock screen?

**Bridging SCF Controls:** IAC-24

**Relevant SCG Controls:**

- vm-9.vmrc-lock -- Virtual machines must be configured to lock when the last console connection is closed.

### Control UEM-07.1

> Are changes to endpoint operating systems, patch levels, and/or applications managed through the organizational change management process?

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control UEM-08.1

> Is information protected from unauthorized disclosure on managed endpoints with storage encryption?

**Bridging SCF Controls:** CRY-05

**Relevant SCG Controls:**

- esx-9.memory-tiering-encryption -- The ESX host should encrypt data written to tiered memory devices.
- esx-9.tpm-configuration -- The ESX host must require TPM-based configuration encryption.
- vsan-9.encryption-rest -- vSAN must protect data at rest.

### Control UEM-10.1

> Are software firewalls configured on managed endpoints?

**Bridging SCF Controls:** END-05

**Relevant SCG Controls:**

- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.
