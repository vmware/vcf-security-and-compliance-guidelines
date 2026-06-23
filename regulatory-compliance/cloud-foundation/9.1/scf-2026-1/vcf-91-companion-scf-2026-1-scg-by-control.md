# Companion Guide to SCF 2026.1 for VMware Cloud Foundation 9.1 -- Framework Controls by SCG Coverage

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://securecontrolsframework.com/

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

109 framework controls have at least one Security Configuration Guide hardening control mapped to them through the SCF crosswalk.

### Control AST-18

> Mechanisms exist to provision and protect the confidentiality, integrity and authenticity of product supplier keys and data that can be used as a “roots of trust” basis for integrity verification.

**Bridging SCF Controls:** AST-18

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.

### Control AST-30

> Mechanisms exist to ensure Technology Assets, Applications and/or Services (TAAS) are properly decommissioned so that data is properly transitioned to new systems or archived in accordance with applicable organizational standards, as well as statutory, regulatory and contractual obligations.

**Bridging SCF Controls:** AST-30

**Relevant SCG Controls:**

- installer-9.security -- The VCF Installer appliance must be removed or powered off after deployment completes, unless it has been converted into the SDDC Manager.

### Control BCD-02.2

> Mechanisms exist to continue essential missions and business functions with little or no loss of operational continuity and sustain that continuity until full system restoration at primary processing and/or storage sites.

**Bridging SCF Controls:** BCD-02.2

**Relevant SCG Controls:**

- vcenter-9.drs -- VMware vCenter must enable the Distributed Resource Scheduler for resilience and to enable automated patching.
- vcenter-9.service-resilience-evc -- Enable Enhanced vMotion Compatibility on vCenter clusters.
- vcenter-9.service-resilience-ha -- Enable vSphere High Availability on clusters.
- vcenter-9.service-resilience-vmotion -- Enable vMotion for live workload migration.
- vsan-9.auto-raid -- vSAN ESA automatic RAID management must remain enabled.

### Control BCD-11

> Mechanisms exist to create recurring backups of data, software and/or system images, as well as verify the integrity of these backups, to ensure the availability of the data to satisfy Recovery Time Objectives (RTOs) and Recovery Point Objectives (RPOs).

**Bridging SCF Controls:** BCD-11

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.

### Control BCD-11.4

> Cryptographic mechanisms exist to prevent the unauthorized disclosure and/or modification of backup information.

**Bridging SCF Controls:** BCD-11.4

**Relevant SCG Controls:**

- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.

### Control BCD-11.7

> Mechanisms exist to maintain a failover capability, which is not collocated with the primary Technology Asset, Application and/or Service (TAAS), which can be activated with little-to-no loss of information or disruption to operations.

**Bridging SCF Controls:** BCD-11.7

**Relevant SCG Controls:**

- nsx-9.service-resilience -- When NSX Manager runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.
- operations-9.service-resilience -- When VCF Operations runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.

### Control BCD-12.2

> Mechanisms exist to implement real-time or near-real-time failover capability to maintain availability of critical Technology Assets, Applications, Services and/or Data (TAASD).

**Bridging SCF Controls:** BCD-12.2

**Relevant SCG Controls:**

- nsx-9.service-resilience -- When NSX Manager runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.
- operations-9.service-resilience -- When VCF Operations runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.
- vcenter-9.service-resilience-ha -- Enable vSphere High Availability on clusters.

### Control CAP-01

> Mechanisms exist to facilitate the implementation of capacity management controls to ensure optimal system performance to meet expected and anticipated future capacity requirements.

**Bridging SCF Controls:** CAP-01

**Relevant SCG Controls:**

- vcenter-9.drs -- VMware vCenter must enable the Distributed Resource Scheduler for resilience and to enable automated patching.
- vsan-9.automatic-rebalance -- vSAN must enable automatic data rebalancing.
- vsan-9.operations-reserve -- vSAN must reserve space to complete internal maintenance operations.

### Control CAP-02

> Mechanisms exist to control resource utilization of Technology Assets, Applications and/or Services (TAAS) that are susceptible to Denial of Service (DoS) attacks to limit and prioritize the use of resources.

**Bridging SCF Controls:** CAP-02

**Relevant SCG Controls:**

- automation-9.operation-limits -- Configure operation limits in VCF Automation to bound resource-intensive operations.
- nsx-9.api-rate-limits -- Configure NSX Manager API rate and concurrency limits.
- vcenter-9.network-nioc -- Enable Network I/O Control on distributed switches.
- vm-9.deactivate-disk-shrinking-shrink -- Virtual machines must have virtual disk shrinking operations deactivated.
- vm-9.deactivate-disk-shrinking-wiper -- Virtual machines must have virtual disk wiping operations deactivated.
- vm-9.limit-setinfo-size -- Virtual machines must limit informational messages from the virtual machine to the VMX file.

