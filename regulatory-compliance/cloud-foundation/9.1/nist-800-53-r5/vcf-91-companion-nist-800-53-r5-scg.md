# Companion Guide to NIST SP 800-53 Revision 5 for VMware Cloud Foundation 9.1 -- SCG Hardening Controls

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-53r5.pdf

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

253 Security Configuration Guide controls map to this framework through the SCF crosswalk, grouped below by product component.

### Automation

#### automation-9.activity-log

Retain the VCF Automation activity log for the audit window and keep debug output disabled.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03, MON-10

**Mapped Framework Controls:** AU-11, CM-07

#### automation-9.oidc-settings

Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-03, IAC-10

**Mapped Framework Controls:** IA-05, IA-05(01), SC-08, SC-08(01)

#### automation-9.operation-limits

Configure operation limits in VCF Automation to bound resource-intensive operations.

**Implementation Priority:** P0

**Bridging SCF Controls:** CAP-02

**Mapped Framework Controls:** SC-05, SC-05(01), SC-05(02), SC-06

#### automation-9.timeouts

Limit the VCF Automation API token lifetime.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** IA-05, IA-05(01)

### ESX

#### esx-9.account-lockout-duration

The ESX host must enforce an unlock timeout.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** AC-07

#### esx-9.account-lockout-max-attempts

The ESX host must enforce a limit on consecutive invalid logon attempts by a user.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** AC-07

#### esx-9.account-password-history

The ESX host must enforce password history for users.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IA-05(01)

#### esx-9.ad-admin-group-autoadd

The ESX host must not automatically grant administrative permissions to Active Directory groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** AC-06, SA-08(14)

#### esx-9.ad-admin-group-name

The ESX host must not use the default "ESX Admins" Active Directory group.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.8

**Mapped Framework Controls:** IA-05, IA-05(05)

#### esx-9.ad-admin-validate-interval

The ESX host must not disable validation of users and groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-17

**Mapped Framework Controls:** AC-06(07)

#### esx-9.api-soap-timeout

The ESX host must configure a session timeout for the vSphere API.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** AC-12

#### esx-9.ceip-disable

Disable the ESX Customer Experience Improvement Program.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### esx-9.cpu-hyperthread-warning

The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-01.4

**Mapped Framework Controls:** SI-04(05)

#### esx-9.dcui-timeout

Set a timeout to automatically terminate idle DCUI sessions on the ESX host.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** AC-12

#### esx-9.deactivate-mob

The ESX Managed Object Browser (MOB) must be disabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### esx-9.deactivate-shell

The ESX Shell must be disabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### esx-9.entropy

The ESX host must use sufficient entropy for cryptographic operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** SC-08(01), SC-08(02), SC-13, SI-07(06)

#### esx-9.etc-issue

Configure the login banner for ESX host SSH connections.

**Implementation Priority:** P1

**Bridging SCF Controls:** SEA-18

**Mapped Framework Controls:** AC-08

#### esx-9.firewall-incoming-default

The ESX host must configure the firewall to block network traffic by default.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04.1

**Mapped Framework Controls:** SC-07(05), SC-07(11)

#### esx-9.firewall-restrict-access

Configure the ESX host firewall to only allow traffic from authorized networks.

**Implementation Priority:** P0

**Bridging SCF Controls:** NET-04.1

**Mapped Framework Controls:** SC-07(05), SC-07(11)

#### esx-9.forensic-snapshots

Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, IRO-08

**Mapped Framework Controls:** AU-10(03), CM-07, IR-04(12)

#### esx-9.hardware-boot

The environment must use adequately sized persistent, non-SD, non-USB devices for ESX boot volumes.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-04

**Mapped Framework Controls:** AU-04

#### esx-9.hardware-boot-order

Restrict the server firmware boot order to authorized boot devices.

**Implementation Priority:** P1

**Bridging SCF Controls:** END-06.5

**Mapped Framework Controls:** SI-07(09)

#### esx-9.hardware-cpu-amd-cc

Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-01, SEA-10

**Mapped Framework Controls:** SC-08(01), SC-08(02), SC-13, SI-07(06), SI-16

#### esx-9.hardware-cpu-intel-cc

Enable Intel SGX and TDX in system firmware where available.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-01, SEA-10

**Mapped Framework Controls:** SC-08(01), SC-08(02), SC-13, SI-07(06), SI-16

#### esx-9.hardware-cpu-intel-txt

Enable Intel TXT in system firmware where available.

**Implementation Priority:** P1

**Bridging SCF Controls:** END-06.5, END-06.6

**Mapped Framework Controls:** SI-07(09), SI-07(10)

#### esx-9.hardware-firmware-updates

Ensure all system and device firmware is auditable, authentic, and up to date.

**Implementation Priority:** P0

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** SI-02, SI-02(04), SI-03

#### esx-9.hardware-management-config-lock

Lock the hardware management controller configuration after provisioning.

**Implementation Priority:** P1

**Bridging SCF Controls:** CHG-04

**Mapped Framework Controls:** CM-05

#### esx-9.hardware-management-log-forwarding

Forward hardware management controller logs to a central log server.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02, MON-02.2

**Mapped Framework Controls:** AU-02, AU-06, AU-06(04), IR-04(04), SI-04

#### esx-9.hardware-management-security

Harden integrated hardware management controllers.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03, IAC-10.8

**Mapped Framework Controls:** CM-07, IA-05, IA-05(05)

#### esx-9.hardware-management-time

