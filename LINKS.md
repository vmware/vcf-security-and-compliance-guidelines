## Current Security & Compliance Landing Pages
As VMware documentation and resources are assimilated into Broadcom links will change. The current best landing page for these resources is:

* [https://brcm.tech/vcf-security](https://brcm.tech/vcf-security)
* [https://brcm.tech/vcf-scg](https://brcm.tech/vcf-scg)
* [https://brcm.tech/vcf-compliance](https://brcm.tech/vcf-compliance)

which redirect to

* [https://github.com/vmware/vcf-security-and-compliance-guidelines/](https://github.com/vmware/vcf-security-and-compliance-guidelines/)
* [https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/security-configuration-hardening-guide](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/security-configuration-hardening-guide)
* [https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/regulatory-compliance](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/regulatory-compliance)

respectively. There are older bit.ly links that are being phased out in favor of the brcm.tech links. Organizations which block bit.ly links often do not comprehensively block HTTP 301/302 redirects and may be able to use brcm.tech instead.

## Broadcom Resources
We have quite a number of tactical and strategic resources available to users of VMware products, answering many questions.

* [vSphere Security & Compliance Playlist on YouTube](https://www.youtube.com/playlist?list=PLymLY4xJSThr22Po9uj6KTcVE6W_Xso4K)
* [Glossary of Security Terms](https://github.com/vmware/cloud-infrastructure-security-and-compliance-guidelines/blob/main/security-design/Glossary.md)
* [Compliance & Vulnerability Scanner FAQ](https://github.com/vmware/cloud-infrastructure-security-and-compliance-guidelines/blob/main/regulatory-compliance/compliance-vulnerability-scanning-faq.md)
* [Best Practices for Patching vSphere](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/security-design/Best-Practices-for-Patching-vSphere.md)

## Broadcom Support Policies Applicable to Security Hardening
Put simply, Broadcom does not support modifications to appliances or the products outside of the documented upgrade and patching processes. Security Configuration Guides, STIGs,  Compliance Kit, and other official guidance found in the Knowledge Base are all supported where the guidance used matches the version being deployed.

* [VMware Virtual Appliances and Customizations to Operating System and Included Packages](https://knowledge.broadcom.com/external/article?articleNumber=367354)
* [Support for Security Technical Implementation Guides (STIGs)](https://knowledge.broadcom.com/external/article?legacyId=94398)

## Security Configuration & Hardening Guides
The Security Configuration and Hardening Guide (SCG) provides a baseline security hardening recommendation. It offers detailed instructions and best practices for configuring various vSphere components to enhance security and ensure compliance with industry standards. That said, it is a guideline, and your organization may have good reason to deviate from it. Good reasons often include specific workload requirements (especially clustered applications which may need specific network port group security settings), and controls being superseded by regulatory requirements.

* Permanent Link: [https://brcm.tech/vcf-scg](https://brcm.tech/vcf-scg)
* Redirect Target: [https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/security-configuration-hardening-guide](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/security-configuration-hardening-guide)

There is a CIS Benchmark for ESX 8.0, but does not include components or features enabled with vCenter or vSAN. When in doubt, or if there is a conflict, use the guidance published by Broadcom.

## Product Documentation
The product documentation is the reference for how a feature or component works. This repository is meant to augment the product documentation. If the docs answer the question "how?" this repository tries to answer the "why?" or "when?" or "so what?" questions you might have.

* [vSphere 8 Security](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security-8-0.html)
* [vSphere 7 Security](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/7-0/vsphere-security-7-0.html)

Documentation is not always flawless. If you encounter an issue with documentation, please use the feedback mechanism for the documenation, which opens a ticket with the documentation team.

## VMware Product Security
VMware has a defined Secure Software Development Lifecycle and policies for how issues are assessed and managed.

* [VMware Product Security: An Overview of VMware's Security Programs and Practices](https://www.vmware.com/docs/vmware-product-security-white-paper)
* [VMware External Vulnerability Response and Remediation Policy](https://www.broadcom.com/support/vmware-services/security-response)
* [Data collected when gathering diagnostic information from vSphere products](https://knowledge.broadcom.com/external/article?legacyId=2147388) also covers what happens with encrypted VMs, and how to encrypt memory and support dumps.

## VMware Security Advisories
VMware Security Advisories, or VMSAs, are formal notifications of a vulnerability that has been reported and resolved in VMware products. They contain information about what the problem is and where it is located, the fixed versions, and sometimes include workarounds and other possible defensive posture.

* [Sign Up for Security Alerts via Email](https://go-vmware.broadcom.com/vmsa_email_alert)
* [Index of VMware Security Advisories](https://www.broadcom.com/support/vmware-security-advisories)

There are no automated vulnerability feeds (RSS or otherwise) available at this time.

## DISA STIG and STIG Readiness Guides
STIGs are comprehensive hardening guides for US Department of Defense (DOD) systems, based on DOD and NIST requirements.

* [Security Technical Implementation Guides (STIGs)](https://www.vmware.com/solutions/security/certifications/stigs)
* [Support Policy for Security Technical Implementation Guides (STIGs)](https://knowledge.broadcom.com/external/article?legacyId=94398)

There is considerable overlap between the STIGs and the SCG, intentionally. The STIG goes much further in certain areas in order to comply with DOD requirements. If you are not directly subject to the DOD requirements you might consider either using the SCG, or using the STIGs but without editing configurations inside the appliances.

## VMware Certifications
Broadcom maintains certifications and validations for VMware products that help demonstrate our claims of security are true, and to help ease procurement processes.

* [Common Criteria](https://www.vmware.com/solutions/security/certifications/common-criteria)
* [Federal Information Processing Standard (FIPS) 140-2 & 140-3](https://www.vmware.com/solutions/security/certifications/fips)
* [VMware Cloud Trust Center](https://www.vmware.com/info/trust-center#compliance)

## Secure System Design and Architecture
This section is growing as we update whitepapers and other resources as part of the merger with Broadcom.

* [Best Practices for Patching vSphere](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/security-design/Best-Practices-for-Patching-vSphere.md)
* [Practical Ideas for Ransomware Resilience](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/ransomware-resources/Practical-Ideas-for-Ransomware-Resilience.md)
* [Designing Infrastructure to Defend Against Ransomware](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/ransomware-resources/Designing%20Infrastructure%20to%20Defeat%20Ransomware%20-%2020221024.pdf)
* [Ransomware Defense and Recovery Strategies](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/ransomware-resources/Ransomware%20Defense%20and%20Recovery%20Strategies%20-%2020230425.pdf)

On the surface this doesn't look like secure system design, per se, but less is more when it comes to security. Using VCF means less first-order objects to secure (servers, software, etc.) which, in turn, means less second- and third-order objects to secure (network switches, etc.). That means less staff time used, less money spent, and less risk taken.

* [Run More VMs and Get Better Performance with VMware vSphere 8](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/security-design/Density/vSphere-8-U3-VM-density-comparison-1024.pdf)
* [Run More VMs and Get Better Performance with VMware vSphere 8: The Science](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/security-design/Density/vSphere-8-U3-VM-density-comparison-science-1024-v2.pdf)

## Firewalling and Perimeter Defenses
VMware documents the ports, protocols, and requirements for network connectivity so that enterprise firewall admins have an easier time being specific about rule sets.

* [Ports and Protocols](https://ports.broadcom.com/)
* [vSphere Firewalling Helper](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/security-configuration-hardening-guide/vsphere/8.0): An Excel spreadsheet that has additional information about network communications and firewalling.

## Cryptography, TLS, and Data-in-Transit Security
We have a fair amount of information at the following links:

* [VMware vSphere 8 Default SSL/TLS Cipher Suites](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/regulatory-compliance/vsphere/8.0/VMware-vSphere-8-Default-TLS-Ciphers.md)
* [VMware vSphere 7 Default SSL/TLS Cipher Suites](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/regulatory-compliance/vsphere/7.0/VMware-vSphere-7-Default-TLS-Ciphers.md)

## Product Resources
Other resources to help with updates and upgrades beyond patching. Every new version of vSphere and Cloud Foundation brings with it deep security and functional improvements.

* [VMware Compatibility Guide](https://www.vmware.com/resources/compatibility/search.php)
* [Product Interoperability Matrix](https://interopmatrix.vmware.com/Interoperability)
* [Product Lifecycle Information](https://support.broadcom.com/group/ecx/productlifecycle)

## Regulatory Compliance Standards
There are over 700 different regulatory compliance frameworks that VMware customers apply to their environments, not counting ones developed internally by GRC and Infosec groups within customer organizations. As such, we focus on the most common. Some of these are linked below. It is often helpful to read the requirements directly, versus using interpretations by compliance auditors, vulnerability scanner vendors, and so on.

* [NIST SP 800-53 Revision 5](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-53r5.pdf)
* [NIST SP 800-53B Control Baselines](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-53B.pdf)
* [800-53-v5-to-ISO 27001-2022 Controls Crosswalk](https://csrc.nist.gov/projects/olir/informative-reference-catalog/details?referenceId=99#/)
* [North American Electric Reliability Corporation Critical Infrastructure Protection (NERC CIP)](https://www.nerc.com/pa/Stand/Pages/ReliabilityStandards.aspx)
* [ISO/IEC 27001:2022](https://www.iso.org/standard/27001) - NOTE: neither free nor freely distributable.
* [NIST SP 800-171 Revision 3](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-171r3.pdf)
* [PCI DSS 4.0.1](https://www.pcisecuritystandards.org/document_library/) - NOTE: free but requires acceptance of terms to download
* [ACSC Information Security Manual](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism)
* [Australian Government Protective Security Policy Framework](https://www.protectivesecurity.gov.au/publications-library?f%5B0%5D=field_publication_type%3A845)
* [EU Digital Operational Resilience Act (DORA)](https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=CELEX:32022R2554)

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
* [CNI system design: Secure Remote Access](https://www.ncsc.gov.uk/blog-post/cni-system-design-secure-remote-access)

## Detection & Response Resources
Additional information about other non-VMware components that can help with early detection and containment of attacker movement inside IT infrastructure layers.

* [Curated List of Awesome Honeypots](https://github.com/paralax/awesome-honeypots)
* [Canary Tokens](https://canarytokens.org/nest/)