### Control CFG-02

> Mechanisms exist to develop, document and maintain secure baseline configurations for Technology Assets, Applications and/or Services (TAAS) that are consistent with industry-accepted system hardening standards.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control CFG-02.7

> Mechanisms exist to document, assess risk and approve or deny deviations to standardized configurations.

**Bridging SCF Controls:** CFG-02.7

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control CFG-03

> Mechanisms exist to configure systems to provide only essential capabilities by specifically prohibiting or restricting the use of ports, protocols, and/or services.

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

### Control CFG-03.1

> Mechanisms exist to periodically review system configurations to identify and disable unnecessary and/or non-secure functions, ports, protocols and services.

**Bridging SCF Controls:** CFG-03.1

**Relevant SCG Controls:**

- nsx-9.inactive-interfaces -- NSX Tier-0 Gateway must remove inactive interfaces.
- nsx-9.routing-protocols-unused -- Disable Tier-0 Gateway routing protocols that are not in use.
- nsx-9.t1-inactive-interfaces -- Remove inactive interfaces and stale linked segments from Tier-1 Gateways.

### Control CFG-03.2

> Mechanisms exist to configure systems to prevent the execution of unauthorized software programs.

**Bridging SCF Controls:** CFG-03.2

**Relevant SCG Controls:**

- esx-9.vib-trusted-binaries -- The ESX host must only execute binaries delivered through a signed VIB.

### Control CFG-06

> Automated mechanisms exist to monitor, enforce and report on configurations for endpoint devices.

**Bridging SCF Controls:** CFG-06

**Relevant SCG Controls:**

- vcenter-9.network-reset-port -- Reset distributed switch port configuration when a virtual machine disconnects.
- vcenter-9.network-restrict-port-level-overrides -- Disallow per-port policy overrides on distributed port groups, except port blocking.
- vsan-9.force-provisioning -- vSAN must not provision storage when storage policy requirements cannot be met.

### Control CFG-08

> Mechanisms exist to configure Technology Assets, Applications and/or Services (TAAS) to restrict access to sensitive/regulated data.

**Bridging SCF Controls:** CFG-08

**Relevant SCG Controls:**

- operations-9.credential-ownership-enforcement -- VCF Operations must enable credential ownership enforcement.

### Control CHG-02

> Mechanisms exist to govern the technical configuration change control processes.

**Bridging SCF Controls:** CHG-02

**Relevant SCG Controls:**

- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.

### Control CHG-04

> Mechanisms exist to enforce configuration restrictions in an effort to restrict the ability of users to conduct unauthorized changes.

**Bridging SCF Controls:** CHG-04

**Relevant SCG Controls:**

- esx-9.hardware-management-config-lock -- Lock the hardware management controller configuration after provisioning.
- guest-9.tools-add-feature -- The guest OS must disable automatic addition of optional VMware Tools features.
- guest-9.tools-allow-transforms -- The guest OS must disable MSI transforms in VMware Tools auto-upgrades.
- guest-9.tools-globalconf -- The guest OS must deactivate GlobalConf unless required.
- guest-9.tools-prevent-recustomization -- The guest OS must prevent re-customization of an already-deployed VM.
- guest-9.tools-remove-feature -- The guest OS must disable automatic removal of optional VMware Tools features.
- vsan-9.managed-disk-claim -- vSAN must disable managed disk claims.

### Control CHG-04.2

> Mechanisms exist to prevent the installation of software and firmware components without verification that the component has been digitally signed using an organization-approved certificate authority.

**Bridging SCF Controls:** CHG-04.2

**Relevant SCG Controls:**

- esx-9.vib-acceptance-level-supported -- The ESX host image profile acceptance level must be PartnerSupported or higher.
- operations-9.unsigned-pak -- VCF Operations must disable unsigned management pack installation.
- vcenter-9.content-library-ovf -- VMware vCenter must enable the OVF security policy on content libraries.

### Control CLD-05

> Mechanisms exist to ensure the integrity of virtual machine images at all times.

**Bridging SCF Controls:** CLD-05

**Relevant SCG Controls:**

- vcenter-9.content-library-ovf -- VMware vCenter must enable the OVF security policy on content libraries.

### Control CRY-01

> Mechanisms exist to facilitate the implementation of cryptographic protections controls using known public standards and trusted cryptographic technologies.

**Bridging SCF Controls:** CRY-01

**Relevant SCG Controls:**

- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

### Control CRY-01.1

> Cryptographic mechanisms exist to prevent unauthorized disclosure of information as an alternative to physical safeguards.

**Bridging SCF Controls:** CRY-01.1

**Relevant SCG Controls:**

- vsan-9.encryption-rest -- vSAN must protect data at rest.

### Control CRY-01.5

