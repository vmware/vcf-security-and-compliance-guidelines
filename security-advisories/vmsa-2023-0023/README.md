# VMSA-2023-0023: Questions & Answers | VMware
Introduction
------------

On October 24, 2023 VMware released a Critical security advisory, VMSA-2023-0023, addressing security vulnerabilities found and resolved in VMware vCenter Server, which is present in VMware vSphere and Cloud Foundation products.

The VMSA will always be the source of truth for what products & versions are aﬀected, the workarounds, and proper patches to keep your organization secure. This document is a corollary to the advisory and includes self-service information to help you and your organization decide how to respond.

These vulnerabilities are memory management and corruption issues which can be used as a remote code execution attack against VMware vCenter Server services.

You are affected by this vulnerability if you are running any version of vSphere except the latest updates for vSphere 6.5, 6.7, 7.0, or 8.0. Please consult the VMSA itself for the definitive list of affected versions. If you have a question about whether you are affected it is likely that you are, and should take action immediately.

Current Update
--------------

Updated at 0800 PST (-0800) on January 19, 2024.

Next Expected Update
--------------------

There is not a regular update schedule for this document; will be updated as needed.

Questions & Answers
-------------------

### Who does this affect?

Customers who have deployed a product listed in the VMSA (one that includes VMware vCenter Server). Because it affects vCenter Server the scope is large.

If you fall under the" _you must patch or update your vCenter category_", please refer to the VMSA to find the patch respective to your current version. 

