# VMware vSphere 7 Virtual Machine Security Parameters
Introduction
------------

VMware vSphere has evolved over two decades with new features and functionality. The default settings for vSphere components have also evolved over time, as VMware balances change in the ecosystem with the need for security by default. As these changes have occurred, security guidance and best practices baselines for VMware products have tried to balance three things: security impact, operational impact, and auditability.

Security impact is straightforward, insofar as any guidance should decrease risk, and increase confidentiality, integrity, and/or availability. Security is always a tradeoff, though, and that’s where operational impact applies. Some potential security controls have detrimental effects on the performance or operation of workloads. For instance, using the now-deprecated svga.vgaOnly control, present in older guidance, means that modern guest operating systems will not operate correctly (impacting availability). Environments are still free to use svga.vgaOnly as they see fit, but it is no longer part of our baseline recommendations.

Last, auditability has had an enormous impact on our guidance, in that many security scanning tools look for specific parameters to be set for ESXi and for virtual machines. If our guidance does not have references to these parameters it leads to questions, support cases, and requests to reinstate them from customers and partners. However, many of the parameters that are checked do not currently exist in vSphere, and most of those that do exist either default to the guidance, or require site-specific information to configure (NTP servers, syslog servers, etc.).

vSphere 7 Approach
------------------

VMware’s goal for security in vSphere is twofold: that vSphere is as secure as is possible by default, and that vSphere security features are easy to use and operate. These goals acknowledge that security is an increasingly important task, given new threats, and that many of the people in IT who are asked to set and operate security controls are often generalists with many other IT tasks to perform. As such, VMware is changing its approach to security guidance.

First, we are acknowledging the product defaults as security that workloads can inherit from the environment. Second, we are omitting guidance that is irrelevant to the security posture of the environment. If a control is not part of a product and/or does not impact security if it is set then it should no longer be listed in our baseline guidance.

This is a general approach, beginning with vSphere 7 Update 3, and will start to be reflected in VMware products as well as documentation and other guidance from VMware. The vSphere Cluster Services (vCLS) agent virtual machines are a good example of this. Because they operate solely on vSphere 7 they can rely on the secure product defaults. As such, those agent virtual machines only set parameters that positively impact security beyond the defaults.

Compliance guidance and other sources of guidance, from VMware and those found on the Internet from non-VMware sources may not immediately reflect these changes. There is an inertia to regulatory compliance, for example, as guidance goes through audit processes. And put frankly, guidance published outside VMware is outside of our control. However, if we do not begin somewhere we will never get anywhere, and as we move forward we will work to document these changes in ways that auditors, security professionals, and IT staff will understand, in the hopes that we can all focus more directly on what matters the most.

Disclaimer
----------

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This  repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.

Intended Audience
-----------------

This information was compiled based on VMware ESXi 7.0 build 19482537 and VMware vCenter Server 7.0 build 19717403 (vSphere 7 Update 3d). We strongly encourage readers to stay current with patches and updates as a major part of a good security posture.

The audience for this document is customers & partners using VMware vSphere 7. Security guidance changes between product versions, and this guidance is not appropriate for versions of VMware vSphere prior to vSphere 7. Workloads that move between other products (Workstation, Fusion, etc.) may have different security requirements and should be assessed separately.

