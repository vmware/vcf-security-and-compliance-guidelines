# Companion Guide to the Australian Signals Directorate Information Security Manual (ISM) for VMware Cloud Foundation 9.1 -- SCG Hardening Controls

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism

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

214 Security Configuration Guide controls map to this framework through the SCF crosswalk, grouped below by product component.

### Automation

#### automation-9.activity-log

Retain the VCF Automation activity log for the audit window and keep debug output disabled.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03, MON-10

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1213, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### automation-9.oidc-settings

Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-03, IAC-10

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-1139, ISM-1227, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1589, ISM-1593, ISM-1594, ISM-1595, ISM-1781

#### automation-9.operation-limits

Configure operation limits in VCF Automation to bound resource-intensive operations.

**Implementation Priority:** P0

**Bridging SCF Controls:** CAP-02

**Mapped Framework Controls:** ISM-1579, ISM-1580, ISM-1581

#### automation-9.timeouts

Limit the VCF Automation API token lifetime.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** ISM-1227, ISM-1593, ISM-1594, ISM-1595

### ESX

#### esx-9.account-lockout-duration

The ESX host must enforce an unlock timeout.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** ISM-1403

#### esx-9.account-lockout-max-attempts

The ESX host must enforce a limit on consecutive invalid logon attempts by a user.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** ISM-1403

#### esx-9.account-password-history

The ESX host must enforce password history for users.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** ISM-0417, ISM-0421, ISM-0422, ISM-1557, ISM-1558, ISM-1596, ISM-1795

#### esx-9.ad-admin-group-autoadd

The ESX host must not automatically grant administrative permissions to Active Directory groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-16, IAC-21

**Mapped Framework Controls:** ISM-0441, ISM-0445, ISM-0446, ISM-0447, ISM-0611, ISM-1175, ISM-1380, ISM-1392, ISM-1507, ISM-1508, ISM-1509, ISM-1620, ISM-1648, ISM-1649, ISM-1650, ISM-1687, ISM-1688, ISM-1705, ISM-1706, ISM-1707, ISM-1708

#### esx-9.ad-admin-group-name

The ESX host must not use the default "ESX Admins" Active Directory group.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.8

**Mapped Framework Controls:** ISM-1304, ISM-1806

#### esx-9.ad-admin-validate-interval

The ESX host must not disable validation of users and groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-17

**Mapped Framework Controls:** ISM-0405, ISM-1647, ISM-1648

#### esx-9.api-soap-timeout

The ESX host must configure a session timeout for the vSphere API.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** ISM-0853

#### esx-9.ceip-disable

Disable the ESX Customer Experience Improvement Program.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### esx-9.dcui-timeout

Set a timeout to automatically terminate idle DCUI sessions on the ESX host.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** ISM-0853

#### esx-9.deactivate-mob

The ESX Managed Object Browser (MOB) must be disabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### esx-9.deactivate-shell

The ESX Shell must be disabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### esx-9.entropy

The ESX host must use sufficient entropy for cryptographic operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** ISM-0142, ISM-0457, ISM-0460, ISM-0471, ISM-0472, ISM-0474, ISM-0475, ISM-0476, ISM-0477, ISM-0479, ISM-0481, ISM-0499, ISM-0501, ISM-0994, ISM-0999, ISM-1080, ISM-1091, ISM-1146, ISM-1446, ISM-1629, ISM-1759, ISM-1761, ISM-1762, ISM-1763, ISM-1764, ISM-1765, ISM-1766, ISM-1767, ISM-1768, ISM-1769, ISM-1770, ISM-1771, ISM-1772

#### esx-9.etc-issue

Configure the login banner for ESX host SSH connections.

**Implementation Priority:** P1

**Bridging SCF Controls:** SEA-18

**Mapped Framework Controls:** ISM-0408

#### esx-9.firewall-restrict-access

Configure the ESX host firewall to only allow traffic from authorized networks.

**Implementation Priority:** P0

**Bridging SCF Controls:** END-05

**Mapped Framework Controls:** ISM-1416

#### esx-9.forensic-snapshots

Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, IRO-08

**Mapped Framework Controls:** ISM-0137, ISM-0138, ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1609, ISM-1621, ISM-1731, ISM-1732

#### esx-9.hardware-boot-order

Restrict the server firmware boot order to authorized boot devices.

**Implementation Priority:** P1

**Bridging SCF Controls:** DCH-12

**Mapped Framework Controls:** ISM-1359, ISM-1713

#### esx-9.hardware-cpu-amd-cc

Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** ISM-0142, ISM-0457, ISM-0460, ISM-0471, ISM-0472, ISM-0474, ISM-0475, ISM-0476, ISM-0477, ISM-0479, ISM-0481, ISM-0499, ISM-0501, ISM-0994, ISM-0999, ISM-1080, ISM-1091, ISM-1146, ISM-1446, ISM-1629, ISM-1759, ISM-1761, ISM-1762, ISM-1763, ISM-1764, ISM-1765, ISM-1766, ISM-1767, ISM-1768, ISM-1769, ISM-1770, ISM-1771, ISM-1772

#### esx-9.hardware-cpu-intel-cc

Enable Intel SGX and TDX in system firmware where available.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** ISM-0142, ISM-0457, ISM-0460, ISM-0471, ISM-0472, ISM-0474, ISM-0475, ISM-0476, ISM-0477, ISM-0479, ISM-0481, ISM-0499, ISM-0501, ISM-0994, ISM-0999, ISM-1080, ISM-1091, ISM-1146, ISM-1446, ISM-1629, ISM-1759, ISM-1761, ISM-1762, ISM-1763, ISM-1764, ISM-1765, ISM-1766, ISM-1767, ISM-1768, ISM-1769, ISM-1770, ISM-1771, ISM-1772

#### esx-9.hardware-firmware-updates

Ensure all system and device firmware is auditable, authentic, and up to date.

**Implementation Priority:** P0

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** ISM-1143, ISM-1493, ISM-1690, ISM-1691, ISM-1692, ISM-1693, ISM-1694, ISM-1695, ISM-1696, ISM-1697, ISM-1751

#### esx-9.hardware-management-authentication

Use strong, isolated identity management on hardware management controllers.

**Implementation Priority:** P0

**Bridging SCF Controls:** NET-06.4

