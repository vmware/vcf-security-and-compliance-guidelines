# Companion Guide to the CSA Cloud Controls Matrix 4.1.0 for VMware Cloud Foundation 9.1 -- SCG Hardening Controls

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

## SCG Hardening Controls Relevant to This Framework

160 Security Configuration Guide controls map to this framework through the SCF crosswalk, grouped below by product component.

### Automation

#### automation-9.activity-log

Retain the VCF Automation activity log for the audit window and keep debug output disabled.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03, MON-10

**Mapped Framework Controls:** AIS-02, LOG-04

#### automation-9.oidc-settings

Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-03, IAC-10

**Mapped Framework Controls:** CEK-03, DSP-10, IAM-14, IAM-15

#### automation-9.timeouts

Limit the VCF Automation API token lifetime.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** IAM-14, IAM-15

### ESX

#### esx-9.account-password-history

The ESX host must enforce password history for users.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IAM-13, IAM-14, IAM-15

#### esx-9.ad-admin-group-autoadd

The ESX host must not automatically grant administrative permissions to Active Directory groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-16, IAC-21

**Mapped Framework Controls:** IAM-05, IAM-09, IAM-10, IAM-11, IAM-13

#### esx-9.ad-admin-group-name

The ESX host must not use the default "ESX Admins" Active Directory group.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.8

**Mapped Framework Controls:** IAM-15

#### esx-9.ad-admin-validate-interval

The ESX host must not disable validation of users and groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-17

**Mapped Framework Controls:** IAM-08, IAM-09, IAM-10, IAM-11

#### esx-9.ceip-disable

Disable the ESX Customer Experience Improvement Program.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### esx-9.cpu-hyperthread-warning

The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-01.4

**Mapped Framework Controls:** LOG-03

#### esx-9.deactivate-mob

The ESX Managed Object Browser (MOB) must be disabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### esx-9.deactivate-shell

The ESX Shell must be disabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### esx-9.entropy

The ESX host must use sufficient entropy for cryptographic operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** CEK-01, CEK-02, CEK-03, CEK-04, DSP-10, LOG-11

#### esx-9.firewall-restrict-access

Configure the ESX host firewall to only allow traffic from authorized networks.

**Implementation Priority:** P0

**Bridging SCF Controls:** END-05

**Mapped Framework Controls:** UEM-10

#### esx-9.forensic-snapshots

Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### esx-9.hardware-cpu-amd-cc

Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** CEK-01, CEK-02, CEK-03, CEK-04, DSP-10, LOG-11

#### esx-9.hardware-cpu-intel-cc

Enable Intel SGX and TDX in system firmware where available.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** CEK-01, CEK-02, CEK-03, CEK-04, DSP-10, LOG-11

#### esx-9.hardware-management-config-lock

Lock the hardware management controller configuration after provisioning.

**Implementation Priority:** P1

**Bridging SCF Controls:** CHG-04

**Mapped Framework Controls:** CCC-04

#### esx-9.hardware-management-security

Harden integrated hardware management controllers.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03, IAC-10.8

**Mapped Framework Controls:** AIS-02, IAM-15

#### esx-9.hardware-management-time

Synchronize hardware management controller time with organizational reference sources.

**Implementation Priority:** P0

**Bridging SCF Controls:** SEA-20

**Mapped Framework Controls:** LOG-06

#### esx-9.hardware-ports

Disable or physically protect unused external server ports.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### esx-9.hardware-tpm

Install and enable a TPM 2.0 on each ESX host.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-09

**Mapped Framework Controls:** CEK-08, CEK-10, CEK-11, CEK-12, CEK-13, CEK-14, CEK-15, CEK-16, CEK-17, CEK-18, CEK-19, CEK-20, CEK-21, LOG-11

#### esx-9.hardware-virtual-nic

The ESX host must not enable virtual hardware management network interfaces.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### esx-9.iscsi-mutual-chap

Enable bidirectional/mutual CHAP authentication for iSCSI traffic.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** IAC-04

**Mapped Framework Controls:** DCS-09, IAM-13

#### esx-9.key-persistence

Disable Key Persistence on ESX hosts that do not have controlled physical access.

