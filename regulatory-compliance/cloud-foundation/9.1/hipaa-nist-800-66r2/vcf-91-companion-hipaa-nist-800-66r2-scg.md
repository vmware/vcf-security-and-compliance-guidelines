# Companion Guide to the HIPAA Security Rule (NIST SP 800-66 R2) for VMware Cloud Foundation 9.1 -- SCG Hardening Controls

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://www.ecfr.gov/current/title-45/subtitle-A/subchapter-C/part-164/subpart-C

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

63 Security Configuration Guide controls map to this framework through the SCF crosswalk, grouped below by product component.

### Automation

#### automation-9.oidc-settings

Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** 164.312(e)(1)

### ESX

#### esx-9.ad-admin-group-autoadd

The ESX host must not automatically grant administrative permissions to Active Directory groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** 164.308(a)(3)(i), 164.312(a)(1)

#### esx-9.ad-admin-validate-interval

The ESX host must not disable validation of users and groups.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-17

**Mapped Framework Controls:** 164.308(a)(3)(ii)(B)

#### esx-9.api-soap-timeout

The ESX host must configure a session timeout for the vSphere API.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** 164.312(a)(2)(iii)

#### esx-9.cpu-hyperthread-warning

The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-01.4

**Mapped Framework Controls:** 164.312(b)

#### esx-9.dcui-timeout

Set a timeout to automatically terminate idle DCUI sessions on the ESX host.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** 164.312(a)(2)(iii)

#### esx-9.entropy

The ESX host must use sufficient entropy for cryptographic operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** 164.312(a)(2)(iv), 164.312(e)(2)(ii)

#### esx-9.hardware-cpu-amd-cc

Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** 164.312(a)(2)(iv), 164.312(e)(2)(ii)

#### esx-9.hardware-cpu-intel-cc

Enable Intel SGX and TDX in system firmware where available.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** 164.312(a)(2)(iv), 164.312(e)(2)(ii)

#### esx-9.lockdown-dcui-access

Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** 164.308(a)(3)(i), 164.312(a)(1)

#### esx-9.lockdown-exception-users

Keep the Lockdown Mode Exception Users list to the minimum necessary.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** 164.308(a)(3)(i), 164.312(a)(1)

#### esx-9.log-audit-local

The ESX host must enable audit record logging.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** 164.312(b)

#### esx-9.log-filter

The ESX host must not enable log filtering.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** 164.312(b)

#### esx-9.log-forwarding-tls-ciphers

The ESX host must verify certificates for TLS remote logging endpoints.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** 164.312(e)(1)

#### esx-9.log-level

The ESX host must produce audit records containing information to establish what type of events occurred.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** 164.312(b)

#### esx-9.nfs-traffic-protection

Protect NFS datastore traffic on the ESX host using encryption or network isolation.

**Implementation Priority:** P1, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** 164.312(e)(1)

#### esx-9.session-timeout

The ESX Host Client must enforce an idle session timeout.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** 164.312(a)(2)(iii)

#### esx-9.shell-interactive-timeout

Configure the inactivity timeout to automatically terminate idle ESX host shells.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** 164.312(a)(2)(iii)

#### esx-9.shell-timeout

Set a timeout to limit how long the ESX Shell and SSH services are allowed to run.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** 164.312(a)(2)(iii)

#### esx-9.shell-warning

The ESX host must not suppress warnings that the local or remote shell is enabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-01.4

**Mapped Framework Controls:** 164.312(b)

#### esx-9.tls-ciphers

The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** 164.312(e)(1)

#### esx-9.vmk-storage

The ESX host must protect the confidentiality and integrity of transmitted storage traffic.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** 164.312(e)(1)

#### esx-9.vmk-vmotion

The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** 164.312(e)(1)

#### esx-9.vmotion-encryption-offload

Accelerate vMotion encryption using available hardware offload on ESX hosts.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** 164.312(e)(1)

#### guest-9.tools-logs

The guest OS must enable VMware Tools logging.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** 164.312(b)

#### vm-9.ft-encrypted

Virtual machines must require encryption for Fault Tolerance.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** 164.312(e)(1), 164.312(e)(2)(i)

#### vm-9.isolation-device-connectable-deactivate

Virtual machines must prevent unauthorized removal, connection, and modification of devices.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** 164.308(a)(3)(i), 164.312(a)(1)

#### vm-9.log-enable

Virtual machines must enable diagnostic logging.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** 164.312(b)

#### vm-9.pci-passthrough

Virtual machines must limit PCI device passthrough functionality.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-21

**Mapped Framework Controls:** 164.308(a)(3)(i), 164.312(a)(1)

#### vm-9.vmotion-encrypted

Virtual machines must require encryption for vMotion.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** 164.312(e)(1), 164.312(e)(2)(i)

### Operations for Networks

#### networks-9.audit-identity

Capture user identity in VCF Operations for Networks audit logs.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** 164.312(b)

#### networks-9.session-timeout

VCF Operations for Networks must enforce an idle session timeout.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** 164.312(a)(2)(iii)

### NSX

#### nsx-9.backup

Configure scheduled backups of NSX Manager.

**Implementation Priority:** P0

**Bridging SCF Controls:** BCD-11

**Mapped Framework Controls:** 164.308(a)(7)(ii)(A), 164.310(d)(2)(iv)

#### nsx-9.bgp-encryption

Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-04

**Mapped Framework Controls:** 164.312(e)(2)(i)

#### nsx-9.load-balancer-fips

Enable FIPS-validated cryptography for NSX load balancers.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-01, CRY-03