**Mapped Framework Controls:** ISM-1385

#### esx-9.hardware-management-log-forwarding

Forward hardware management controller logs to a central log server.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02, MON-02.2

**Mapped Framework Controls:** ISM-0109, ISM-1228, ISM-1405, ISM-1536, ISM-1537, ISM-1566, ISM-1650

#### esx-9.hardware-management-security

Harden integrated hardware management controllers.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03, IAC-10.8

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1304, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621, ISM-1806

#### esx-9.hardware-management-time

Synchronize hardware management controller time with organizational reference sources.

**Implementation Priority:** P0

**Bridging SCF Controls:** SEA-20

**Mapped Framework Controls:** ISM-0988

#### esx-9.hardware-ports

Disable or physically protect unused external server ports.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### esx-9.hardware-tpm

Install and enable a TPM 2.0 on each ESX host.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-09

**Mapped Framework Controls:** ISM-0455, ISM-0507

#### esx-9.hardware-virtual-nic

The ESX host must not enable virtual hardware management network interfaces.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### esx-9.iscsi-mutual-chap

Enable bidirectional/mutual CHAP authentication for iSCSI traffic.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** IAC-04

**Mapped Framework Controls:** ISM-1603

#### esx-9.key-persistence

Disable Key Persistence on ESX hosts that do not have controlled physical access.

**Implementation Priority:** P2, Upon Feature Enablement

**Bridging SCF Controls:** CRY-09

**Mapped Framework Controls:** ISM-0455, ISM-0507

#### esx-9.lockdown-dcui-access

Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** ISM-0441, ISM-0611, ISM-1380, ISM-1392, ISM-1705, ISM-1706, ISM-1707, ISM-1708

#### esx-9.lockdown-exception-users

Keep the Lockdown Mode Exception Users list to the minimum necessary.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** ISM-0441, ISM-0611, ISM-1380, ISM-1392, ISM-1705, ISM-1706, ISM-1707, ISM-1708

#### esx-9.log-audit-forwarding

The ESX host must transmit audit records to a remote host.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02

**Mapped Framework Controls:** ISM-0109, ISM-1228, ISM-1405, ISM-1536, ISM-1537, ISM-1566, ISM-1650

#### esx-9.log-audit-local

The ESX host must enable audit record logging.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** ISM-0582, ISM-0585, ISM-1536, ISM-1537

#### esx-9.log-audit-local-capacity

The ESX host must store audit records for a time period consistent with your records retention policy.

**Implementation Priority:** P1

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** ISM-1213

#### esx-9.log-audit-persistent

Configure a persistent log location for all locally stored audit records on the ESX host.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** ISM-1213

#### esx-9.log-filter

The ESX host must not enable log filtering.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** ISM-0582, ISM-0585, ISM-1536, ISM-1537

#### esx-9.log-forwarding

The ESX host must forward system and audit logs to a remote log collection point.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02

**Mapped Framework Controls:** ISM-0109, ISM-1228, ISM-1405, ISM-1536, ISM-1537, ISM-1566, ISM-1650

#### esx-9.log-forwarding-tls-ciphers

The ESX host must verify certificates for TLS remote logging endpoints.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-1139, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1589, ISM-1781

#### esx-9.log-level

The ESX host must produce audit records containing information to establish what type of events occurred.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** ISM-0582, ISM-0585, ISM-1536, ISM-1537

#### esx-9.log-persistent

Configure a persistent log location for all locally stored logs on the ESX host.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** ISM-1213

#### esx-9.login-message

Configure the ESX host login banner for the DCUI and Host Client.

**Implementation Priority:** P1

**Bridging SCF Controls:** SEA-18

**Mapped Framework Controls:** ISM-0408

#### esx-9.memory-tiering-encryption

The ESX host should encrypt data written to tiered memory devices.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-05

**Mapped Framework Controls:** ISM-0459, ISM-1080

#### esx-9.network-bpdu

Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-02.1, NET-04

**Mapped Framework Controls:** ISM-0643, ISM-0645, ISM-1019, ISM-1157, ISM-1158, ISM-1386, ISM-1431, ISM-1436, ISM-1805

#### esx-9.network-dvfilter

Use of the dvFilter network APIs must be restricted on the ESX host.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, NET-04

**Mapped Framework Controls:** ISM-0385, ISM-0643, ISM-0645, ISM-1006, ISM-1157, ISM-1158, ISM-1311, ISM-1312, ISM-1386, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### esx-9.network-rpf-promisc

The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** ISM-0643, ISM-0645, ISM-1157, ISM-1158, ISM-1386

#### esx-9.network-standard-reject-forged-transmit

Reject forged transmits on standard switches and port groups.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** ISM-0643, ISM-0645, ISM-1157, ISM-1158, ISM-1386

#### esx-9.network-standard-reject-mac-changes

Reject guest MAC address changes on standard switches and port groups.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** ISM-0643, ISM-0645, ISM-1157, ISM-1158, ISM-1386

#### esx-9.network-standard-reject-promiscuous-mode

Reject promiscuous mode on standard switches and port groups.

**Implementation Priority:** P2, Upon Feature Enablement

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** ISM-0643, ISM-0645, ISM-1157, ISM-1158, ISM-1386

#### esx-9.network-vgt

The ESX host must restrict the use of Virtual Guest Tagging (VGT) on Standard Switches.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-06.2

**Mapped Framework Controls:** ISM-0529, ISM-0530, ISM-0535, ISM-1364, ISM-1532

#### esx-9.nfs-traffic-protection

Protect NFS datastore traffic on the ESX host using encryption or network isolation.

**Implementation Priority:** P1, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03, NET-06

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-1139, ISM-1181, ISM-1269, ISM-1270, ISM-1271, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1577, ISM-1589, ISM-1750, ISM-1781

#### esx-9.password-complexity

Enforce password complexity on ESX local accounts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** ISM-0417, ISM-0421, ISM-0422, ISM-1557, ISM-1558, ISM-1596, ISM-1795

#### esx-9.password-max-age

The ESX host must be configured with an appropriate maximum password age.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** ISM-0417, ISM-0421, ISM-0422, ISM-1557, ISM-1558, ISM-1596, ISM-1795

#### esx-9.session-timeout