> Mechanisms exist to identify, document and review deployed cryptographic cipher suites and protocols to proactively respond to industry trends regarding the continued viability of utilized cryptographic cipher suites and protocols.

**Bridging SCF Controls:** CRY-01.5

**Relevant SCG Controls:**

- esx-9.tls-ciphers -- The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- nsx-9.tls-ciphers -- NSX Manager must use TLS with approved protocol versions and cipher suites.
- vcenter-9.tls-ciphers -- vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.

### Control CRY-03

> Cryptographic mechanisms exist to protect the confidentiality of data being transmitted.

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

### Control CRY-04

> Cryptographic mechanisms exist to protect the integrity of data being transmitted.

**Bridging SCF Controls:** CRY-04

**Relevant SCG Controls:**

- nsx-9.bgp-encryption -- Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.
- nsx-9.ospf-encryption -- NSX Tier-0 Gateway must enable OSPF authentication.
- operations-9.logs-ssl-api -- Enable SSL for API log ingestion in VCF Operations.
- operations-9.logs-ssl-syslog -- Enable SSL for syslog log ingestion in VCF Operations.
- vm-9.ft-encrypted -- Virtual machines must require encryption for Fault Tolerance.
- vm-9.vmotion-encrypted -- Virtual machines must require encryption for vMotion.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.

### Control CRY-05

> Cryptographic mechanisms exist to prevent unauthorized disclosure of data at rest.

**Bridging SCF Controls:** CRY-05

**Relevant SCG Controls:**

- esx-9.memory-tiering-encryption -- The ESX host should encrypt data written to tiered memory devices.
- esx-9.tpm-configuration -- The ESX host must require TPM-based configuration encryption.
- vsan-9.encryption-rest -- vSAN must protect data at rest.

### Control CRY-08.1

> Resiliency mechanisms exist to ensure the availability of data in the event of the loss of cryptographic keys.

**Bridging SCF Controls:** CRY-08.1

**Relevant SCG Controls:**

- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.

### Control CRY-09

> Mechanisms exist to facilitate cryptographic key management controls to protect the confidentiality, integrity and availability of keys.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control CRY-09.3

> Mechanisms exist to ensure the availability of information in the event of the loss of cryptographic keys by individual users.

**Bridging SCF Controls:** CRY-09.3

**Relevant SCG Controls:**

- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.

### Control CRY-13

> Mechanisms exist to utilize hash algorithms to generate a hash value that can be used to validate the integrity of data and/or software.

**Bridging SCF Controls:** CRY-13

**Relevant SCG Controls:**

- vsan-9.object-checksum -- vSAN must calculate object checksums to protect data integrity.

### Control DCH-12

> Mechanisms exist to restrict removable media in accordance with data handling and acceptable usage parameters.

**Bridging SCF Controls:** DCH-12

**Relevant SCG Controls:**

- esx-9.hardware-boot-order -- Restrict the server firmware boot order to authorized boot devices.

### Control END-05

> Mechanisms exist to utilize host-based firewall software, or a similar technology, on all endpoint devices, where technically feasible.

**Bridging SCF Controls:** END-05

**Relevant SCG Controls:**

- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.

### Control END-06.4

> Automated mechanisms exist to implement remediation actions when integrity violations are discovered.

**Bridging SCF Controls:** END-06.4

**Relevant SCG Controls:**

- vsan-9.object-checksum -- vSAN must calculate object checksums to protect data integrity.

### Control END-06.5

> Automated mechanisms exist to verify the integrity of the boot process of systems.

**Bridging SCF Controls:** END-06.5

**Relevant SCG Controls:**

- esx-9.hardware-boot-order -- Restrict the server firmware boot order to authorized boot devices.
- esx-9.hardware-cpu-intel-txt -- Enable Intel TXT in system firmware where available.
- esx-9.hardware-secureboot -- Enable UEFI Secure Boot.
- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.secureboot-enforcement -- The ESX host must enable Secure Boot enforcement for configuration encryption.
- esx-9.tpm-trusted-binaries -- The ESX host must enforce execInstalledOnly.
- vm-9.efi-boot-types -- Virtual machines must prevent booting from unauthorized sources.
- vm-9.secure-boot -- The guest OS must enable Secure Boot.

### Control END-06.6

> Automated mechanisms exist to protect the integrity of boot firmware in systems.

**Bridging SCF Controls:** END-06.6

**Relevant SCG Controls:**

- esx-9.hardware-cpu-intel-txt -- Enable Intel TXT in system firmware where available.
- esx-9.hardware-secureboot -- Enable UEFI Secure Boot.
- esx-9.secureboot-enforcement -- The ESX host must enable Secure Boot enforcement for configuration encryption.
- vm-9.secure-boot -- The guest OS must enable Secure Boot.

### Control END-12

> Mechanisms exist to physically disable or remove unnecessary connection ports or input/output devices from sensitive systems.