Synchronize hardware management controller time with organizational reference sources.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-07.1, SEA-20

**Mapped Framework Controls:** AU-08, SC-45, SC-45(01)

#### esx-9.hardware-ports

Disable or physically protect unused external server ports.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03, END-12

**Mapped Framework Controls:** CM-07, SC-41

#### esx-9.hardware-secureboot

Enable UEFI Secure Boot.

**Implementation Priority:** P0

**Bridging SCF Controls:** END-06.5, END-06.6

**Mapped Framework Controls:** SI-07(09), SI-07(10)

#### esx-9.hardware-tpm

Install and enable a TPM 2.0 on each ESX host.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-09, END-06.5

**Mapped Framework Controls:** SC-28(03), SI-07(09)

#### esx-9.hardware-virtual-nic

The ESX host must not enable virtual hardware management network interfaces.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03, SEA-03.2

**Mapped Framework Controls:** CM-07, SC-02, SC-02(01)

#### esx-9.iscsi-mutual-chap

Enable bidirectional/mutual CHAP authentication for iSCSI traffic.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** IAC-04

**Mapped Framework Controls:** IA-03, IA-03(01), IA-03(04)

#### esx-9.key-persistence

Disable Key Persistence on ESX hosts that do not have controlled physical access.

**Implementation Priority:** P2, Upon Feature Enablement

**Bridging SCF Controls:** CRY-09

**Mapped Framework Controls:** SC-28(03)

#### esx-9.lockdown-dcui-access

Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** AC-06, SA-08(14)

#### esx-9.lockdown-exception-users

Keep the Lockdown Mode Exception Users list to the minimum necessary.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** AC-06, SA-08(14)

#### esx-9.lockdown-mode

The ESX host must enable Lockdown Mode.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-20

**Mapped Framework Controls:** AC-03, AC-06

#### esx-9.log-audit-forwarding

The ESX host must transmit audit records to a remote host.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02

**Mapped Framework Controls:** AU-02, AU-06, IR-04(04), SI-04

#### esx-9.log-audit-local

The ESX host must enable audit record logging.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** AU-03

#### esx-9.log-audit-local-capacity

The ESX host must store audit records for a time period consistent with your records retention policy.

**Implementation Priority:** P1

**Bridging SCF Controls:** MON-04, MON-10

**Mapped Framework Controls:** AU-04, AU-11

#### esx-9.log-audit-persistent

Configure a persistent log location for all locally stored audit records on the ESX host.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-08, MON-10

**Mapped Framework Controls:** AU-09, AU-11

#### esx-9.log-filter

The ESX host must not enable log filtering.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03, MON-08

**Mapped Framework Controls:** AU-03, AU-09

#### esx-9.log-forwarding

The ESX host must forward system and audit logs to a remote log collection point.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02, MON-13

**Mapped Framework Controls:** AU-02, AU-05(05), AU-06, IR-04(04), SI-04

#### esx-9.log-forwarding-tls-ciphers

The ESX host must verify certificates for TLS remote logging endpoints.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03, IAC-10.2

**Mapped Framework Controls:** IA-05(02), SC-08, SC-08(01)

#### esx-9.log-forwarding-tls-x509

The ESX host must use strict x509 verification for TLS-enabled remote logging endpoints.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.2

**Mapped Framework Controls:** IA-05(02)

#### esx-9.log-level

The ESX host must produce audit records containing information to establish what type of events occurred.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** AU-03

#### esx-9.log-persistent

Configure a persistent log location for all locally stored logs on the ESX host.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-08, MON-10

**Mapped Framework Controls:** AU-09, AU-11

#### esx-9.login-message

Configure the ESX host login banner for the DCUI and Host Client.

**Implementation Priority:** P1

**Bridging SCF Controls:** SEA-18

**Mapped Framework Controls:** AC-08

#### esx-9.memeagerzero

The ESX host must enable volatile key destruction.

**Implementation Priority:** P0

**Bridging SCF Controls:** SEA-05

**Mapped Framework Controls:** SC-04

#### esx-9.memory-tiering-encryption

The ESX host should encrypt data written to tiered memory devices.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-05

**Mapped Framework Controls:** SC-13, SC-28, SC-28(01)

#### esx-9.network-bpdu

Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-02.1, NET-04

**Mapped Framework Controls:** AC-04, SC-05

#### esx-9.network-dvfilter

Use of the dvFilter network APIs must be restricted on the ESX host.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, NET-04

**Mapped Framework Controls:** AC-04, CM-07

#### esx-9.network-rpf-promisc

The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** AC-04

#### esx-9.network-standard-reject-forged-transmit

Reject forged transmits on standard switches and port groups.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** AC-04

#### esx-9.network-standard-reject-mac-changes

Reject guest MAC address changes on standard switches and port groups.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** AC-04

#### esx-9.network-standard-reject-promiscuous-mode

Reject promiscuous mode on standard switches and port groups.

**Implementation Priority:** P2, Upon Feature Enablement

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** AC-04

#### esx-9.nfs-traffic-protection

Protect NFS datastore traffic on the ESX host using encryption or network isolation.

**Implementation Priority:** P1, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03, NET-06

**Mapped Framework Controls:** AC-04(21), SC-08, SC-08(01)

#### esx-9.password-complexity

Enforce password complexity on ESX local accounts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IA-05(01)

#### esx-9.password-max-age

The ESX host must be configured with an appropriate maximum password age.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IA-05(01)

#### esx-9.secureboot-enforcement

The ESX host must enable Secure Boot enforcement for configuration encryption.