The ESX Host Client must enforce an idle session timeout.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** ISM-0853

#### esx-9.shell-interactive-timeout

Configure the inactivity timeout to automatically terminate idle ESX host shells.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** ISM-0853

#### esx-9.shell-timeout

Set a timeout to limit how long the ESX Shell and SSH services are allowed to run.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** ISM-0853

#### esx-9.snmp

The SNMP service on the ESX host must not be configured to start automatically.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### esx-9.ssh

The ESX host's SSH service must be deactivated except for temporary diagnostic use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### esx-9.supported

The ESX host must run a build of ESX that has not reached End of General Support.

**Implementation Priority:** P2

**Bridging SCF Controls:** TDA-17, VPM-04

**Mapped Framework Controls:** ISM-0304, ISM-1501, ISM-1704, ISM-1753, ISM-1801

#### esx-9.time

The ESX host must synchronize its clock with organizational reference sources.

**Implementation Priority:** P0

**Bridging SCF Controls:** SEA-20

**Mapped Framework Controls:** ISM-0988

#### esx-9.tls-ciphers

The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-1139, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1589, ISM-1781

#### esx-9.tpm-configuration

The ESX host must require TPM-based configuration encryption.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-05

**Mapped Framework Controls:** ISM-0459, ISM-1080

#### esx-9.tpm-recovery-key-backup

The ESX host configuration encryption recovery key must be backed up to a secure off-host location.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-09

**Mapped Framework Controls:** ISM-0455, ISM-0507

#### esx-9.updates

The ESX host must have all available software updates and patches installed.

**Implementation Priority:** P0

**Bridging SCF Controls:** VPM-04.1, VPM-05

**Mapped Framework Controls:** ISM-1143, ISM-1467, ISM-1483, ISM-1493, ISM-1690, ISM-1691, ISM-1692, ISM-1693, ISM-1694, ISM-1695, ISM-1696, ISM-1697, ISM-1751

#### esx-9.vib-acceptance-level-supported

The ESX host image profile acceptance level must be PartnerSupported or higher.

**Implementation Priority:** P2

**Bridging SCF Controls:** CHG-04.2

**Mapped Framework Controls:** ISM-1796

#### esx-9.vmk-management

The ESX host must isolate management communications.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-06.1

**Mapped Framework Controls:** ISM-1385, ISM-1750

#### esx-9.vmk-storage

The ESX host must protect the confidentiality and integrity of transmitted storage traffic.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03, NET-06

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-1139, ISM-1181, ISM-1269, ISM-1270, ISM-1271, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1577, ISM-1589, ISM-1750, ISM-1781

#### esx-9.vmk-vmotion

The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03, NET-06

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-1139, ISM-1181, ISM-1269, ISM-1270, ISM-1271, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1577, ISM-1589, ISM-1750, ISM-1781

#### esx-9.vmotion-encryption-offload

Accelerate vMotion encryption using available hardware offload on ESX hosts.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-1139, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1589, ISM-1781

#### guest-9.tools-deactivate-appinfo

The guest OS must deactivate Appinfo information gathering unless required.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### guest-9.tools-deactivate-containerinfo

The guest OS must deactivate ContainerInfo unless required.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### guest-9.tools-deactivate-guestoperations

The guest OS must deactivate Guest Operations unless required.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### guest-9.tools-deactivate-gueststoreupgrade

The guest OS must deactivate Guest Store Upgrade operations unless required.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### guest-9.tools-deactivate-servicediscovery

The guest OS must deactivate Service Discovery unless required.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### guest-9.tools-log-forwarding

The guest OS must send VMware Tools logs to the system log service.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02

**Mapped Framework Controls:** ISM-0109, ISM-1228, ISM-1405, ISM-1536, ISM-1537, ISM-1566, ISM-1650

#### guest-9.tools-logs

The guest OS must enable VMware Tools logging.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** ISM-0582, ISM-0585, ISM-1536, ISM-1537

#### guest-9.tools-updates

The guest OS must run a current version of VMware Tools.

**Implementation Priority:** P0

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** ISM-1143, ISM-1493, ISM-1690, ISM-1691, ISM-1692, ISM-1693, ISM-1694, ISM-1695, ISM-1696, ISM-1697, ISM-1751

#### guest-9.tools-upgrade

The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.

**Implementation Priority:** P2

**Bridging SCF Controls:** VPM-05, VPM-05.4

**Mapped Framework Controls:** ISM-1143, ISM-1467, ISM-1493, ISM-1690, ISM-1691, ISM-1692, ISM-1693, ISM-1694, ISM-1695, ISM-1696, ISM-1697, ISM-1751

#### vm-9.deactivate-console-copy

Virtual machines must have console copy operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### vm-9.deactivate-console-paste

Virtual machines must have console paste operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### vm-9.deactivate-disk-shrinking-shrink

Virtual machines must have virtual disk shrinking operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CAP-02, CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1579, ISM-1580, ISM-1581, ISM-1621

#### vm-9.deactivate-disk-shrinking-wiper

Virtual machines must have virtual disk wiping operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CAP-02, CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1579, ISM-1580, ISM-1581, ISM-1621

#### vm-9.deactivate-non-essential-3d-features

Virtual machines must have 3D graphics features deactivated when not required.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### vm-9.dvfilter

Virtual machines must limit access through the dvFilter API.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, NET-04

**Mapped Framework Controls:** ISM-0385, ISM-0643, ISM-0645, ISM-1006, ISM-1157, ISM-1158, ISM-1311, ISM-1312, ISM-1386, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### vm-9.efi-boot-types

Virtual machines must prevent booting from unauthorized sources.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### vm-9.ft-encrypted

Virtual machines must require encryption for Fault Tolerance.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-0677, ISM-1139, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1589, ISM-1781

#### vm-9.isolation-device-connectable-deactivate

Virtual machines must prevent unauthorized removal, connection, and modification of devices.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, IAC-21

**Mapped Framework Controls:** ISM-0385, ISM-0441, ISM-0611, ISM-1006, ISM-1311, ISM-1312, ISM-1380, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621, ISM-1705, ISM-1706, ISM-1707, ISM-1708

#### vm-9.isolation-tools-dnd-deactivate

Virtual machines must have console drag and drop operations deactivated.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### vm-9.limit-setinfo-size

