# Companion Guide to NERC CIP for VMware Cloud Foundation 9.1 -- SCG Hardening Controls

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://www.nerc.com/standards/reliability-standards/cip

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

139 Security Configuration Guide controls map to this framework through the SCF crosswalk, grouped below by product component.

### Automation

#### automation-9.activity-log

Retain the VCF Automation activity log for the audit window and keep debug output disabled.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03, MON-10

**Mapped Framework Controls:** CIP-006-6 1.9, CIP-006-6 2.3, CIP-007-6 1.1, CIP-007-6 4.3

#### automation-9.oidc-settings

Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** CIP-007-6 5.6

#### automation-9.timeouts

Limit the VCF Automation API token lifetime.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** CIP-007-6 5.6

### ESX

#### esx-9.account-lockout-duration

The ESX host must enforce an unlock timeout.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** CIP-007-6 5.7

#### esx-9.account-lockout-max-attempts

The ESX host must enforce a limit on consecutive invalid logon attempts by a user.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** CIP-007-6 5.7

#### esx-9.account-password-history

The ESX host must enforce password history for users.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** CIP-007-6 5.5.1, CIP-007-6 5.5.2

#### esx-9.ad-admin-group-name

The ESX host must not use the default "ESX Admins" Active Directory group.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.8

**Mapped Framework Controls:** CIP-007-6 5.4

#### esx-9.ad-admin-validate-interval

The ESX host must not disable validation of users and groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-17

**Mapped Framework Controls:** CIP-004-7 4.3, CIP-004-7 6.2, CIP-004-7 6.2.1, CIP-004-7 6.2.2

#### esx-9.api-soap-timeout

The ESX host must configure a session timeout for the vSphere API.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** CIP-005-7 2.5, CIP-005-7 3.2

#### esx-9.ceip-disable

Disable the ESX Customer Experience Improvement Program.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### esx-9.cpu-hyperthread-warning

The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-01.4

**Mapped Framework Controls:** CIP-007-6 4.1, CIP-007-6 4.2

#### esx-9.dcui-timeout

Set a timeout to automatically terminate idle DCUI sessions on the ESX host.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** CIP-005-7 2.5, CIP-005-7 3.2

#### esx-9.deactivate-mob

The ESX Managed Object Browser (MOB) must be disabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### esx-9.deactivate-shell

The ESX Shell must be disabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### esx-9.entropy

The ESX host must use sufficient entropy for cryptographic operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** CIP-006-6 1.10

#### esx-9.forensic-snapshots

Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, IRO-08

**Mapped Framework Controls:** CIP-007-6 1.1, CIP-008-6 2.3, CIP-009-6 1.5

#### esx-9.hardware-cpu-amd-cc

Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** CIP-006-6 1.10

#### esx-9.hardware-cpu-intel-cc

Enable Intel SGX and TDX in system firmware where available.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** CIP-006-6 1.10

#### esx-9.hardware-firmware-updates

Ensure all system and device firmware is auditable, authentic, and up to date.

**Implementation Priority:** P0

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** CIP-007-6 1.3, CIP-007-6 2.3

#### esx-9.hardware-management-security

Harden integrated hardware management controllers.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03, IAC-10.8

**Mapped Framework Controls:** CIP-007-6 1.1, CIP-007-6 5.4

#### esx-9.hardware-ports

Disable or physically protect unused external server ports.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03, END-12

**Mapped Framework Controls:** CIP-007-6 1.1, CIP-007-6 1.2

#### esx-9.hardware-virtual-nic

The ESX host must not enable virtual hardware management network interfaces.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### esx-9.iscsi-mutual-chap

Enable bidirectional/mutual CHAP authentication for iSCSI traffic.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** IAC-04

**Mapped Framework Controls:** CIP-005-7 1.4

#### esx-9.log-audit-local

The ESX host must enable audit record logging.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** CIP-007-6 4.1, CIP-007-6 4.1.1, CIP-007-6 4.1.2, CIP-007-6 4.1.3

#### esx-9.log-audit-local-capacity

The ESX host must store audit records for a time period consistent with your records retention policy.

**Implementation Priority:** P1

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** CIP-006-6 1.9, CIP-006-6 2.3, CIP-007-6 4.3

#### esx-9.log-audit-persistent