**Implementation Priority:** P2

**Bridging SCF Controls:** END-06.5, END-06.6

**Mapped Framework Controls:** SI-07(09), SI-07(10)

#### esx-9.session-timeout

The ESX Host Client must enforce an idle session timeout.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** AC-12

#### esx-9.shell-interactive-timeout

Configure the inactivity timeout to automatically terminate idle ESX host shells.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** AC-12

#### esx-9.shell-timeout

Set a timeout to limit how long the ESX Shell and SSH services are allowed to run.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** AC-12

#### esx-9.shell-warning

The ESX host must not suppress warnings that the local or remote shell is enabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-01.4

**Mapped Framework Controls:** SI-04(05)

#### esx-9.snmp

The SNMP service on the ESX host must not be configured to start automatically.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### esx-9.ssh

The ESX host's SSH service must be deactivated except for temporary diagnostic use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, NET-14.4

**Mapped Framework Controls:** AC-17(04), CM-07

#### esx-9.supported

The ESX host must run a build of ESX that has not reached End of General Support.

**Implementation Priority:** P2

**Bridging SCF Controls:** TDA-17, VPM-04

**Mapped Framework Controls:** SA-22, SC-18(01)

#### esx-9.time

The ESX host must synchronize its clock with organizational reference sources.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-07.1, SEA-20

**Mapped Framework Controls:** AU-08, SC-45, SC-45(01)

#### esx-9.tls-ciphers

The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** SC-08, SC-08(01)

#### esx-9.tpm-configuration

The ESX host must require TPM-based configuration encryption.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-05

**Mapped Framework Controls:** SC-13, SC-28, SC-28(01)

#### esx-9.tpm-recovery-key-backup

The ESX host configuration encryption recovery key must be backed up to a secure off-host location.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-09

**Mapped Framework Controls:** SC-28(03)

#### esx-9.tpm-trusted-binaries

The ESX host must enforce execInstalledOnly.

**Implementation Priority:** P2

**Bridging SCF Controls:** END-06.5, SEA-06

**Mapped Framework Controls:** CM-07(02), SI-07(09)

#### esx-9.transparent-page-sharing

The ESX host must restrict inter-VM transparent page sharing to VMs configured with sched.mem.pshare.salt.

**Implementation Priority:** P2

**Bridging SCF Controls:** SEA-05

**Mapped Framework Controls:** SC-04

#### esx-9.updates

The ESX host must have all available software updates and patches installed.

**Implementation Priority:** P0

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** SI-02, SI-02(04), SI-03

#### esx-9.vib-acceptance-level-supported

The ESX host image profile acceptance level must be PartnerSupported or higher.

**Implementation Priority:** P2

**Bridging SCF Controls:** CHG-04.2

**Mapped Framework Controls:** CM-14, SI-07(15)

#### esx-9.vib-trusted-binaries

The ESX host must only execute binaries delivered through a signed VIB.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03.2

**Mapped Framework Controls:** CM-07(02)

#### esx-9.vmk-management

The ESX host must isolate management communications.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-06.1

**Mapped Framework Controls:** SC-07(13), SC-07(29)

#### esx-9.vmk-storage

The ESX host must protect the confidentiality and integrity of transmitted storage traffic.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03, NET-06

**Mapped Framework Controls:** AC-04(21), SC-08, SC-08(01)

#### esx-9.vmk-vmotion

The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03, NET-06

**Mapped Framework Controls:** AC-04(21), SC-08, SC-08(01)

#### esx-9.vmotion-encryption-offload

Accelerate vMotion encryption using available hardware offload on ESX hosts.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03, TDA-02.2

**Mapped Framework Controls:** IA-02(01), IA-02(02), SA-04(07), SA-04(10), SC-08, SC-08(01)

#### guest-9.tools-add-feature

The guest OS must disable automatic addition of optional VMware Tools features.

**Implementation Priority:** P0

**Bridging SCF Controls:** CHG-04

**Mapped Framework Controls:** CM-05

#### guest-9.tools-allow-transforms

The guest OS must disable MSI transforms in VMware Tools auto-upgrades.

**Implementation Priority:** P2

**Bridging SCF Controls:** CHG-04

**Mapped Framework Controls:** CM-05

#### guest-9.tools-deactivate-appinfo

The guest OS must deactivate Appinfo information gathering unless required.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### guest-9.tools-deactivate-containerinfo

The guest OS must deactivate ContainerInfo unless required.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### guest-9.tools-deactivate-guestoperations

The guest OS must deactivate Guest Operations unless required.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### guest-9.tools-deactivate-gueststoreupgrade

The guest OS must deactivate Guest Store Upgrade operations unless required.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### guest-9.tools-deactivate-servicediscovery

The guest OS must deactivate Service Discovery unless required.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### guest-9.tools-globalconf

The guest OS must deactivate GlobalConf unless required.

**Implementation Priority:** P2

**Bridging SCF Controls:** CHG-04

**Mapped Framework Controls:** CM-05

#### guest-9.tools-log-forwarding

The guest OS must send VMware Tools logs to the system log service.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02

**Mapped Framework Controls:** AU-02, AU-06, IR-04(04), SI-04

#### guest-9.tools-logs

The guest OS must enable VMware Tools logging.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** AU-03

#### guest-9.tools-prevent-recustomization

The guest OS must prevent re-customization of an already-deployed VM.

**Implementation Priority:** P0

**Bridging SCF Controls:** CHG-04

