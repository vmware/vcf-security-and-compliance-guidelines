# VMSA-2022-0020: Questions & Answers

> [!WARNING]
> This information is about an older security vulnerability and is not current. It is kept online for reference. Please review the [VMware Security Advisories web page](https://www.broadcom.com/support/vmware-security-advisories) for the latest information to protect yourself and your organizations. Thank you.

Introduction
------------

On July 12, 2022, several CPU manufacturers, along with security researchers, announced security advisories addressing side-channel vulnerabilities in CPU hardware. VMware has issued a VMware Security Advisory (VMSA) covering these issues as they affect VMware software and customers.

These issues are vulnerabilities in CPU hardware and not with VMware software. However, VMware can use the flexibility of the vSphere platforms to help affected customers mitigate the issues. Those mitigations are what we detail in the VMSA and in this list of questions and answers.

Next Expected Update
--------------------

There is not a regular update schedule for this document. This list of questions will be updated if new questions arise; please check back before completing updates or mitigations.

Questions & Answers
-------------------

NOTE: Please use the index on the left side to navigate, as the Q&A you need most may be near the bottom of the document. New information added after the original publication date is added to the end of the list to preserve links to the subsections.

### Who is affected?

Organizations running VMware vSphere on AMD- or Intel-based server platforms.

### When do I need to act?

VMware has scored this issue as CVSS 5.6, or “Moderate.” To exploit this vulnerability, a malicious actor will need administrator or root access to a virtual machine running on ESXi (which would be a considerable security issue on its own). Your organization should assess the impact of this vulnerability in the context of your own environment and decide based on your own tolerance for risk.

### What should I do to protect myself?

Put simply: patch. These updates to ESXi introduce the recommended mitigations from Intel & AMD, and no further work is needed once the host is restarted.

### Do these issues have another name?

Security researchers have named these attacks “RetBleed.” AMD refers to these as “Branch Type Confusion” vulnerabilities. Intel has dubbed them “Return-Stack-Buffer-Underflow” vulnerabilities.

### Why is the VMware classification of this issue different than Intel’s?

AMD and Intel scored their variants of these issues differently based on their own analysis. VMware analyzes security issues based on the impact on our software products, so our scores may vary from other vendors’ assessments.

### What is in the patch released by VMware?

Please refer to the release notes for information about the patch beyond the mitigations for CVE-2022-23816, CVE-2022-23825, CVE-2022-28693, and CVE-2022-29901.

### When I patch do I need to enable the mitigation?

The mitigation is on by default and does not need further configuration.

### What about other CVEs that were disclosed?

VMware Security Advisories (VMSAs) only cover issues relevant to VMware products. Other vulnerabilities disclosed by hardware vendors were evaluated and found to not impact VMware software.

### Do Side-Channel Aware Schedulers mitigate these issues?

No, the VMware Side-Channel Aware Schedulers, SCAv1 and SCAv2, do not mitigate these issues.

### Can I just firewall the affected products instead of patching or using the workaround?

Hardware/CPU vulnerabilities are not subject to firewalls and other network-based controls. All organizations have diﬀerent environments, and whether there are system designs or other compensating controls available in your environment is best determined by you and your information security staﬀ.

### If I wait to patch will the mitigations be present in future updates to vSphere?

Yes, updates to products are always cumulative when it comes to security. Applying the latest updates will also apply all earlier security updates.

### Does this impact vSphere 6.0 or another earlier version of vSphere?

Please follow the extended support process to request patches and other information for products past the end of their general support periods.

### Are there any downsides or performance implications to applying these mitigations?

There are no meaningful performance impacts from these ESXi patches, based on VMware testing. The mitigation in ESXi controls how the virtual machine runtime environment is allowed to talk to ESXi, which is communication outside of how the workload and guest OS are executed and uses well-tested mechanisms already present -- and highly optimized -- in vSphere.

Other operating systems and environments may have different outcomes and performance impacts when using their vendor's published remediation strategies. Context is always important. News reports that suggest there are significant performance impacts may actually be summarizing the historical and worst-case impacts for mitigating speculative execution attacks, versus what your environment will actually experience after applying these updates. For vSphere, there are no meaningful performance impacts to workloads from the application of these updates to ESXi.

Because patching vSphere can be a granular, per-host activity, environments that monitor workload performance can employ a rolling patch strategy with pauses to assess performance impact, using vMotion and/or DRS groups and rules to place workloads on systems with the mitigations in place. For support and operational reasons VMware does not recommend having vSphere clusters at different patch levels for an extended period of time.

### Is this a vulnerability in vSphere?

No, this is a vulnerability in computing hardware.

### Do I have to patch ESXi hosts?

This advisory is for ESXi hosts and will involve patching and restarting them. VMware always recommends applying the latest updates to installed products and system firmware as an essential part of defense-in-depth.

VMSA-2022-0018, also released on July 12, 2022, is an advisory for vCenter Server. It is always recommended that vCenter Server be brought to current patch levels prior to applying current ESXi updates. See “[Tips for Patching VMware vSphere](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/security-design/Best-Practices-for-Patching-vSphere.MD)” for more information about techniques for ensuring patching success.

### If I apply these ESXi updates, do I also need to update my system firmware?

System firmware updates from hardware vendors also include updates to BIOS, management engine, and other system components outside the scope of ESXi updates. It is important to keep system firmware updated to remove attack vectors in those components, too.

vSphere Lifecycle Manager, part of vSphere 7 and newer, includes the ability to connect to Hardware Support Manager components in order to update and manage system firmware and hardware configurations from inside vSphere itself. For more information refer to the documentation or ask your account team, Technical Account Manager, or Customer Success agent.

VMware Cloud customers have their hardware firmware managed by VMware as part of the service.

### Will there be a patch for VMware Cloud Foundation?

Yes, there is an asynchronous patch for VMware Cloud Foundation. Please follow the instructions linked in the VMSA itself for patching.

### What are the CVE numbers involved in VMSA-2022-0020?

CVE-2022-23816, CVE-2022-23825, CVE-2022-28693, CVE-2022-29901

### I am using a third-party solution, like Dell EMC VxRail, HPE SimpliVity, and so on. Is it safe for me to apply either the workarounds or the patch?

VMware is proud of the robust partner ecosystem and community built around our products, but we cannot speak to our partners’ solutions. Nor would they want us to.

Engineered and integrated solutions like Dell EMC VxRail, HPE SimpliVity, and even VMware Cloud Foundation control their patch levels and conﬁgurations as part of their qualiﬁcation and testing processes. Using security guidance that is not explicitly for that product and product version is never advised. VMware covers VMware Cloud Foundation in our security advisory materials, but if you have additional engineered and integrated solutions in use, you should contact those vendors directly for guidance.

### I have feedback about the products and/or processes. How do I provide it to you?

VMware appreciates all feedback on our products and processes. Please contact your Account Executive, Solutions Engineer, or Technical Account Manager. They have processes for submitting feedback on your behalf.

Please help us help you – many features and improvements have been realized because of suggestions made by customers. If we can make life better for you, please tell us how.

### Are VMware Cloud and other hosted products patched?

VMware delivers information in-product for vulnerabilities disclosed in VMware Security Advisories that may be relevant to the service. Remediations for these issues inside VMware Cloud should be pursued with VMware Cloud support staff, as with all updates and upgrades.

VMware Cloud delivers environments where the underlying hardware is not shared, which positively affects the risk profile for most customers when it comes to hardware vulnerabilities.

Change Log
----------

All times are in Pacific Daylight (-0700)

2022-07-12, 1000: Initial release.