Configure a persistent log location for all locally stored audit records on the ESX host.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** CIP-006-6 1.9, CIP-006-6 2.3, CIP-007-6 4.3

#### esx-9.log-filter

The ESX host must not enable log filtering.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** CIP-007-6 4.1, CIP-007-6 4.1.1, CIP-007-6 4.1.2, CIP-007-6 4.1.3

#### esx-9.log-level

The ESX host must produce audit records containing information to establish what type of events occurred.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** CIP-007-6 4.1, CIP-007-6 4.1.1, CIP-007-6 4.1.2, CIP-007-6 4.1.3

#### esx-9.log-persistent

Configure a persistent log location for all locally stored logs on the ESX host.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** CIP-006-6 1.9, CIP-006-6 2.3, CIP-007-6 4.3

#### esx-9.network-bpdu

Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** CIP-005-7 1.3

#### esx-9.network-dvfilter

Use of the dvFilter network APIs must be restricted on the ESX host.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, NET-04

**Mapped Framework Controls:** CIP-005-7 1.3, CIP-007-6 1.1

#### esx-9.network-rpf-promisc

The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** CIP-005-7 1.3

#### esx-9.network-standard-reject-forged-transmit

Reject forged transmits on standard switches and port groups.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** CIP-005-7 1.3

#### esx-9.network-standard-reject-mac-changes

Reject guest MAC address changes on standard switches and port groups.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** CIP-005-7 1.3

#### esx-9.network-standard-reject-promiscuous-mode

Reject promiscuous mode on standard switches and port groups.

**Implementation Priority:** P2, Upon Feature Enablement

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** CIP-005-7 1.3

#### esx-9.password-complexity

Enforce password complexity on ESX local accounts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** CIP-007-6 5.5.1, CIP-007-6 5.5.2

#### esx-9.password-max-age

The ESX host must be configured with an appropriate maximum password age.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** CIP-007-6 5.5.1, CIP-007-6 5.5.2

#### esx-9.session-timeout

The ESX Host Client must enforce an idle session timeout.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** CIP-005-7 2.5, CIP-005-7 3.2

#### esx-9.shell-interactive-timeout

Configure the inactivity timeout to automatically terminate idle ESX host shells.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** CIP-005-7 2.5, CIP-005-7 3.2

#### esx-9.shell-timeout

Set a timeout to limit how long the ESX Shell and SSH services are allowed to run.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** CIP-005-7 2.5, CIP-005-7 3.2

#### esx-9.shell-warning

The ESX host must not suppress warnings that the local or remote shell is enabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-01.4

**Mapped Framework Controls:** CIP-007-6 4.1, CIP-007-6 4.2

#### esx-9.snmp

The SNMP service on the ESX host must not be configured to start automatically.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### esx-9.ssh

The ESX host's SSH service must be deactivated except for temporary diagnostic use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### esx-9.updates

The ESX host must have all available software updates and patches installed.

**Implementation Priority:** P0

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** CIP-007-6 1.3, CIP-007-6 2.3

#### guest-9.tools-deactivate-appinfo

The guest OS must deactivate Appinfo information gathering unless required.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### guest-9.tools-deactivate-containerinfo

The guest OS must deactivate ContainerInfo unless required.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### guest-9.tools-deactivate-guestoperations

The guest OS must deactivate Guest Operations unless required.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### guest-9.tools-deactivate-gueststoreupgrade

The guest OS must deactivate Guest Store Upgrade operations unless required.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### guest-9.tools-deactivate-servicediscovery

The guest OS must deactivate Service Discovery unless required.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### guest-9.tools-logs

The guest OS must enable VMware Tools logging.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** CIP-007-6 4.1, CIP-007-6 4.1.1, CIP-007-6 4.1.2, CIP-007-6 4.1.3

#### guest-9.tools-updates

The guest OS must run a current version of VMware Tools.

**Implementation Priority:** P0

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** CIP-007-6 1.3, CIP-007-6 2.3

#### guest-9.tools-upgrade

The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.

**Implementation Priority:** P2

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** CIP-007-6 1.3, CIP-007-6 2.3

#### vm-9.deactivate-console-copy

Virtual machines must have console copy operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vm-9.deactivate-console-paste

Virtual machines must have console paste operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vm-9.deactivate-disk-shrinking-shrink

Virtual machines must have virtual disk shrinking operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vm-9.deactivate-disk-shrinking-wiper

