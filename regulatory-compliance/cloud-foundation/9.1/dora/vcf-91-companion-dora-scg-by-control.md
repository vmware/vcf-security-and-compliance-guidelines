# Companion Guide to Regulation (EU) 2022/2554 Digital Operational Resilience Act (DORA) for VMware Cloud Foundation 9.1 -- Framework Controls by SCG Coverage

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://www.digital-operational-resilience-act.com/

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

14 framework controls have at least one Security Configuration Guide hardening control mapped to them through the SCF crosswalk.

### Control 9.3(a)

> Ensure the security of the means of transfer of data.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 9.3(b)

> Minimize the risk of corruption or loss of data, unauthorized access and technical flaws.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 9.3(c)

> Prevent the lack of availability, the impairment of the authenticity and integrity, the breaches of confidentiality and the loss of data.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 9.3(d)

> Ensure that data is protected from risks arising from data management (e.g., poor administration, processing risks, human error).

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 9.4(c)

> Implement policies that limit the physical or logical access to information assets and ICT assets to what is required for legitimate and approved functions and activities only.

**Bridging SCF Controls:** IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 9.4(e)

> Implement documented policies, procedures and controls for ICT change management that are based on a risk assessment approach.

**Bridging SCF Controls:** CHG-02

**Relevant SCG Controls:**

- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.

### Control 9.4(f)

> Have appropriate and comprehensive documented policies for patches and updates.

**Bridging SCF Controls:** VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control 12.1

> For the purpose of ensuring the restoration of ICT systems and data with minimum downtime, limited disruption and loss, as part of their ICT risk management framework, financial entities shall develop and document:

**Bridging SCF Controls:** BCD-11

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.

### Control 12.1(a)

> Backup policies and procedures specifying the scope of the data that is subject to the backup and the minimum frequency of the backup, based on the criticality of information or the confidentiality level of the data.

**Bridging SCF Controls:** BCD-11

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.

### Control 12.1(b)

> Restoration and recovery procedures and methods.

**Bridging SCF Controls:** BCD-11

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.

### Control 12.2

> Financial entities shall set up backup systems that can be activated in accordance with the backup policies and procedures, as well as restoration and recovery procedures and methods. The activation of backup systems shall not jeopardise the security of the network and information systems or the availability, authenticity, integrity or confidentiality of data. Testing of the backup procedures and restoration and recovery procedures and methods shall be undertaken periodically.

**Bridging SCF Controls:** BCD-11

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.

### Control 12.4

> Financial entities, other than microenterprises, shall maintain redundant ICT capacities equipped with resources, capabilities and functions that are adequate to ensure business needs. Microenterprises shall assess the need to maintain such redundant ICT capacities based on their risk profile.

**Bridging SCF Controls:** BCD-11.7, BCD-12.2

**Relevant SCG Controls:**

- nsx-9.service-resilience -- When NSX Manager runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.
- operations-9.service-resilience -- When VCF Operations runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.
- vcenter-9.service-resilience-ha -- Enable vSphere High Availability on clusters.

### Control 29.1

> When assessing risks, financial entities shall also take into account whether the arrangement would lead to:

**Bridging SCF Controls:** TPM-04

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control 30.3(f)

> Exit strategies, in particular the establishment of a mandatory adequate transition period:

**Bridging SCF Controls:** TPM-03

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.