**Implementation Priority:** P2, Upon Feature Enablement

**Bridging SCF Controls:** CRY-09

**Mapped Framework Controls:** CEK-08, CEK-10, CEK-11, CEK-12, CEK-13, CEK-14, CEK-15, CEK-16, CEK-17, CEK-18, CEK-19, CEK-20, CEK-21, LOG-11

#### esx-9.lockdown-dcui-access

Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** IAM-05, IAM-13

#### esx-9.lockdown-exception-users

Keep the Lockdown Mode Exception Users list to the minimum necessary.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** IAM-05, IAM-13

#### esx-9.log-audit-local

The ESX host must enable audit record logging.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** LOG-09, LOG-12

#### esx-9.log-audit-local-capacity

The ESX host must store audit records for a time period consistent with your records retention policy.

**Implementation Priority:** P1

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** LOG-04

#### esx-9.log-audit-persistent

Configure a persistent log location for all locally stored audit records on the ESX host.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-08, MON-10

**Mapped Framework Controls:** LOG-02, LOG-04, LOG-10

#### esx-9.log-filter

The ESX host must not enable log filtering.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03, MON-08

**Mapped Framework Controls:** LOG-02, LOG-09, LOG-10, LOG-12

#### esx-9.log-forwarding-tls-ciphers

The ESX host must verify certificates for TLS remote logging endpoints.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03, IAC-10.2

**Mapped Framework Controls:** CEK-03, DSP-10, IAM-13, IAM-14

#### esx-9.log-forwarding-tls-x509

The ESX host must use strict x509 verification for TLS-enabled remote logging endpoints.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.2

**Mapped Framework Controls:** IAM-13, IAM-14

#### esx-9.log-level

The ESX host must produce audit records containing information to establish what type of events occurred.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** LOG-09, LOG-12

#### esx-9.log-persistent

Configure a persistent log location for all locally stored logs on the ESX host.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-08, MON-10

**Mapped Framework Controls:** LOG-02, LOG-04, LOG-10

#### esx-9.memory-tiering-encryption

The ESX host should encrypt data written to tiered memory devices.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-05

**Mapped Framework Controls:** CEK-03, UEM-08

#### esx-9.network-dvfilter

Use of the dvFilter network APIs must be restricted on the ESX host.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### esx-9.nfs-traffic-protection

Protect NFS datastore traffic on the ESX host using encryption or network isolation.

**Implementation Priority:** P1, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03, NET-06

**Mapped Framework Controls:** CEK-03, DSP-10, I&S-06

#### esx-9.password-complexity

Enforce password complexity on ESX local accounts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IAM-13, IAM-14, IAM-15

#### esx-9.password-max-age

The ESX host must be configured with an appropriate maximum password age.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IAM-13, IAM-14, IAM-15

#### esx-9.shell-warning

The ESX host must not suppress warnings that the local or remote shell is enabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-01.4

**Mapped Framework Controls:** LOG-03

#### esx-9.snmp

The SNMP service on the ESX host must not be configured to start automatically.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### esx-9.ssh

The ESX host's SSH service must be deactivated except for temporary diagnostic use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### esx-9.supported

The ESX host must run a build of ESX that has not reached End of General Support.

**Implementation Priority:** P2

**Bridging SCF Controls:** VPM-04

**Mapped Framework Controls:** TVM-08, TVM-10

#### esx-9.time

The ESX host must synchronize its clock with organizational reference sources.

**Implementation Priority:** P0

**Bridging SCF Controls:** SEA-20

**Mapped Framework Controls:** LOG-06

#### esx-9.tls-ciphers

The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** CEK-03, DSP-10

#### esx-9.tpm-configuration

The ESX host must require TPM-based configuration encryption.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-05

**Mapped Framework Controls:** CEK-03, UEM-08

#### esx-9.tpm-recovery-key-backup

The ESX host configuration encryption recovery key must be backed up to a secure off-host location.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-09

**Mapped Framework Controls:** CEK-08, CEK-10, CEK-11, CEK-12, CEK-13, CEK-14, CEK-15, CEK-16, CEK-17, CEK-18, CEK-19, CEK-20, CEK-21, LOG-11

