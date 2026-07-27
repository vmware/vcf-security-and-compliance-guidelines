## Current Security & Compliance Landing Pages
The best landing pages for these resources are:

* [https://brcm.tech/vcf-security](https://brcm.tech/vcf-security)
* [https://brcm.tech/vcf-scg](https://brcm.tech/vcf-scg)
* [https://brcm.tech/vcf-compliance](https://brcm.tech/vcf-compliance)

which redirect to

* [https://github.com/vmware/vcf-security-and-compliance-guidelines/](https://github.com/vmware/vcf-security-and-compliance-guidelines/)
* [https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/security-configuration-hardening-guide](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/security-configuration-hardening-guide)
* [https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/regulatory-compliance](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/regulatory-compliance)

respectively. We are phasing out the older bit.ly links in favor of the brcm.tech links. Organizations which block bit.ly links often do not comprehensively block HTTP 301/302 redirects and may be able to use brcm.tech instead.

## Broadcom Resources
These resources answer common security and compliance questions for users of VMware products.

* [vSphere Security & Compliance Playlist on YouTube](https://www.youtube.com/playlist?list=PLymLY4xJSThr22Po9uj6KTcVE6W_Xso4K)
* [Glossary of Security Terms](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/security-design/Glossary.MD)
* [Compliance & Vulnerability Scanner FAQ](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/regulatory-compliance/compliance-vulnerability-scanning-faq.md)
* [Best Practices for Patching vSphere](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/security-design/Best-Practices-for-Patching-vSphere.MD)

## Broadcom Support Policies Applicable to Security Hardening
Put simply, Broadcom does not support modifications to appliances or the products outside of the documented upgrade and patching processes. Security Configuration Guides, STIGs, Compliance Kit, and other official guidance found in the Knowledge Base are all supported where the guidance used matches the version being deployed.

* [VMware Virtual Appliances and Customizations to Operating System and Included Packages](https://knowledge.broadcom.com/external/article?articleNumber=367354)
* [Support for Security Technical Implementation Guides (STIGs)](https://knowledge.broadcom.com/external/article?legacyId=94398)

## Security Configuration & Hardening Guides
The Security Configuration and Hardening Guide (SCG) provides a baseline security hardening recommendation. It contains instructions for configuring vSphere components against the baseline and supporting compliance work. That said, it is a guideline, and your organization may have good reason to deviate from it. Good reasons often include specific workload requirements (especially clustered applications which may need specific network port group security settings), and controls being superseded by regulatory requirements.

* Permanent Link: [https://brcm.tech/vcf-scg](https://brcm.tech/vcf-scg)
* Redirect Target: [https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/security-configuration-hardening-guide](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/security-configuration-hardening-guide)

There is a CIS Benchmark for ESX 8.0, but it does not include components or features enabled with vCenter or vSAN. When in doubt, or if there is a conflict, use the guidance published by Broadcom.

## Product Documentation
The product documentation is the reference for how a feature or component works. This repository is meant to augment the product documentation. If the docs answer the question "how?" this repository tries to answer the "why?" or "when?" or "so what?" questions you might have.

* [vSphere 9 Security](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/9-0/vsphere-security.html)
* [vSphere 8 Security](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security.html)
* [vSphere 7 Security](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/7-0/vsphere-security.html)

Documentation is not always flawless. If you encounter an issue with documentation, please use the feedback mechanism for the documentation, which opens a ticket with the documentation team.

## VMware Product Security
VMware has a defined Secure Software Development Lifecycle and policies for how issues are assessed and managed.

* [VMware Cloud Foundation Product Security](https://support.broadcom.com/web/ecx/support-content-notification/-/external/content/ProductAdvisories/0/37333) describes the product security practices applied across the VCF development lifecycle. (Successor to the former "VMware Product Security: An Overview of VMware's Security Programs and Practices" whitepaper; requires a Broadcom support login.)
* [VMware External Vulnerability Response and Remediation Policy](https://www.broadcom.com/support/vmware-services/security-response)
* [Data collected when gathering diagnostic information from vSphere products](https://knowledge.broadcom.com/external/article?legacyId=2147388) also covers what happens with encrypted VMs, and how to encrypt memory and support dumps.

## VMware Security Advisories
VMware Security Advisories, or VMSAs, are formal notifications of a vulnerability that has been reported and resolved in VMware products. They contain information about what the problem is and where it is located, the fixed versions, and sometimes include workarounds and other defensive measures.

* [Sign Up for Security Alerts via Email](https://go-vmware.broadcom.com/vmsa_email_alert)
* [Index of VMware Security Advisories](https://www.broadcom.com/support/vmware-security-advisories)

There are no automated vulnerability feeds (RSS or otherwise) available at this time.

## DISA STIG and STIG Readiness Guides
STIGs are comprehensive hardening guides for US Department of Defense (DOD) systems, based on DOD and NIST requirements.

* [Security Technical Implementation Guides (STIGs)](https://www.vmware.com/resources/certifications/stigs)
* [Support for Security Technical Implementation Guides (STIGs)](https://knowledge.broadcom.com/external/article?legacyId=94398)

There is considerable overlap between the STIGs and the SCG, intentionally. The STIG goes much further in certain areas in order to comply with DOD requirements. If you are not directly subject to the DOD requirements you might consider either using the SCG, or using the STIGs but without editing configurations inside the appliances.

## VMware Certifications
Broadcom maintains certifications and validations for VMware products that support our security claims and ease procurement.

* [Common Criteria](https://www.vmware.com/resources/certifications/common-criteria)
* [Federal Information Processing Standard (FIPS) 140-2 & 140-3](https://www.vmware.com/resources/certifications/fips)
* [VMware Cloud Trust Center](https://www.broadcom.com/support/trust-center)

## Secure System Design and Architecture
This section grows as we update whitepapers and other resources.

* [Practical Ideas for Ransomware Resilience](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/threat-resources/Ransomware/Practical-Ideas-for-Ransomware-Resilience.md)
* [Designing Infrastructure to Defeat Ransomware](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/security-design/designing-infrastructure-to-defeat-ransomware.pdf)
* [Ransomware Defense and Recovery Strategies](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/security-design/ransomware-defense-and-recovery-strategies.pdf)

On the surface this doesn't look like secure system design, per se, but a smaller footprint is easier to secure. Using VCF means fewer first-order objects to secure (servers, software, etc.) which, in turn, means fewer second- and third-order objects to secure (network switches, etc.). That means less staff time used, less money spent, and less risk taken.

## Firewalling and Perimeter Defenses
VMware documents the ports, protocols, and requirements for network connectivity so that enterprise firewall admins have an easier time being specific about rule sets.

* [Ports and Protocols](https://ports.broadcom.com/)

## Cryptography, TLS, and Data-in-Transit Security
We have a fair amount of information at the following links:

* [VMware vSphere 8 Default SSL/TLS Cipher Suites](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/regulatory-compliance/vsphere/8.0/VMware-vSphere-8-Default-TLS-Ciphers.md)
* [VMware vSphere 7 Default SSL/TLS Cipher Suites](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/regulatory-compliance/vsphere/7.0/VMware-vSphere-7-Default-TLS-Ciphers.md)

## Product Resources
Other resources to help with updates and upgrades beyond patching. New versions of vSphere and Cloud Foundation include security and functional improvements beyond what patches deliver.

* [VMware Compatibility Guide](https://compatibilityguide.broadcom.com/)
* [Product Interoperability Matrix](https://interopmatrix.broadcom.com/Interoperability)
* [Product Lifecycle Information](https://support.broadcom.com/group/ecx/productlifecycle)

## US Cybersecurity and Infrastructure Security (CISA) Resources
CISA is the United States' coordinator for infrastructure security and resilience. They have a lot of interesting material for anyone in the world, and some highlights are linked below. Bob Plankers' presentations often quote the Risk and Vulnerability Assessments, which are free and available on the CISA website.

* [https://www.cisa.gov/](https://www.cisa.gov/)
* [Risk and Vulnerability Assessments](https://www.cisa.gov/resources-tools/resources/risk-and-vulnerability-assessments)
* [Insider Threat Mitigation](https://www.cisa.gov/topics/physical-security/insider-threat-mitigation)
* [Tabletop Exercise Packages](https://www.cisa.gov/resources-tools/services/cisa-tabletop-exercise-packages)
* [Stop Ransomware](https://www.cisa.gov/stopransomware)

## Australian Cyber Security Centre (ACSC) Resources
The Australian Signals Directorate's Australian Cyber Security Centre (ASD's ACSC) leads the Australian Government’s efforts to improve cyber security. 

* [https://www.cyber.gov.au/](https://www.cyber.gov.au/)

## UK National Cyber Security Centre (NCSC) Resources
NCSC supports cybersecurity efforts in the United Kingdom. Their site has useful information for organizations globally, especially their collections in the "Information for..." section of the NCSC site.

* [https://www.ncsc.gov.uk/](https://www.ncsc.gov.uk/)
* [Secure connectivity principles for operational technology (OT)](https://www.ncsc.gov.uk/collection/operational-technology/secure-connectivity)

## Detection & Response Resources
Additional information about other non-VMware components that can help with early detection and containment of attacker movement inside IT infrastructure layers.

* [Curated List of Awesome Honeypots](https://github.com/paralax/awesome-honeypots)
* [Canary Tokens](https://canarytokens.org/nest/)
