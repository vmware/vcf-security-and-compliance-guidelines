# VMSA-2024-0001: Questions & Answers | VMware
Introduction
------------

On January 16, 2024, VMware issued a critical security advisory, VMSA-2024-0001, which addresses security vulnerabilities discovered in all versions of VMware Aria Automation (formerly known as VMware vRealize Automation) prior to version 8.16.

The VMSA is the definitive source for information regarding affected products and versions, workarounds, and appropriate patches necessary for maintaining your organization's security. This document serves as a supplementary guide to the advisory, providing self-service information to assist you and your organization in determining an appropriate response.

Current Update
--------------

Updated at 0030 PST (-0800) on January 16, 2024.

Next Expected Update
--------------------

There is not a regular update schedule for this document.

Questions & Answers
-------------------

### Who does this affect?

This affects customers who have deployed VMware vRealize Automation or VMware Aria Automation using versions earlier than 8.16.

### When should I act?

In ITIL terms, this situation qualifies as an emergency change, necessitating prompt action from your organization. However, the appropriate security response varies depending on specific circumstances. It's important to consult with your organization's information security staff to decide the best course of action tailored to your organization's needs.

### How can I protect myself?

Install one of the patch versions specified in the VMware Security Advisory (VMSA).

There may be other mitigations and compensating controls that could be applicable within your organization, dependent on your security posture, defense-in-depth strategies, and the configurations of perimeter and appliance firewalls. Each organization must assess for themselves whether to rely on these protections and how to effectively configure these measures for their environment.

### Which products are affected?

VMware Aria Automation, formerly known as VMware vRealize Automation, is affected. This product may also be included in other software packages, such as VMware Cloud Foundation.

### What CVE numbers are associated with these disclosures?

The disclosure involves CVE-2023-34063.

### What is the severity of the vulnerabilities disclosed in VMSA-2024-0001?

VMware Security Advisories determine severities using version 3.1 of the Common Vulnerability Scoring Standard (CVSS). For specific scores, please refer to the VMSA itself.

### Are there more details on the vectors of the individual vulnerabilities?

Yes, VMware Security Advisories provide links to the FIRST CVSS v3.1 calculator, with vectors pre-filled for each individual vulnerability. You can find this information in the 'References' section of the advisory.

### Are the vulnerabilities disclosed being exploited “in the wild?”

As of now, VMware is not aware of any "in the wild" exploitation of these vulnerabilities. If this situation changes, both the VMSA and this document will be updated accordingly. For proactive alerts, please subscribe to the VMSA mailing list.

### Is it necessary to patch VMware vCenter Server?

No; vCenter Server is not affected by this VMSA.

### Is it necessary to patch VMware ESXi?

No; ESXi is not affected by this VMSA.

### Is it necessary to patch VMware Cloud Foundation?

Yes, if the products are deployed via the Aria Suite Lifecycle Manager (formerly known as the vRealize Lifecycle Manager), you should follow the patch instructions provided in the VMSA.

### Which versions of VMware vRealize Automation/Aria Automation are affected?

The advisory details the affected products and their specific versions, including the product build numbers that incorporate the fixes. Please update to these specified versions or newer ones.

### If I'm running an older version of VMware vRealize Automation/Aria Automation that isn’t listed, is it affected?

Products beyond their end-of-support dates are not assessed in security advisories. It is recommended to upgrade to version 8.16 or to a version that has a patch as specified in the VMSA.

### Which version of VMware Aria Automation should I move to?

VMware strongly recommends upgrading to VMware Aria Automation 8.16.

### Are there specific considerations or limitations to be aware of when applying these patches?

To apply the patch, your system must be running the latest version of the major release. For example, if your system is on Aria Automation 8.12.1, you must first update to 8.12.2 before applying the patch.

After patching, the only supported upgrade path is to move to version 8.16 or a newer version.

### Does the behavior of VMware Aria Automation change after the patch is applied?

Access to Automation Orchestrator is now governed by separate Orchestrator service roles. Please see the 8.16 release notes for more information.

### What are the implications of not upgrading to version 8.16, but choosing a different version instead?

If you choose a different version instead of upgrading to version 8.16, it is important to note that the only supported upgrade path after applying the patch is to version 8.16. VMware strongly recommends this version. If you upgrade to an intermediate version, the vulnerability will be reintroduced, requiring an additional round of patching.

### Is Aria Orchestrator affected by this vulnerability?

No, the vulnerability pertains to VMware Aria Automation. Therefore, no action is required for Aria Orchestrator.

### If I do not have Aria Orchestrator do I need to worry about following this VMSA?

No, if you are not using Aria Orchestrator workflows, you are not affected by this VMSA. However, VMware strongly recommends upgrading to unaffected versions and applying all security patches to mitigate future vulnerabilities in case the affected feature is used.

### Is Aria Automation Cloud affected?

No; remediation measures have already been implemented for systems and services managed by VMware, as part of the shared responsibility model.

### Are there workarounds for these vulnerabilities?

No, there are no workarounds for this advisory. However, there may be other mitigations and compensating controls that could be applicable within your organization, dependent on your security posture, defense-in-depth strategies, and the configurations of perimeter and appliance firewalls. Each organization must assess for themselves whether to rely on these protections and how to effectively configure these measures for their environment.

Changelog
---------

2024-01-16, 0030 PST (-0800): Initial publication.

Disclaimer
----------

This document is intended to provide general guidance for organizations that are considering VMware solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided “AS IS.”  VMware makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.