Virtual machines must have virtual disk wiping operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vm-9.deactivate-non-essential-3d-features

Virtual machines must have 3D graphics features deactivated when not required.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vm-9.dvfilter

Virtual machines must limit access through the dvFilter API.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, NET-04

**Mapped Framework Controls:** CIP-005-7 1.3, CIP-007-6 1.1

#### vm-9.efi-boot-types

Virtual machines must prevent booting from unauthorized sources.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vm-9.isolation-device-connectable-deactivate

Virtual machines must prevent unauthorized removal, connection, and modification of devices.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vm-9.isolation-tools-dnd-deactivate

Virtual machines must have console drag and drop operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vm-9.log-enable

Virtual machines must enable diagnostic logging.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** CIP-007-6 4.1, CIP-007-6 4.1.1, CIP-007-6 4.1.2, CIP-007-6 4.1.3

#### vm-9.log-retention

Virtual machines must limit the number of retained diagnostic logs.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** CIP-006-6 1.9, CIP-006-6 2.3, CIP-007-6 4.3

#### vm-9.pci-passthrough

Virtual machines must limit PCI device passthrough functionality.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vm-9.persistent-disk

Virtual machines must not use independent, nonpersistent disks.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vm-9.remove-unnecessary-devices

Virtual machines must remove unnecessary virtual hardware.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03, END-12

**Mapped Framework Controls:** CIP-007-6 1.1, CIP-007-6 1.2

#### vm-9.restrict-host-info

Virtual machines must not be able to obtain host information from the hypervisor.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vm-9.virtual-hardware

Virtual machines must use a minimum supported virtual hardware version.

**Implementation Priority:** P1

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** CIP-007-6 1.3, CIP-007-6 2.3

### Operations

#### fleet-9.access-token

Limit the maximum lifetime of access tokens.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** CIP-007-6 5.6

#### fleet-9.api-token

Limit the maximum lifetime of API tokens.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** CIP-007-6 5.6

#### fleet-9.password-policy

Configure a fleet-wide password policy.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1, IAC-22

**Mapped Framework Controls:** CIP-007-6 5.5.1, CIP-007-6 5.5.2, CIP-007-6 5.7

#### operations-9.account-lockout

VCF Operations must lock accounts after consecutive failed logon attempts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** CIP-007-6 5.7

#### operations-9.action-history-retention

Retain VCF Operations remediation action history for an appropriate interval.

**Implementation Priority:** P1

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** CIP-006-6 1.9, CIP-006-6 2.3, CIP-007-6 4.3

#### operations-9.ceip-disable

Disable the VCF Operations Customer Experience Improvement Program.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### operations-9.firewall-hardening

VCF Operations must enable firewall hardening.

**Implementation Priority:** P0

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** CIP-005-7 1.5

#### operations-9.in-page-feedback

Disable VCF Operations in-page feedback.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### operations-9.log-retention

Configure the VCF Operations log retention period.

**Implementation Priority:** P1

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** CIP-006-6 1.9, CIP-006-6 2.3, CIP-007-6 4.3

#### operations-9.non-imported-vidm

Restrict VCF Operations access to imported identity-provider users.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-07

**Mapped Framework Controls:** CIP-004-7 6.1.1, CIP-004-7 6.1.2, CIP-004-7 6.3

#### operations-9.password-complexity

Enforce password complexity on VCF Operations local accounts.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** CIP-007-6 5.5.1, CIP-007-6 5.5.2

#### operations-9.session-timeout

VCF Operations must enforce an idle session timeout.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** CIP-005-7 2.5, CIP-005-7 3.2

### Installer

#### installer-9.security

The VCF Installer appliance must be removed or powered off after deployment completes, unless it has been converted into the SDDC Manager.

**Implementation Priority:** P0

**Bridging SCF Controls:** AST-30, CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1, CIP-011-3 2.2

### Operations for Networks

#### networks-9.audit-identity

Capture user identity in VCF Operations for Networks audit logs.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** CIP-007-6 4.1, CIP-007-6 4.1.1, CIP-007-6 4.1.2, CIP-007-6 4.1.3

#### networks-9.session-timeout

VCF Operations for Networks must enforce an idle session timeout.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** CIP-005-7 2.5, CIP-005-7 3.2

### NSX

#### nsx-9.account-lockout-max-attempts