Virtual machines must limit informational messages from the virtual machine to the VMX file.

**Implementation Priority:** P2

**Bridging SCF Controls:** CAP-02

**Mapped Framework Controls:** ISM-1579, ISM-1580, ISM-1581

#### vm-9.log-enable

Virtual machines must enable diagnostic logging.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** ISM-0582, ISM-0585, ISM-1536, ISM-1537

#### vm-9.log-retention

Virtual machines must limit the number of retained diagnostic logs.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** ISM-1213

#### vm-9.pci-passthrough

Virtual machines must limit PCI device passthrough functionality.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03, IAC-21

**Mapped Framework Controls:** ISM-0385, ISM-0441, ISM-0611, ISM-1006, ISM-1311, ISM-1312, ISM-1380, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621, ISM-1705, ISM-1706, ISM-1707, ISM-1708

#### vm-9.persistent-disk

Virtual machines must not use independent, nonpersistent disks.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### vm-9.remove-unnecessary-devices

Virtual machines must remove unnecessary virtual hardware.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### vm-9.restrict-host-info

Virtual machines must not be able to obtain host information from the hypervisor.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### vm-9.virtual-hardware

Virtual machines must use a minimum supported virtual hardware version.

**Implementation Priority:** P1

**Bridging SCF Controls:** VPM-04.1, VPM-05

**Mapped Framework Controls:** ISM-1143, ISM-1467, ISM-1483, ISM-1493, ISM-1690, ISM-1691, ISM-1692, ISM-1693, ISM-1694, ISM-1695, ISM-1696, ISM-1697, ISM-1751

#### vm-9.vmotion-encrypted

Virtual machines must require encryption for vMotion.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-0677, ISM-1139, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1589, ISM-1781

#### vm-9.vmrc-lock

Virtual machines must be configured to lock when the last console connection is closed.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-24

**Mapped Framework Controls:** ISM-0428

### Operations

#### fleet-9.access-token

Limit the maximum lifetime of access tokens.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** ISM-1227, ISM-1593, ISM-1594, ISM-1595

#### fleet-9.api-token

Limit the maximum lifetime of API tokens.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** ISM-1227, ISM-1593, ISM-1594, ISM-1595

#### fleet-9.dns

Configure fleet-wide DNS settings.

**Implementation Priority:** P1

**Bridging SCF Controls:** NET-10

**Mapped Framework Controls:** ISM-0574, ISM-0861, ISM-1026, ISM-1027, ISM-1151, ISM-1183, ISM-1540, ISM-1782, ISM-1799

#### fleet-9.jit-inactivity

Configure an inactivity expiry for Just-In-Time users.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-15.3

**Mapped Framework Controls:** ISM-1404, ISM-1648

#### fleet-9.password-policy

Configure a fleet-wide password policy.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1, IAC-22

**Mapped Framework Controls:** ISM-0417, ISM-0421, ISM-0422, ISM-1403, ISM-1557, ISM-1558, ISM-1596, ISM-1795

#### fleet-9.time

Configure fleet-wide time synchronization.

**Implementation Priority:** P0

**Bridging SCF Controls:** SEA-20

**Mapped Framework Controls:** ISM-0988

#### operations-9.account-lockout

VCF Operations must lock accounts after consecutive failed logon attempts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** ISM-1403

#### operations-9.action-history-retention

Retain VCF Operations remediation action history for an appropriate interval.

**Implementation Priority:** P1

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** ISM-1213

#### operations-9.ceip-disable

Disable the VCF Operations Customer Experience Improvement Program.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### operations-9.firewall-hardening

VCF Operations must enable firewall hardening.

**Implementation Priority:** P0

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** ISM-0611, ISM-0612, ISM-0613, ISM-0616, ISM-0619, ISM-0622, ISM-0628, ISM-0629, ISM-0631, ISM-0634, ISM-0637, ISM-0639, ISM-1037, ISM-1192, ISM-1284, ISM-1286, ISM-1287, ISM-1288, ISM-1289, ISM-1293, ISM-1389, ISM-1427, ISM-1520, ISM-1521, ISM-1522, ISM-1528

#### operations-9.in-page-feedback

Disable VCF Operations in-page feedback.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### operations-9.log-collection

Configure VCF Operations log collection for all deployed components.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02, MON-02.2

**Mapped Framework Controls:** ISM-0109, ISM-1228, ISM-1405, ISM-1536, ISM-1537, ISM-1566, ISM-1650

#### operations-9.log-retention

Configure the VCF Operations log retention period.

**Implementation Priority:** P1

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** ISM-1213

#### operations-9.login-message

Configure the VCF Operations login banner.

**Implementation Priority:** P1

**Bridging SCF Controls:** SEA-18

**Mapped Framework Controls:** ISM-0408

#### operations-9.logs-ssl-api

Enable SSL for API log ingestion in VCF Operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-0677, ISM-1139, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1589, ISM-1781

#### operations-9.logs-ssl-syslog

Enable SSL for syslog log ingestion in VCF Operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-0677, ISM-1139, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1589, ISM-1781

#### operations-9.non-imported-vidm

Restrict VCF Operations access to imported identity-provider users.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-07

**Mapped Framework Controls:** ISM-0430

#### operations-9.password-complexity

Enforce password complexity on VCF Operations local accounts.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** ISM-0417, ISM-0421, ISM-0422, ISM-1557, ISM-1558, ISM-1596, ISM-1795

#### operations-9.session-timeout

VCF Operations must enforce an idle session timeout.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** ISM-0853

#### operations-9.unsigned-pak

VCF Operations must disable unsigned management pack installation.

**Implementation Priority:** P2

**Bridging SCF Controls:** CHG-04.2

**Mapped Framework Controls:** ISM-1796

### Installer

#### installer-9.security

The VCF Installer appliance must be removed or powered off after deployment completes, unless it has been converted into the SDDC Manager.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

### Operations for Networks

#### networks-9.audit-identity

Capture user identity in VCF Operations for Networks audit logs.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** ISM-0582, ISM-0585, ISM-1536, ISM-1537

#### networks-9.login-message

Configure the VCF Operations for Networks login banner.

**Implementation Priority:** P1

**Bridging SCF Controls:** SEA-18

**Mapped Framework Controls:** ISM-0408

