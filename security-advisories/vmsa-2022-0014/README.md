# VMSA-2022-0014: Questions & Answers | VMware
Introduction
------------

On May 18, 2022 VMware released a critical security advisory, VMSA-2022-0014, that addresses security vulnerabilities found and resolved in VMware’s Workspace ONE Access, VMware Identity Manager (vIDM), vRealize Lifecycle Manager, vRealize Automation, and VMware Cloud Foundation products. VMware Identity Manager is also an optional external component that can provide authentication and authorization for other products, such as NSX, vRealize Operations, vRealize Log Insight, and vRealize Network Insight.

The VMSA will always be the source of truth for what products & versions are aﬀected, the workarounds, and proper patches to keep your organization secure. This document is a corollary to the advisory and includes self-service information to help you and your organization decide how to respond.

Next Expected Update
--------------------

There will not be a regular update schedule for this document. The list of questions will be updated if new questions arise; please check back before completing your updates or mitigations.

Resources
---------

Links to the different resources available:

*   [VMware Security Advisory VMSA-2022-0014](https://www.vmware.com/security/advisories/VMSA-2022-0014.html) (descriptions of the issues and workarounds)
*   [Frequently Asked Questions for VMSA-2022-0014](https://via.vmw.com/vmsa-2022-0014-qna) (this document)
    
*   [VMSA-2022-0014: What You Need to Know](http://via.vmw.com/vmsa-2022-0014-blog) (blog post covering this advisory)
    
*   [Tips for Patching VMware vSphere](https://core.vmware.com/tips-patching-vmware-vsphere) (practical advice for ensuring patching success, and many ideas here apply to other components as well)
    
*   [VMware Ransomware Resource Center](https://core.vmware.com/ransomware) (discussion around tactics to help prevent, deter, and recover from attacks)
    
*   [VMware Ports & Protocols Firewalling Guidance](https://ports.vmware.com/) (ports.vmware.com)
    

Questions & Answers
-------------------

NOTE: Please use the index on the left side to navigate, as the Q&A you need most may be near the bottom of the document. New information added after the original publish date is added to the end of the list in order to preserve links to the subsections.

### Who is affected?

Customers who have deployed a product listed in the VMSA. Please note that this might include products and suites that oﬀer VMware Identity Manager (vIDM) components as an optional installation.

### When do I need to act?

This critical vulnerability should be patched or mitigated immediately per the instructions in VMSA-2022-0014. The ramiﬁcations of this vulnerability are serious.

Organizations that practice change management using the ITIL deﬁnitions of change types would consider this an “emergency change.” All environments are diﬀerent, have diﬀerent tolerance for risk, and have diﬀerent security controls and defense-in-depth to mitigate risk, so customers must make their own decisions on how to proceed. However, given the severity of the vulnerability, we strongly recommend immediate action.

### What should I do to protect myself?

To fully protect yourself and your organization, please install one of the patch versions listed in the VMware Security Advisory, or use the workarounds listed in the VMSA.

There may be other protections available in your organization, depending on your security posture, defense-in-depth strategies, and conﬁgurations of virtual machines. All organizations must decide for themselves whether to rely on those protections.

### Can I just firewall the affected products instead of patching or using the workaround?

All organizations have diﬀerent environments and needs, and that type of context is important in security. Whether ﬁrewalls are an appropriate compensating control for this situation in your environment is for you and your information security staﬀ to assess.

### I already patched using the fixes in VMSA-2022-0011; do I have to patch this as well?

VMSA-2022-0011 (issued in April 2022) and VMSA-2022-0014 (issued in May 2022) address different vulnerabilities. You will need to apply the updates in VMSA-2022-0014 to any affected software components in your environment to remove these additional vulnerabilities.

### If I apply the patch in this VMSA (2022-0014), will it also remove the vulnerabilities addressed in the April VMSA-2022-0011?

Yes. VMware product updates are cumulative for security. If you did not apply the updates from VMSA-2022-0011 in April, updating to the versions listed in this VMSA (VMSA-2022-0014) will also resolve all previously published vulnerabilities.

### Why is there a second VMSA for these software components?

When a security researcher finds a vulnerability it often draws the attention of other security researchers, who bring different perspectives and experience to the research. VMware recognizes that additional patches are inconvenient for IT staff, but we balance that concern with a commitment to transparency, keeping our customers informed and ahead of potential attacks.

### I have extended support on one or more of the aﬀected products. How can I get a patch for this?

Please follow the extended support process to request patches and other information.

### Are there any downsides to using the workaround?

The workaround will make admins unable to log into the Workspace ONE Access console using the local admin account, which may impact your organization's operations.

The only way to remove the vulnerabilities from your environment is to apply the patches provided in VMSA-2022-0014. Workarounds, while convenient, do not remove the vulnerabilities, and may introduce additional complexities that patching would not.

While the decision to patch or use the workaround is yours, **VMware always strongly recommends patching as the simplest and most reliable way to resolve this type of issue**. 

### Is this a vulnerability in vSphere?

No, but please consult VMSA-2022-0014 for the list of affected products so you can confirm whether any of them are currently in use in your environment.

### Do I have to patch ESXi hosts?

ESXi is not affected by this VMSA.

### Will there be a patch for VMware Cloud Foundation?

Yes. Please follow the instructions linked in the VMSA itself for patching and/or a workaround.

### What are the CVE numbers involved in VMSA-2022-0014?

CVE-2022-22972, CVE-2022-22973

### I am using a third-party solution, like Dell EMC VxRail, HPE SimpliVity, and so on. Is it safe for me to apply either the workarounds or the patch?

VMware is proud of the robust partner ecosystem and community built around our products, but we cannot speak to our partners’ solutions. Nor would they want us to.

Engineered and integrated solutions like Dell EMC VxRail, HPE SimpliVity, and even VMware Cloud Foundation control their patch levels and conﬁgurations as part of their qualiﬁcation and testing processes. Using security guidance that is not explicitly for that product and product version is never advised. VMware covers VMware Cloud Foundation in our security advisory materials, but if you have additional engineered and integrated solutions in use, you should contact those vendors directly for guidance.

### I have feedback about the products and/or processes. How do I provide it to you?

VMware appreciates any and all feedback on our products and processes. Please contact your Account Executive, Solutions Engineer, or Technical Account Manager. They have processes for submitting feedback on your behalf.

Please help us help you – many features and improvements have been realized because of suggestions made by customers. If we can make life better for you please tell us how.

### Is VMware doing anything about these security issues?

Our product teams always investigate the full impact of a vulnerability on both our products and our environment in order to protect our customers, partners and stakeholders.

### Are Connectors for Workspace ONE Access or vIDM affected?

No, the issue does not affect Workspace ONE Access or VMware Identity Manager connectors. Please consult the VMSA for the list of components that are affected.

### Is there a way to determine if the workaround has been applied?

The workaround will not update product versions or build numbers. Only patching will do that. To determine if the workaround has been applied you can log into the Workspace One Access administration console to confirm that the local administrator user account is disabled.

### Are cloud services and hosted products patched?

For Cloud instances of Workspace ONE Access (SaaS), VMware provides information in-product for vulnerabilities disclosed in VMware Security Advisories that may be relevant to the service. Please log in to the Workspace ONE Access admin console to review available notifications.

Change Log
----------

All times are in Pacific Daylight (-0700)

2022-05-18, 0800: Initial release.

2022-05-18, 1000: Added Q&A about Connectors and determining the workaround status, as well as an update to the effects of the workaround.

2022-05-19, 1200: Corrected 2021-0014 to 2022-0014.

2022-05-19: 1300: Added Q&A about cloud services status.