The most up-to-date version of this document can be found at: [https://bit.ly/vcf-scg](https://bit.ly/vcf-scg)

Feedback
--------

Please use the issue tracker in our GitHub repository to submit feedback:

[https://github.com/vmware/vcf-security-and-compliance-guidelines/issues](https://github.com/vmware/vcf-security-and-compliance-guidelines/issues)

Thank you.

Virtual Machine Parameter Guidance Overview
-------------------------------------------

This is a summary of the state of the virtual machine parameters. More information about individual parameters is below.

Unexposed/unimplemented parameters that are deprecated from vSphere 7 security guidance:

*   isolation.bios.bbs.disable
*   isolation.ghi.host.shellAction.disable
*   isolation.tools.dispTopoRequest.disable
*   isolation.tools.getCreds.disable
*   isolation.tools.ghi.autologon.disable
*   isolation.tools.ghi.launchmenu.change
*   isolation.tools.ghi.protocolhandler.info.disable
*   isolation.tools.ghi.trayicon.disable
*   isolation.tools.guestDnDVersionSet.disable
*   isolation.tools.hgfsServerSet.disable
*   isolation.tools.memSchedFakeSampleStats.disable
*   isolation.tools.trashFolderState.disable
*   isolation.tools.unity.disable
*   isolation.tools.unity.push.update.disable
*   isolation.tools.unity.taskbar.disable
*   isolation.tools.unity.windowContents.disable
*   isolation.tools.unityActive.disable
*   isolation.tools.unityInterlockOperation.disable
*   isolation.tools.vixMessage.disable
*   RemoteDisplay.vnc.enabled

Parameters which default to suggested configurations in vSphere 7 and should be reviewed:

*   isolation.device.connectable.disable
*   isolation.tools.copy.disable
*   isolation.tools.diskShrink.disable
*   isolation.tools.diskWiper.disable
*   isolation.tools.dnd.disable
*   isolation.tools.paste.disable
*   isolation.tools.setGUIOptions.enable
*   isolation.tools.vmxDnDVersionGet.disable
*   sched.mem.pshare.salt
*   svga.vgaOnly
*   tools.guestlib.enableHostInfo
*   tools.setInfo.sizeLimit

Parameters which should be configured to something other than the default:

*   mks.enable3d
*   RemoteDisplay.maxConnections
*   log.keepOld
*   log.rotateSize
*   tools.guest.desktop.autolock
*   isolation.device.edit.disable

Virtual Machine Parameter Guidance
----------------------------------

The guidance for these parameters has evolved, as described above.

### isolation.bios.bbs.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.device.connectable.disable

Status: Valid parameter, default reflects security guidance

Default Value: TRUE

Desired Value: TRUE

This parameter controls the ability for users to connect, change, and disconnect devices attached to the virtual machine.

Scans for this parameter should not generate findings if the parameter is found and set to TRUE, or the parameter is omitted and using the default for virtual machines which always run in vSphere 7 environments.

### isolation.device.edit.disable

Status: Valid parameter, should be set to TRUE

Default Value: FALSE

Desired Value: TRUE

This parameter controls the ability for users to connect, change, and disconnect devices attached to the virtual machine.

Scans for this parameter should not generate findings if the parameter is found and set to TRUE.

### isolation.ghi.host.shellAction.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.copy.disable

Status: Valid parameter, default reflects current guidance

Default Value: TRUE

Desired Value: TRUE

This parameter controls the ability to copy & paste information into a guest workload using the VMware vSphere virtual machine console. This control has no effect on in-guest console connections such as that with Microsoft Remote Desktop Connection.

Scans for this parameter should not generate findings if the parameter is found and set to TRUE, or the parameter is omitted and using the default for virtual machines which always run in vSphere 7 environments.

### isolation.tools.diskShrink.disable

Status: Valid parameter, default reflects current guidance

Default Value: TRUE

Desired Value: TRUE

This parameter controls the ability for in-guest users to trigger a process to reclaim disk space at the virtual disk (VMDK) level. This process can create a denial-of-service condition if used inappropriately.

Scans for this parameter should not generate findings if the parameter is found and set to TRUE, or the parameter is omitted and using the default for virtual machines which always run in vSphere 7 environments.

### isolation.tools.diskWiper.disable

Status: Valid parameter, default reflects current guidance

Default Value: TRUE

Desired Value: TRUE

This parameter controls the ability for in-guest users to trigger a process to wipe disk space at the virtual disk (VMDK) level. This process can create a denial-of-service condition if used inappropriately. Software disk wiping is also inappropriate for use on modern flash memory storage.

Scans for this parameter should not generate findings if the parameter is found and set to TRUE, or the parameter is omitted and using the default for virtual machines which always run in vSphere 7 environments.

### isolation.tools.dispTopoRequest.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.dnd.disable

Status: Valid parameter, default reflects current guidance

Default Value: TRUE

Desired Value: TRUE

This parameter controls the ability to copy & paste information into a guest workload using the VMware vSphere virtual machine console. This control has no effect on in-guest console connections such as that with Microsoft Remote Desktop Connection.

Scans for this parameter should not generate findings if the parameter is found and set to TRUE, or the parameter is omitted and using the default for virtual machines which always run in vSphere 7 environments.

### isolation.tools.getCreds.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.ghi.autologon.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.ghi.protocolhandler.info.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.ghi.trayicon.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.guestDnDVersionSet.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.hgfsServerSet.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.memSchedFakeSampleStats.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.paste.disable

Status: Valid parameter, default reflects current guidance

Default Value: TRUE

Desired Value: TRUE

This parameter controls the ability to copy & paste information into a guest workload using the VMware vSphere virtual machine console. This control has no effect on in-guest console connections such as that with Microsoft Remote Desktop Connection.

Scans for this parameter should not generate findings if the parameter is found and set to TRUE, or the parameter is omitted and using the default for virtual machines which always run in vSphere 7 environments.

### isolation.tools.setGUIOptions.enable

Status: Valid parameter, default reflects current guidance

Default Value: FALSE

Desired Value: FALSE

This parameter controls the ability to copy & paste information into a guest workload using the VMware vSphere virtual machine console. This control has no effect on in-guest console connections such as that with Microsoft Remote Desktop Connection.

Scans for this parameter should not generate findings if the parameter is found and set to FALSE, or the parameter is omitted and using the default for virtual machines which always run in vSphere 7 environments.

### isolation.tools.trashFolderState.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.unity.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.unity.push.update.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.unity.taskbar.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.unity.windowContents.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.unityActive.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.unityInterlockOperation.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.vixMessage.disable

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### isolation.tools.vmxDnDVersionGet.disable

Status: Valid parameter, default reflects current guidance

Default Value: TRUE

Desired Value: TRUE

This parameter controls the ability to copy & paste information into a guest workload using the VMware vSphere virtual machine console. This control has no effect on in-guest console connections such as that with Microsoft Remote Desktop Connection.

Scans for this parameter should not generate findings if the parameter is found and set to TRUE, or the parameter is omitted and using the default for virtual machines which always run in vSphere 7 environments.

### log.keepOld

Status: Valid parameter, should be set to 10

Default Value: 6

Desired Value: 10

This parameter controls how many older versions of a virtual machine log file should be kept with the virtual machine, in order to balance preserving information versus the risks of uncontrolled growth on disk.

Scans for this parameter should not generate findings if the parameter is found and set to 10.

### log.rotateSize

Status: Valid parameter, should be set to 2048000

Default Value: 0

Desired Value: 2048000

This parameter controls how much information is written to a virtual machine log file before it is rotated, in order to balance preserving information versus the risks of uncontrolled growth on disk.

Scans for this parameter should not generate findings if the parameter is found and set to 2048000.

### mks.enable3d

Status: Valid parameter, should be set to FALSE as appropriate

Default Value: TRUE

Desired Value: FALSE

This parameter disables the 3D functionality available in the virtual machine graphics adapters to reduce potential attack surface for workloads that do not require 3D. It is also exposed as a checkbox in the virtual machine configuration UI.

Scans for this parameter should not generate findings if the parameter is found and set to FALSE.

### RemoteDisplay.maxConnections

Status: Valid parameter, should be set to 1 as appropriate

Default Value: 40

Desired Value: 1

This parameter controls how many simultaneous connections are allowed to the VMware vSphere virtual machine console. This control has no effect on in-guest console connections such as that with Microsoft Remote Desktop Connection. Please note that virtual machine console connections proxied through vCenter Server (the default in vSphere 7) will warn of simultaneous connections, so setting this higher can help compensate for disconnected sessions counting towards the total, or denial-of-service effects from having the number set low.

Scans for this parameter should not generate findings if the parameter is found and set to 1.

### RemoteDisplay.vnc.enabled

Status: Unexposed/unimplemented feature on VMware ESXi 7.

Default Value: N/A

Desired Value: N/A

The presence or absence of this parameter does not change the security posture of workloads running on vSphere-based infrastructure. Consider removing from implementations unless there is a specific regulatory compliance desire to keep it.

Scans for this parameter should not generate findings.

### sched.mem.pshare.salt

Status: Valid parameter, default reflects current guidance

Default Value: 2

Desired Value: 2

This parameter controls Transparent Page Sharing (TPS), an approach to deduplicating memory between virtual machines. Security and performance concerns with TPS, coupled with TPS not operating on the large memory pages used by modern compute hardware, informs this default and recommendation. More information can be found at: [https://kb.vmware.com/s/article/2097593](https://kb.vmware.com/s/article/2097593)

Scans for this parameter should not generate findings if the parameter is found and set to 2, or the parameter is omitted and using the default for virtual machines which always run in vSphere 7 environments.

### svga.vgaOnly

Status: Valid parameter, default reflects current guidance

Default Value: FALSE

Desired Value: FALSE

This parameter limits a virtual machine to only Super VGA (SVGA) graphics functionality. This has significant negative impacts on modern guest operating system support and has been deprecated as part of our guidance. Customers can still disable 3D functionality with the mks.enable3d parameter.

Scans for this parameter should not generate findings if the parameter is found and set to FALSE, or the parameter is omitted and using the default for virtual machines which always run in vSphere 7 environments.

### tools.guest.desktop.autolock

Status: Valid parameter, should be set to TRUE

Default Value: FALSE

Desired Value: TRUE

This parameter controls whether the VMware Tools, if running on a virtual machine, should be asked to lock the VMware vSphere virtual machine console when vSphere sees the last console user disconnect. This control has no effect on in-guest console connections such as that with Microsoft Remote Desktop Connection. It also relies on VMware Tools and in-guest processes that are outside the scope of this document and guidance. In-guest user inactivity timeouts and controls should also be used.

Scans for this parameter should not generate findings if the parameter is found and set to TRUE.

### tools.guestlib.enableHostInfo

Status: Valid parameter, default reflects current guidance

Default Value: FALSE

Desired Value: FALSE

You can integrate virtual machine performance counters for CPU and memory into PerfMon for Linux and Microsoft Windows guest operating systems. This feature makes detailed information about the physical host available to the guest operating system. An adversary could potentially use this information to inform further attacks on the host.

Scans for this parameter should not generate findings if the parameter is found and set to FALSE, or the parameter is omitted and using the default for virtual machines which always run in vSphere 7 environments.

### tools.setInfo.sizeLimit

Status: Valid parameter, default reflects current guidance

Default Value: 1048576

Desired Value: 1048576

This parameter limits the amount of information that can be transmitted and stored from the virtual machine to the ESXi host.

Scans for this parameter should not generate findings if the parameter is found and set to 1048576, or the parameter is omitted and using the default for virtual machines which always run in vSphere 7 environments.