#### networks-9.session-timeout

VCF Operations for Networks must enforce an idle session timeout.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** ISM-0853

### NSX

#### nsx-9.account-lockout-max-attempts

NSX Manager must enforce an account lockout after consecutive failed authentication attempts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** ISM-1403

#### nsx-9.api-rate-limits

Configure NSX Manager API rate and concurrency limits.

**Implementation Priority:** P0

**Bridging SCF Controls:** CAP-02, NET-03.1

**Mapped Framework Controls:** ISM-1314, ISM-1579, ISM-1580, ISM-1581

#### nsx-9.backup

Configure scheduled backups of NSX Manager.

**Implementation Priority:** P0

**Bridging SCF Controls:** BCD-11

**Mapped Framework Controls:** ISM-1511, ISM-1547, ISM-1810, ISM-1811

#### nsx-9.bgp-encryption

Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-04

**Mapped Framework Controls:** ISM-0677

#### nsx-9.bgp-max-prefixes

Configure BGP maximum prefix limits on Tier-0 Gateway neighbors.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-02.1

**Mapped Framework Controls:** ISM-1019, ISM-1431, ISM-1436, ISM-1805

#### nsx-9.ceip-disable

Disable the NSX Manager Customer Experience Improvement Program.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### nsx-9.dhcp-disable

NSX Tier-0 Gateway must not enable DHCP unless it is required.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### nsx-9.ibgp-source-loopback

Configure Tier-0 Gateway iBGP peering to use the loopback address as the source.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** ISM-0611, ISM-0612, ISM-0613, ISM-0616, ISM-0619, ISM-0622, ISM-0628, ISM-0629, ISM-0631, ISM-0634, ISM-0637, ISM-0639, ISM-1037, ISM-1192, ISM-1284, ISM-1286, ISM-1287, ISM-1288, ISM-1289, ISM-1293, ISM-1389, ISM-1427, ISM-1520, ISM-1521, ISM-1522, ISM-1528

#### nsx-9.load-balancer-fips

Enable FIPS-validated cryptography for NSX load balancers.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-01, CRY-03

**Mapped Framework Controls:** ISM-0142, ISM-0231, ISM-0232, ISM-0457, ISM-0460, ISM-0465, ISM-0467, ISM-0469, ISM-0471, ISM-0472, ISM-0474, ISM-0475, ISM-0476, ISM-0477, ISM-0479, ISM-0481, ISM-0484, ISM-0499, ISM-0501, ISM-0547, ISM-0994, ISM-0999, ISM-1080, ISM-1091, ISM-1139, ISM-1146, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1446, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1589, ISM-1629, ISM-1759, ISM-1761, ISM-1762, ISM-1763, ISM-1764, ISM-1765, ISM-1766, ISM-1767, ISM-1768, ISM-1769, ISM-1770, ISM-1771, ISM-1772, ISM-1781

#### nsx-9.log-level

NSX Manager must set service logging levels to capture audit-relevant events.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** ISM-0582, ISM-0585, ISM-1536, ISM-1537

#### nsx-9.login-message

Configure the NSX Manager login banner.

**Implementation Priority:** P1

**Bridging SCF Controls:** SEA-18

**Mapped Framework Controls:** ISM-0408

#### nsx-9.multicast-disable

NSX Tier-0 Gateway must disable multicast and PIM where they are not required.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### nsx-9.ospf-encryption

NSX Tier-0 Gateway must enable OSPF authentication.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-04

**Mapped Framework Controls:** ISM-0677

#### nsx-9.password-complexity

Enforce password complexity on NSX Manager local accounts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** ISM-0417, ISM-0421, ISM-0422, ISM-1557, ISM-1558, ISM-1596, ISM-1795

#### nsx-9.reverse-path-forwarding

NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-02.1, NET-03

**Mapped Framework Controls:** ISM-0611, ISM-0612, ISM-0613, ISM-0616, ISM-0619, ISM-0622, ISM-0628, ISM-0629, ISM-0631, ISM-0634, ISM-0637, ISM-0639, ISM-1019, ISM-1037, ISM-1192, ISM-1284, ISM-1286, ISM-1287, ISM-1288, ISM-1289, ISM-1293, ISM-1389, ISM-1427, ISM-1431, ISM-1436, ISM-1520, ISM-1521, ISM-1522, ISM-1528, ISM-1805

#### nsx-9.session-timeout

NSX Manager must enforce an idle session timeout on its API and CLI.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** ISM-0853

#### nsx-9.snmp

NSX Manager must not use SNMP v1 or v2c.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### nsx-9.ssh

The NSX Manager SSH service must be deactivated except for temporary diagnostic use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### nsx-9.t0-ipv6-hop-limit

The NSX Tier-0 Gateway must advertise a sufficient IPv6 Router Advertisement hop limit.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-02.1

**Mapped Framework Controls:** ISM-1019, ISM-1431, ISM-1436, ISM-1805

#### nsx-9.t1-dhcp-disable

Disable Tier-1 Gateway DHCP service when not in use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### nsx-9.t1-ipv6-hop-limit

The NSX Tier-1 Gateway must advertise a sufficient IPv6 Router Advertisement hop limit.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-02.1

**Mapped Framework Controls:** ISM-1019, ISM-1431, ISM-1436, ISM-1805

#### nsx-9.t1-multicast-disable

Disable Tier-1 Gateway multicast when not in use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### nsx-9.tls-ciphers

NSX Manager must use TLS with approved protocol versions and cipher suites.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-1139, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1589, ISM-1781

### Protection and Recovery

#### pnr-9.log-forwarding

The VCF Protection and Recovery appliance must forward its logs to a central log server.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02

**Mapped Framework Controls:** ISM-0109, ISM-1228, ISM-1405, ISM-1536, ISM-1537, ISM-1566, ISM-1650

#### pnr-9.ssh

The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-03, NET-14

**Mapped Framework Controls:** ISM-0385, ISM-0487, ISM-0488, ISM-0489, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### pnr-9.time

The VCF Protection and Recovery appliance must synchronize its clock with organizational reference sources.

**Implementation Priority:** P0

**Bridging SCF Controls:** SEA-20

**Mapped Framework Controls:** ISM-0988

### SDDC Manager

#### sddc-9.api-admin

