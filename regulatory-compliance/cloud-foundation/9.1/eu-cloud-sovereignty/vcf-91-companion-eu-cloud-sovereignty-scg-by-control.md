# Companion Guide to the EU Cloud Sovereignty Framework for VMware Cloud Foundation 9.1 -- Framework Controls by SCG Coverage

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

## Framework Controls With Relevant SCG Hardening Controls

4 framework controls have at least one Security Configuration Guide hardening control mapped to them through the SCF crosswalk.

### Control SOV-1

> Strategic Sovereignty: Strategic sovereignty captures the degree to which the services of a cloud provider (or technology actor) are anchored within the European Union legal, financial, and industrial ecosystem. It assesses ownership stability, governance influence, and alignment with EU strategic priorities. Contributing factors: Ensuring that bodies having decisive authority over your services are located within EU jurisdiction; Evaluating the assurances against change of control; Degree to which the provider relies on financing coming from EU sources; Extent of investment, jobs, and value creation within EU; Involvement in EU initiatives, Consistency with digital, green, and industrial sovereignty objectives defined at EU level; Ability to sustain secure operations against requests to cease or suspend the service, or if vendor support is withdrawn or disrupted.

**Bridging SCF Controls:** TPM-04

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control SOV-3

> Data & AI Sovereignty: Data & AI sovereignty focuses on the protection, control, and independence of data assets and AI services within the EU. It addresses how data is secured, where it is processed, and the degree of autonomy customers retain over AI capabilities. Contributing factors: Ensuring that only the customer, not the provider, has effective control over cryptographic access to their data; Visibility into when, where, and by whom data is accessed, including auditability of AI model usage, mechanisms guaranteeing irreversible removal of data, with verifiable evidence; Strict confinement of storage and processing to European jurisdictions, with no fallback to third countries; Extent to which AI models and data pipelines are developed, trained, hosted, and governed under EU control, minimizing dependency on non-EU technology stacks.

**Bridging SCF Controls:** CRY-01, CRY-09, MON-02.7

**Relevant SCG Controls:**

- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- vcenter-9.events-remote-logging -- Enable remote logging of vCenter events.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control SOV-5

> Supply Chain Sovereignty: Supply chain sovereignty evaluates the geographic origin, transparency, and resilience of the technology supply chain, focusing on the extent to which critical components and processes remain under EU control or exposed to non-EU dependencies. Contributing factors: Geographic source of key physical parts, manufacturing location - countries where hardware is manufactured or assembled; Jurisdiction and provenance of embedded code controlling hardware, firmware; Origin of Software: where and by whom software is architected and programmed, location and jurisdiction governing software packaging, distribution, and updates; Degree of reliance on non-EU vendors, facilities, or proprietary technologies; Visibility into the entire supplier and sub-supplier chain, including audit rights.

**Bridging SCF Controls:** TPM-03

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control SOV-7

> Security & Compliance Sovereignty: Security & Compliance sovereignty measures the extent to which security operations, compliance obligations, and resilience measures are controlled within the EU, ensuring independence from foreign jurisdictions and long-term operational assurance. Contributing factors: Attainment of EU and internationally recognized certifications (e.g., ISO, ENISA schemes); Adherence to GDPR, NIS2, DORA, and other EU frameworks; Security Operations Centres and response teams operating exclusively under EU jurisdiction, control over security monitoring/logging - customer or EU authority ability to oversee logs, alerts, and monitoring functions directly; Transparent, timely, and EU-compliant reporting of breaches or vulnerabilities, maintenance Autonomy - ability to develop, test, and apply security patches independently of non-EU vendors; Capacity for EU entities to perform independent security and compliance audits with full access.

**Bridging SCF Controls:** VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.
