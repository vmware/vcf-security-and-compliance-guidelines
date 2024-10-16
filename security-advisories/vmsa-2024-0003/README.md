# VMSA-2024-0003: Questions & Answers | VMware
Introduction
------------

On February 20, 2024, Broadcom issued a critical security advisory, VMSA-2024-0003, which addresses security vulnerabilities in the VMware Enhanced Authentication Plugin (EAP).

The EAP is an additional feature that can be installed on client workstations to allow seamless login to vSphere's management interfaces and tools. It's important to note that this component is not included by default and is not a part of vCenter Server, ESXi, or Cloud Foundation.

The VMSA is the definitive source for information regarding affected products and versions, workarounds, and appropriate patches necessary for maintaining your organization's security. This document serves as a supplementary guide to the advisory, providing self-service information to assist you and your organization in determining an appropriate response.

Current Update
--------------

Updated at 1430 PST (-0800) on February 22, 2024.

Next Expected Update
--------------------

There is not a regular update schedule for this document.

Questions & Answers
-------------------

### Who does this affect?

This issue impacts users who have added the VMware Enhanced Authentication Plugin (EAP) to Microsoft Windows client systems used to connect to VMware vSphere via the vSphere Client.

It's important to note that the EAP doesn't come pre-installed. It must be manually installed on each client workstation.

### When should I act?

In ITIL terms, this situation qualifies as an emergency change, necessitating prompt action from your organization. However, the appropriate security response varies depending on specific circumstances. It's important to consult with your organization's information security staff to decide the best course of action tailored to your organization's needs.

### How can I protect myself?

You can protect yourself and your organization by uninstalling the VMware Enhanced Authentication Plugin.

### Which products are affected?

The VMware Enhanced Authentication Plugin is affected.

### What CVE numbers are associated with these disclosures?

The disclosure involves CVE-2024-22245 and CVE-2024-22250.

### What is the severity of the vulnerabilities disclosed in this VMSA?

VMware Security Advisories determine severities using version 3.1 of the Common Vulnerability Scoring Standard (CVSS). For specific scores, please refer to the VMSA itself.

### Are there more details on the vectors of the individual vulnerabilities?

Yes, VMware Security Advisories provide links to the FIRST CVSS v3.1 calculator, with vectors pre-filled for each individual vulnerability. You can find this information in the 'References' section of the advisory.

### Are the vulnerabilities disclosed being exploited “in the wild?”

As of now, VMware is not aware of any "in the wild" exploitation of these vulnerabilities. If this situation changes, both the VMSA and this document will be updated accordingly. For proactive alerts, please subscribe to the VMSA mailing list.

### Where would this software be found in my environment?

The Enhanced Authentication Plugin (EAP) is an extra software package that doesn't come pre-installed. Administrators need to install it on client computers used for administration to allow direct login when using the VMware vSphere Client through a web browser.

The EAP is not a plugin for vCenter Server, ESXi, or Cloud Foundation. It is a client plugin.

### How do I remove this software?

The Enhanced Authentication Plugin can be removed from client systems using the client operating system’s method of uninstalling software (Add/Remove Programs on a Microsoft Windows client, for example).

### Is it necessary to patch VMware vCenter Server?

No; vCenter Server is not affected by this VMSA.

### Is it necessary to patch VMware ESXi?

No; ESXi is not affected by this VMSA.

### Is it necessary to patch VMware Cloud Foundation?

No; VMware Cloud Foundation is not affected by this VMSA.

### Which patch for vCenter Server resolves this issue?

There is not a patch for this issue. Please uninstall the plugin.

### Why is there not a patch for this software?

The Enhanced Authentication Plugin (EAP) has been deprecated since the General Availability of vSphere 7.0. To use the EAP, organizations would have to bypass important security features in their modern web browsers, which is not advisable. Additionally, the approach to cybersecurity has evolved with the increase in attacks and the adoption of zero-trust security models, which encourage more proactive re-verification of user credentials.

Given this context it has been decided to discontinue the availability of the software.

### How will I authenticate to the vSphere Client?

VMware vSphere 8 supports a range of authentication methods, including connections to Active Directory over LDAPS, Microsoft Active Directory Federation Services (ADFS), Okta, and Microsoft Entra ID (formerly Azure AD). We recommend configuring one of these sources.

Integrated Windows Authentication and direct Smart Card support are also deprecated but continue to be supported through the life of vSphere 8. Access to vSphere with those mechanisms can also be configured through Microsoft ADFS.

### The vSphere Client web page still has a link to the plugin.

The link from the vSphere Client primary login page will be removed in a future release.

### Are there workarounds for these vulnerabilities?

There may be mitigations and compensating controls that could be applicable within your organization, dependent on your security posture, defense-in-depth strategies, and the configurations of perimeter and appliance firewalls. Each organization must assess for themselves whether to rely on these protections and how to effectively configure these measures for their environment.

One approach to disable this authentication type directly on vCenter Server is to issue the following command:

sso-config.sh -set\_authn\_policy -winAuthn false -t vsphere.local

substituting your vSphere SSO domain for vsphere.local if applicable.

As with all changes to IT systems please use care and maintain a current backup of your vCenter Server.

Changelog
---------

2024-02-20, 0830 PST (-0800): Initial publication.

2024-02-22, 1430 PST (-0800): Updated the workarounds to indicate the use of sso-admin.sh.

Disclaimer
----------

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided “AS IS.”  Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.