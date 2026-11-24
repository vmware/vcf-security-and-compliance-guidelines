# VMSA-2026-0011: Questions & Answers

## Introduction

On November 24, 2026, Broadcom released a critical VMware Security Advisory (VMSA), VMSA-2026-0011, addressing security vulnerabilities found and resolved in VMware ESX, VMware vCenter, VMware Workstation, VMware Fusion, VMware Tools, and VMware Avi Load Balancer. ESX and vCenter are part of the larger VMware Cloud Foundation (VCF), VMware vSphere Foundation (VVF), VMware Telco Cloud Platform, and VMware Telco Cloud Infrastructure software stacks.

The VMSA will always be the source of truth for which products and versions are affected and the proper patches to keep your organization secure. This document is a supplement to the advisory and includes self-service information to help you and your organization decide how to respond.

Because of coordinated disclosure and release pipeline timing this VMSA comes on the heels of VMSA-2026-0009, and atop a major holiday in the United States. The security vulnerability landscape is more dynamic than ever; please know that while we acknowledge this timing is not optimal, your ability to operate and maintain a secure environment amidst modern, AI-assisted threats is paramount to us.

Please check release levels closely, as some software versions delivered with VMSA-2026-0009 resolve these issues, too. If you applied vCenter 8.0 U3m for VMSA-2026-0009, including on VCF 5.2.x, you do not need to update vCenter again, but vCenter 9.1.x needs the update in this advisory (question 8). ESX was not part of VMSA-2026-0009 and needs the update in this advisory.

VMSA-2026-0009 also resolved issues in SDDC Manager, which this advisory does not update. If you have not applied the SDDC Manager update from VMSA-2026-0009, apply it separately (question 19). This advisory also includes a VMware Tools update. Updating vCenter and ESX does not update VMware Tools inside virtual machines, so plan that update separately (question 18).

This advisory covers a total of twenty-three issues. Seven are in vCenter: an authentication bypass and three denial-of-service issues in the VMware Directory Service, an arbitrary file write while processing certain archives, a local privilege escalation in a vpxd service script, and a security policy enforcement failure in the vSphere Distributed Switch (vDS). Seven are in ESX: a heap out-of-bounds write and a use-after-free in the I/O filter service, an out-of-bounds write in the Extensible Host Controller Interface (XHCI) USB controller, a stack-based buffer overflow in the VMkernel, a security bypass in the host configuration store, a signature verification bypass, and a denial of service in guest RPC. The XHCI and guest RPC issues also affect Workstation and Fusion. Eight are in Avi Load Balancer: an insecure deserialization, a local privilege escalation, a command injection, three sensitive information disclosures, an authentication bypass, and a directory traversal. One is in VMware Tools: a denial of service in the VMware Guest Authentication (VGAuth) service.

The most severe issues permit an attacker with network access to vCenter to bypass authentication and gain unauthorized access to the system, and an attacker with network access to ESX to execute code on the host. An attacker with network access to vCenter may also cause a denial of service of the VMware Directory Service. The XHCI issue permits an attacker with local administrative privileges in a virtual machine to execute code as the virtual machine executable (VMX) process that runs the virtual machine on the host. On ESX, that exploitation is contained within the VMX sandbox. On Workstation and Fusion, it may lead to code execution on the machine where Workstation or Fusion is installed. The other issues require existing access or privileges, such as access to the vCenter backup repository, a compromised vpxd service account, privileges inside a virtual machine or its VMX process, root privileges on ESX, or an authenticated or administrative account on Avi Load Balancer.

You are affected if you are running any version of VMware vCenter, VMware ESX, VMware Workstation, VMware Fusion, VMware Tools, VMware Avi Load Balancer, VMware Cloud Foundation, VMware vSphere Foundation, VMware Telco Cloud Platform, or VMware Telco Cloud Infrastructure prior to the versions listed as "fixed" in the VMSA. Please consult the VMSA itself for the definitive list of affected versions. If you have a question about whether you are affected, it is likely that you are and should take action immediately.

## Current Update

This document reflects VMSA-2026-0011, the initial advisory, published November 24, 2026.

## Next Expected Update

There is not a regular update schedule for this document; it will be updated as needed.

## Relevant Links