**Bridging SCF Controls:** END-12

**Relevant SCG Controls:**

- esx-9.hardware-ports -- Disable or physically protect unused external server ports.
- vm-9.remove-unnecessary-devices -- Virtual machines must remove unnecessary virtual hardware.

### Control END-15

> Mechanisms exist to restrict access to hypervisor management functions or administrative consoles for systems hosting virtualized systems.

**Bridging SCF Controls:** END-15

**Relevant SCG Controls:**

- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.

### Control IAC-01.2

> Mechanisms exist to strictly govern the use of Authenticate, Authorize and Audit (AAA) solutions, both on-premises and those hosted by an External Service Provider (ESP).

**Bridging SCF Controls:** IAC-01.2

**Relevant SCG Controls:**

- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.

### Control IAC-02

> Mechanisms exist to uniquely identify and centrally Authenticate, Authorize and Audit (AAA) organizational users and processes acting on behalf of organizational users.

**Bridging SCF Controls:** IAC-02

**Relevant SCG Controls:**

- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control IAC-04

> Mechanisms exist to uniquely identify and centrally Authenticate, Authorize and Audit (AAA) devices before establishing a connection using bidirectional authentication that is cryptographically- based and replay resistant.

**Bridging SCF Controls:** IAC-04

**Relevant SCG Controls:**

- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control IAC-06.1

> Mechanisms exist to utilize Multi-Factor Authentication (MFA) to authenticate network access for privileged accounts.

**Bridging SCF Controls:** IAC-06.1

**Relevant SCG Controls:**

- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control IAC-07

> Mechanisms exist to utilize a formal user registration and de-registration process that governs the assignment of access rights.

**Bridging SCF Controls:** IAC-07

**Relevant SCG Controls:**

- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.

### Control IAC-10

> Mechanisms exist to: (1) Securely manage authenticators for users and devices; and (2) Ensure the strength of authentication is appropriate to the classification of the data being accessed.

**Bridging SCF Controls:** IAC-10

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.

### Control IAC-10.1

> Mechanisms exist to enforce complexity, length and lifespan considerations to ensure strong criteria for password-based authentication.

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

### Control IAC-10.2

> Automated mechanisms exist to validate certificates by constructing and verifying a certification path to an accepted trust anchor including checking certificate status information for PKI-based authentication.

**Bridging SCF Controls:** IAC-10.2

**Relevant SCG Controls:**

- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.log-forwarding-tls-x509 -- The ESX host must use strict x509 verification for TLS-enabled remote logging endpoints.
- operations-9.certificates-validation -- VCF Operations must activate certificate validation.

### Control IAC-10.4

> Automated mechanisms exist to determine if password authenticators are sufficiently strong enough to satisfy organization-defined password length and complexity requirements.

**Bridging SCF Controls:** IAC-10.4

**Relevant SCG Controls:**

- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control IAC-10.8

> Mechanisms exist to ensure default authenticators are changed as part of account creation or system installation.

**Bridging SCF Controls:** IAC-10.8

**Relevant SCG Controls:**

- esx-9.ad-admin-group-name -- The ESX host must not use the default "ESX Admins" Active Directory group.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- sddc-9.api-admin -- SDDC Manager must configure the API admin account.

### Control IAC-10.13

> Mechanisms exist to change authentication credentials: (1) At predefined intervals; and/or (2) Upon suspicion of credential compromise.

**Bridging SCF Controls:** IAC-10.13

**Relevant SCG Controls:**

- vcenter-9.vpxuser-rotation -- Rotate the vpxuser password at least as often as the default.

### Control IAC-15.3

> Automated mechanisms exist to disable inactive accounts after an organization-defined time period.

**Bridging SCF Controls:** IAC-15.3

**Relevant SCG Controls:**

- fleet-9.jit-inactivity -- Configure an inactivity expiry for Just-In-Time users.

### Control IAC-15.5

> Mechanisms exist to authorize the use of shared/group accounts only under certain organization-defined conditions.

**Bridging SCF Controls:** IAC-15.5

**Relevant SCG Controls:**

- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.

### Control IAC-15.7

> Mechanisms exist to review all system accounts and disable any account that cannot be associated with a business process and owner.

**Bridging SCF Controls:** IAC-15.7

**Relevant SCG Controls:**

- esx-9.disable-accounts-dcui -- The ESX host must disable shell access for the dcui account.
- nsx-9.disable-accounts -- Disable unused NSX Manager local accounts.
- vcenter-9.disable-accounts -- VMware vCenter must have unnecessary or unused user accounts disabled or removed.

### Control IAC-15.9

> Mechanisms exist to establish and control "emergency access only" accounts.

**Bridging SCF Controls:** IAC-15.9

**Relevant SCG Controls:**

- sddc-9.api-admin -- SDDC Manager must configure the API admin account.

### Control IAC-16

