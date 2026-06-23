# Companion Guide to the EU Cloud Sovereignty Framework for VMware Cloud Foundation 9.1 -- SCG Hardening Controls

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://commission.europa.eu/document/download/09579818-64a6-4dd5-9577-446ab6219113_en

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

17 Security Configuration Guide controls map to this framework through the SCF crosswalk, grouped below by product component.

### ESX

#### esx-9.entropy

The ESX host must use sufficient entropy for cryptographic operations.

**Implementation Priority:** P2

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** SOV-3

#### esx-9.hardware-cpu-amd-cc

Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** SOV-3

#### esx-9.hardware-cpu-intel-cc

Enable Intel SGX and TDX in system firmware where available.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** SOV-3

#### esx-9.hardware-firmware-updates

Ensure all system and device firmware is auditable, authentic, and up to date.

**Implementation Priority:** P0

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** SOV-7

#### esx-9.hardware-tpm

Install and enable a TPM 2.0 on each ESX host.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-09

**Mapped Framework Controls:** SOV-3

#### esx-9.key-persistence

Disable Key Persistence on ESX hosts that do not have controlled physical access.

**Implementation Priority:** P2, Upon Feature Enablement

**Bridging SCF Controls:** CRY-09

**Mapped Framework Controls:** SOV-3

#### esx-9.tpm-recovery-key-backup

The ESX host configuration encryption recovery key must be backed up to a secure off-host location.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-09

**Mapped Framework Controls:** SOV-3

#### esx-9.updates

The ESX host must have all available software updates and patches installed.

**Implementation Priority:** P0

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** SOV-7

#### guest-9.tools-updates

The guest OS must run a current version of VMware Tools.

**Implementation Priority:** P0

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** SOV-7

#### guest-9.tools-upgrade

The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.

**Implementation Priority:** P2

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** SOV-7

#### vm-9.virtual-hardware

Virtual machines must use a minimum supported virtual hardware version.

**Implementation Priority:** P1

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** SOV-7

### NSX

#### nsx-9.load-balancer-fips

Enable FIPS-validated cryptography for NSX load balancers.

**Implementation Priority:** P0

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** SOV-3

### vCenter

#### vcenter-9.administration-client-plugins

Reduce or eliminate third-party vCenter plugins.

**Implementation Priority:** P1

**Bridging SCF Controls:** TPM-03, TPM-04

**Mapped Framework Controls:** SOV-1, SOV-5

#### vcenter-9.events-remote-logging

Enable remote logging of vCenter events.

**Implementation Priority:** P2

**Bridging SCF Controls:** MON-02.7

**Mapped Framework Controls:** SOV-3

#### vcenter-9.snmp3

Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

**Implementation Priority:** P0, Upon Feature Enablement

**Bridging SCF Controls:** CRY-01

**Mapped Framework Controls:** SOV-3

#### vcenter-9.vami-updates

vCenter must have all available software updates and patches installed.

**Implementation Priority:** P0

**Bridging SCF Controls:** VPM-05

**Mapped Framework Controls:** SOV-7

### vSAN

#### vsan-9.rekey-interval

Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

**Implementation Priority:** P1

**Bridging SCF Controls:** CRY-09

**Mapped Framework Controls:** SOV-3