- [VMware Security Advisory VMSA-2026-0011](https://support.broadcom.com/web/ecx/security-advisory?segment=VC) (the security advisory itself)
- [VMSA-2026-0011 Questions & Answers](https://brcm.tech/vmsa-2026-0011-qna) (this document's link)
- [vSphere Security Configuration & Hardening Guides](https://brcm.tech/vcf-scg) (the reference for hardening VMware vSphere and Cloud Foundation, virtual machines, and in-guest settings like VMware Tools)
- [VMware Cloud Foundation Security Advisories](https://support.broadcom.com/web/ecx/security-advisory?segment=VC) (list of all disclosed security vulnerabilities)
- [VMware Security Advisory Mailing List](https://go-vmware.broadcom.com/vmsa_email_alert) (please subscribe for proactive notifications of security advisories)
- [VMware Product Interoperability Matrix](https://interopmatrix.broadcom.com/Interoperability) (use to determine whether vCenter versions are compatible with ESX versions)
- [VMware Ports & Protocols](https://ports.broadcom.com/) (assistance in determining ingress and egress firewall rule sets)
- [VMware vSphere Critical Patch Downloads](https://support.broadcom.com/group/ecx/productdownloads?subfamily=VMware+vSphere&tab=Solutions) (support.broadcom.com)
- [Asynchronous Patching Guide, KB 88287](https://knowledge.broadcom.com/external/article?legacyId=88287) (the patching path for VMware Cloud Foundation 5.x)

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.

## Note on Product Naming

VMware Cloud Foundation 9.0 and VMware vSphere Foundation 9.0 and later change the name of the hypervisor from VMware ESXi to VMware ESX. Moving forward, the terms "ESX" and "ESXi" may be used interchangeably to refer to current, supported hypervisor versions. Patch and build identifiers may still carry the ESXi prefix.

## Questions & Answers

### 1. Who does this affect?

You are affected if you are running any version of VMware vCenter, VMware ESX, VMware Workstation, VMware Fusion, VMware Tools, or VMware Avi Load Balancer prior to the versions listed as "fixed" in the VMSA. This includes vCenter and ESX deployed standalone and as part of VMware Cloud Foundation, VMware vSphere Foundation, VMware Telco Cloud Platform, and VMware Telco Cloud Infrastructure.

For a definitive list of affected versions, please refer to the VMSA directly. If there is any uncertainty about whether a system is affected, presume it is vulnerable and take action immediately.

### 2. When do I need to act?

Four issues are rated Critical: CVE-2026-123903 in vCenter, CVE-2026-123910 and CVE-2026-123911 in ESX, and CVE-2026-123912 in Workstation and Fusion. These issues qualify under ITIL methodologies as an emergency change, requiring prompt action from your organization. However, the specific response timing depends on your unique circumstances. Consult immediately with your organization's information security staff. They will assess the situation and determine the most appropriate course of action for your specific organizational context.

### 3. What should I do to protect myself?

Install one of the fixed versions listed in the VMware Security Advisory. Patches are cumulative, so versions newer than the ones listed also resolve these issues. Broadcom always recommends applying the latest updates to all software products.

### 4. What CVE numbers are involved in these disclosures?

Twenty-three:

- vCenter: CVE-2026-123903 (authentication bypass in the VMware Directory Service), CVE-2026-123904 (arbitrary file write), CVE-2026-123905, CVE-2026-123906, and CVE-2026-123907 (denial of service in the VMware Directory Service), CVE-2026-123908 (local privilege escalation), and CVE-2026-123909 (vSphere Distributed Switch security policy enforcement failure).
- ESX: CVE-2026-123910 (heap out-of-bounds write in the I/O filter service), CVE-2026-123911 (use-after-free in the I/O filter service), CVE-2026-123913 (VMkernel stack-based buffer overflow), CVE-2026-123914 (host configuration store security bypass), and CVE-2026-123915 (signature verification bypass).
- ESX, Workstation, and Fusion: CVE-2026-123912 (XHCI USB controller out-of-bounds write) and CVE-2026-123916 (guest RPC denial of service).
- Avi Load Balancer: CVE-2026-123919 (insecure deserialization), CVE-2026-123920 (local privilege escalation), CVE-2026-123921 (command injection), CVE-2026-123922 (disclosure of password hashes), CVE-2026-123923 (authentication bypass to the service engine routing management interface), CVE-2026-123924 (disclosure of SSH credentials), CVE-2026-123925 (directory traversal), and CVE-2026-123926 (read access to resources beyond the user's intended privileges).
- VMware Tools: CVE-2026-123918 (denial of service in the VGAuth service).

### 5. What is the severity of the vulnerabilities?

The advisory as a whole is rated Critical. Individual scores range from 3.4 to 9.8, scored using version 3.1 of the Common Vulnerability Scoring System (CVSS). CVE-2026-123912 has two scores: 9.3 for Workstation and Fusion, and 8.5 for ESX, where exploitation is contained within the VMX sandbox.

### 6. Are there additional details about the vectors of the vulnerabilities?

VMware Security Advisories link to the FIRST CVSS v3.1 calculator with the vectors pre-filled for the individual vulnerabilities. This information is found in the References section of the advisory.

### 7. Is CVE-2026-123903 related to CVE-2026-123890 from VMSA-2026-0009?

CVE-2026-123903 is a new and distinct issue. All systems running software below the versions listed in the VMSA need this update.

### 8. If I applied the vCenter updates from VMSA-2026-0009 does this resolve these issues, too?

Always check the versions in the VMSA itself, but in this case, if you applied vCenter 8.0 U3m for VMSA-2026-0009, you do not need to patch vCenter again. vCenter 8.0 U3m is also the 8.0 fixed version in this advisory. For vCenter 9.1.x, update to vCenter 9.1.2, which was released with this advisory. For vCenter 9.0.x, compare your version with the fixed version in the VMSA. The ESX, VMware Tools, Workstation, Fusion, and Avi Load Balancer issues in this advisory still need their updates.

### 9. Does this advisory resolve the issues in VMSA-2026-0009?

Patches are cumulative, so the updates listed in this advisory also contain the fixes from VMSA-2026-0009 when they are newer than the fixed versions listed in VMSA-2026-0009. However, this advisory does not mention the SDDC Manager updates from VMSA-2026-0009; please ensure you are handling those.

### 10. Do the updates that are listed in VMSA-2026-0011 also resolve the issues in VMSA-2026-0010?

No. VMSA-2026-0010 is a separate advisory; if it applies to your environment, please use the workaround in that VMSA. Broadcom plans to release an Express Patch to resolve those issues.

### 11. Is this a "VM escape?"

On Workstation and Fusion, CVE-2026-123912 may permit one. An attacker with local administrative privileges in a virtual machine may exploit the issue to execute code as the VMX process, which may lead to code execution on the machine where Workstation or Fusion is installed.

On ESX, exploitation of CVE-2026-123912 is contained within the VMX sandbox. A separate issue, CVE-2026-123913, is a stack-based buffer overflow in the VMkernel that permits an attacker who already has privileges within the VMX process to elevate privileges.

CVE-2026-123916 permits an attacker with non-administrative privileges in a virtual machine to send a crafted RPC command that crashes the VMX process, resulting in a denial of service of that virtual machine.

The two most severe ESX issues, CVE-2026-123910 and CVE-2026-123911, do not require access to a virtual machine. An attacker with network access to ESX may exploit them to execute code on the host.

### 12. Do I have to update VMware vCenter?

Yes. vCenter is affected by CVE-2026-123903, CVE-2026-123904, CVE-2026-123905, CVE-2026-123906, CVE-2026-123907, CVE-2026-123908, and CVE-2026-123909. The fixed versions are vCenter 9.1.2 for 9.1.x, the vCenter 9.0.2 express patch for 9.0.x, and vCenter 8.0 U3m for 8.0.

### 13. Do I have to update VMware ESX?

Yes. ESX is affected by CVE-2026-123910, CVE-2026-123911, CVE-2026-123912, CVE-2026-123913, CVE-2026-123914, CVE-2026-123915, and CVE-2026-123916. The fixed versions are ESX 9.1.2 for 9.1.x, the ESX 9.0.2 express patch for 9.0.x, and ESX 8.0 U3m (ESXi80U3m) for 8.0.

### 14. Do I have to update the vSAN Witness Appliance?

Yes. The vSAN Witness Appliance runs ESX and is affected by the ESX issues in this advisory, though it does not run virtual machines or traditional workloads. Update it to the fixed ESX version along with the other hosts in the vSAN cluster. The witness appliance runs as a virtual machine, so also update the ESX host that runs it.

### 15. Do I have to update VMware Workstation or VMware Fusion?

Yes. Workstation and Fusion are affected by CVE-2026-123912 and CVE-2026-123916. Both issues are fixed in Workstation and Fusion 26H1u1. On Workstation and Fusion, exploitation of CVE-2026-123912 may lead to code execution on the machine where Workstation or Fusion is installed.

### 16. I am already running VCF 9.1.1. Am I already protected?

Only from CVE-2026-123916. The advisory notes that CVE-2026-123916 was first resolved in VCF 9.1.1, VCF 5.2.4, ESX 8.0 U3j, and Workstation and Fusion 26H1. Those versions are still affected by the other issues in this advisory. Update to the fixed versions listed in the VMSA, which contain the fixes for all of them.

### 17. Do I have to update VMware Avi Load Balancer?

Yes. Avi Load Balancer is affected by CVE-2026-123919, CVE-2026-123920, CVE-2026-123921, CVE-2026-123922, CVE-2026-123923, CVE-2026-123924, CVE-2026-123925, and CVE-2026-123926. These issues score from 3.4 to 6.7. CVE-2026-123926 requires network access and an authenticated account on Avi Load Balancer. The other seven require administrative privileges on the Avi Controller, a service engine, or Avi Load Balancer.

Avi Load Balancer 32.1.4 resolves all eight issues and is the recommended version. The other fixed versions resolve only some of the issues:

- 31.2.3 resolves CVE-2026-123919 and CVE-2026-123921, for systems running 31.x, 30.x, and 22.1.x;
- 30.2.7 resolves CVE-2026-123920, for systems running 30.x;
- 32.1.3-2p1 resolves CVE-2026-123926, for systems running 32.1.3;
- 32.1.2-2p3 resolves CVE-2026-123926, for systems running 32.1.1, 32.1.2, and 31.x.

CVE-2026-123922, CVE-2026-123923, CVE-2026-123924, and CVE-2026-123925 are resolved only in 32.1.4. Avi Load Balancer 30.x and 22.x are not affected by CVE-2026-123926.

### 18. Do I have to update VMware Tools?

Yes. VMware Tools for Windows and Linux is affected by CVE-2026-123918, a denial-of-service issue in the VMware Guest Authentication (VGAuth) service. The fixed versions are VMware Tools 13.1.10 for 13.x, and 12.5.6 for 12.x and 11.x. For 32-bit Windows, VMware Tools 12.4.11, which is part of the VMware Tools 12.5.6 release, also resolves the issue. Fixed versions of open-vm-tools for Linux are distributed by Linux vendors, and the version numbers may differ by distribution and vendor.

These versions also contain the fix for CVE-2026-123894 from VMSA-2026-0009. Updating vCenter and ESX does not update VMware Tools inside virtual machines, so plan the VMware Tools update separately. Please consider installing the new "Capsule PK" driver as mentioned in the [VMSA-2026-0009 Questions & Answers](https://brcm.tech/vmsa-2026-0009-qna).

Upgrading virtual machine hardware versions is not required.

### 19. Do I have to update SDDC Manager, VCF Operations, or VCF Automation?

Yes, for SDDC Manager, if you have not already applied the SDDC Manager update from VMSA-2026-0009. SDDC Manager is not affected by the issues in this advisory, but CVE-2026-123891, CVE-2026-123892, and CVE-2026-123893 from VMSA-2026-0009 are resolved by updating SDDC Manager to 9.1.1.0200 for 9.1.x, 9.0.2.0100 for 9.0.x, and 5.2.5 for 5.x. The [VMSA-2026-0009 Questions & Answers](https://brcm.tech/vmsa-2026-0009-qna) have more information.

VCF Operations and VCF Automation are not affected by this advisory or by VMSA-2026-0009.

### 20. Do I have to update VCF Networking?

No. VCF Networking, formerly VMware NSX, is not affected by this VMSA.

### 21. Will there be a patch for VMware Cloud Foundation?

Yes, fixed versions and instructions are listed and linked in the VMSA. For VMware Cloud Foundation and VMware vSphere Foundation 9.1.x, the fixed versions are vCenter 9.1.2 and ESX 9.1.2. For 9.0.x, they are the vCenter and ESX 9.0.2 express patches. For VMware Cloud Foundation 5.x, the advisory lists 5.2.5 as the fixed version for vCenter and ESX and links the asynchronous patching process described in [KB 88287](https://knowledge.broadcom.com/external/article?legacyId=88287). VCF 5.x customers apply vCenter 8.0 U3m and ESX 8.0 U3m using that process. Updating SDDC Manager to 5.2.5 for VMSA-2026-0009 does not update ESX, so apply ESX 8.0 U3m even if SDDC Manager already runs 5.2.5. Refer to the VMSA itself for the instructions for your version. VMware Tools in virtual machines is updated separately, and its fixed versions are 13.1.10 for 13.x, and 12.5.6 for 12.x and 11.x (question 18).

### 22. Will there be a patch for VMware Telco Cloud Platform and VMware Telco Cloud Infrastructure?

Yes. Please follow the instructions linked in the VMSA itself.

### 23. Are there workarounds for these vulnerabilities?

Not as listed by Broadcom. Questions 24 and 25 discuss two partial mitigations, removing the XHCI USB controller from virtual machines and restricting network access to the ESX I/O filter service, and explain why updating is the better path. There may be other mitigations and compensating controls available in your organization, depending on your security posture, defense-in-depth strategies, and configurations of perimeter firewalls, appliance firewalls, and ESX host firewalls. All organizations must decide for themselves whether to rely on those protections; Broadcom and VMware Global Support (GS) cannot decide for you what is appropriate for your organization.

For assistance that is tailored to your environment and organization please contact your account team about VMware Professional Services.

### 24. Can I remove the USB controller from virtual machines as a workaround for CVE-2026-123912?

Removing the XHCI USB controller may be a workaround for that particular issue, as a virtual machine without an XHCI controller does not present the vulnerable device. However, this only resolves one issue, and for most organizations tends to be far more effort than applying the full set of patches.

Test before you remove the controller, and confirm that the guest operating system does not require it. Removing the XHCI controller can interrupt console keyboard and mouse input for guest operating systems that bind those input devices to it, and USB devices connected to the virtual machine stop working. The VCF Security Configuration Guide control `vm-9.remove-unnecessary-devices` recommends removing USB controllers and other virtual hardware that a workload does not need.

The following PowerCLI example lists virtual machines that have an XHCI controller:

```powershell
Get-VM | Where-Object {
    $_.ExtensionData.Config.Hardware.Device | Where-Object { $_ -is [VMware.Vim.VirtualUSBXHCIController] }
} | Select-Object Name, PowerState
```

Remove the controller from the virtual machine's Edit Settings dialog in the vSphere Client. On Workstation and Fusion, remove it in the virtual machine settings.

### 25. Can I restrict network access to the ESX I/O filter service as a workaround for CVE-2026-123910 and CVE-2026-123911?

Network access control can be a mitigation for many security issues, and is recommended as a general best practice for security. For the ESX I/O filter service, limiting the systems that can reach it only resolves a small portion of the issues in this VMSA, and may negatively impact the operation of the cluster and the availability of workloads and storage. Please apply the software updates instead.

### 26. What does CVE-2026-123909 mean for vSphere Distributed Switch security policies?

CVE-2026-123909 is a failure to enforce a security policy on a vSphere Distributed Switch. A local actor in a virtual machine may exploit it to operate with certain capabilities that may expose the environment to elevated risk. vCenter manages distributed switch configuration, and the fix is in the vCenter update.

The distributed switch security policies are Promiscuous Mode, MAC Address Changes, and Forged Transmits. Each defaults to Reject. The VCF Security Configuration Guide recommends keeping Reject, and placing workloads that require Accept on a separate distributed port group (two port groups can have the same VLAN tag, for instance, with differing policies). To review the current settings with PowerCLI:

```powershell
Get-VDPortgroup | Get-VDSecurityPolicy
```

### 27. Does CVE-2026-123904 affect how I protect vCenter backups?

Yes. CVE-2026-123904 requires an attacker with access to the backup repository, the file server where vCenter file-based backups are stored. The issue is in how vCenter processes certain archives, and it may let the attacker write files to arbitrary locations on the vCenter appliance as root, which may lead to code execution on the appliance.

Update vCenter. Restrict write access to the backup repository to the account that vCenter uses to store backups and to the administrators who manage the repository.

### 28. Do I have to apply other patches first, such as those for VMSA-2026-0009?

No. All patches released publicly in this manner are cumulative and do not require prior patches to be applied first. A single update therefore applies all updates available to that product and/or version branch, and there is no need to apply separate patches for individual CVEs. The fixed vCenter and VMware Tools versions in this advisory also contain the vCenter and VMware Tools fixes for VMSA-2026-0009.

VMSA-2026-0009 also resolved issues in SDDC Manager, which this advisory does not update. If you have not applied that fix, apply it separately.

### 29. Does this advisory address other recent CVEs, such as those in OpenSSH, NGINX, or Apache components?

If the CVE was mitigated or resolved as part of a previous software release then it will be addressed, given the cumulative nature of software updates.

For more information about the disposition of CVEs inside VMware Cloud Foundation 9.1 and newer, find the "CVE Status for VCF" downloadable CSV file on the "Additional Downloads" tab in the download portal.

### 30. If I am not using Enhanced Linked Mode am I safe?

No. The VMware Directory Service issues (CVE-2026-123903, CVE-2026-123905, CVE-2026-123906, and CVE-2026-123907) are in vCenter itself, not in Enhanced Linked Mode (ELM), and they are present whether or not you use ELM. Update vCenter.

Moving forward, ELM is deprecated in VCF 9.0 and replaced by vCenter Groups in VCF 9.1, which is a federated approach that solves the need to manage and update all ELM-connected vCenters together (which makes updates a lot easier). Please update your environment to VCF 9.1 to take advantage of this and hundreds of additional features that make maintenance easier.

### 31. How do I check the build or version number of VMware vCenter?

The build information is available in the Summary tab of the vSphere Client. It can also be queried with PowerCLI. Once you connect using `Connect-VIServer`, the build is available in the `$global:DefaultVIServer.Build` variable, and the version is available in `$global:DefaultVIServer.Version`.

### 32. How do I check the build or version number of VMware ESX?

The build information is available in the Summary tab for each host in the vSphere Client. It can also be queried with PowerCLI:

```powershell
Get-VMHost | Select-Object Name, Version, Build
```

### 33. If I update vCenter will it affect running workloads?

No. vCenter is the management interface to a VCF environment. You will lose the use of the vSphere Client briefly during the update, and other management methods will be similarly affected, but virtual machine and container workloads will continue to run.

Some data-at-rest encryption operations against a Standard Key Provider/KMS, such as new encryption and key rotations, will be unavailable while vCenter is offline. Existing encrypted workloads, vSphere HA, and VMware vSAN continue to operate. This is the same behavior ESX and vCenter have exhibited since vSphere 6.5, so nothing new, but we mention it to note it as an operational consideration.

### 34. If I update ESX will it affect running workloads?

No, when the virtual machines can migrate. Updating ESX restarts the host. Before the restart, the host enters maintenance mode, and vSphere vMotion moves its running virtual machines to other hosts in the cluster. vSphere DRS can perform those migrations automatically, and vSphere Lifecycle Manager can update a cluster one host at a time. Virtual machines that cannot migrate, such as those on standalone hosts or with PCI passthrough devices, must be shut down while their host is updated.

The fixes for CVE-2026-123912 and CVE-2026-123916 are in the VMX process. A virtual machine runs the fixed VMX after it powers on, or after it migrates with vMotion to an updated host. A rolling update of a cluster with vMotion does this for every running virtual machine. Restarting the guest operating system does not restart the VMX process.

### 35. Are these updates compatible with vCenter Quick Patch?

No. The vCenter updates in this advisory are not eligible for vCenter Quick Patch.

vCenter Quick Patch was introduced in VCF 9.1 and is not present in earlier versions. The release notes for each update state whether it is eligible for Quick Patch, and an eligible update requires the system to be running the immediately preceding update (N-1) of that major version. Systems that are further behind use the conventional update methods to catch up. The Cloud Foundation blog has more information about [VMware vCenter Quick Patch](https://blogs.vmware.com/cloud-foundation/2026/05/12/vcenter-quick-patch/).

### 36. Are these updates compatible with ESX Live Patch?

No. The ESX updates in this advisory are not eligible for ESX Live Patch. Apply them with the standard remediation process described in question 34, which restarts each host.

ESX Live Patch applies an eligible patch to a host in memory, without maintenance mode, virtual machine evacuation, or a host restart. Eligibility depends on the specific patch, not on its release type or severity, and vSphere Lifecycle Manager reports it before remediation. The Cloud Foundation blog has more information about [ESX Live Patch](https://blogs.vmware.com/cloud-foundation/2025/07/15/live-patch-gets-even-better-in-vsphere-with-vmware-cloud-foundation-9-0/).

### 37. Can I use the vCenter VAMI to apply these updates?

Yes. The patch is available through the standard update mechanisms for VMware vSphere and VMware Cloud Foundation. Consult the product documentation for the version of the product you use.

### 38. Are there any known issues with this patch?

These updates do not cause a "Back-in-Time" issue, and VCF 9.1.2 resolves the one created by VMSA-2026-0009. See question 44.

### 39. Does this impact VMware vSphere 6.5 or 6.7?

Presume that it does. Broadcom does not evaluate products past their End of General Support dates as part of security advisories, and downlevel versions that the VMSA does not list should be assumed to be affected. Broadcom strongly encourages customers running downlevel versions to upgrade to VCF 9.1.

### 40. Does this impact VMware vSphere 7.0?

Yes. VMware vSphere 7 reached End of General Support on October 2, 2025, and the advisory lists vCenter 7.0 and ESX 7.0 as affected. If your organization has an active extended support contract, contact Broadcom Support to request patches for these issues. Broadcom strongly encourages customers running downlevel versions to upgrade to VCF 9.1.

### 41. Do I have to update to vSphere 8 Update 3 to receive this patch on vSphere 8 or VCF 5.x?

Yes. The 8.0 fixed versions in this advisory are vCenter 8.0 U3m and ESX 8.0 U3m (ESXi80U3m). VMware vSphere 8 Update 3 is the best version of vSphere 8 and new security updates are built atop it. We strongly urge customers to apply that version, or upgrade to VVF/VCF 9.1. The latest patch for VMware vSphere 8.0 Update 3 contains all released security AND bug fixes, improving system confidentiality, integrity, and availability.

VMware Cloud Foundation 5.x customers apply these updates using the asynchronous patching process described in [KB 88287](https://knowledge.broadcom.com/external/article?legacyId=88287).

### 42. I am using a third-party solution such as HPE SimpliVity, Dell EMC VxRail, and so on. Is it safe for me to apply the update?

Third-party engineered systems control their patch levels and configurations as part of their qualification and testing processes. Using security guidance that is not explicitly for that product and product version is never advised. If you use engineered and integrated solutions, please contact those vendors directly for guidance. Broadcom is not involved in, and cannot speak to, third-party product release schedules.

### 43. Are VMware Cloud and hosted products updated?

VMSA information is delivered as a message inside hosted, cloud, and software-as-a-service products where applicable. Please check the administrative consoles of those services for further relevant messages and details about this VMSA. Additional questions about the service should be answered through the support processes for that service.

### 44. Do these patches cause "Back-in-Time" upgrade issues?

No. The updates in this advisory do not cause a "Back-in-Time" restriction.
VCF 9.1.2 also resolves the restriction created by VMSA-2026-0009, in which vCenter 8.0 U3m and 9.0.2.0200 blocked upgrades to VCF 9.1.1. Systems running those versions can upgrade to VCF 9.1.2.

A "Back-in-Time" restriction occurs when a patch updates a product branch that carries a newer build number than the target of a planned upgrade. More information about "Back-in-Time" restrictions and the compatibility matrix is available in [KB 67077](https://knowledge.broadcom.com/external/article?legacyId=67077).

### 45. Is the updated vCenter compatible with my ESX hosts?

Most likely, yes. In the past we have always advised that vCenter should be updated ahead of ESX hosts, but that requirement is not universally true any longer. Check the [VMware Product Interoperability Matrix](https://interopmatrix.broadcom.com/Interoperability), where you can specify "VMware vCenter" at a particular version against "VMware ESX" at another. If you use VMware vSAN, include it in the interoperability check as well. Confirm that the fixed vCenter version supports the ESX versions you already run.

### 46. Are these issues ones that were found by AI?

Please refer to the acknowledgments in each CVE section of the VMSA itself. We cannot speak to whether the reporters used AI.

### 47. Do these patches contain other improvements or fixes?

These patches represent the most current versions of the products at the time of the VMSA. As noted above, the patches are cumulative and contain all previous updates. If you read the release notes you may also see other issues which were resolved, too, where the fix was ready to be made public and could be included in the update. When in doubt use the version numbers to guide your decisions.

### 48. Why is the date of the VMSA different than the date that appears for the update in the VAMI?

The date in the VAMI is the date the update was compiled and packaged internally, not the date of the advisory. Nothing can or should be inferred from the length of time between the two dates.

## Change Log

Specific changes to this document can be tracked with GitHub's "History" and "Blame" functions (buttons above).