#### esx-9.vmk-storage

The ESX host must protect the confidentiality and integrity of transmitted storage traffic.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03, NET-06

**Mapped Framework Controls:** CEK-03, DSP-10, I&S-06

#### esx-9.vmk-vmotion

The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03, NET-06

**Mapped Framework Controls:** CEK-03, DSP-10, I&S-06

#### esx-9.vmotion-encryption-offload

Accelerate vMotion encryption using available hardware offload on ESX hosts.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** CEK-03, DSP-10

#### guest-9.tools-add-feature

The guest OS must disable automatic addition of optional VMware Tools features.

**Implementation Priority:** P0

**Bridging SCF Controls:** CHG-04

**Mapped Framework Controls:** CCC-04

#### guest-9.tools-allow-transforms

The guest OS must disable MSI transforms in VMware Tools auto-upgrades.

**Implementation Priority:** P2

**Bridging SCF Controls:** CHG-04

**Mapped Framework Controls:** CCC-04

#### guest-9.tools-deactivate-appinfo

The guest OS must deactivate Appinfo information gathering unless required.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### guest-9.tools-deactivate-containerinfo

The guest OS must deactivate ContainerInfo unless required.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### guest-9.tools-deactivate-guestoperations

The guest OS must deactivate Guest Operations unless required.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### guest-9.tools-deactivate-gueststoreupgrade

The guest OS must deactivate Guest Store Upgrade operations unless required.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### guest-9.tools-deactivate-servicediscovery

The guest OS must deactivate Service Discovery unless required.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### guest-9.tools-globalconf

The guest OS must deactivate GlobalConf unless required.

**Implementation Priority:** P2

**Bridging SCF Controls:** CHG-04

**Mapped Framework Controls:** CCC-04

#### guest-9.tools-logs

The guest OS must enable VMware Tools logging.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** LOG-09, LOG-12

#### guest-9.tools-prevent-recustomization

The guest OS must prevent re-customization of an already-deployed VM.

**Implementation Priority:** P0

**Bridging SCF Controls:** CHG-04

**Mapped Framework Controls:** CCC-04

#### guest-9.tools-remove-feature

The guest OS must disable automatic removal of optional VMware Tools features.

**Implementation Priority:** P0

**Bridging SCF Controls:** CHG-04

**Mapped Framework Controls:** CCC-04

#### vm-9.deactivate-console-copy

Virtual machines must have console copy operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vm-9.deactivate-console-paste

Virtual machines must have console paste operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vm-9.deactivate-disk-shrinking-shrink

Virtual machines must have virtual disk shrinking operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vm-9.deactivate-disk-shrinking-wiper

Virtual machines must have virtual disk wiping operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vm-9.deactivate-non-essential-3d-features

Virtual machines must have 3D graphics features deactivated when not required.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vm-9.dvfilter

Virtual machines must limit access through the dvFilter API.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vm-9.efi-boot-types

Virtual machines must prevent booting from unauthorized sources.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vm-9.ft-encrypted

Virtual machines must require encryption for Fault Tolerance.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** CEK-03, DSP-10

#### vm-9.isolation-device-connectable-deactivate

Virtual machines must prevent unauthorized removal, connection, and modification of devices.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, IAC-21

**Mapped Framework Controls:** AIS-02, IAM-05, IAM-13

#### vm-9.isolation-tools-dnd-deactivate

Virtual machines must have console drag and drop operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vm-9.log-enable

Virtual machines must enable diagnostic logging.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** LOG-09, LOG-12

#### vm-9.log-retention

Virtual machines must limit the number of retained diagnostic logs.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** LOG-04

#### vm-9.pci-passthrough

Virtual machines must limit PCI device passthrough functionality.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, IAC-21

**Mapped Framework Controls:** AIS-02, IAM-05, IAM-13

#### vm-9.persistent-disk

Virtual machines must not use independent, nonpersistent disks.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vm-9.remove-unnecessary-devices

Virtual machines must remove unnecessary virtual hardware.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vm-9.restrict-host-info

Virtual machines must not be able to obtain host information from the hypervisor.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vm-9.vmotion-encrypted

Virtual machines must require encryption for vMotion.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** CEK-03, DSP-10

