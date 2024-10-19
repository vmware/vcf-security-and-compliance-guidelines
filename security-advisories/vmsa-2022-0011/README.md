# VMSA-2022-0011: Questions & Answers
Introduction
------------

On April 6, 2022 VMware released VMSA-2022-0011, a critical advisory addressing security vulnerabilities found and resolved in VMware’s Workspace ONE Access, VMware Identity Manager (vIDM), vRealize Lifecycle Manager, vRealize Automation, and VMware Cloud Foundation products. VMware Identity Manager is also an optional external component that can provide authentication and authorization for other products, such as NSX, vRealize Operations, vRealize Log Insight, and vRealize Network Insight. The VMSA will always be the source of truth for what products & versions are affected, the workarounds, and appropriate patches. This document is a corollary to that advisory and contains resources and numerous questions & answers that have been asked regarding this issue in an effort to communicate new information, reduce the need for support calls, and help keep organizations secure.

Next Expected Update
--------------------

There will not be a regular update schedule for this document.

Questions & Answers
-------------------

We add new questions and answers to the end of this document to preserve links into the subsections here. Please use the index on the left side to scan the questions -- the question you have might be near the end!

### Who is affected?

Customers who have deployed a product listed in the VMSA. Please note that this might include product & suites that offer VMware Identity Manager (vIDM) components as an optional installation.

### When do I need to act?

This critical vulnerability should be patched or mitigated immediately per the instructions in VMSA-2021-0011. The ramifications of this vulnerability are serious.

Organizations that practice change management using the ITIL definitions of change types would consider this an “emergency change.” All environments are different, have different tolerance for risk, and have different security controls and defense-in-depth to mitigate risk, so customers must make their own decisions on how to proceed. However, given the severity of the vulnerability, we strongly recommend immediate action. 

### What should I do to protect myself?

To fully protect yourself and your organization please install one of the patch versions listed in the VMware Security Advisory, or use the workarounds listed in the VMSA.

There may be other protections available in your organization, depending on your security posture, defense-in-depth strategies, and configurations of virtual machines. All organizations must decide for themselves whether to rely on those protections.

### Can I just firewall the affected products instead of patching or using the workaround?

All organizations have different environments and needs. Whether firewalls are appropriate compensating controls in your environment for this particular situation is for customers and their information security staff to assess.

### Is this being exploited "in the wild?"

Yes. VMware has confirmed that exploitation of CVE-2022-22954 has occurred in the wild.

### How were the issues discovered?

As specified in our security advisory: 

"VMware would like to thank Steven Seeley (mr\_me) of Qihoo 360 Vulnerability Research Institute for reporting this issue to us."

### Is VMware Cloud on AWS affected?

No.

### Are hosted VMware Workspace ONE services affected?

All issues related to VMSA-2022-0011 have been resolved in hosted Workspace ONE services via code deployment.

### Are Carbon Black Cloud services affected?

No.

### It looks like VMware did maintenance on cloud services. How can I see the status of those services and upcoming maintenance activities?

[https://status.vmware-services.io/](https://status.vmware-services.io/) is the status dashboard for VMware Cloud on AWS, which also encompasses many other cloud-based services.

[https://status.workspaceone.com/](https://status.workspaceone.com/) is the status dashboard for VMware Workspace ONE.

[https://status.carbonblack.com/](https://status.carbonblack.com/) is the status dashboard for VMware Carbon Black tools & services.

### I have extended support on an affected product. How can I get a patch for this?

Please follow the extended support process to request patches and other information.

### Are there any downsides to using the workaround?

The only way to remove the vulnerabilities from your environment is to apply patches provided in VMSA-2021-0011. Workarounds, while convenient, do not remove the vulnerabilities, and may introduce additional complexities that patching would not.

While the decision to patch or use the workaround is yours, VMware always strongly recommends patching as the simplest and most reliable way to resolve this issue.

### Is this a vulnerability in vSphere?

No, but please consult VMSA-2022-0011 for the list of affected products so you can confirm whether any of them are currently in use in your environment.

### Do I have to patch ESXi hosts?

ESXi is not affected by this VMSA.

### Will there be a patch for VMware Cloud Foundation?

Yes. Please follow the instructions linked in the VMSA itself for patching and/or a workaround.

### What are the CVE numbers involved in VMSA-2022-0011?

CVE-2022-22954, CVE-2022-22955, CVE-2022-22956, CVE-2022-22957, CVE-2022-22958, CVE-2022-22959, CVE-2022-22960, CVE-2022-22961

### I am using a third-party solution, like Dell EMC VxRail, HPE SimpliVity, and so on. Is it safe for me to apply either the workarounds or the patch?

VMware is proud of the robust partner ecosystem and community built around our products, but we cannot speak to our partners’ solutions. Nor would they want us to.

Engineered and integrated solutions like Dell EMC VxRail, HPE SimpliVity, and even VMware Cloud Foundation control their patch levels and configurations as part of their qualification and testing processes. Using security guidance that is not explicitly for that product and product version is never advised. VMware covers VMware Cloud Foundation in our security advisory materials, but if you have additional engineered and integrated solutions in play, you should contact those vendors directly for guidance.

### I have feedback about the products and/or processes. How do I provide it to you?

VMware appreciates any and all feedback on our products and processes. Please contact your Account Executive, Solutions Engineer, or Technical Account Manager. They have processes for submitting feedback on your behalf.

Please help us help you – many features and improvements have been realized because of suggestions made by customers. If we can make life better for you please tell us how.

### Is VMware doing anything about these security issues?

Our product teams always investigate the full impact of a vulnerability on both our products and our environment in order to protect our customers, partners and stakeholders.

### Is this related to the Spring4Shell vulnerabilities?

No. Those are covered exclusively in [VMSA-2022-0010](https://www.vmware.com/security/advisories/VMSA-2022-0010.html).

Change Log
----------

2022-04-12, 0745: Updated the answer to "is this being used in the wild?"

2022-04-06, 1023: Updated the "Will there be a patch for VMware Cloud Foundation?" answer to refer to the VMSA itself.

2022-04-06: 0800: Initial release.