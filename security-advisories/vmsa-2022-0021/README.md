# VMSA-2022-0021: Questions & Answers

> [!WARNING]
> This information is about an older security vulnerability and is not current. It is kept online for reference. Please review the [VMware Security Advisories web page](https://www.broadcom.com/support/vmware-security-advisories) for the latest information to protect yourself and your organizations. Thank you.

Introduction
------------

On August 2, 2022 VMware released a critical security advisory, VMSA-2022-0021, that addresses security vulnerabilities found and resolved in VMware’s Workspace ONE Access, VMware Identity Manager (vIDM), vRealize Lifecycle Manager, vRealize Automation, and VMware Cloud Foundation products. VMware Identity Manager is also an optional external component that can provide authentication and authorization for other products, such as NSX, vRealize Operations, vRealize Log Insight, and vRealize Network Insight.

[The VMSA](https://www.vmware.com/security/advisories/VMSA-2022-0021.html) will always be the source of truth for what products & versions are aﬀected, the workarounds, and proper patches to keep your organization secure. This document is a corollary to the advisory and includes self-service information to help you and your organization decide how to respond.

These vulnerabilities are authentication bypass, remote code execution, and privilege escalation vulnerabilities. An authentication bypass means that an attacker with network access to Workspace ONE Access, VMware Identity Manager, and vRealize Automation can obtain administrator access. Remote code execution (RCE) means that an attacker can trick the components into executing commands that aren’t authorized. Privilege escalation means that an attacker with local access can become root on the virtual appliance. It is extremely important that you quickly take steps to patch or mitigate these issues in on-premises deployments. If your organization uses ITIL methodologies for change management, this would be considered an “emergency” change. Information on patches and workarounds can be found in the VMware Security Advisory (link below).

Next Expected Update
--------------------

There is not a regular update schedule for this document. This list of questions will be updated if new questions arise; please check back before completing updates or mitigations.

Questions & Answers
-------------------

NOTE: Please use the index on the left side to navigate, as the Q&A you need most may be near the bottom of the document. New information added after the original publication date is added to the end of the list to preserve links to the subsections.

### Who is affected?

Customers who have deployed a product listed in the VMSA. Please note that this might include products and suites that oﬀer Workspace ONE Access or VMware Identity Manager (vIDM) components as an optional installation.

### When do I need to act?

This critical vulnerability **should be patched or mitigated immediately** per the instructions in VMSA.

Organizations that practice change management using the ITIL deﬁnitions of change types would consider this an “emergency change.” All environments are diﬀerent, have diﬀerent tolerance for risk, and have diﬀerent security controls and defense-in-depth to mitigate risk, so customers must make their own decisions on how to proceed. However, given the severity of the vulnerability, we strongly recommend immediate action.

### What should I do to protect myself?

To fully protect yourself and your organization, please install one of the patch versions listed in the VMware Security Advisory, or use the workarounds listed in the VMSA. These updates do not introduce new functionality or other changes beyond resolving these issues and should be a straightforward update in most environments.

There may be other protections available in your organization depending on your security posture, defense-in-depth strategies, and conﬁgurations of virtual machines. All organizations must decide for themselves whether to rely on those protections.

### Is this being exploited “in the wild?”

As of August 10, 2022 there is proof-of-concept exploit code available in the information security community.

### Can I just firewall the affected products instead of patching or using the workaround?

All organizations have diﬀerent environments and needs, and that type of context is important in security. Whether ﬁrewalls are an appropriate compensating control for this situation in your environment is for you and your information security staﬀ to assess.

### I already patched using the fixes in VMSA-2022-0014; do I have to patch this as well?

Yes. You will need to apply the updates in VMSA-2022-0021 to any affected software components in your environment to remove all known vulnerabilities.

### If I apply the patch in VMSA-2022-0021 will it also remove the vulnerabilities addressed in the previous VMSAs (VMSA-2022-0014 and VMSA-2022-0011)?

Yes. VMware product updates are cumulative for security. If you did not apply the updates from previous VMSAs, updating to the versions listed in this VMSA (VMSA-2022-0021) will also resolve all previously published vulnerabilities.

### Why is there another VMSA for these software components?

When a security researcher finds a vulnerability, it often draws the attention of other security researchers who bring different perspectives and experience to the research. VMware recognizes that patches are inconvenient for IT staff, but we balance that concern with a commitment to transparency, keeping our customers informed and ahead of potential attacks.

### What is in the patch released by VMware?

These updates do not introduce new functionality or other changes beyond resolving CVE-2022-31656, CVE-2022-31657, CVE-2022-31658, CVE-2022-31659, CVE-2022-31660, CVE-2022-31661, CVE-2022-31662, CVE-2022-31663, CVE-2022-31664, and CVE-2022-31665.

### If I have the workaround in place from VMSA-2022-0014 will that protect me here?

The workarounds for VMSA-2022-0014 also protect against the critical vulnerability in VMSA-2022-0021, but not the additional less-severe vulnerabilties that are disclosed in VMSA-2022-0021. We urge patching of the Workspace ONE Access/Identity Manager components instead of relying on workarounds.

### When I patch do I need to perform the workaround?

No. Patching fully resolves the issues disclosed in this VMSA.

### Are there any downsides to using the workaround?

The workaround only covers the critical vulnerability (CVE-2022-31656) and does not address the other issues. There are functional impacts, such as inventory sync failures and disablement of local users, if you use the workaround. Please review the workaround Knowledge Base article for more information.

The workaround will not change the version number of the product, and the presence of the workaround is not as easily verifiable to an auditor or security team as a change in the product version number, should you need to demonstrate that the issue is resolved in your environment. The workaround also uses protected troubleshooting and support interfaces such as SSH to interact with the appliances, which are best left disabled in most environments.

Both the new software update and the workaround have been fully tested by VMware and are supported, but from a risk management perspective the workaround is higher risk because it changes the configuration of the software, whereas the patch does not.

Workarounds do not remove the vulnerabilities from the environment, and almost always introduce additional complexities and technical debt that patching would not. These updates do not introduce new functionality or other changes beyond resolving these issues and should be a straightforward update in most environments.

While the decision to patch or use the workaround is yours, **VMware always strongly recommends patching as the simplest and most reliable way to resolve this type of issue**.

### If I wait to patch will the mitigations be present in future updates?

Yes, updates to products are always cumulative when it comes to security. Applying the latest releases of a product will also apply all earlier security updates.

### Is there a way to determine if the workaround has been applied?

The workaround will not update product versions or build numbers. Only patching will do that. To find if the workaround has been applied you can log into the Workspace One Access administration console to confirm that local user accounts are disabled.

### Is this a vulnerability in vSphere?

No, but please consult the VMSA for the list of affected products so you can confirm whether any of them are currently in use in your environment.

### Do I have to patch ESXi hosts?

ESXi is not affected by this VMSA.

### Will there be a patch for VMware Cloud Foundation?

Yes, there is an asynchronous patch for VMware Cloud Foundation. Please follow the instructions linked in the VMSA itself for patching.

### What are the CVE numbers involved in VMSA-2022-0021

CVE-2022-31656, CVE-2022-31657, CVE-2022-31658, CVE-2022-31659, CVE-2022-31660, CVE-2022-31661, CVE-2022-31662, CVE-2022-31663, CVE-2022-31664, CVE-2022-31665

### I have extended support on one or more of the aﬀected products. How can I get a patch for this?

Please follow the extended support process to request patches and other information.

### I am running a version of an affected product that is not listed. Does that mean it is not affected by this advisory?

VMware only analyzes and publishes security advisories for products currently under active general support and strongly recommends that installations be kept current with supported versions.

### I am using a third-party solution, like Dell EMC VxRail, HPE SimpliVity, and so on. Is it safe for me to apply either the workarounds or the patch?

VMware is proud of the robust partner ecosystem and community built around our products, but we cannot speak to our partners’ solutions. Nor would they want us to.

Engineered and integrated solutions like Dell EMC VxRail, HPE SimpliVity, and even VMware Cloud Foundation control their patch levels and conﬁgurations as part of their qualiﬁcation and testing processes. Using security guidance that is not explicitly for that product and product version is never advised. VMware covers VMware Cloud Foundation in our security advisory materials, but if you have additional engineered and integrated solutions in use, you should contact those vendors directly for guidance.

### I have feedback about the products and/or processes. How do I provide it to you?

VMware appreciates all feedback on our products and processes. Please contact your Account Executive, Solutions Engineer, or Technical Account Manager. They have processes for submitting feedback on your behalf.

Please help us help you – many features and improvements have been realized because of suggestions made by customers. If we can make life better for you, please tell us how.

### Are VMware Cloud and hosted Workspace ONE products patched?

VMware delivers VMSA information as a message inside hosted, cloud, and software-as-a-service products. We do it this way because hosted products are implementations of the products, and, as all of our on-premises customers know from experience, have different operational considerations than just a software release.

For example, and depending on the type of issue, some cloud deployments or services may not have ever been impacted, some may have been impacted and been remediated already, and some may need customer input or proactive notice for remediation. It is different for each environment and for each issue, and by sending messages to customers inside the administrative consoles of the services we can customize the message for each environment so our customers know where they stand.

Please check the administrative consoles of those services for relevant messages about this VMSA. For questions about the service please follow the support processes for that service. Thank you!

Change Log
----------

All times are in Pacific Daylight (-0700)

2022-08-02, 0700: Initial release.

2022-08-02, 1230: Updates to several questions to improve clarity and reduce confusion about the relationship between VMSA-2022-0014 and VMSA-2022-0021. Updated the question about cloud-hosted environments about where information can be found, and why that is done that way.

2022-08-10: 1200: Updated to reflect the availability of proof-of-concept exploit code.