NSX Manager must enforce an account lockout after consecutive failed authentication attempts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** CIP-007-6 5.7

#### nsx-9.backup

Configure scheduled backups of NSX Manager.

**Implementation Priority:** P0

**Bridging SCF Controls:** BCD-11

**Mapped Framework Controls:** CIP-009-6 1.3, CIP-009-6 1.4

#### nsx-9.ceip-disable

Disable the NSX Manager Customer Experience Improvement Program.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### nsx-9.dhcp-disable

NSX Tier-0 Gateway must not enable DHCP unless it is required.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### nsx-9.ibgp-source-loopback

Configure Tier-0 Gateway iBGP peering to use the loopback address as the source.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** CIP-005-7 1.5

#### nsx-9.load-balancer-fips

Enable FIPS-validated cryptography for NSX load balancers.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** CIP-006-6 1.10

#### nsx-9.log-level

NSX Manager must set service logging levels to capture audit-relevant events.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** CIP-007-6 4.1, CIP-007-6 4.1.1, CIP-007-6 4.1.2, CIP-007-6 4.1.3

#### nsx-9.multicast-disable

NSX Tier-0 Gateway must disable multicast and PIM where they are not required.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### nsx-9.password-complexity

Enforce password complexity on NSX Manager local accounts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** CIP-007-6 5.5.1, CIP-007-6 5.5.2

#### nsx-9.reverse-path-forwarding

NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** CIP-005-7 1.5

#### nsx-9.session-timeout

NSX Manager must enforce an idle session timeout on its API and CLI.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** CIP-005-7 2.5, CIP-005-7 3.2

#### nsx-9.snmp

NSX Manager must not use SNMP v1 or v2c.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### nsx-9.ssh

The NSX Manager SSH service must be deactivated except for temporary diagnostic use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### nsx-9.t1-dhcp-disable

Disable Tier-1 Gateway DHCP service when not in use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### nsx-9.t1-multicast-disable

Disable Tier-1 Gateway multicast when not in use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

### Protection and Recovery

#### pnr-9.ssh

The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03, NET-14

**Mapped Framework Controls:** CIP-005-7 2.1, CIP-005-7 2.3, CIP-005-7 2.4, CIP-007-6 1.1

### SDDC Manager

#### sddc-9.api-admin

SDDC Manager must configure the API admin account.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.8

**Mapped Framework Controls:** CIP-007-6 5.4

#### sddc-9.basic-auth-disable

Disable HTTP Basic Authentication on the SDDC Manager API.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** CIP-007-6 5.6

### vCenter

#### vcenter-9.account-lockout-duration

Set the vCenter account auto-unlock interval.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** CIP-007-6 5.7

#### vcenter-9.account-lockout-max-attempts

Lock vCenter accounts after repeated failed login attempts.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** CIP-007-6 5.7

#### vcenter-9.account-lockout-reset

Set the vCenter failed-login counting interval.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** CIP-007-6 5.7

#### vcenter-9.administration-client-plugins

Reduce or eliminate third-party vCenter plugins.

**Implementation Priority:** P1

**Bridging SCF Controls:** TPM-03

**Mapped Framework Controls:** CIP-013-2 1.2.5, CIP-013-2 1.2.6

#### vcenter-9.administration-sso-groups

VMware vCenter must separate authentication and authorization for administrators.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-01.2

**Mapped Framework Controls:** CIP-007-6 5.1

#### vcenter-9.bashshelladministrators

VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-15.5

**Mapped Framework Controls:** CIP-007-6 5.3

#### vcenter-9.ceip-disable

Disable the vCenter Customer Experience Improvement Program.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vcenter-9.client-feedback

Disable vSphere Client in-product feedback.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vcenter-9.client-telemetry

Disable vSphere Client UI telemetry.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vcenter-9.events-database-retention

VMware vCenter must retain task and event data for an appropriate interval.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** CIP-006-6 1.9, CIP-006-6 2.3, CIP-007-6 4.3

#### vcenter-9.logs-level-global

Configure the vCenter logging level to capture security-relevant events.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** CIP-007-6 4.1, CIP-007-6 4.1.1, CIP-007-6 4.1.2, CIP-007-6 4.1.3

#### vcenter-9.network-mac-learning

Disable MAC learning on distributed switch port groups unless a workload requires it.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** CIP-005-7 1.5