![image-20231025124848-2](https://images.core.vmware.com/sites/default/files/inline-images/image-20231025124848-2.png)

**You are affected by this vulnerability if you are running any version of vSphere except the latest updates for vSphere 6.5, 6.7, 7.0, or 8.0. Please consult the VMSA itself for the definitive list of affected versions. If you have a question about whether you are affected it is likely that you are, and should take action immediately.**

### When do I need to act?

In ITIL parlance this would be considered an emergency change, and your organization should consider acting quickly. However, all security response depends on context. Please consult with your organization’s information security staff to determine the right course of action for your organization.

### What should I do to protect myself?

To fully protect yourself and your organization, please install one of the patch versions listed in the VMware Security Advisory. Follow the VMware documentation for patching procedures and considerations when using vCenter Server High Availability (not vSphere High Availability).

There may be other mitigations available in your organization depending on your security posture, defense-in-depth strategies, and conﬁgurations of perimeter firewalls and appliance firewalls. All organizations must decide for themselves whether to rely on those protections.

### What products are affected?

VMware vCenter Server and any products that contain vCenter Server (vSphere and Cloud Foundation, among others).

### What CVE numbers are involved in these disclosures?

CVE-2023-34048 and CVE-2023-34056 for all versions except 8.0 U1d, which only resolves CVE-2023-34048.

### What is the severity of the vulnerabilities disclosed in VMSA-2023-0023?

9.8 and 4.3. VMware Security Advisories list the severities using version 3.1 of the Common Vulnerability Scoring Standard (CVSS).

### Are there additional details on the vectors of the individual vulnerabilities?

VMware Security Advisories link to the FIRST CVSS v3.1 calculator, with the vectors pre-filled for the individual vulnerabilities. This information is found in the ‘References’ section of the advisory.

### Are the vulnerabilities disclosed being exploited “in the wild?”

As of January 18, 2024 VMware is aware of exploitation “in the wild.” Please subscribe to the VMSA mailing list for proactive alerts.

### Do I have to patch vCenter Server?

Yes; vCenter Server is affected by this VMSA.

See "[Best Practices for Patching VMware vSphere](https://core.vmware.com/patch-vsphere-best-practices)" for guidance on patching vSphere components.

### Do I have to patch ESXi hosts?

No; ESXi is not affected by this VMSA.

### Will there be a patch for VMware Cloud Foundation?

Yes, there is an asynchronous patch for VMware Cloud Foundation 3.x, 4.x, and 5.x. Please follow the instructions linked in the VMSA itself for patching.

### What versions of vCenter Server are affected?

Affected products and product versions are listed in the advisory, as well as the product build numbers which contain the fixes. Please update to those or newer versions. Patch releases are cumulative and newer versions will contain all previous fixes.

### Are there workarounds for these vulnerabilities?

There are no workarounds for this advisory that remove the vulnerability.

There may be other possible mitigations and compensating controls available in your organization, depending on your security posture, defense-in-depth strategies, and conﬁgurations of perimeter firewalls and appliance firewalls. All organizations must decide for themselves whether to rely on those protections, and how to configure those protections effectively for your environment.

**VMware staff will always advise you to patch, as it is the only way to ensure the removal of the vulnerability. The decision to use other mitigations is something your organization must consider on its own. Similarly, configuration and validation of security controls, such as firewall rules, is an activity that is specific to your environment, and not something that VMware Global Support Services can assist with**. For assistance of that nature please contact your account team to enquire about VMware Professional Services.

### What network ports should be restricted as part of a mitigation?

VMware strongly recommends strict network perimeter access control to all management components and interfaces in vSphere and related components, such as storage and network components, as part of an overall effective security posture.

The specific network ports involved in this vulnerability are 2012/tcp, 2014/tcp, and 2020/tcp.

### What builds are affected by these issues? What version should I move to?

**You are affected by this vulnerability if you are running any version of vSphere except the very latest updates for vSphere 6.5, 6.7, 7.0, or 8.0 (listed in the VMSA). Please consult the VMSA itself for the definitive list of affected versions. If you have a question about whether you are affected it is likely that you are, and should take action immediately.**



* Path Number: 1
  * What You Are Running: Release
  *  : 6.5 U3u or below
  * You Should Move To...:  
  *  : 7.0 U3o
  * You Can Move To...:  
  * 6.5 U3v
* Path Number: Version
  * What You Are Running: 6.5.0.41000
  *  :  
  * You Should Move To...: 7.0.3.01700
  *  :  
  * You Can Move To...: 6.5.0.42000
* Path Number: Build Number
  * What You Are Running: 20510539
  *  :  
  * You Should Move To...: 22357613
  *  :  
  * You Can Move To...: 22499743
* Path Number: GA Date
  * What You Are Running: October 6, 2022
  *  :  
  * You Should Move To...: September 28, 2023
  *  :  
  * You Can Move To...: October 24, 2023
* Path Number:  
  * What You Are Running: 
  *  : 
  * You Should Move To...: 
  *  : 
  * You Can Move To...: 
* Path Number: 2
  * What You Are Running: Release
  *  : 6.7 U3s or below
  * You Should Move To...:  
  *  : 7.0 U3o
  * You Can Move To...:  
  * 6.7 U3t
  * 8.0 U1d
  * 8.0 U2
* Path Number: Version
  * What You Are Running: 6.7.0.54000
  *  :  
  * You Should Move To...: 7.0.3.01700
  *  :  
  * You Can Move To...: 6.7.0.55000
  * 8.0.1.00400
  * 8.0.2.00000
* Path Number: Build Number
  * What You Are Running: 20540798
  *  :  
  * You Should Move To...: 22357613
  *  :  
  * You Can Move To...: 22509723
  * 22368047
  * 22385739
* Path Number: GA Date
  * What You Are Running: October 6, 2022
  *  :  
  * You Should Move To...: September 28, 2023
  *  :  
  * You Can Move To...: October 24, 2023
  * October 24, 2023
  * September 21, 2023
* Path Number:  
  * What You Are Running: 
  *  : 
  * You Should Move To...: 
  *  : 
  * You Can Move To...: 
* Path Number: 3
  * What You Are Running: Release
  *  : 7.0 U3n or below
  * You Should Move To...:  
  *  : 7.0 U3o
  * You Can Move To...:  
  *  
  * 8.0 U1d
  * 8.0 U2
* Path Number: Version
  * What You Are Running: 7.0.3.01600
  *  :  
  * You Should Move To...: 7.0.3.01700
  *  :  
  * You Can Move To...:  
  * 8.0.1.00400
  * 8.0.2.00000
* Path Number: Build Number
  * What You Are Running: 21958406
  *  :  
  * You Should Move To...: 22357613
  *  :  
  * You Can Move To...:  
  * 22368047
  * 22385739
* Path Number: GA Date
  * What You Are Running: July 7, 2023
  *  :  
  * You Should Move To...: September 28, 2023
  *  :  
  * You Can Move To...:  
  * October 24, 2023
  * September 21, 2023
* Path Number:  
  * What You Are Running: 
  *  : 
  * You Should Move To...: 
  *  : 
  * You Can Move To...: 
* Path Number: 4
  * What You Are Running: Release
  *  : 8.0 U1c or below
  * You Should Move To...:  
  *  : 8.0 U1d
  * You Can Move To...:  
  *  
  *  
  * 8.0 U2
* Path Number: Version
  * What You Are Running: 8.0.1.00300
  *  :  
  * You Should Move To...: 8.0.1.00400
  *  :  
  * You Can Move To...:  
  *  
  * 8.0.2.00000
* Path Number: Build Number
  * What You Are Running: 22088981
  *  :  
  * You Should Move To...: 22368047
  *  :  
  * You Can Move To...:  
  *  
  * 22385739
* Path Number: GA Date
  * What You Are Running: July 27. 2023
  *  :  
  * You Should Move To...: October 24, 2023
  *  :  
  * You Can Move To...:  
  *  
  * September 21, 2023
* Path Number:  
  * What You Are Running: 
  *  : 
  * You Should Move To...: 
  *  : 
  * You Can Move To...: 
* Path Number: 5
  * What You Are Running: Release
  *  : 7.0 U3o 
  * You Should Move To...:  
  *  : No Action Required
  * You Can Move To...: 
* Path Number: Version
  * What You Are Running: 7.0.3.01700
  *  :  
  * You Should Move To...: 
  *  : 
  * You Can Move To...: 
* Path Number: Build Number
  * What You Are Running: 22357613
  *  :  
  * You Should Move To...: 
  *  : 
  * You Can Move To...: 
* Path Number: GA Date
  * What You Are Running: September 28, 2023
  *  :  
  * You Should Move To...: 
  *  : 
  * You Can Move To...: 
* Path Number:  
  * What You Are Running: 
  *  : 
  * You Should Move To...: 
  *  : 
  * You Can Move To...: 
* Path Number: 6
  * What You Are Running: Release
  *  : 8.0 U2
  * You Should Move To...:  
  *  : No Action Required
  * You Can Move To...: 
* Path Number: Version
  * What You Are Running: 8.0.2.00000
  *  :  
  * You Should Move To...: 
  *  : 
  * You Can Move To...: 
* Path Number: Build Number
  * What You Are Running: 22385739
  *  :  
  * You Should Move To...: 
  *  : 
  * You Can Move To...: 
* Path Number: GA Date
  * What You Are Running: September 21, 2023
  *  :  
  * You Should Move To...: 
  *  : 
  * You Can Move To...: 


The updates for vCenter Server 6.5 and 6.7 were tested against environments already running 6.5 Update 3 and 6.7 Update 3, respectively. VMware recommends that those deployments be brought to their respective Update 3 prior to applying this update.

The recommendation to move to 8.0 U1d is helpful for VMware Cloud Foundation 5.0 customers, as well as to decouple the upgrade process from security remediation work.

### How do I check the build number of vCenter Server?

The build information is available in the Summary tab of the vSphere Client. Alternately it can be queried with PowerCLI. Once connected using Connect-VIServer, build information is available in the $global:DefaultVIServer.Build variable (there is also $global:DefaultVIServer.Version).

### If I update vCenter Server will it affect running workloads and virtual machines?

No. vCenter Server is the management interface to a vSphere cluster. You will lose the use of the vSphere Client briefly during the update, and other management methods will be similarly impacted, but virtual machine and container workloads will be unaffected.

### Does this impact vSphere 6.x?

Yes.

### Will there be a patch to vCenter Server 6.5 or 6.7?

VMware feels strongly about helping protect customers. Though these products are past their End of General Support dates and nearing the end of their extended support/technical guidance phase, a patch has been developed and is available to all VMware customers.

### Is there any specific guidance for the vCenter Server 6.5 or 6.7 patch?

The updates for vSphere 6.5/6.7 that are part of this VMSA were tested against environments running VMware vSphere 6.5 Update 3 and VMware vSphere 6.7 Update 3, respectively.

VMware recommends that deployments not already at Update 3 be brought to their respective Update 3 prior to applying this update.

Given the upcoming end of the vSphere 6.5 and 6.7 product lifecycles, VMware strongly recommends upgrading to vSphere 7 or 8.

### If I apply the vCenter Server 6.5 or 6.7 patch can I receive support for it?

VMware will have heightened support for issues directly related to adoption of all security patches released for VMSA-2023-0023. Issues related to patch adoption will be addressed on a best effort basis until November 14, 2023, after which vSphere 6.5 and 6.7 move to the End of Support Life phase. After that date new support cases cannot be opened for vSphere 6.5 and 6.7.

Customers with Extended Support contracts can receive support for vSphere 6.5 and 6.7 through the end of their Extended Support contract, in accordance with the Support Lifecycle Policies found at [https://www.vmware.com/support/lifecycle-policies.html](https://www.vmware.com/support/lifecycle-policies.html) and [https://lifecycle.vmware.com/](https://lifecycle.vmware.com/).

VMware strongly recommends that customers run versions of products that are within the General Support phase of their support lifecycle, such as vSphere 7 and/or 8.

### Will there be a corresponding ESXi patch release for vSphere 6.5 and 6.7?

No.

### Can I use the vCenter Server VAMI to apply these updates?

Yes, the patch will be available through the standard update mechanisms on all vCenter Server versions listed in the VMSA.

See "[Best Practices for Patching VMware vSphere](https://core.vmware.com/patch-vsphere-best-practices)" for guidance on patching vSphere components.

### Does this impact versions of vSphere older than 6.5?

VMware only analyzes and publishes security advisories for products currently under active general support and strongly recommends that installations be kept current with supported versions.

VMware vSphere 6.5 and 6.7 were included in this advisory as an exception, as part of VMware’s commitment to customer security and resilience.

Versions of vSphere not listed in the VMSA have not been analyzed and should be assumed to be vulnerable, as with all software which is past the end of support.

### Do I have to update to vSphere 8 Update 2 to receive the patch?

No. While vSphere 8 Update 2 does contain the fix, there is a patch available to vSphere 8 Update 1 (8.0 U1d) that resolves this, decoupling the upgrade process from the security remediation work.

### Do I have to update to vSphere 7 Update 3 to receive the patch?

Yes. vSphere 7 Update 3 was released in January 2022 and is considered the best version of vSphere 7, intended for long-term stability and support. New security updates build from vSphere 7 Update 3.

### I am using a third-party solution such as HPE SimpliVity, Dell EMC VxRail, and so on. Is it safe for me to apply the update?

Engineered and integrated solutions like HPE SimpliVity and Dell EMC VxRail control their patch levels and conﬁgurations as part of their qualiﬁcation and testing processes. Using security guidance that is not explicitly for that product and product version is never advised. If you use engineered and integrated solutions please contact those vendors directly for guidance.

### Are VMware Cloud and hosted products patched?

VMware delivers VMSA information as a message inside hosted, cloud, and software-as-a-service products where applicable. In this case no action is necessary by customers for VMware-managed components. Please check the administrative consoles of those services for further relevant messages and details about this VMSA.

Additional questions about the service should be answered through the support processes for that service. Thank you.

Changelog
---------

2023-10-24, 1930 PDT (-0700): Initial publication.

2023-10-25, 11:50 PDT (-0700): Updates to improve clarity.

2023-10-31, 0930 PDT (-0700): Updates to the VMware Cloud messaging.

Disclaimer
----------

This document is intended to provide general guidance for organizations that are considering VMware solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided “AS IS.”  VMware makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.