#### vm-9.vmrc-lock

Virtual machines must be configured to lock when the last console connection is closed.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-24

**Mapped Framework Controls:** UEM-06

### Operations

#### fleet-9.access-token

Limit the maximum lifetime of access tokens.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** IAM-14, IAM-15

#### fleet-9.api-token

Limit the maximum lifetime of API tokens.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** IAM-14, IAM-15

#### fleet-9.password-policy

Configure a fleet-wide password policy.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IAM-13, IAM-14, IAM-15

#### fleet-9.time

Configure fleet-wide time synchronization.

**Implementation Priority:** P0

**Bridging SCF Controls:** SEA-20

**Mapped Framework Controls:** LOG-06

#### operations-9.action-history-retention

Retain VCF Operations remediation action history for an appropriate interval.

**Implementation Priority:** P1

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** LOG-04

#### operations-9.ceip-disable

Disable the VCF Operations Customer Experience Improvement Program.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### operations-9.certificates-validation

VCF Operations must activate certificate validation.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.2

**Mapped Framework Controls:** IAM-13, IAM-14

#### operations-9.in-page-feedback

Disable VCF Operations in-page feedback.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### operations-9.log-retention

Configure the VCF Operations log retention period.

**Implementation Priority:** P1

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** LOG-04

#### operations-9.logs-authenticated-ingestion

Require authenticated log ingestion in VCF Operations.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-08

**Mapped Framework Controls:** LOG-02, LOG-10

#### operations-9.logs-ssl-api

Enable SSL for API log ingestion in VCF Operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** CEK-03, DSP-10

#### operations-9.logs-ssl-syslog

Enable SSL for syslog log ingestion in VCF Operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** CEK-03, DSP-10

#### operations-9.non-imported-vidm

Restrict VCF Operations access to imported identity-provider users.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-07

**Mapped Framework Controls:** IAM-06, IAM-07

#### operations-9.password-complexity

Enforce password complexity on VCF Operations local accounts.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IAM-13, IAM-14, IAM-15

#### operations-9.service-resilience

When VCF Operations runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** BCD-11.7, BCD-12.2

**Mapped Framework Controls:** BCR-03, BCR-11

### Installer

#### installer-9.security

The VCF Installer appliance must be removed or powered off after deployment completes, unless it has been converted into the SDDC Manager.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

### Operations for Networks

#### networks-9.audit-identity

Capture user identity in VCF Operations for Networks audit logs.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** LOG-09, LOG-12

### NSX

#### nsx-9.backup

Configure scheduled backups of NSX Manager.

**Implementation Priority:** P0

**Bridging SCF Controls:** BCD-11

**Mapped Framework Controls:** BCR-08

#### nsx-9.ceip-disable

Disable the NSX Manager Customer Experience Improvement Program.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### nsx-9.dhcp-disable

NSX Tier-0 Gateway must not enable DHCP unless it is required.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### nsx-9.inactive-interfaces

NSX Tier-0 Gateway must remove inactive interfaces.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03.1

**Mapped Framework Controls:** AIS-02

#### nsx-9.load-balancer-fips

Enable FIPS-validated cryptography for NSX load balancers.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-01, CRY-03

**Mapped Framework Controls:** CEK-01, CEK-02, CEK-03, CEK-04, DSP-10, LOG-11

#### nsx-9.log-level

NSX Manager must set service logging levels to capture audit-relevant events.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** LOG-09, LOG-12

#### nsx-9.multicast-disable

NSX Tier-0 Gateway must disable multicast and PIM where they are not required.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### nsx-9.password-complexity

Enforce password complexity on NSX Manager local accounts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IAM-13, IAM-14, IAM-15

#### nsx-9.routing-protocols-unused

Disable Tier-0 Gateway routing protocols that are not in use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03.1

**Mapped Framework Controls:** AIS-02

#### nsx-9.service-resilience

When NSX Manager runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** BCD-11.7, BCD-12.2

**Mapped Framework Controls:** BCR-03, BCR-11

#### nsx-9.snmp

NSX Manager must not use SNMP v1 or v2c.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### nsx-9.ssh