#### vcenter-9.network-reject-forged-transmit-dvportgroup

Reject forged transmits on distributed switches and port groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** CIP-005-7 1.5

#### vcenter-9.network-reject-mac-changes-dvportgroup

Reject guest MAC address changes on distributed switches and port groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** CIP-005-7 1.5

#### vcenter-9.network-reject-promiscuous-mode-dvportgroup

Reject promiscuous mode on distributed switches and port groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** CIP-005-7 1.3

#### vcenter-9.network-reset-port

Reset distributed switch port configuration when a virtual machine disconnects.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** CIP-005-7 1.5

#### vcenter-9.network-restrict-discovery-protocol

Disable CDP/LLDP discovery protocols on distributed switches unless required.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vcenter-9.network-restrict-netflow-usage

Send distributed switch NetFlow data only to authorized collectors.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03, NET-04

**Mapped Framework Controls:** CIP-005-7 1.3, CIP-005-7 1.5

#### vcenter-9.network-restrict-port-level-overrides

Disallow per-port policy overrides on distributed port groups, except port blocking.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** CIP-005-7 1.5

#### vcenter-9.network-restrict-port-mirroring

Remove unauthorized port mirroring sessions on distributed switches.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** CIP-005-7 1.5

#### vcenter-9.network-vgt

Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** CIP-005-7 1.3

#### vcenter-9.password-complexity

Enforce password complexity for vCenter SSO accounts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** CIP-007-6 5.5.1, CIP-007-6 5.5.2

#### vcenter-9.password-history

Restrict password reuse on vCenter SSO accounts.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** CIP-007-6 5.5.1, CIP-007-6 5.5.2

#### vcenter-9.password-max-age

Disable forced password expiration on vCenter SSO accounts.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** CIP-007-6 5.5.1, CIP-007-6 5.5.2

#### vcenter-9.session-timeout

Enforce an idle session timeout for the vSphere Client.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** CIP-005-7 2.5, CIP-005-7 3.2

#### vcenter-9.snmp

Disable SNMP v1 and v2c receivers on vCenter.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vcenter-9.snmp3

Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** CIP-006-6 1.10

#### vcenter-9.ssh

Deactivate SSH access to the vCenter appliance except for temporary diagnostic use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vcenter-9.vami-password-max-age

Disable forced password expiration on the vCenter appliance root account.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** CIP-007-6 5.5.1, CIP-007-6 5.5.2

#### vcenter-9.vami-updates

vCenter must have all available software updates and patches installed.

**Implementation Priority:** P0

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** CIP-007-6 1.3, CIP-007-6 2.3

#### vcenter-9.vds-health-check-disable

Disable the vSphere Distributed Switch health check when not troubleshooting.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** CIP-007-6 1.1

#### vcenter-9.vpxuser-length

Keep the vpxuser password at or above its default length.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** CIP-007-6 5.5.1, CIP-007-6 5.5.2

### VCF

#### vcf-9.permissions-roles

Review and right-size accounts, permissions, and role assignments across all VCF components.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-17

**Mapped Framework Controls:** CIP-004-7 4.3, CIP-004-7 6.2, CIP-004-7 6.2.1, CIP-004-7 6.2.2

#### vcf-9.secure-baseline

Apply the controls in this guidance, and document the rationale for any deviations.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-02, CFG-02.7

**Mapped Framework Controls:** CIP-010-4 1.1, CIP-010-4 1.1.1, CIP-010-4 1.1.2, CIP-010-4 1.1.3, CIP-010-4 1.1.4, CIP-010-4 1.1.5, CIP-010-4 1.2, CIP-010-4 1.4, CIP-010-4 1.4.3, CIP-010-4 1.5, CIP-010-4 1.6, CIP-010-4 2.1

### vSAN

#### vsan-9.file-services-access-control-nfs

NFS file shares on vSAN File Services must be configured to restrict access.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** CIP-005-7 1.3

#### vsan-9.hcl-internet

Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03, NET-03

**Mapped Framework Controls:** CIP-005-7 1.5, CIP-007-6 1.1

#### vsan-9.iscsi-mutual-chap

vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** IAC-04

**Mapped Framework Controls:** CIP-005-7 1.4

#### vsan-9.network-isolation-vsan-iscsi-target

Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** CIP-005-7 1.5