**Mapped Framework Controls:** 164.312(a)(2)(iv), 164.312(e)(1), 164.312(e)(2)(ii)

#### nsx-9.log-level

NSX Manager must set service logging levels to capture audit-relevant events.

**Implementation Priority:** P0

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** 164.312(b)

#### nsx-9.ospf-encryption

NSX Tier-0 Gateway must enable OSPF authentication.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-04

**Mapped Framework Controls:** 164.312(e)(2)(i)

#### nsx-9.session-timeout

NSX Manager must enforce an idle session timeout on its API and CLI.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** 164.312(a)(2)(iii)

#### nsx-9.tls-ciphers

NSX Manager must use TLS with approved protocol versions and cipher suites.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** 164.312(e)(1)

### Operations

#### operations-9.credential-ownership-enforcement

VCF Operations must enable credential ownership enforcement.

**Implementation Priority:** P0

**Bridging SCF Controls:** CFG-08

**Mapped Framework Controls:** 164.308(a)(3)(i), 164.312(c)(2)

#### operations-9.logs-ssl-api

Enable SSL for API log ingestion in VCF Operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** 164.312(e)(1), 164.312(e)(2)(i)

#### operations-9.logs-ssl-syslog

Enable SSL for syslog log ingestion in VCF Operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** 164.312(e)(1), 164.312(e)(2)(i)

#### operations-9.non-imported-vidm

Restrict VCF Operations access to imported identity-provider users.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-07

**Mapped Framework Controls:** 164.308(a)(3)(ii)(C)

#### operations-9.session-timeout

VCF Operations must enforce an idle session timeout.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** 164.312(a)(2)(iii)

### SDDC Manager

#### sddc-9.api-admin

SDDC Manager must configure the API admin account.

**Implementation Priority:** P2

**Bridging SCF Controls:** IAC-15.9

**Mapped Framework Controls:** 164.312(a)(2)(ii)

### vCenter

#### vcenter-9.administration-client-plugins

Reduce or eliminate third-party vCenter plugins.

**Implementation Priority:** P1

**Bridging SCF Controls:** TPM-04

**Mapped Framework Controls:** 164.308(b)(1)

#### vcenter-9.drs

VMware vCenter must enable the Distributed Resource Scheduler for resilience and to enable automated patching.

**Implementation Priority:** P0

**Bridging SCF Controls:** BCD-02.2

**Mapped Framework Controls:** 164.308(a)(7)(ii)(C)

#### vcenter-9.logs-level-global

Configure the vCenter logging level to capture security-relevant events.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-03

**Mapped Framework Controls:** 164.312(b)

#### vcenter-9.service-resilience-evc

Enable Enhanced vMotion Compatibility on vCenter clusters.

**Implementation Priority:** P1

**Bridging SCF Controls:** BCD-02.2

**Mapped Framework Controls:** 164.308(a)(7)(ii)(C)

#### vcenter-9.service-resilience-ha

Enable vSphere High Availability on clusters.

**Implementation Priority:** P0

**Bridging SCF Controls:** BCD-02.2

**Mapped Framework Controls:** 164.308(a)(7)(ii)(C)

#### vcenter-9.service-resilience-vmotion

Enable vMotion for live workload migration.

**Implementation Priority:** P0

**Bridging SCF Controls:** BCD-02.2

**Mapped Framework Controls:** 164.308(a)(7)(ii)(C)

#### vcenter-9.session-timeout

Enforce an idle session timeout for the vSphere Client.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-25

**Mapped Framework Controls:** 164.312(a)(2)(iii)

#### vcenter-9.smtp

Send vCenter notification email over a secure SMTP connection.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** 164.312(e)(1)

#### vcenter-9.snmp3

Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** 164.312(a)(2)(iv), 164.312(e)(2)(ii)

#### vcenter-9.tls-ciphers

vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** 164.312(e)(1)

### VCF

#### vcf-9.mfa

Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

**Implementation Priority:** P0

**Bridging SCF Controls:** IAC-02

**Mapped Framework Controls:** 164.312(a)(2)(i)

#### vcf-9.permissions-roles

Review and right-size accounts, permissions, and role assignments across all VCF components.

**Implementation Priority:** P1

**Bridging SCF Controls:** IAC-17, IAC-21

**Mapped Framework Controls:** 164.308(a)(3)(i), 164.308(a)(3)(ii)(B), 164.312(a)(1)

#### vcf-9.secure-baseline

Apply the controls in this guidance, and document the rationale for any deviations.

**Implementation Priority:** P1

**Bridging SCF Controls:** CFG-02

**Mapped Framework Controls:** 164.312(a)(2)(iii), 164.312(e)(1), 164.312(e)(2)(i), 164.312(e)(2)(ii)

### vSAN

#### vsan-9.auto-raid

vSAN ESA automatic RAID management must remain enabled.

**Implementation Priority:** P2

**Bridging SCF Controls:** BCD-02.2

**Mapped Framework Controls:** 164.308(a)(7)(ii)(C)

#### vsan-9.encryption-transit-esa

vSAN must protect data in transit between hosts.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** 164.312(e)(1), 164.312(e)(2)(i)

#### vsan-9.encryption-transit-osa

vSAN must protect data in transit between hosts.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** 164.312(e)(1), 164.312(e)(2)(i)

#### vsan-9.file-services-authentication-smb

SMB file shares on vSAN File Services must require protocol encryption.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03, CRY-04

**Mapped Framework Controls:** 164.312(e)(1), 164.312(e)(2)(i)

#### vsan-9.storage-cluster-traffic-protection

vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-03

**Mapped Framework Controls:** 164.312(e)(1)