> Mechanisms exist to restrict and control privileged access rights for users and Technology Assets, Applications and/or Services (TAAS).

**Bridging SCF Controls:** IAC-16

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.

### Control IAC-16.2

> Mechanisms exist to separate privileged accounts between infrastructure environments to reduce the risk of a compromise in one infrastructure environment from laterally affecting other infrastructure environments.

**Bridging SCF Controls:** IAC-16.2

**Relevant SCG Controls:**

- esx-9.hardware-management-authentication -- Use strong, isolated identity management on hardware management controllers.
- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.

### Control IAC-17

> Mechanisms exist to periodically-review the privileges assigned to individuals and service accounts to validate the need for such privileges and reassign or remove unnecessary privileges, as necessary.

**Bridging SCF Controls:** IAC-17

**Relevant SCG Controls:**

- esx-9.ad-admin-validate-interval -- The ESX host must not disable validation of users and groups.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.

### Control IAC-20

> Mechanisms exist to enforce Logical Access Control (LAC) permissions that conform to the principle of "least privilege."

**Bridging SCF Controls:** IAC-20

**Relevant SCG Controls:**

- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.

### Control IAC-20.1

> Mechanisms exist to limit access to sensitive/regulated data to only those individuals whose job requires such access.

**Bridging SCF Controls:** IAC-20.1

**Relevant SCG Controls:**

- vcenter-9.content-library-authentication -- VMware vCenter must require authentication for published content libraries.

### Control IAC-21

> Mechanisms exist to utilize the concept of least privilege, allowing only authorized access to processes necessary to accomplish assigned tasks in accordance with organizational business functions.

**Bridging SCF Controls:** IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control IAC-22

> Mechanisms exist to enforce a limit for consecutive invalid login attempts by a user during an organization-defined time period and automatically locks the account when the maximum number of unsuccessful attempts is exceeded.

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

### Control IAC-23

> Mechanisms exist to limit the number of concurrent sessions for each system account.

**Bridging SCF Controls:** IAC-23

**Relevant SCG Controls:**

- operations-9.concurrent-sessions -- VCF Operations must limit the number of concurrent sessions.
- vm-9.limit-console-connections -- Virtual machines must limit console sharing.

### Control IAC-24

> Mechanisms exist to initiate a session lock after an organization-defined time period of inactivity, or upon receiving a request from a user and retain the session lock until the user reestablishes access using established identification and authentication methods.

**Bridging SCF Controls:** IAC-24

**Relevant SCG Controls:**

- vm-9.vmrc-lock -- Virtual machines must be configured to lock when the last console connection is closed.

### Control IAC-25

> Automated mechanisms exist to log out users, both locally on the network and for remote sessions, at the end of the session or after an organization-defined period of inactivity.

**Bridging SCF Controls:** IAC-25

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

### Control IAC-30

> Mechanisms exist to enforce Mutual Authentication (MA) where both sides of a communications channel verify the identity of the other party through certificate exchange.

**Bridging SCF Controls:** IAC-30

**Relevant SCG Controls:**

- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control IRO-08

> Mechanisms exist to perform digital forensics and maintain the integrity of the chain of custody, in accordance with applicable laws, regulations and industry-recognized secure practices.

**Bridging SCF Controls:** IRO-08

**Relevant SCG Controls:**

- esx-9.forensic-snapshots -- Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.

### Control MON-01.4

> Mechanisms exist to generate, monitor, correlate and respond to alerts from physical, cybersecurity, data protection and supply chain activities to achieve integrated situational awareness.

**Bridging SCF Controls:** MON-01.4

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.

### Control MON-02

> Mechanisms exist to utilize a Security Incident Event Manager (SIEM), or similar automated tool, to support the centralized collection of security-related event logs.

**Bridging SCF Controls:** MON-02

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.

### Control MON-02.2

> Automated mechanisms exist to centrally collect, review and analyze audit records from multiple sources.

**Bridging SCF Controls:** MON-02.2

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.

### Control MON-02.7

> Automated mechanisms exist to compile audit records into an organization-wide audit trail that is time-correlated.

**Bridging SCF Controls:** MON-02.7

**Relevant SCG Controls:**

- vcenter-9.events-remote-logging -- Enable remote logging of vCenter events.

### Control MON-03

> Mechanisms exist to configure Technology Assets, Applications and/or Services (TAAS) to produce event logs that contain sufficient information to, at a minimum: (1) Establish what type of event occurred; (2) When (date and time) the event occurred; (3) Where the event occurred; (4) The source of the event; (5) The outcome (success or failure) of the event; and  (6) The identity of any user/subject associated with the event.

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

### Control MON-04

> Mechanisms exist to allocate and proactively manage sufficient event log storage capacity to reduce the likelihood of such capacity being exceeded.

**Bridging SCF Controls:** MON-04