SDDC Manager must configure the API admin account.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.8, IAC-15.9

**Mapped Framework Controls:** ISM-1304, ISM-1610, ISM-1611, ISM-1612, ISM-1613, ISM-1614, ISM-1615, ISM-1806

#### sddc-9.basic-auth-disable

Disable HTTP Basic Authentication on the SDDC Manager API.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10

**Mapped Framework Controls:** ISM-1227, ISM-1593, ISM-1594, ISM-1595

### vCenter

#### vcenter-9.account-lockout-duration

Set the vCenter account auto-unlock interval.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** ISM-1403

#### vcenter-9.account-lockout-max-attempts

Lock vCenter accounts after repeated failed login attempts.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** ISM-1403

#### vcenter-9.account-lockout-reset

Set the vCenter failed-login counting interval.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-22

**Mapped Framework Controls:** ISM-1403

#### vcenter-9.administration-client-plugins

Reduce or eliminate third-party vCenter plugins.

**Implementation Priority:** P1

**Bridging SCF Controls:** TPM-03, TPM-04

**Mapped Framework Controls:** ISM-0731, ISM-1452, ISM-1569, ISM-1632, ISM-1789

#### vcenter-9.bashshelladministrators

VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-16

**Mapped Framework Controls:** ISM-0445, ISM-0446, ISM-0447, ISM-1175, ISM-1380, ISM-1507, ISM-1508, ISM-1509, ISM-1620, ISM-1648, ISM-1649, ISM-1650, ISM-1687, ISM-1688

#### vcenter-9.ceip-disable

Disable the vCenter Customer Experience Improvement Program.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### vcenter-9.client-feedback

Disable vSphere Client in-product feedback.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### vcenter-9.client-telemetry

Disable vSphere Client UI telemetry.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### vcenter-9.content-library-ovf

VMware vCenter must enable the OVF security policy on content libraries.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CHG-04.2

**Mapped Framework Controls:** ISM-1796

#### vcenter-9.drs

VMware vCenter must enable the Distributed Resource Scheduler for resilience and to enable automated patching.

**Implementation Priority:** P0

**Bridging SCF Controls:** CAP-01

**Mapped Framework Controls:** ISM-1579, ISM-1580, ISM-1581

#### vcenter-9.etc-issue

Configure the vCenter SSH login banner (/etc/issue).

**Implementation Priority:** P1

**Bridging SCF Controls:** SEA-18

**Mapped Framework Controls:** ISM-0408

#### vcenter-9.events-database-retention

VMware vCenter must retain task and event data for an appropriate interval.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-10

**Mapped Framework Controls:** ISM-1213

#### vcenter-9.events-remote-logging

Enable remote logging of vCenter events.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-02.7

**Mapped Framework Controls:** ISM-0988

#### vcenter-9.log-forwarding

VMware vCenter must forward its logs to a central log server.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-02

**Mapped Framework Controls:** ISM-0109, ISM-1228, ISM-1405, ISM-1536, ISM-1537, ISM-1566, ISM-1650

#### vcenter-9.login-message

Configure the vCenter login banner for the vSphere Client.

**Implementation Priority:** P1

**Bridging SCF Controls:** SEA-18

**Mapped Framework Controls:** ISM-0408

#### vcenter-9.logs-level-global

Configure the vCenter logging level to capture security-relevant events.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** ISM-0582, ISM-0585, ISM-1536, ISM-1537

#### vcenter-9.native-key-provider-backup

Protect Native Key Provider backups with a strong password.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-09.3

**Mapped Framework Controls:** ISM-0455, ISM-0462

#### vcenter-9.network-mac-learning

Disable MAC learning on distributed switch port groups unless a workload requires it.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** ISM-0611, ISM-0612, ISM-0613, ISM-0616, ISM-0619, ISM-0622, ISM-0628, ISM-0629, ISM-0631, ISM-0634, ISM-0637, ISM-0639, ISM-1037, ISM-1192, ISM-1284, ISM-1286, ISM-1287, ISM-1288, ISM-1289, ISM-1293, ISM-1389, ISM-1427, ISM-1520, ISM-1521, ISM-1522, ISM-1528

#### vcenter-9.network-nioc

Enable Network I/O Control on distributed switches.

**Implementation Priority:** P2

**Bridging SCF Controls:** CAP-02, NET-02.1

**Mapped Framework Controls:** ISM-1019, ISM-1431, ISM-1436, ISM-1579, ISM-1580, ISM-1581, ISM-1805

#### vcenter-9.network-reject-forged-transmit-dvportgroup

Reject forged transmits on distributed switches and port groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** ISM-0611, ISM-0612, ISM-0613, ISM-0616, ISM-0619, ISM-0622, ISM-0628, ISM-0629, ISM-0631, ISM-0634, ISM-0637, ISM-0639, ISM-1037, ISM-1192, ISM-1284, ISM-1286, ISM-1287, ISM-1288, ISM-1289, ISM-1293, ISM-1389, ISM-1427, ISM-1520, ISM-1521, ISM-1522, ISM-1528

#### vcenter-9.network-reject-mac-changes-dvportgroup

Reject guest MAC address changes on distributed switches and port groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** ISM-0611, ISM-0612, ISM-0613, ISM-0616, ISM-0619, ISM-0622, ISM-0628, ISM-0629, ISM-0631, ISM-0634, ISM-0637, ISM-0639, ISM-1037, ISM-1192, ISM-1284, ISM-1286, ISM-1287, ISM-1288, ISM-1289, ISM-1293, ISM-1389, ISM-1427, ISM-1520, ISM-1521, ISM-1522, ISM-1528

#### vcenter-9.network-reject-promiscuous-mode-dvportgroup

Reject promiscuous mode on distributed switches and port groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** ISM-0643, ISM-0645, ISM-1157, ISM-1158, ISM-1386

#### vcenter-9.network-reset-port

Reset distributed switch port configuration when a virtual machine disconnects.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-06, NET-03

**Mapped Framework Controls:** ISM-0611, ISM-0612, ISM-0613, ISM-0616, ISM-0619, ISM-0622, ISM-0628, ISM-0629, ISM-0631, ISM-0634, ISM-0637, ISM-0639, ISM-0843, ISM-0846, ISM-0955, ISM-1037, ISM-1192, ISM-1284, ISM-1286, ISM-1287, ISM-1288, ISM-1289, ISM-1293, ISM-1389, ISM-1392, ISM-1427, ISM-1471, ISM-1490, ISM-1520, ISM-1521, ISM-1522, ISM-1528, ISM-1544, ISM-1582