The NSX Manager SSH service must be deactivated except for temporary diagnostic use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### nsx-9.t1-dhcp-disable

Disable Tier-1 Gateway DHCP service when not in use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### nsx-9.t1-inactive-interfaces

Remove inactive interfaces and stale linked segments from Tier-1 Gateways.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03.1

**Mapped Framework Controls:** AIS-02

#### nsx-9.t1-multicast-disable

Disable Tier-1 Gateway multicast when not in use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### nsx-9.tls-ciphers

NSX Manager must use TLS with approved protocol versions and cipher suites.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** CEK-03, DSP-10

### Protection and Recovery

#### pnr-9.ssh

The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### pnr-9.time

The VCF Protection and Recovery appliance must synchronize its clock with organizational reference sources.

**Implementation Priority:** P0

**Bridging SCF Controls:** SEA-20

**Mapped Framework Controls:** LOG-06

### SDDC Manager

#### sddc-9.api-admin

SDDC Manager must configure the API admin account.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.8

**Mapped Framework Controls:** IAM-15

#### sddc-9.basic-auth-disable

Disable HTTP Basic Authentication on the SDDC Manager API.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** IAM-14, IAM-15

### vCenter

#### vcenter-9.administration-client-plugins

Reduce or eliminate third-party vCenter plugins.

**Implementation Priority:** P1

**Bridging SCF Controls:** TPM-03, TPM-04

**Mapped Framework Controls:** IAM-11

#### vcenter-9.bashshelladministrators

VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-16

**Mapped Framework Controls:** IAM-09, IAM-10, IAM-11

#### vcenter-9.ceip-disable

Disable the vCenter Customer Experience Improvement Program.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vcenter-9.client-feedback

Disable vSphere Client in-product feedback.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vcenter-9.client-telemetry

Disable vSphere Client UI telemetry.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vcenter-9.content-library-authentication

VMware vCenter must require authentication for published content libraries.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** IAC-20.1

**Mapped Framework Controls:** DSP-17

#### vcenter-9.drs

VMware vCenter must enable the Distributed Resource Scheduler for resilience and to enable automated patching.

**Implementation Priority:** P0

**Bridging SCF Controls:** BCD-02.2, CAP-01

**Mapped Framework Controls:** BCR-03, I&S-02

#### vcenter-9.events-database-retention

VMware vCenter must retain task and event data for an appropriate interval.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** LOG-04

#### vcenter-9.logs-level-global

Configure the vCenter logging level to capture security-relevant events.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** LOG-09, LOG-12

#### vcenter-9.native-key-provider-backup

Protect Native Key Provider backups with a strong password.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** BCD-11.4, CRY-09.3

**Mapped Framework Controls:** BCR-08, CEK-12, CEK-13, CEK-14, CEK-15, CEK-16, CEK-17, CEK-19

#### vcenter-9.network-restrict-discovery-protocol

Disable CDP/LLDP discovery protocols on distributed switches unless required.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vcenter-9.password-complexity

Enforce password complexity for vCenter SSO accounts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IAM-13, IAM-14, IAM-15

#### vcenter-9.password-history

Restrict password reuse on vCenter SSO accounts.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IAM-13, IAM-14, IAM-15

#### vcenter-9.password-max-age

Disable forced password expiration on vCenter SSO accounts.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IAM-13, IAM-14, IAM-15

#### vcenter-9.service-resilience-evc

Enable Enhanced vMotion Compatibility on vCenter clusters.

**Implementation Priority:** P1

**Bridging SCF Controls:** BCD-02.2

**Mapped Framework Controls:** BCR-03

#### vcenter-9.service-resilience-ha

Enable vSphere High Availability on clusters.

**Implementation Priority:** P0

**Bridging SCF Controls:** BCD-02.2, BCD-12.2

**Mapped Framework Controls:** BCR-03, BCR-11

#### vcenter-9.service-resilience-vmotion

Enable vMotion for live workload migration.

**Implementation Priority:** P0

**Bridging SCF Controls:** BCD-02.2

**Mapped Framework Controls:** BCR-03

#### vcenter-9.smtp

Send vCenter notification email over a secure SMTP connection.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** CEK-03, DSP-10