**Mapped Framework Controls:** CM-05

#### guest-9.tools-remove-feature

The guest OS must disable automatic removal of optional VMware Tools features.

**Implementation Priority:** P0

**Bridging SCF Controls:** CHG-04

**Mapped Framework Controls:** CM-05

#### guest-9.tools-updates

The guest OS must run a current version of VMware Tools.

**Implementation Priority:** P0

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** SI-02, SI-02(04), SI-03

#### guest-9.tools-upgrade

The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.

**Implementation Priority:** P2

**Bridging SCF Controls:** VPM-05, VPM-05.4

**Mapped Framework Controls:** SI-02, SI-02(04), SI-02(05), SI-03

#### vm-9.deactivate-console-copy

Virtual machines must have console copy operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, SEA-05

**Mapped Framework Controls:** CM-07, SC-04

#### vm-9.deactivate-console-paste

Virtual machines must have console paste operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, SEA-05

**Mapped Framework Controls:** CM-07, SC-04

#### vm-9.deactivate-disk-shrinking-shrink

Virtual machines must have virtual disk shrinking operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CAP-02, CFG-03

**Mapped Framework Controls:** CM-07, SC-05, SC-05(01), SC-05(02), SC-06

#### vm-9.deactivate-disk-shrinking-wiper

Virtual machines must have virtual disk wiping operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CAP-02, CFG-03

**Mapped Framework Controls:** CM-07, SC-05, SC-05(01), SC-05(02), SC-06

#### vm-9.deactivate-non-essential-3d-features

Virtual machines must have 3D graphics features deactivated when not required.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### vm-9.dvfilter

Virtual machines must limit access through the dvFilter API.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, NET-04

**Mapped Framework Controls:** AC-04, CM-07

#### vm-9.efi-boot-types

Virtual machines must prevent booting from unauthorized sources.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03, END-06.5

**Mapped Framework Controls:** CM-07, SI-07(09)

#### vm-9.ft-encrypted

Virtual machines must require encryption for Fault Tolerance.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** SC-08, SC-08(01), SC-16(01), SC-28(01)

#### vm-9.isolation-device-connectable-deactivate

Virtual machines must prevent unauthorized removal, connection, and modification of devices.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, IAC-21

**Mapped Framework Controls:** AC-06, CM-07, SA-08(14)

#### vm-9.isolation-tools-dnd-deactivate

Virtual machines must have console drag and drop operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, SEA-05

**Mapped Framework Controls:** CM-07, SC-04

#### vm-9.limit-console-connections

Virtual machines must limit console sharing.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-23

**Mapped Framework Controls:** AC-10

#### vm-9.limit-setinfo-size

Virtual machines must limit informational messages from the virtual machine to the VMX file.

**Implementation Priority:** P2

**Bridging SCF Controls:** CAP-02

**Mapped Framework Controls:** SC-05, SC-05(01), SC-05(02), SC-06

#### vm-9.log-enable

Virtual machines must enable diagnostic logging.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** AU-03

#### vm-9.log-retention

Virtual machines must limit the number of retained diagnostic logs.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-04, MON-10

**Mapped Framework Controls:** AU-04, AU-11

#### vm-9.log-rotation-size

Virtual machines must limit the size of diagnostic logs.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-04

**Mapped Framework Controls:** AU-04

#### vm-9.pci-passthrough

Virtual machines must limit PCI device passthrough functionality.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, IAC-21

**Mapped Framework Controls:** AC-06, CM-07, SA-08(14)

#### vm-9.persistent-disk

Virtual machines must not use independent, nonpersistent disks.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### vm-9.remove-unnecessary-devices

Virtual machines must remove unnecessary virtual hardware.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03, END-12

**Mapped Framework Controls:** CM-07, SC-41

#### vm-9.restrict-host-info

Virtual machines must not be able to obtain host information from the hypervisor.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### vm-9.secure-boot

The guest OS must enable Secure Boot.

**Implementation Priority:** P0

**Bridging SCF Controls:** END-06.5, END-06.6

**Mapped Framework Controls:** SI-07(09), SI-07(10)

#### vm-9.transparentpagesharing-inter-vm-enabled

Virtual machines must restrict sharing of memory pages between VMs.

**Implementation Priority:** P2

**Bridging SCF Controls:** SEA-05

**Mapped Framework Controls:** SC-04

#### vm-9.virtual-hardware

Virtual machines must use a minimum supported virtual hardware version.

**Implementation Priority:** P1

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** SI-02, SI-02(04), SI-03

#### vm-9.vmotion-encrypted

Virtual machines must require encryption for vMotion.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** SC-08, SC-08(01), SC-16(01), SC-28(01)

#### vm-9.vmrc-lock

Virtual machines must be configured to lock when the last console connection is closed.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-24

**Mapped Framework Controls:** AC-02(05), AC-11

### Operations

#### fleet-9.access-token

Limit the maximum lifetime of access tokens.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** IA-05, IA-05(01)

#### fleet-9.all-users-group

Do not automatically include all users in role assignments.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-20

**Mapped Framework Controls:** AC-03, AC-06

#### fleet-9.api-token

Limit the maximum lifetime of API tokens.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** IA-05, IA-05(01)

#### fleet-9.dns

Configure fleet-wide DNS settings.

**Implementation Priority:** P1

**Bridging SCF Controls:** NET-10

**Mapped Framework Controls:** SC-20, SC-20(02)

#### fleet-9.jit-inactivity

Configure an inactivity expiry for Just-In-Time users.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-15.3

