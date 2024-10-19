# VMSA-2024-0012: Questions & Answers
Introduction
------------

On June 17, 2024 VMware released a critical security advisory, VMSA-2024-0012, addressing security vulnerabilities found and resolved in VMware vCenter Server, which is present in VMware vSphere and VMware Cloud Foundation products.

The VMSA will always be the source of truth for what products & versions are aﬀected, the workarounds, and proper patches to keep your organization secure. This document is a corollary to the advisory and includes self-service information to help you and your organization decide how to respond.

These vulnerabilities are memory management and corruption issues which can be used against VMware vCenter Server services, potentially allowing remote code execution.

Current Update
--------------

Updated at 2130 PDT (-0700) on June 17, 2024.

Next Expected Update
--------------------

There is not a regular update schedule for this document. It will be updated as new information becomes available.

Questions & Answers
-------------------

### Who does this affect?

Customers who have deployed a product listed in the VMSA (one that includes VMware vCenter Server).

### When do I need to act?

All security response depends on context. Please consult with your organization’s information security staff to determine the right course of action for your organization. If in doubt we recommend taking immediate action, given the severity.

### What should I do to protect myself?

To fully protect yourself and your organization, install one of the patch versions listed in the VMware Security Advisory. Follow the VMware documentation for patching procedures and considerations when using vCenter Server High Availability (not vSphere High Availability).

There may be other protections available in your organization depending on your security posture, defense-in-depth strategies, and conﬁgurations of perimeter firewalls and appliance firewalls. All organizations must decide for themselves whether to rely on those protections.

### What products are affected?

VMware vCenter Server and products that contain vCenter Server (vSphere and Cloud Foundation).

### What CVE numbers are involved in these disclosures?

CVE-2024-37079, CVE-2024-37080, CVE-2024-37081

### What is the severity of the vulnerabilities disclosed in VMSA-2024-0012?

VMware Security Advisories list the severities using version 3.1 of the Common Vulnerability Scoring Standard (CVSS). Please refer to the VMSA itself for the specific scores.

### Are there additional details on the vectors of the individual vulnerabilities?

VMware Security Advisories link to the FIRST CVSS v3.1 calculator, with the vectors pre-filled for the individual vulnerabilities. This information is found in the ‘References’ section of the advisory.

### Are the vulnerabilities disclosed being exploited “in the wild?”

VMware is not currently aware of exploitation “in the wild.” If this changes the VMSA and this document will be updated.

### Are there workarounds for these vulnerabilities?

Not as part of this advisory. There may be other mitigations and compensating controls available in your organization, depending on your security posture, defense-in-depth strategies, and conﬁgurations of perimeter firewalls and appliance firewalls. All organizations must decide for themselves whether to rely on those protections.

Many appliances, such as the vCenter Server Appliance (VCSA), have firewalling capabilities accessible through the Virtual Appliance Management Interface (VAMI). This firewall can be used to help restrict access and potentially help mitigate vulnerabilities.

### Do I have to patch vCenter Server?

vCenter Server **is affected** by this VMSA.

### Do I have to patch ESXi hosts?

ESXi is not affected by this VMSA.

### Will there be a patch for VMware Cloud Foundation?

Yes, there is an asynchronous patch for VMware Cloud Foundation. Please follow the instructions linked in the VMSA itself for patching.

### Are there any known patching issues when applying these updates?

There was an issue introduced in 7.0 U3q that impacts vCenter Server patching when custom ciphers are enabled. This issue will carry forward in the 7.0 U3r patch as well, though with a precheck that will catch this issue. There is a Knowledge Base article on this issue, "[An error occurred while starting service 'vpxd-svcs,' vCenter Server patching to 7.0 U3q fails due to upsupported TLS Ciphers in Envoy Configuration](https://knowledge.broadcom.com/external/article/369485)."

### What versions of vCenter Server are affected?

Affected products and product versions are listed in the advisory, as well as the product build numbers which contain the fixes. Please update to those or newer versions. Patch releases are cumulative and newer versions will contain all previous fixes.

### How do I check the build number of vCenter Server?

The build information is available in the Summary tab of the vSphere Client. Alternately it can be queried with PowerCLI. Once connected using Connect-VIServer, build information is available in the $global:DefaultVIServer.Build variable (there is also $global:DefaultVIServer.Version).

### If I update vCenter Server will it affect running workloads and virtual machines?

No. vCenter Server is the management interface to a vSphere cluster. You will lose the use of the vSphere Client briefly during the update, and other management methods will be similarly impacted, but virtual machine and container workloads will be unaffected.

### Will there be a patch to vSphere 6.5 or 6.7?

Products that are past their End of General Support dates are not evaluated as part of security advisories. If your organization has extended support please use those processes to request assistance.

### I am using a third-party solution such as HPE SimpliVity, Dell EMC VxRail, and so on. Is it safe for me to apply the update?

VMware is proud of the robust partner ecosystem and community built around our products, but we cannot speak to our partners’ solutions. Nor would they want us to.

Engineered and integrated solutions like HPE SimpliVity and Dell EMC VxRail control their patch levels and conﬁgurations as part of their qualiﬁcation and testing processes. Using security guidance that is not explicitly for that product and product version is never advised. If you use engineered and integrated solutions please contact those vendors directly for guidance.

### Are VMware Cloud and hosted products patched?

VMware delivers VMSA information as a message inside hosted, cloud, and software-as-a-service products where applicable. Please check the administrative consoles of those services for relevant messages about this VMSA. For questions about the service please follow the support processes for that service.

Changelog
---------

2023-06-17, 2130 PDT (-0700): Initial publication.

Disclaimer
----------

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided “AS IS.”  Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.