# CVE-2023-20867 & VMSA-2023-0013: Questions & Answers
Introduction
------------

On June 13, 2023, VMware released VMSA-2023-0013, aligning with Mandiant's publication of a third post about their ongoing investigation into a state-sponsored cyberespionage group, which was initially reported in September 2022.

This document is meant to address customer questions and provide additional resources specific to VMware deployments.

Current Update
--------------

Updated at 0830 PDT (-0700) on June 14, 2023

Next Expected Update
--------------------

There is not a regular update schedule for this document.

Questions & Answers
-------------------

### What do I need to do to protect my environment?

All customers should update their VMware Tools and ensure that their vSphere environments are hardened using the [VMware Security Configuration & Hardening Guides](https://brcm.tech/vcf-scg).

### What CVEs are associated with these disclosures?

CVE-2023-20867

### What products are affected?

The CVE affects VMware Tools, which is found in VMware ESXi, Workstation, and Fusion.

Both VMware and Mandiant continue to emphasize how important it is for organizations to effectively strengthen and monitor their infrastructure to both deter and detect security breaches.

### Is this a Zero-Day?

No, this is not a zero-day vulnerability, as there is a fix available. A zero-day vulnerability is one that is previously unknown and has no patch, which is the context Mandiant refers to, but is not currently the case.

### This seems serious, why isn’t this a critical vulnerability?

Context is very important in security. The industry-standard method for assigning CVSS scores to CVEs is based on the context of the vulnerability itself. Because there are numerous additional security controls in vSphere to mitigate CVE-2023-20867, such as the need to be a privileged ESXi admin, the CVSS score is low.

In a particular situation, such as the one documented by Mandiant, the context changes. **_Those attackers used a variety of other methods to negate security controls in the environment and gain privileged access to the hosts prior to using the vulnerability in VMware Tools_**.

### How is this different than the previous Mandiant articles?

This new article is an extension of those articles, covering the same investigations. Customers who are doing threat hunting based on the information in those articles should continue to do so.

### Will there be a patch to vSphere 6.0, 6.5, or 6.7 to resolve this issue?

VMware Tools is released independently from VMware vSphere releases. See the question below to learn how to obtain independent VMware Tools updates for use with Update Manager on these versions, and prioritize upgrading to a supported version of vSphere.

### Will ESXi be updated with the latest version of VMware Tools?

When patches are released for ESXi, the current version of VMware Tools is included. In the meantime:

1.  VMware vSphere Lifecycle Manager allows customers to import the “VMware Tools Async Release” into their cluster images, permitting customers to control the Tools versions stored on, and offered to guests by, ESXi.
2.  VMware Tools can be downloaded in VIB format, to be imported into legacy Baselines.

You can find VMware Tools installers and VIBs as [downloads in Customer Connect](https://customerconnect.vmware.com/downloads/info/slug/datacenter_cloud_infrastructure/vmware_tools/12_x).

### How do I update my Linux virtual machines?

Linux distributions use open-vm-tools; please use the patching processes available inside your guest OS. VMware has updated the [upstream GitHub repository for open-vm-tools](https://github.com/vmware/open-vm-tools) but it will require those vendors to update their software, too.

### Is there a workaround available for this issue?

Organizations concerned specifically with CVE-2023-20867 should update VMware Tools. Given the context of the Mandiant research we suggest customers prioritize auditing and remediating their environments against the [VMware Security Configuration & Hardening Guides](https://brcm.tech/vcf-scg). This guidance contains additional steps to harden environments that are effective against the tactics outlined in the Mandiant report, such as disabling VMware Tools guest operations, disabling shell access for vpxuser, and more.

### Can we just remove VMware Tools?

Removing VMware Tools would also remove important drivers, guest customization capabilities, and other functionality that is important to IT operations and workflows. VMware does not recommend it.

### Where does VMware Tools log authentication attempts?

By default, VMware Tools logs authentication attempts to its vmsvc.data location in tools.conf, which is “%windir%/temp/vmware-<servicename>.log” on Microsoft Windows and “/var/log/vmware-<servicename>-<username>.log” on Linux guest OSes. Once updated, VMware Tools will generate an “Unsupported credentialType” message to that log.

Logging in VMware Tools is very customizable. Organizations should review the options available [in the sample tools.conf present in the open-vm-tools GitHub repository](https://github.com/vmware/open-vm-tools/blob/master/open-vm-tools/tools.conf) and consider forwarding logs to syslog (which also forwards to the Windows Event Log on those platforms).

### Can I remove shell access for vpxuser?

The vpxuser account is created by vCenter Server when the host is first attached, and is subseqently used for privileged authentication to ESXi. While the password is automatically rotated by vCenter Server on an interval governed by VirtualCenter.VimPasswordExpirationInDays, it also has shell access which can be deactivated in ESXi 8 to reduce attack surface.

Users who do not have shell access cannot reconfigure other users' shell access, no matter their privilege levels. Since vCenter Server connects as vpxuser, once vpxuser has been stripped of shell access it will no longer be able to change those user settings for others. Further reconfiguration will need to happen on a host-by-host basis using an account that is authorized.

For security, ESXi 8 no longer supports traditional password or account recovery operations, such as booting from media or changing init to a shell on boot.

### Does this affect the vmxnet3 or pvscsi paravirtualized drivers?

No. VMware continues to recommend the use of the paravirtualized network and storage drivers. The vmxnet3 and pvscsi drivers are now included in native installation media for recent releases of Microsoft Windows, and available as part of Windows Update. Linux distributions have had core portions of VMware Tools available as part of the Linux kernel since 2012.

### What is VMCI used for? Can or should I disable it?

VMCI is the Virtual Machine Communication Interface and it provides efficient communication between the host and the guest OS. It has been present in ESXi for decades, but ESXi 5.1 and newer limited it to host communications only (versus VM to VM). It is used by VMware Tools, as well as other functions such as guest introspection, the Guest Data Publisher, vSAN File Services, NSX, Aria Operations, container runtimes, and more. VMware does not recommend you disable it.

### Does VMCI allow virtual machines to communicate with each other?

VM-to-VM communications through VMCI were removed in ESXi 5.1.

Changelog
---------

2023-06-13, 0900 PDT (-0700): Initial publication.

2023-06-13: 1430 PDT (-0700): Corrected a link.

2023-06-14: 0830 PDT (-0700): Clarified what a zero-day vulnerability means.

Disclaimer
----------

This document is intended to provide general guidance for organizations that are considering VMware solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided “AS IS.”  VMware makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.