#### vcenter-9.snmp

Disable SNMP v1 and v2c receivers on vCenter.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vcenter-9.snmp3

Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** CEK-01, CEK-02, CEK-03, CEK-04, DSP-10, LOG-11

#### vcenter-9.ssh

Deactivate SSH access to the vCenter appliance except for temporary diagnostic use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vcenter-9.time

vCenter must synchronize its clock with organizational reference sources.

**Implementation Priority:** P0

**Bridging SCF Controls:** SEA-20

**Mapped Framework Controls:** LOG-06

#### vcenter-9.tls-ciphers

vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** CEK-03, DSP-10

#### vcenter-9.vami-firewall-restrict-access

Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.

**Implementation Priority:** P0

**Bridging SCF Controls:** END-05

**Mapped Framework Controls:** UEM-10

#### vcenter-9.vami-password-max-age

Disable forced password expiration on the vCenter appliance root account.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IAM-13, IAM-14, IAM-15

#### vcenter-9.vds-health-check-disable

Disable the vSphere Distributed Switch health check when not troubleshooting.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vcenter-9.vpxuser-length

Keep the vpxuser password at or above its default length.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1, IAC-10.4

**Mapped Framework Controls:** IAM-13, IAM-14, IAM-15

### VCF

#### vcf-9.mfa

Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-02

**Mapped Framework Controls:** IAM-13

#### vcf-9.permissions-roles

Review and right-size accounts, permissions, and role assignments across all VCF components.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-17, IAC-21

**Mapped Framework Controls:** IAM-05, IAM-08, IAM-09, IAM-10, IAM-11, IAM-13

#### vcf-9.secure-baseline

Apply the controls in this guidance, and document the rationale for any deviations.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-02, CFG-02.7

**Mapped Framework Controls:** AIS-02, CCC-06, CCC-08, I&S-04, UEM-07

### vSAN

#### vsan-9.auto-policy-management

vSAN automatic policy management must remain disabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** CHG-02

**Mapped Framework Controls:** CCC-02, CCC-03, CCC-05, CCC-09, CEK-05

#### vsan-9.auto-raid

vSAN ESA automatic RAID management must remain enabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** BCD-02.2

**Mapped Framework Controls:** BCR-03

#### vsan-9.automatic-rebalance

vSAN must enable automatic data rebalancing.

**Implementation Priority:** P0

**Bridging SCF Controls:** CAP-01

**Mapped Framework Controls:** I&S-02

#### vsan-9.encryption-rest

vSAN must protect data at rest.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-05

**Mapped Framework Controls:** CEK-03, UEM-08

#### vsan-9.encryption-transit-esa

vSAN must protect data in transit between hosts.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** CEK-03, DSP-10

#### vsan-9.encryption-transit-osa

vSAN must protect data in transit between hosts.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** CEK-03, DSP-10

#### vsan-9.file-services-authentication-smb

SMB file shares on vSAN File Services must require protocol encryption.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** CEK-03, DSP-10

#### vsan-9.hcl-internet

Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** AIS-02

#### vsan-9.iscsi-mutual-chap

vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** IAC-04

**Mapped Framework Controls:** DCS-09, IAM-13

#### vsan-9.managed-disk-claim

vSAN must disable managed disk claims.

**Implementation Priority:** P0

**Bridging SCF Controls:** CHG-04

**Mapped Framework Controls:** CCC-04

#### vsan-9.network-isolation-vsan-iscsi-target

Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-06

**Mapped Framework Controls:** I&S-06

#### vsan-9.operations-reserve

vSAN must reserve space to complete internal maintenance operations.

**Implementation Priority:** P0

**Bridging SCF Controls:** CAP-01

**Mapped Framework Controls:** I&S-02

#### vsan-9.rekey-interval

Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-09

**Mapped Framework Controls:** CEK-08, CEK-10, CEK-11, CEK-12, CEK-13, CEK-14, CEK-15, CEK-16, CEK-17, CEK-18, CEK-19, CEK-20, CEK-21, LOG-11

#### vsan-9.storage-cluster-traffic-protection

vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03, NET-06

**Mapped Framework Controls:** CEK-03, DSP-10, I&S-06