#### vcenter-9.network-restrict-discovery-protocol

Disable CDP/LLDP discovery protocols on distributed switches unless required.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### vcenter-9.network-restrict-netflow-usage

Send distributed switch NetFlow data only to authorized collectors.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03, NET-04

**Mapped Framework Controls:** ISM-0611, ISM-0612, ISM-0613, ISM-0616, ISM-0619, ISM-0622, ISM-0628, ISM-0629, ISM-0631, ISM-0634, ISM-0637, ISM-0639, ISM-0643, ISM-0645, ISM-1037, ISM-1157, ISM-1158, ISM-1192, ISM-1284, ISM-1286, ISM-1287, ISM-1288, ISM-1289, ISM-1293, ISM-1386, ISM-1389, ISM-1427, ISM-1520, ISM-1521, ISM-1522, ISM-1528

#### vcenter-9.network-restrict-port-level-overrides

Disallow per-port policy overrides on distributed port groups, except port blocking.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-06, NET-03

**Mapped Framework Controls:** ISM-0611, ISM-0612, ISM-0613, ISM-0616, ISM-0619, ISM-0622, ISM-0628, ISM-0629, ISM-0631, ISM-0634, ISM-0637, ISM-0639, ISM-0843, ISM-0846, ISM-0955, ISM-1037, ISM-1192, ISM-1284, ISM-1286, ISM-1287, ISM-1288, ISM-1289, ISM-1293, ISM-1389, ISM-1392, ISM-1427, ISM-1471, ISM-1490, ISM-1520, ISM-1521, ISM-1522, ISM-1528, ISM-1544, ISM-1582

#### vcenter-9.network-restrict-port-mirroring

Remove unauthorized port mirroring sessions on distributed switches.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-03

**Mapped Framework Controls:** ISM-0611, ISM-0612, ISM-0613, ISM-0616, ISM-0619, ISM-0622, ISM-0628, ISM-0629, ISM-0631, ISM-0634, ISM-0637, ISM-0639, ISM-1037, ISM-1192, ISM-1284, ISM-1286, ISM-1287, ISM-1288, ISM-1289, ISM-1293, ISM-1389, ISM-1427, ISM-1520, ISM-1521, ISM-1522, ISM-1528

#### vcenter-9.network-vgt

Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.

**Implementation Priority:** P2

**Bridging SCF Controls:** NET-04, NET-06.2

**Mapped Framework Controls:** ISM-0529, ISM-0530, ISM-0535, ISM-0643, ISM-0645, ISM-1157, ISM-1158, ISM-1364, ISM-1386, ISM-1532

#### vcenter-9.password-complexity

Enforce password complexity for vCenter SSO accounts.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** ISM-0417, ISM-0421, ISM-0422, ISM-1557, ISM-1558, ISM-1596, ISM-1795

#### vcenter-9.password-history

Restrict password reuse on vCenter SSO accounts.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** ISM-0417, ISM-0421, ISM-0422, ISM-1557, ISM-1558, ISM-1596, ISM-1795

#### vcenter-9.password-max-age

Disable forced password expiration on vCenter SSO accounts.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** ISM-0417, ISM-0421, ISM-0422, ISM-1557, ISM-1558, ISM-1596, ISM-1795

#### vcenter-9.session-timeout

Enforce an idle session timeout for the vSphere Client.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** ISM-0853

#### vcenter-9.smtp

Send vCenter notification email over a secure SMTP connection.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03, NET-13

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0264, ISM-0267, ISM-0269, ISM-0270, ISM-0271, ISM-0272, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0490, ISM-0494, ISM-0496, ISM-0498, ISM-0547, ISM-0565, ISM-0569, ISM-0570, ISM-0571, ISM-0572, ISM-0574, ISM-0861, ISM-0998, ISM-0999, ISM-1000, ISM-1023, ISM-1024, ISM-1026, ISM-1027, ISM-1089, ISM-1139, ISM-1151, ISM-1183, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1540, ISM-1553, ISM-1589, ISM-1781

#### vcenter-9.snmp

Disable SNMP v1 and v2c receivers on vCenter.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### vcenter-9.snmp3

Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** ISM-0142, ISM-0457, ISM-0460, ISM-0471, ISM-0472, ISM-0474, ISM-0475, ISM-0476, ISM-0477, ISM-0479, ISM-0481, ISM-0499, ISM-0501, ISM-0994, ISM-0999, ISM-1080, ISM-1091, ISM-1146, ISM-1446, ISM-1629, ISM-1759, ISM-1761, ISM-1762, ISM-1763, ISM-1764, ISM-1765, ISM-1766, ISM-1767, ISM-1768, ISM-1769, ISM-1770, ISM-1771, ISM-1772

#### vcenter-9.ssh

Deactivate SSH access to the vCenter appliance except for temporary diagnostic use.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### vcenter-9.supported

vCenter must run a version that has not reached End of General Support.

**Implementation Priority:** P2

**Bridging SCF Controls:** TDA-17, VPM-04.1

**Mapped Framework Controls:** ISM-0304, ISM-1467, ISM-1483, ISM-1501, ISM-1704, ISM-1753

#### vcenter-9.time

vCenter must synchronize its clock with organizational reference sources.

**Implementation Priority:** P0

**Bridging SCF Controls:** SEA-20

**Mapped Framework Controls:** ISM-0988

#### vcenter-9.tls-ciphers

vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-1139, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1589, ISM-1781

#### vcenter-9.vami-firewall-restrict-access

Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.

**Implementation Priority:** P0

**Bridging SCF Controls:** END-05

**Mapped Framework Controls:** ISM-1416

#### vcenter-9.vami-password-max-age

Disable forced password expiration on the vCenter appliance root account.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** ISM-0417, ISM-0421, ISM-0422, ISM-1557, ISM-1558, ISM-1596, ISM-1795

#### vcenter-9.vami-updates

vCenter must have all available software updates and patches installed.

**Implementation Priority:** P0

**Bridging SCF Controls:** VPM-04.1, VPM-05

