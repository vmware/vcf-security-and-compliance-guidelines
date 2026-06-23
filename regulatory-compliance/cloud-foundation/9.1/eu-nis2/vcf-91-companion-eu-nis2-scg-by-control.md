# Companion Guide to Directive (EU) 2022/2555 (NIS2) for VMware Cloud Foundation 9.1 -- Framework Controls by SCG Coverage

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://eur-lex.europa.eu/eli/dir/2022/2555

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

6 framework controls have at least one Security Configuration Guide hardening control mapped to them through the SCF crosswalk.

### Control 21.2(c)

> The measures referred to in paragraph 1 shall be based on an all-hazards approach that aims to protect network and information systems and the physical environment of those systems from incidents, and shall include at least the following: (c)  business continuitness of cybersecurity risk-management measures;

**Bridging SCF Controls:** BCD-11

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.

### Control 21.2(d)

> The measures referred to in paragraph 1 shall be based on an all-hazards approach that aims to protect network and information systems and the physical environment of those systems from incidents, and shall include at least the following: (d) supply chain security, including security-related aspects concerning the relationships between each entity and its direct suppliers or service providers;

**Bridging SCF Controls:** TPM-03

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control 21.2(h)

> The measures referred to in paragraph 1 shall be based on an all-hazards approach that aims to protect network and information systems and the physical environment of those systems from incidents, and shall include at least the following: (h) policies and procedures regarding the use of cryptography and, where appropriate, encryption;

**Bridging SCF Controls:** CRY-01

**Relevant SCG Controls:**

- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

### Control 21.3

> Member States shall ensure that, when considering which measures referred to in paragraph 2, point (d), of this Article are appropriate, entities take into account the vulnerabilities specific to each direct supplier and service provider and the overall quality of products and cybersecurity practices of their suppliers and service providers, including their secure development procedures. Member States shall also ensure that, when considering which measures referred to in that point are appropriate, entities are required to take into account the results of the coordinated security risk assessments of critical supply chains carried out in accordance with Article 22(1).

**Bridging SCF Controls:** TPM-03, TPM-04

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control 21.4

> Member States shall ensure that an entity that finds that it does not comply with the measures provided for in paragraph 2 takes, without undue delay, all necessary, appropriate and proportionate corrective measures.

**Bridging SCF Controls:** VPM-04

**Relevant SCG Controls:**

- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.

### Control 21.5

> By 17 October 2024, the Commission shall adopt implementing acts laying down the technical and the methodological requirements of the measures referred to in paragraph 2 with regard to DNS service providers, TLD name registries, cloud computing service providers, data centre service providers, content delivery network providers, managed service providers, managed security service providers, providers of online market places, of online search engines and of social networking services platforms, and trust service providers. The Commission may adopt implementing acts laying down the technical and the methodological requirements, as well as sectoral requirements, as necessary, of the measures referred to in paragraph 2 with regard to essential and important entities other than those referred to in the first subparagraph of this paragraph.  When preparing the implementing acts referred to in the first and second subparagraphs of this paragraph, the Commission shall, to the extent possible, follow European and international standards, as well as relevant technical specifications. The Commission shall exchange advice and cooperate with the Cooperation Group and ENISA on the draft implementing acts in accordance with Article 14(4), point (e).  Those implementing acts shall be adopted in accordance with the examination procedure referred to in Article 39(2).

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