**Relevant SCG Controls:**

- esx-9.hardware-boot -- The environment must use adequately sized persistent, non-SD, non-USB devices for ESX boot volumes.
- esx-9.log-audit-local-capacity -- The ESX host must store audit records for a time period consistent with your records retention policy.
- vm-9.log-retention -- Virtual machines must limit the number of retained diagnostic logs.
- vm-9.log-rotation-size -- Virtual machines must limit the size of diagnostic logs.

### Control MON-07

> Mechanisms exist to configure Technology Assets, Applications and/or Services (TAAS) to use an authoritative time source to generate time stamps for event logs.

**Bridging SCF Controls:** MON-07

**Relevant SCG Controls:**

- nsx-9.timezone-utc -- Set NSX Manager timezone to UTC for consistent audit timestamps.

### Control MON-07.1

> Mechanisms exist to synchronize internal system clocks with an authoritative time source.

**Bridging SCF Controls:** MON-07.1

**Relevant SCG Controls:**

- esx-9.hardware-management-time -- Synchronize hardware management controller time with organizational reference sources.
- esx-9.time -- The ESX host must synchronize its clock with organizational reference sources.
- fleet-9.time -- Configure fleet-wide time synchronization.
- pnr-9.time -- The VCF Protection and Recovery appliance must synchronize its clock with organizational reference sources.
- vcenter-9.time -- vCenter must synchronize its clock with organizational reference sources.

### Control MON-08

> Mechanisms exist to protect event logs and audit tools from unauthorized access, modification and deletion.

**Bridging SCF Controls:** MON-08

**Relevant SCG Controls:**

- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.

### Control MON-10

> Mechanisms exist to retain event logs for a time period consistent with records retention requirements to provide support for after-the-fact investigations of security incidents and to meet statutory, regulatory and contractual retention requirements.

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

### Control MON-13

> Mechanisms exist to provide an alternate event logging capability in the event of a failure in primary audit capability.

**Bridging SCF Controls:** MON-13

**Relevant SCG Controls:**

- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.

### Control NET-02.1

> Automated mechanisms exist to protect against or limit the effects of denial of service attacks.

**Bridging SCF Controls:** NET-02.1

**Relevant SCG Controls:**

- esx-9.network-bpdu -- Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.
- nsx-9.bgp-max-prefixes -- Configure BGP maximum prefix limits on Tier-0 Gateway neighbors.
- nsx-9.reverse-path-forwarding -- NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.
- nsx-9.t0-ipv6-hop-limit -- The NSX Tier-0 Gateway must advertise a sufficient IPv6 Router Advertisement hop limit.
- nsx-9.t1-ipv6-hop-limit -- The NSX Tier-1 Gateway must advertise a sufficient IPv6 Router Advertisement hop limit.
- vcenter-9.network-nioc -- Enable Network I/O Control on distributed switches.

### Control NET-03

> Mechanisms exist to monitor and control communications at the external network boundary and at key internal boundaries within the network.

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

### Control NET-03.1

> Mechanisms exist to limit the number of concurrent external network connections to its Technology Assets, Applications and/or Services (TAAS).

**Bridging SCF Controls:** NET-03.1

**Relevant SCG Controls:**

- nsx-9.api-rate-limits -- Configure NSX Manager API rate and concurrency limits.

### Control NET-03.3

> Mechanisms exist to prevent the public disclosure of internal network information.

**Bridging SCF Controls:** NET-03.3

**Relevant SCG Controls:**

- vcenter-9.network-restrict-discovery-protocol -- Disable CDP/LLDP discovery protocols on distributed switches unless required.
- vcenter-9.vds-health-check-disable -- Disable the vSphere Distributed Switch health check when not troubleshooting.

### Control NET-03.5

> Automated mechanisms exist to prevent the unauthorized exfiltration of sensitive/regulated data across managed interfaces.

**Bridging SCF Controls:** NET-03.5

**Relevant SCG Controls:**

- vcenter-9.network-restrict-port-mirroring -- Remove unauthorized port mirroring sessions on distributed switches.

### Control NET-04

> Mechanisms exist to implement and govern Access Control Lists (ACLs) to provide data flow enforcement that explicitly restrict network traffic to only what is authorized.

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

### Control NET-04.1

> Mechanisms exist to configure firewall and router configurations to deny network traffic by default and allow network traffic by exception (e.g., deny all, permit by exception).

**Bridging SCF Controls:** NET-04.1

**Relevant SCG Controls:**

- esx-9.firewall-incoming-default -- The ESX host must configure the firewall to block network traffic by default.
- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.
- vcf-9.perimeter-firewall -- Limit access to VCF component management interfaces with perimeter firewalls.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.

### Control NET-04.12

> Automated mechanisms exist to uniquely identify and authenticate source and destination points for information transfer.

**Bridging SCF Controls:** NET-04.12