**Mapped Framework Controls:** AC-02(03)

#### fleet-9.password-policy

Configure a fleet-wide password policy.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1, IAC-22

**Mapped Framework Controls:** AC-07, IA-05(01)

#### fleet-9.time

Configure fleet-wide time synchronization.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-07.1, SEA-20

**Mapped Framework Controls:** AU-08, SC-45, SC-45(01)

#### operations-9.account-lockout

VCF Operations must lock accounts after consecutive failed logon attempts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** AC-07

#### operations-9.action-history-retention

Retain VCF Operations remediation action history for an appropriate interval.

**Implementation Priority:** P1

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** AU-11

#### operations-9.ceip-disable

Disable the VCF Operations Customer Experience Improvement Program.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### operations-9.certificates-validation

VCF Operations must activate certificate validation.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.2

**Mapped Framework Controls:** IA-05(02)

#### operations-9.concurrent-sessions

VCF Operations must limit the number of concurrent sessions.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-23

**Mapped Framework Controls:** AC-10

#### operations-9.credential-ownership-enforcement

VCF Operations must enable credential ownership enforcement.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-08

**Mapped Framework Controls:** AC-03(11)

#### operations-9.firewall-hardening

VCF Operations must enable firewall hardening.

**Implementation Priority:** P0

**Bridging SCF Controls:** NET-03, NET-04.1

**Mapped Framework Controls:** SC-07, SC-07(05), SC-07(09), SC-07(11)

#### operations-9.in-page-feedback

Disable VCF Operations in-page feedback.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### operations-9.log-collection

Configure VCF Operations log collection for all deployed components.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02, MON-02.2

**Mapped Framework Controls:** AU-02, AU-06, AU-06(04), IR-04(04), SI-04

#### operations-9.log-retention

Configure the VCF Operations log retention period.

**Implementation Priority:** P1

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** AU-11

#### operations-9.login-message

Configure the VCF Operations login banner.

**Implementation Priority:** P1

**Bridging SCF Controls:** SEA-18

**Mapped Framework Controls:** AC-08

#### operations-9.logs-authenticated-ingestion

Require authenticated log ingestion in VCF Operations.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-08, NET-04.12

**Mapped Framework Controls:** AC-04(17), AU-09

#### operations-9.logs-ssl-api

Enable SSL for API log ingestion in VCF Operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** SC-08, SC-08(01), SC-16(01), SC-28(01)

#### operations-9.logs-ssl-syslog

Enable SSL for syslog log ingestion in VCF Operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** SC-08, SC-08(01), SC-16(01), SC-28(01)

#### operations-9.non-imported-vidm

Restrict VCF Operations access to imported identity-provider users.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-07, IAC-20

**Mapped Framework Controls:** AC-03, AC-06, IA-12(04)

#### operations-9.password-complexity

Enforce password complexity on VCF Operations local accounts.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IA-05(01)

#### operations-9.service-resilience

When VCF Operations runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** BCD-11.7, BCD-12.2

**Mapped Framework Controls:** CP-09(06), SI-13

#### operations-9.session-timeout

VCF Operations must enforce an idle session timeout.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** AC-12

#### operations-9.unsigned-pak

VCF Operations must disable unsigned management pack installation.

**Implementation Priority:** P2

**Bridging SCF Controls:** CHG-04.2

**Mapped Framework Controls:** CM-14, SI-07(15)

### Installer

#### installer-9.security

The VCF Installer appliance must be removed or powered off after deployment completes, unless it has been converted into the SDDC Manager.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

### Operations for Networks

#### networks-9.audit-identity

Capture user identity in VCF Operations for Networks audit logs.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** AU-03

#### networks-9.login-message

Configure the VCF Operations for Networks login banner.

**Implementation Priority:** P1

**Bridging SCF Controls:** SEA-18

**Mapped Framework Controls:** AC-08

#### networks-9.session-timeout

VCF Operations for Networks must enforce an idle session timeout.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** AC-12

### NSX

#### nsx-9.account-lockout-max-attempts

NSX Manager must enforce an account lockout after consecutive failed authentication attempts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** AC-07

#### nsx-9.api-rate-limits

Configure NSX Manager API rate and concurrency limits.

**Implementation Priority:** P0

**Bridging SCF Controls:** CAP-02, NET-03.1

**Mapped Framework Controls:** SC-05, SC-05(01), SC-05(02), SC-06, SC-07(03), SI-04(25)

#### nsx-9.backup

Configure scheduled backups of NSX Manager.

**Implementation Priority:** P0

**Bridging SCF Controls:** BCD-11

**Mapped Framework Controls:** CP-09, SC-28(02)

#### nsx-9.bgp-encryption

Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-04, NET-09

**Mapped Framework Controls:** SC-08, SC-16(01), SC-23, SC-28(01)

#### nsx-9.bgp-max-prefixes

Configure BGP maximum prefix limits on Tier-0 Gateway neighbors.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-02.1

**Mapped Framework Controls:** SC-05

#### nsx-9.ceip-disable

Disable the NSX Manager Customer Experience Improvement Program.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### nsx-9.dhcp-disable

NSX Tier-0 Gateway must not enable DHCP unless it is required.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### nsx-9.ibgp-source-loopback

Configure Tier-0 Gateway iBGP peering to use the loopback address as the source.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** SC-07, SC-07(09), SC-07(11)

#### nsx-9.inactive-interfaces

NSX Tier-0 Gateway must remove inactive interfaces.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03.1