**Mapped Framework Controls:** ISM-1143, ISM-1467, ISM-1483, ISM-1493, ISM-1690, ISM-1691, ISM-1692, ISM-1693, ISM-1694, ISM-1695, ISM-1696, ISM-1697, ISM-1751

#### vcenter-9.vds-health-check-disable

Disable the vSphere Distributed Switch health check when not troubleshooting.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-03

**Mapped Framework Controls:** ISM-0385, ISM-1006, ISM-1311, ISM-1312, ISM-1392, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1621

#### vcenter-9.vpxuser-length

Keep the vpxuser password at or above its default length.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-10.1

**Mapped Framework Controls:** ISM-0417, ISM-0421, ISM-0422, ISM-1557, ISM-1558, ISM-1596, ISM-1795

### VCF

#### vcf-9.mfa

Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-02

**Mapped Framework Controls:** ISM-0414, ISM-0415, ISM-1546

#### vcf-9.perimeter-firewall

Limit access to VCF component management interfaces with perimeter firewalls.

**Implementation Priority:** P0

**Bridging SCF Controls:** NET-06.1

**Mapped Framework Controls:** ISM-1385, ISM-1750

#### vcf-9.permissions-roles

Review and right-size accounts, permissions, and role assignments across all VCF components.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-17, IAC-21

**Mapped Framework Controls:** ISM-0405, ISM-0441, ISM-0611, ISM-1380, ISM-1392, ISM-1647, ISM-1648, ISM-1705, ISM-1706, ISM-1707, ISM-1708

#### vcf-9.secure-baseline

Apply the controls in this guidance, and document the rationale for any deviations.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-02

**Mapped Framework Controls:** ISM-0341, ISM-0343, ISM-0345, ISM-0380, ISM-0383, ISM-0567, ISM-1316, ISM-1318, ISM-1319, ISM-1321, ISM-1406, ISM-1407, ISM-1408, ISM-1409, ISM-1418, ISM-1491, ISM-1492, ISM-1562, ISM-1584, ISM-1604, ISM-1608, ISM-1621, ISM-1622, ISM-1623, ISM-1624, ISM-1654, ISM-1655, ISM-1710, ISM-1745

### vSAN

#### vsan-9.auto-policy-management

vSAN automatic policy management must remain disabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** CHG-02

**Mapped Framework Controls:** ISM-1211

#### vsan-9.automatic-rebalance

vSAN must enable automatic data rebalancing.

**Implementation Priority:** P0

**Bridging SCF Controls:** CAP-01

**Mapped Framework Controls:** ISM-1579, ISM-1580, ISM-1581

#### vsan-9.encryption-rest

vSAN must protect data at rest.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-05

**Mapped Framework Controls:** ISM-0459, ISM-1080

#### vsan-9.encryption-transit-esa

vSAN must protect data in transit between hosts.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-0677, ISM-1139, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1589, ISM-1781

#### vsan-9.encryption-transit-osa

vSAN must protect data in transit between hosts.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-0677, ISM-1139, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1589, ISM-1781

#### vsan-9.file-services-access-control-nfs

NFS file shares on vSAN File Services must be configured to restrict access.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-04

**Mapped Framework Controls:** ISM-0643, ISM-0645, ISM-1157, ISM-1158, ISM-1386

#### vsan-9.file-services-authentication-smb

SMB file shares on vSAN File Services must require protocol encryption.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-0677, ISM-1139, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1589, ISM-1781

#### vsan-9.force-provisioning

vSAN must not provision storage when storage policy requirements cannot be met.

**Implementation Priority:** P2

**Bridging SCF Controls:** CFG-06

**Mapped Framework Controls:** ISM-0843, ISM-0846, ISM-0955, ISM-1392, ISM-1471, ISM-1490, ISM-1544, ISM-1582

#### vsan-9.hcl-internet

Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-03, NET-03

**Mapped Framework Controls:** ISM-0385, ISM-0611, ISM-0612, ISM-0613, ISM-0616, ISM-0619, ISM-0622, ISM-0628, ISM-0629, ISM-0631, ISM-0634, ISM-0637, ISM-0639, ISM-1006, ISM-1037, ISM-1192, ISM-1284, ISM-1286, ISM-1287, ISM-1288, ISM-1289, ISM-1293, ISM-1311, ISM-1312, ISM-1389, ISM-1392, ISM-1427, ISM-1479, ISM-1487, ISM-1488, ISM-1489, ISM-1520, ISM-1521, ISM-1522, ISM-1528, ISM-1621

#### vsan-9.iscsi-mutual-chap

vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** IAC-04

**Mapped Framework Controls:** ISM-1603

#### vsan-9.network-isolation-vsan-iscsi-target

Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** NET-03, NET-06

**Mapped Framework Controls:** ISM-0611, ISM-0612, ISM-0613, ISM-0616, ISM-0619, ISM-0622, ISM-0628, ISM-0629, ISM-0631, ISM-0634, ISM-0637, ISM-0639, ISM-1037, ISM-1181, ISM-1192, ISM-1269, ISM-1270, ISM-1271, ISM-1284, ISM-1286, ISM-1287, ISM-1288, ISM-1289, ISM-1293, ISM-1389, ISM-1427, ISM-1520, ISM-1521, ISM-1522, ISM-1528, ISM-1577, ISM-1750

#### vsan-9.operations-reserve

vSAN must reserve space to complete internal maintenance operations.

**Implementation Priority:** P0

**Bridging SCF Controls:** CAP-01

**Mapped Framework Controls:** ISM-1579, ISM-1580, ISM-1581

#### vsan-9.rekey-interval

Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-09

**Mapped Framework Controls:** ISM-0455, ISM-0507

#### vsan-9.storage-cluster-traffic-protection

vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03, NET-06

**Mapped Framework Controls:** ISM-0231, ISM-0232, ISM-0465, ISM-0467, ISM-0469, ISM-0484, ISM-0547, ISM-1139, ISM-1181, ISM-1269, ISM-1270, ISM-1271, ISM-1369, ISM-1370, ISM-1372, ISM-1373, ISM-1374, ISM-1375, ISM-1448, ISM-1453, ISM-1506, ISM-1553, ISM-1577, ISM-1589, ISM-1750, ISM-1781