**Relevant SCG Controls:**

- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.

### Control NET-06

> Mechanisms exist to ensure network architecture utilizes network segmentation to isolate Technology Assets, Applications and/or Services (TAAS) to protect from other network resources.

**Bridging SCF Controls:** NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control NET-06.1

> Mechanisms exist to implement security management subnets to isolate security tools and support components from other internal system components by implementing separate subnetworks with managed interfaces to other components of the system.

**Bridging SCF Controls:** NET-06.1

**Relevant SCG Controls:**

- esx-9.vmk-management -- The ESX host must isolate management communications.
- vcf-9.perimeter-firewall -- Limit access to VCF component management interfaces with perimeter firewalls.

### Control NET-06.2

> Mechanisms exist to enable Virtual Local Area Networks (VLANs) to limit the ability of devices on a network to directly communicate with other devices on the subnet and limit an attacker's ability to laterally move to compromise neighboring systems.

**Bridging SCF Controls:** NET-06.2

**Relevant SCG Controls:**

- esx-9.network-vgt -- The ESX host must restrict the use of Virtual Guest Tagging (VGT) on Standard Switches.
- vcenter-9.network-vgt -- Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.

### Control NET-06.4

> Mechanisms exist to isolate sensitive/regulated data enclaves (secure zones) from corporate-provided IT resources by providing enclave-specific IT services (e.g., directory services, DNS, NTP, ITAM, antimalware, patch management, etc.) to those isolated network segments.

**Bridging SCF Controls:** NET-06.4

**Relevant SCG Controls:**

- esx-9.hardware-management-authentication -- Use strong, isolated identity management on hardware management controllers.

### Control NET-09

> Mechanisms exist to protect the authenticity and integrity of communications sessions.

**Bridging SCF Controls:** NET-09

**Relevant SCG Controls:**

- nsx-9.bgp-encryption -- Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.
- nsx-9.ospf-encryption -- NSX Tier-0 Gateway must enable OSPF authentication.

### Control NET-10

> Mechanisms exist to ensure Domain Name Service (DNS) resolution is designed, implemented and managed to protect the security of name / address resolution.

**Bridging SCF Controls:** NET-10

**Relevant SCG Controls:**

- fleet-9.dns -- Configure fleet-wide DNS settings.

### Control NET-12

> Cryptographic mechanisms exist to implement strong cryptography and security protocols to safeguard sensitive/regulated data during transmission over open, public networks.

**Bridging SCF Controls:** NET-12

**Relevant SCG Controls:**

- nsx-9.snmp -- NSX Manager must not use SNMP v1 or v2c.
- vcenter-9.snmp -- Disable SNMP v1 and v2c receivers on vCenter.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

### Control NET-13

> Mechanisms exist to protect the confidentiality, integrity and availability of electronic messaging communications.

**Bridging SCF Controls:** NET-13

**Relevant SCG Controls:**

- vcenter-9.smtp -- Send vCenter notification email over a secure SMTP connection.

### Control NET-14

> Mechanisms exist to define, control and review organization-approved, secure remote access methods.

**Bridging SCF Controls:** NET-14

**Relevant SCG Controls:**

- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.

### Control NET-14.4

> Mechanisms exist to restrict the execution of privileged commands and access to security-relevant information via remote access only for compelling operational needs.

**Bridging SCF Controls:** NET-14.4

**Relevant SCG Controls:**

- esx-9.ssh -- The ESX host's SSH service must be deactivated except for temporary diagnostic use.
- vcenter-9.ssh -- Deactivate SSH access to the vCenter appliance except for temporary diagnostic use.

### Control SEA-03.2

> Mechanisms exist to separate user functionality from system management functionality.

**Bridging SCF Controls:** SEA-03.2

**Relevant SCG Controls:**

- esx-9.hardware-virtual-nic -- The ESX host must not enable virtual hardware management network interfaces.

### Control SEA-05

> Mechanisms exist to prevent unauthorized and unintended information transfer via shared system resources.

**Bridging SCF Controls:** SEA-05

**Relevant SCG Controls:**

- esx-9.memeagerzero -- The ESX host must enable volatile key destruction.
- esx-9.transparent-page-sharing -- The ESX host must restrict inter-VM transparent page sharing to VMs configured with sched.mem.pshare.salt.
- vm-9.deactivate-console-copy -- Virtual machines must have console copy operations deactivated.
- vm-9.deactivate-console-paste -- Virtual machines must have console paste operations deactivated.
- vm-9.isolation-tools-dnd-deactivate -- Virtual machines must have console drag and drop operations deactivated.
- vm-9.transparentpagesharing-inter-vm-enabled -- Virtual machines must restrict sharing of memory pages between VMs.

### Control SEA-06

> Automated mechanisms exist to prevent the execution of unauthorized software programs.

**Bridging SCF Controls:** SEA-06