**Mapped Framework Controls:** CM-07(01)

#### nsx-9.load-balancer-fips

Enable FIPS-validated cryptography for NSX load balancers.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-01, CRY-03

**Mapped Framework Controls:** SC-08, SC-08(01), SC-08(02), SC-13, SI-07(06)

#### nsx-9.log-level

NSX Manager must set service logging levels to capture audit-relevant events.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** AU-03

#### nsx-9.login-message

Configure the NSX Manager login banner.

**Implementation Priority:** P1

**Bridging SCF Controls:** SEA-18

**Mapped Framework Controls:** AC-08

#### nsx-9.multicast-disable

NSX Tier-0 Gateway must disable multicast and PIM where they are not required.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### nsx-9.ospf-encryption

NSX Tier-0 Gateway must enable OSPF authentication.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-04, NET-09

**Mapped Framework Controls:** SC-08, SC-16(01), SC-23, SC-28(01)

#### nsx-9.password-complexity

Enforce password complexity on NSX Manager local accounts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IA-05(01)

#### nsx-9.reverse-path-forwarding

NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-02.1, NET-03

**Mapped Framework Controls:** SC-05, SC-07, SC-07(09), SC-07(11)

#### nsx-9.routing-protocols-unused

Disable Tier-0 Gateway routing protocols that are not in use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03.1

**Mapped Framework Controls:** CM-07(01)

#### nsx-9.service-resilience

When NSX Manager runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** BCD-11.7, BCD-12.2

**Mapped Framework Controls:** CP-09(06), SI-13

#### nsx-9.session-timeout

NSX Manager must enforce an idle session timeout on its API and CLI.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** AC-12

#### nsx-9.snmp

NSX Manager must not use SNMP v1 or v2c.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, NET-12

**Mapped Framework Controls:** AC-02, AC-03, AC-05, CM-07, SI-03, SI-04, SI-05, SI-07, SI-10

#### nsx-9.ssh

The NSX Manager SSH service must be deactivated except for temporary diagnostic use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### nsx-9.t0-ipv6-hop-limit

The NSX Tier-0 Gateway must advertise a sufficient IPv6 Router Advertisement hop limit.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-02.1

**Mapped Framework Controls:** SC-05

#### nsx-9.t1-dhcp-disable

Disable Tier-1 Gateway DHCP service when not in use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### nsx-9.t1-inactive-interfaces

Remove inactive interfaces and stale linked segments from Tier-1 Gateways.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03.1

**Mapped Framework Controls:** CM-07(01)

#### nsx-9.t1-ipv6-hop-limit

The NSX Tier-1 Gateway must advertise a sufficient IPv6 Router Advertisement hop limit.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-02.1

**Mapped Framework Controls:** SC-05

#### nsx-9.t1-multicast-disable

Disable Tier-1 Gateway multicast when not in use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### nsx-9.timezone-utc

Set NSX Manager timezone to UTC for consistent audit timestamps.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-07

**Mapped Framework Controls:** AU-08

#### nsx-9.tls-ciphers

NSX Manager must use TLS with approved protocol versions and cipher suites.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** SC-08, SC-08(01)

### Protection and Recovery

#### pnr-9.log-forwarding

The VCF Protection and Recovery appliance must forward its logs to a central log server.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02

**Mapped Framework Controls:** AU-02, AU-06, IR-04(04), SI-04

#### pnr-9.ssh

The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03, NET-14

**Mapped Framework Controls:** AC-17, AC-17(06), CM-07

#### pnr-9.time

The VCF Protection and Recovery appliance must synchronize its clock with organizational reference sources.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-07.1, SEA-20

**Mapped Framework Controls:** AU-08, SC-45, SC-45(01)

### SDDC Manager

#### sddc-9.api-admin

SDDC Manager must configure the API admin account.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.8

**Mapped Framework Controls:** IA-05, IA-05(05)

#### sddc-9.basic-auth-disable

Disable HTTP Basic Authentication on the SDDC Manager API.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** IA-05, IA-05(01)

### vCenter

#### vcenter-9.account-lockout-duration

Set the vCenter account auto-unlock interval.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** AC-07

#### vcenter-9.account-lockout-max-attempts

Lock vCenter accounts after repeated failed login attempts.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** AC-07

#### vcenter-9.account-lockout-reset

Set the vCenter failed-login counting interval.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** AC-07

#### vcenter-9.administration-client-plugins

Reduce or eliminate third-party vCenter plugins.

**Implementation Priority:** P1

**Bridging SCF Controls:** TPM-03, TPM-04

**Mapped Framework Controls:** SA-09, SA-09(03), SR-02, SR-02(01)

#### vcenter-9.administration-sso-groups

VMware vCenter must separate authentication and authorization for administrators.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-01.2

**Mapped Framework Controls:** IA-04, IA-04(04)

#### vcenter-9.bashshelladministrators

VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-15.5

**Mapped Framework Controls:** AC-02(09)

#### vcenter-9.ceip-disable

Disable the vCenter Customer Experience Improvement Program.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### vcenter-9.client-feedback

Disable vSphere Client in-product feedback.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### vcenter-9.client-telemetry

Disable vSphere Client UI telemetry.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CM-07

#### vcenter-9.content-library-ovf

VMware vCenter must enable the OVF security policy on content libraries.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CHG-04.2

**Mapped Framework Controls:** CM-14, SI-07(15)

#### vcenter-9.drs

VMware vCenter must enable the Distributed Resource Scheduler for resilience and to enable automated patching.

