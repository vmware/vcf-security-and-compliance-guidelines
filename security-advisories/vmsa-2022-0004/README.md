# VMSA-2022-0004: Questions & Answers
Introduction
------------

VMware has published [VMSA-2022-0004](https://www.vmware.com/security/advisories/VMSA-2022-0004.html) that addresses security vulnerabilities found & resolved in VMware ESXi, VMware Workstation, VMware Fusion, and VMware Cloud Foundation products. The VMSA will always be the source of truth for what products & versions are affected, the workarounds, and appropriate patches. This document is a corollary to that advisory and contains resources and answers to questions that have been asked regarding this issue in an effort to communicate new information, reduce the need for support calls, and help keep organizations secure.

In short, patching VMware ESXi, Workstation, and Fusion are the fastest methods to resolve these issues. There is also a workaround: removing the USB controllers from virtual machines, though that may be infeasible at scale (see the Q&A below for PowerCLI examples, though) and does not eliminate the potential threat like patching does. With this VMSA there are additional versions of patches available for customers who are at VMware vSphere 7 Update 1 and Update 2, in an effort to help customers who cannot upgrade to vSphere 7 Update 3c at this time. Please read the questions & answers below for more information.

As always, please subscribe to [our Security Advisories mailing list](http://lists.vmware.com/mailman/listinfo/security-announce) for immediate notification when there are new VMware Security Advisories released.

New questions are answered at the end, so please read through or scan the index on the left of the page.

Vulnerabilities generate a lot of calls to VMware Global Support Services. While VMware Support is always happy to answer questions, you will get "guidance" or "advisory" types of answers faster, and with more relevance to your own environments, if you ask your account team, Technical Account Manager (TAM), or Professional Services representatives first.

Thank you!

Next Expected Update
--------------------

There will not be a regular update schedule for this document.

Questions & Answers
-------------------

We add new questions and answers to the end of this document to preserve links into the subsections here. Please use the index on the left side to scan the questions -- the question you have might be near the end!

### Who is affected?

A VMware Security Advisory will always list the specific supported products and versions that are affected. In this case it affects versions of VMware ESXi, Workstation, Fusion, and Cloud Foundation running in on-premises or colocated settings. If you have a version of these products running in your environment you are affected.

Cloud-based VMware services have been protected [and are fully operational](https://status.vmware-services.io/). Customers of VMware Cloud on AWS are fully protected as well, and no additional work is needed to protect their cloud-based workloads.

### When do I need to act?

Immediately. The ramifications of this vulnerability are serious, especially if attackers have access to workloads inside your environments.

Organizations that practice change management using the ITIL definitions of change types would consider this an “emergency change.” All environments are different, have different tolerance for risk, and have different security controls and defense-in-depth to mitigate risk, so the decision on how to proceed is up to you. However, given the severity, we strongly recommend that you act.

### What should I do to protect myself?

To fully protect yourself and your organization please install one of the patch versions listed in the VMware Security Advisory, or use the workarounds listed in the VMSA.

There may be other protections available in your organization, depending on your security posture, defense-in-depth strategies, and configurations of virtual machines. Reliance on those protections has to be a discussion within your organization.

### Is this being exploited "in the wild?"

As of this publication VMware has not seen evidence that this has been exploited in the wild.\[1\]

### How were the issues discovered?

These issues were discovered as part of the Tianfu Cup, a Chinese hacking event. VMware worked with the organizers of this event to review the findings and receive the information privately.\[1\]

### Is VMware Cloud on AWS affected?

Remediations are already in place for systems and services managed by VMware, as part of the shared responsibility model. No further work is needed to protect cloud-based workloads in VMware Cloud on AWS.

### Do I have to patch vCenter Server?

No. Consult the VMSA itself for the authoritative list of what is impacted.

### Do I have to patch ESXi hosts?

Yes -- ESXi is impacted by these issues if you have workloads that have virtual USB controllers.

### Will there be a patch to VMware Cloud Foundation?

There are patches for all affected products. Please refer to the VMSA itself for the specific versions that resolve these issues.

### Some documents call the ESXi 7.0.1 and 7.0.2 patches "back in time" updates, what does that mean?

VMware refers to patches & updates as "back in time" when they update a product branch that is older than the latest version of that major release. In this case, the 7.0.3.x line is the top of the vSphere development tree, and the most current. Patches in the 7.0.1.x and 7.0.2.x are "back in time" because they are on older branches of vSphere 7.

Please refer to [Knowledge Base article 87613](https://kb.vmware.com/s/article/87613) for upgrade options between ESXi versions.

### Will these "back in time" releases disrupt the upgrade to vSphere 7 we have planned?

Probably not but please consult the upgrade compatibility matrix for guidance.

### If we use the patch for vSphere 7 Update 2 (7.0.2) does that prevent us from updating to vSphere 7 Update 3c or newer?

No, all vSphere 7 versions can be updated to the latest vSphere 7 release. See [Knowledge Base article 87613](https://kb.vmware.com/s/article/87613) for more information.

### Are there any considerations to make when choosing the 7.0.1 or 7.0.2 patches?

There are three tenets that define the core of information security: confidentiality, integrity, and availability. They are known as the CIA Triad.

Organizations often think of security only in terms of confidentiality, but that is an incomplete view. System and data integrity and availability are important, too.

The updates to 7.0.1 and 7.0.2 improve confidentiality, in that they close the vulnerabilities listed in this security advisory. Those patches do not contain all the bug fixes and other improvements to integrity and availability that have been made as part of 7.0.3 and newer releases (especially vSphere 7 Update 3c). As such, we always recommend using the most current version of vSphere where possible.

### What are the CVE numbers involved in VMSA-2022-0004?

CVE-2021-22040, CVE-2021-22041, CVE-2021-22042, CVE-2021-22043, CVE-2021-22050

### I am using a third-party solution, like Dell EMC VxRail, HPE SimpliVity, and so on. Is it safe for me to apply either the workarounds or the patch?

VMware is proud of the robust partner ecosystem and community built around our products, but we cannot speak to our partners’ solutions. Nor would they want us to.

Engineered and integrated solutions like Dell EMC VxRail, HPE SimpliVity, and even VMware Cloud Foundation control their patch levels and configurations as part of their qualification and testing processes. Using security guidance that is not explicitly for that product and product version is never a good idea. While we cover VMware Cloud Foundation in our own VMSA materials, if you also have other solutions in play you should contact those vendors directly for guidance.

### I have feedback about the products and/or processes, how should I give it to you?

VMware appreciates any and all feedback on our products and processes. You have two great options for feedback. First, if you are using vSphere 7 the vSphere Client provides a feedback mechanism in the upper-right corner (the smiley face, though we realize you may not share that emotion at the moment, and we understand). Click that to submit direct product feedback into a ticketing system that allows us to track and prioritize your suggestions.

Alternately, contact your Account Executive, Solutions Engineer, or Technical Account Manager. They have processes to submit feedback on your behalf into those same systems.

Please help us help you – many features and improvements have been realized because of suggestions made by customers. If we can make life better for you please tell us how.

### Is VMware doing anything about these security issues?

Our product teams always investigate the full impact of a vulnerability on both our products and our environment in order to protect our customers, partners and stakeholders.

### I have external Platform Services Controllers (PSCs). Do they need to be patched?

**This VMSA does not list vCenter Server as affected by this particular vulnerability.** However, we always recommend keeping all infrastructure components updated to the most current versions.

If the VMSA did list vCenter Server as affected then Platform Services Controllers (PSCs), which are based on vCenter Server, will need to be updated. If the PSCs are external (not embedded) they will need to have the patching processes run on them. In general, VMware recommends patching Platform Services Controllers first, then vCenter Server.

Embedded Platform Services Controllers are part of the vCenter Server appliance, and those functions will be updated as you update vCenter Server.

### I use vCenter Server HA. Do I need to update the witness node and secondary vCenter Server?

**This VMSA does not list vCenter Server as affected by this particular vulnerability.** However, we always recommend keeping all infrastructure components updated to the most current versions.

If the VMSA did list vCenter Server as affected then additional HA nodes, which are based on vCenter Server, would need to be updated, either directly or through additional steps.

### If I patch VMware vCenter Server will that affect running workloads in my cluster?

**This VMSA does not list vCenter Server as affected by this particular vulnerability.** However, we always recommend keeping all infrastructure components updated to the most current versions.

vCenter Server is the management interface to a vSphere cluster. When patching & restarting vCenter Server you will lose the ability to manage vSphere briefly during the update, and lose the ability to connect to VM consoles, but the workloads will stay up and running.

### Can I just firewall the affected products instead of patching?

All organizations have different environments and needs. Whether firewalls are appropriate compensating controls in your environment for this situation is for you and your information security staff to assess. In this particular case, the vulnerabilities can be exploited by anyone with administrator/root-level privileged access to a workload.

### Why is the VMSA listed as Critical when the vulnerabilities are not?

Individually the vulnerabilities have CVSS scores that are "Important." However, combining or chaining these issues together may result in what is effectively a critical exploit. To best serve our customers VMware has chosen to make the Security Advisory itself "Critical."

### I am running a specific build of a hot-patch for an affected product. Will I be able to get a new hot patch with the fixes?

VMware strongly recommends patching to the release listed in the VMSA, and continue to check for newer releases because full patch releases are cumulative. If you are running a hot-patch and cannot update, it is recommended that you follow the workaround instructions in the VMSA.

### It looks like VMware did maintenance on cloud services. How can I see the status of those services and upcoming maintenance activities?

[https://status.vmware-services.io/](https://status.vmware-services.io/) is the status dashboard for VMware Cloud on AWS, which also encompasses many other cloud-based services.

[https://status.workspaceone.com/](https://status.workspaceone.com/) is the status dashboard for VMware Workspace ONE.

[https://status.carbonblack.com/](https://status.carbonblack.com/) is the status dashboard for VMware Carbon Black tools & services.

### I am at vSphere 7 Update 3c, do I need to patch?

Please consult the VMSA for version information, but if you have fully applied the ESXi 7.0 Update 3c release from January 27, 2022, or a newer release, you are fully protected from this vulnerability.

### I have extended support on an affected product. How can I get a patch for this?

Please follow the extended support process to request patches and other information.

### Is vSphere 5.5 affected?

vSphere 5.5 is past the end of general and extended support and is not evaluated as part of this advisory. Please upgrade to vSphere 7 as soon as possible. There is a terrific upgrade starting point at [https://core.vmware.com/guide-vsphere-70-upgrade](https://core.vmware.com/guide-vsphere-70-upgrade)!

### Is vSphere 6.0 affected?

vSphere 6.0 is past the end of general support and is not evaluated as part of this advisory. If your organization has extended support please use those processes to request assistance. Please upgrade to vSphere 7 as soon as possible. There is a terrific upgrade starting point at [https://core.vmware.com/guide-vsphere-70-upgrade](https://core.vmware.com/guide-vsphere-70-upgrade)!

### Is VMware vSAN impacted?

VMware vSAN is deeply integrated in VMware vSphere, so recommendations for remediating vCenter Server and ESXi will also remediate vSAN.

### Does VMSA-2022-0004 contain fixes for Log4j?

Please refer to [VMSA-2021-0028](https://www.vmware.com/security/advisories/VMSA-2021-0028.html) for information on Log4j. The product lists are different.

### Why isn't my product or product version listed in the VMSA?

The VMSA only lists supported versions of affected products.

### Are there any downsides to using the workaround?

The workarounds listed involve removing the USB controllers from virtual machines. This may not be feasible at scale, and some supported operating systems require USB for keyboard & mouse access via the virtual console (through vCenter Server or ESXi, but does not affect Remote Desktop). You may also lose some functionality such as USB passthrough.

That said, most Windows and Linux versions support use of the virtual PS/2 mouse and keyboard, and removing unnecessary devices such as USB controllers is recommended as part of the [security hardening guidance VMware publishes for cloud infrastructure products like vSphere, Cloud Foundation, and VMware Cloud on AWS](https://core.vmware.com/security-configuration-guide).

### How can I determine if my virtual machines have a USB controller attached?

Beyond using the vSphere Client UI, you can use PowerCLI to audit for USB and other devices:

```
$VMs = Get-VM

$USBHardware = "VirtualUSBController|VirtualUSBXHCIController"
foreach ($VM in $VMs) {
    $VMview = Get-VM $VM | Get-View

    $VMview.Config.Hardware.Device | Where-Object {$_.GetType().Name -match $USBHardware} | Foreach-Object {
        $devname = $_.GetType().Name
        Write-Host "$VM`: VM has a $devname device." -ForegroundColor Yellow
    }
}
```


(If you are auditing for potentially unnecessary virtual hardware a larger list is:  "VirtualUSBController|VirtualUSBXHCIController|VirtualParallelPort|VirtualFloppy|VirtualSerialPort|VirtualHdAudioCard|VirtualEnsoniq1371|VirtualCdrom|VirtualAHCIController")

### Can I remove USB controllers using PowerCLI?

Yes. The virtual machine may need to be powered off, depending on the guest operating system and its support for hot-add/hot-remove devices.

```
$VMs = Get-VM $vmname

$USBHardware = "VirtualUSBController|VirtualUSBXHCIController"

foreach ($VM in $VMs) {
    $VMview = Get-VM $VM | Get-View
    $VMview.Config.Hardware.Device | Where-Object {$_.GetType().Name -match $USBHardware} | Foreach-Object {
        $devname = $_.GetType().Name
        Write-Host "$VM`: Removing the $devname device." -ForegroundColor Yellow
        $Config = New-Object VMware.Vim.VirtualMachineConfigSpec
        $Config.DeviceChange = New-Object VMware.Vim.VirtualDeviceConfigSpec
        $Config.DeviceChange[0] = New-Object VMware.Vim.VirtualDeviceConfigSpec
        $Config.DeviceChange[0].Operation = "remove"
        $Config.DeviceChange[0].Device = $_
        # $VM.ExtensionData.ReconfigVM($Config)
    }
}
```


Replace or assign a value to the $vmname variable, and uncomment the ReconfigVM line to actually make the change (it is commented here for safety). It is also set up for use with the longer hardware list from above (though you may need to run it twice to remove the AHCI controllers, because of dependencies). Also, by removing $vmname altogether you can iterate over all virtual machines in an environment (dangerous!).

As with all code samples, we provide them to assist customers who wish to automate their work. **However, all environments are different, and VMware cannot take responsibility for the effects of this code sample in your environment. Please ensure that you have tested this in a controlled environment, understand the effects prior to using it in a production setting, have gained proper authorization to make these changes, and have communicated the changes to your organization prior to making them.**

Snapshots also capture VM configuration, which means that you can take a snapshot of a VM for testing or to mitigate the risk of this change. It also means that snapshots of a virtual machine may contain USB controllers, so if they are reverted you may be vulnerable again. This is why patching ESXi is always recommended as the best method for securing the environment, as it eliminates the vulnerability completely. If you do take a snapshot, ensure that you remove it in a timely manner to avoid the common performance and capacity issues that can develop from long-term snapshots.

### ESXi 6.7 is not impacted by some of these CVEs, is the risk lower?

No. ESXi 7 introduced a "sandbox" as a wrapper around the VMX process (the process that is effectively the running virtual machine on a hypervisor). That sandbox is a form of defense-in-depth that works to severely limit the impact of a "VM escape" by allowing the VMX process to only do pre-approved things. If an attacker finds a way through the VM to the hypervisor they will find themselves inside the sandbox, limited in what they can do. CVE-2021-22042 and CVE-2021-22043 are issues with the sandbox itself.

ESXi 6.7 and earlier do not have the sandbox, which is why they are not affected by vulnerabilities in the sandbox/settingsd, but they are still vulnerable to the issues with the USB controllers.

More Information
----------------

### Resources

Additional resources you might be interested in:

*   [VMware Security Advisory VMSA-2022-0004](https://www.vmware.com/security/advisories/VMSA-2022-0004.html) (descriptions of the issues and workarounds)
*   [VMSA-2022-0004 Questions & Answers](https://via.vmw.com/vmsa-2022-0004-qna) (this document, common questions & answers)
*   [Tips for Patching VMware vSphere](https://core.vmware.com/tips-patching-vmware-vsphere) (practical advice for ensuring patching success)
    
*   [VMware vSphere Security Configuration Guide](https://core.vmware.com/security-configuration-guide) (baseline security best practices for vSphere)
*   [VMware Ransomware Resource Center](https://core.vmware.com/ransomware) (discussion around tactics to help prevent, deter, and recover from attacks)
*   [VMware Ports & Protocols Firewalling Guidance](https://ports.broadcom.com/) (ports.broadcom.com)

### Changelog

*   \[1\] February 15, 2022, 1400 PST: The original "Is this being exploited in the wild?" question has been updated and split into multiple parts to improve clarity and accuracy.