**Relevant SCG Controls:**

- esx-9.tpm-trusted-binaries -- The ESX host must enforce execInstalledOnly.

### Control SEA-10

> Mechanisms exist to implement security safeguards to protect system memory from unauthorized code execution.

**Bridging SCF Controls:** SEA-10

**Relevant SCG Controls:**

- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.

### Control SEA-18

> Mechanisms exist to utilize system use notification / logon banners that display an approved system use notification message or banner before granting access to Technology Assets, Applications and/or Services (TAAS).

**Bridging SCF Controls:** SEA-18

**Relevant SCG Controls:**

- esx-9.etc-issue -- Configure the login banner for ESX host SSH connections.
- esx-9.login-message -- Configure the ESX host login banner for the DCUI and Host Client.
- networks-9.login-message -- Configure the VCF Operations for Networks login banner.
- nsx-9.login-message -- Configure the NSX Manager login banner.
- operations-9.login-message -- Configure the VCF Operations login banner.
- vcenter-9.etc-issue -- Configure the vCenter SSH login banner (/etc/issue).
- vcenter-9.login-message -- Configure the vCenter login banner for the vSphere Client.

### Control SEA-20

> Mechanisms exist to utilize time-synchronization technology to synchronize all critical system clocks.

**Bridging SCF Controls:** SEA-20

**Relevant SCG Controls:**

- esx-9.hardware-management-time -- Synchronize hardware management controller time with organizational reference sources.
- esx-9.time -- The ESX host must synchronize its clock with organizational reference sources.
- fleet-9.time -- Configure fleet-wide time synchronization.
- pnr-9.time -- The VCF Protection and Recovery appliance must synchronize its clock with organizational reference sources.
- vcenter-9.time -- vCenter must synchronize its clock with organizational reference sources.

### Control TDA-01.2

> Mechanisms exist to utilize integrity validation mechanisms for security updates.

**Bridging SCF Controls:** TDA-01.2

**Relevant SCG Controls:**

- esx-9.vib-acceptance-level-supported -- The ESX host image profile acceptance level must be PartnerSupported or higher.
- operations-9.unsigned-pak -- VCF Operations must disable unsigned management pack installation.

### Control TDA-02.2

> Mechanisms exist to limit the use of commercially-provided Information Assurance (IA) and IA-enabled IT products to those products that have been successfully evaluated against a National Information Assurance partnership (NIAP)-approved Protection Profile or the cryptographic module is FIPS-validated or NSA-approved.

**Bridging SCF Controls:** TDA-02.2

**Relevant SCG Controls:**

- esx-9.vmotion-encryption-offload -- Accelerate vMotion encryption using available hardware offload on ESX hosts.

### Control TDA-17

> Mechanisms exist to prevent unsupported Technology Assets, Applications and/or Services (TAAS) by: (1) Removing and/or replacing TAAS when support for the components is no longer available from the developer, vendor or manufacturer; and (2) Requiring justification and documented approval for the continued use of unsupported TAAS required to satisfy mission/business needs.

**Bridging SCF Controls:** TDA-17

**Relevant SCG Controls:**

- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.
- vcenter-9.supported -- vCenter must run a version that has not reached End of General Support.

### Control TPM-03

> Mechanisms exist to: (1) Evaluate security risks and threats associated with Technology Assets, Applications and/or Services (TAAS) supply chains; and (2) Take appropriate remediation actions to minimize the organization's exposure to those risks and threats, as necessary.

**Bridging SCF Controls:** TPM-03

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control TPM-04

> Mechanisms exist to mitigate the risks associated with third-party access to the organization's Technology Assets, Applications, Services and/or Data (TAASD).

**Bridging SCF Controls:** TPM-04

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control VPM-04

> Mechanisms exist to address new threats and vulnerabilities on an ongoing basis and ensure assets are protected against known attacks.

**Bridging SCF Controls:** VPM-04

**Relevant SCG Controls:**

- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.

### Control VPM-04.1

> Mechanisms exist to install the latest stable version of any software and/or security-related updates on all applicable systems.

**Bridging SCF Controls:** VPM-04.1

**Relevant SCG Controls:**

- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- vcenter-9.supported -- vCenter must run a version that has not reached End of General Support.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control VPM-05

> Mechanisms exist to conduct software patching for all deployed Technology Assets, Applications and/or Services (TAAS), including firmware.

**Bridging SCF Controls:** VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control VPM-05.4

> Automated mechanisms exist to install the latest stable versions of security-relevant software and firmware updates.

**Bridging SCF Controls:** VPM-05.4

**Relevant SCG Controls:**

- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.

### Control VPM-05.8

> Mechanisms exist to ensure software and/or firmware patches are: (1) Obtained from trusted sources; and  (2) Checked for integrity.

**Bridging SCF Controls:** VPM-05.8

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