**Implementation Priority:** P0

**Bridging SCF Controls:** BCD-02.2, CAP-01

**Mapped Framework Controls:** CP-02(05), SC-05, SC-05(03)

#### vcenter-9.etc-issue

Configure the vCenter SSH login banner (/etc/issue).

**Implementation Priority:** P1

**Bridging SCF Controls:** SEA-18

**Mapped Framework Controls:** AC-08

#### vcenter-9.events-database-retention

VMware vCenter must retain task and event data for an appropriate interval.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** AU-11

#### vcenter-9.events-remote-logging

Enable remote logging of vCenter events.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-02.7

**Mapped Framework Controls:** AU-12(01)

#### vcenter-9.log-forwarding

VMware vCenter must forward its logs to a central log server.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02

**Mapped Framework Controls:** AU-02, AU-06, IR-04(04), SI-04

#### vcenter-9.login-message

Configure the vCenter login banner for the vSphere Client.

**Implementation Priority:** P1

**Bridging SCF Controls:** SEA-18

**Mapped Framework Controls:** AC-08

#### vcenter-9.logs-level-global

Configure the vCenter logging level to capture security-relevant events.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** AU-03

#### vcenter-9.native-key-provider-backup

Protect Native Key Provider backups with a strong password.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** BCD-11.4, CRY-09.3

**Mapped Framework Controls:** CP-09(08), SC-12(01), SC-28(01)

#### vcenter-9.network-mac-learning

Disable MAC learning on distributed switch port groups unless a workload requires it.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** SC-07, SC-07(09), SC-07(11)

#### vcenter-9.network-nioc

Enable Network I/O Control on distributed switches.

**Implementation Priority:** P2

**Bridging SCF Controls:** CAP-02, NET-02.1

**Mapped Framework Controls:** SC-05, SC-05(01), SC-05(02), SC-06

#### vcenter-9.network-reject-forged-transmit-dvportgroup

Reject forged transmits on distributed switches and port groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** SC-07, SC-07(09), SC-07(11)

#### vcenter-9.network-reject-mac-changes-dvportgroup

Reject guest MAC address changes on distributed switches and port groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** SC-07, SC-07(09), SC-07(11)

#### vcenter-9.network-reject-promiscuous-mode-dvportgroup

Reject promiscuous mode on distributed switches and port groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** AC-04

#### vcenter-9.network-reset-port

Reset distributed switch port configuration when a virtual machine disconnects.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-06, NET-03

**Mapped Framework Controls:** CM-03(08), CM-11(03), SC-07, SC-07(09), SC-07(11)

#### vcenter-9.network-restrict-discovery-protocol

Disable CDP/LLDP discovery protocols on distributed switches unless required.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03, NET-03.3

**Mapped Framework Controls:** CM-07, SC-07(16)

#### vcenter-9.network-restrict-netflow-usage

Send distributed switch NetFlow data only to authorized collectors.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03, NET-04

**Mapped Framework Controls:** AC-04, SC-07, SC-07(09), SC-07(11)

#### vcenter-9.network-restrict-port-level-overrides

Disallow per-port policy overrides on distributed port groups, except port blocking.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-06, NET-03

**Mapped Framework Controls:** CM-03(08), CM-11(03), SC-07, SC-07(09), SC-07(11)

#### vcenter-9.network-restrict-port-mirroring

Remove unauthorized port mirroring sessions on distributed switches.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03, NET-03.5

**Mapped Framework Controls:** SC-07, SC-07(09), SC-07(10), SC-07(11)

#### vcenter-9.network-vgt

Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** AC-04

#### vcenter-9.password-complexity

Enforce password complexity for vCenter SSO accounts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IA-05(01)

#### vcenter-9.password-history

Restrict password reuse on vCenter SSO accounts.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IA-05(01)

#### vcenter-9.password-max-age

Disable forced password expiration on vCenter SSO accounts.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IA-05(01)

#### vcenter-9.service-resilience-evc

Enable Enhanced vMotion Compatibility on vCenter clusters.

**Implementation Priority:** P1

**Bridging SCF Controls:** BCD-02.2

**Mapped Framework Controls:** CP-02(05)

#### vcenter-9.service-resilience-ha

Enable vSphere High Availability on clusters.

**Implementation Priority:** P0

**Bridging SCF Controls:** BCD-02.2, BCD-12.2

**Mapped Framework Controls:** CP-02(05), SI-13

#### vcenter-9.service-resilience-vmotion

Enable vMotion for live workload migration.

**Implementation Priority:** P0

**Bridging SCF Controls:** BCD-02.2

**Mapped Framework Controls:** CP-02(05)

#### vcenter-9.session-timeout

Enforce an idle session timeout for the vSphere Client.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** AC-12

#### vcenter-9.smtp

Send vCenter notification email over a secure SMTP connection.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03, NET-13

**Mapped Framework Controls:** SC-08, SC-08(01), SC-08(03)

#### vcenter-9.snmp

Disable SNMP v1 and v2c receivers on vCenter.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, NET-12

**Mapped Framework Controls:** AC-02, AC-03, AC-05, CM-07, SI-03, SI-04, SI-05, SI-07, SI-10

#### vcenter-9.snmp3

Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-01, NET-12

**Mapped Framework Controls:** AC-02, AC-03, AC-05, SC-08(01), SC-08(02), SC-13, SI-03, SI-04, SI-05, SI-07, SI-07(06), SI-10

#### vcenter-9.ssh

Deactivate SSH access to the vCenter appliance except for temporary diagnostic use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, NET-14.4

**Mapped Framework Controls:** AC-17(04), CM-07

#### vcenter-9.supported

vCenter must run a version that has not reached End of General Support.

**Implementation Priority:** P2

**Bridging SCF Controls:** TDA-17

**Mapped Framework Controls:** SA-22

#### vcenter-9.time

vCenter must synchronize its clock with organizational reference sources.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-07.1, SEA-20

**Mapped Framework Controls:** AU-08, SC-45, SC-45(01)

#### vcenter-9.tls-ciphers

vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** SC-08, SC-08(01)

#### vcenter-9.vami-firewall-restrict-access

Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.

**Implementation Priority:** P0

**Bridging SCF Controls:** NET-04.1

**Mapped Framework Controls:** SC-07(05), SC-07(11)

#### vcenter-9.vami-password-max-age

Disable forced password expiration on the vCenter appliance root account.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** IA-05(01)

#### vcenter-9.vami-updates

vCenter must have all available software updates and patches installed.

**Implementation Priority:** P0

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** SI-02, SI-02(04), SI-03

#### vcenter-9.vds-health-check-disable

Disable the vSphere Distributed Switch health check when not troubleshooting.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, NET-03.3

**Mapped Framework Controls:** CM-07, SC-07(16)

#### vcenter-9.vpxuser-length

Keep the vpxuser password at or above its default length.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1, IAC-10.4

**Mapped Framework Controls:** IA-05(01)

### VCF

#### vcf-9.mfa

Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-02, IAC-06.1

**Mapped Framework Controls:** IA-02, IA-02(01), IA-02(02)

#### vcf-9.perimeter-firewall

Limit access to VCF component management interfaces with perimeter firewalls.

**Implementation Priority:** P0

**Bridging SCF Controls:** NET-04.1, NET-06.1

**Mapped Framework Controls:** SC-07(05), SC-07(11), SC-07(13), SC-07(29)

#### vcf-9.permissions-roles

Review and right-size accounts, permissions, and role assignments across all VCF components.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-17, IAC-21

**Mapped Framework Controls:** AC-06, AC-06(07), SA-08(14)

#### vcf-9.secure-baseline

Apply the controls in this guidance, and document the rationale for any deviations.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-02, CFG-02.7

**Mapped Framework Controls:** CM-02, CM-06, PL-10, SA-08, SA-15(05)

### vSAN

#### vsan-9.auto-policy-management

vSAN automatic policy management must remain disabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** CHG-02

**Mapped Framework Controls:** CM-03, SA-08(31)

#### vsan-9.auto-raid

vSAN ESA automatic RAID management must remain enabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** BCD-02.2

**Mapped Framework Controls:** CP-02(05)

#### vsan-9.automatic-rebalance

vSAN must enable automatic data rebalancing.

**Implementation Priority:** P0

**Bridging SCF Controls:** CAP-01

**Mapped Framework Controls:** SC-05, SC-05(03)

#### vsan-9.encryption-rest

vSAN must protect data at rest.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-01.1, CRY-05

**Mapped Framework Controls:** SC-08(01), SC-13, SC-28, SC-28(01)

#### vsan-9.encryption-transit-esa

vSAN must protect data in transit between hosts.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** SC-08, SC-08(01), SC-16(01), SC-28(01)

#### vsan-9.encryption-transit-osa

vSAN must protect data in transit between hosts.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** SC-08, SC-08(01), SC-16(01), SC-28(01)

#### vsan-9.file-services-access-control-nfs

NFS file shares on vSAN File Services must be configured to restrict access.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-04, NET-04.1

**Mapped Framework Controls:** AC-04, SC-07(05), SC-07(11)

#### vsan-9.file-services-authentication-smb

SMB file shares on vSAN File Services must require protocol encryption.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** SC-08, SC-08(01), SC-16(01), SC-28(01)

#### vsan-9.force-provisioning

vSAN must not provision storage when storage policy requirements cannot be met.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-06

**Mapped Framework Controls:** CM-03(08), CM-11(03)

#### vsan-9.hcl-internet

Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03, NET-03

**Mapped Framework Controls:** CM-07, SC-07, SC-07(09), SC-07(11)

#### vsan-9.iscsi-mutual-chap

vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** IAC-04

**Mapped Framework Controls:** IA-03, IA-03(01), IA-03(04)

#### vsan-9.managed-disk-claim

vSAN must disable managed disk claims.

**Implementation Priority:** P0

**Bridging SCF Controls:** CHG-04

**Mapped Framework Controls:** CM-05

#### vsan-9.network-isolation-vsan-iscsi-target

Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-03, NET-06

**Mapped Framework Controls:** AC-04(21), SC-07, SC-07(09), SC-07(11)

#### vsan-9.object-checksum

vSAN must calculate object checksums to protect data integrity.

**Implementation Priority:** P2

**Bridging SCF Controls:** END-06.4

**Mapped Framework Controls:** SI-07(05)

#### vsan-9.operations-reserve

vSAN must reserve space to complete internal maintenance operations.

**Implementation Priority:** P0

**Bridging SCF Controls:** CAP-01

**Mapped Framework Controls:** SC-05, SC-05(03)

#### vsan-9.rekey-interval

Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-09

**Mapped Framework Controls:** SC-28(03)

#### vsan-9.storage-cluster-traffic-protection

vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03, NET-06

**Mapped Framework Controls:** AC-04(21), SC-08, SC-08(01)
