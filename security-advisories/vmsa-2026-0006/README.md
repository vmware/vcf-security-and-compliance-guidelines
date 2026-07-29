# VMSA-2026-0006: Questions & Answers

## Introduction

On July 29, 2026, Broadcom released a critical VMware Security Advisory (VMSA), VMSA-2026-0006, addressing security vulnerabilities found and resolved in VMware ESX, VMware vCenter, VMware Workstation, and VMware Fusion. These components are part of the larger VMware Cloud Foundation, VMware vSphere Foundation, VMware Telco Cloud Platform, and VMware Telco Cloud Infrastructure software stacks.

The VMSA will always be the source of truth for which products and versions are affected and the proper patches to keep your organization secure. This document is a supplement to the advisory and includes self-service information to help you and your organization decide how to respond.

The advisory covers five issues: an authentication bypass in the VMware Directory Service, a directory traversal issue in the vCenter syslog server, an out-of-bounds write in the VMXNET3 virtual network adapter, an out-of-bounds read in ESX, Workstation, and Fusion, and an insufficient logging issue in ESX. The two vCenter issues permit an unauthenticated attacker with network access to bypass authentication and to execute arbitrary code. The VMXNET3 issue permits an attacker who already has administrative privileges inside a virtual machine to execute code on the ESX host. The out-of-bounds read requires virtual machine deployment privileges and can disclose information or cause a denial-of-service condition in the host process. The logging issue permits an administrator to perform operations on ESX without those operations being recorded.

You are affected if you are running any version of VMware ESX, VMware vCenter, VMware Workstation, VMware Fusion, VMware Cloud Foundation, VMware vSphere Foundation, VMware Telco Cloud Platform, or VMware Telco Cloud Infrastructure prior to the versions listed as "fixed" in the VMSA. Please consult the VMSA itself for the definitive list of affected versions. If you have a question about whether you are affected, it is likely that you are and should take action immediately.

## Current Update

The last update timestamp can be seen as part of the GitHub file history above.

## Next Expected Update

There is not a regular update schedule for this document; it will be updated as needed.

## Relevant Links

- [VMware Security Advisory VMSA-2026-0006](https://support.broadcom.com/web/ecx/support-content-notification/-/external/content/SecurityAdvisories/0/38017) (the security advisory itself)  
- [VMSA-2026-0006 Questions & Answers](https://brcm.tech/vmsa-2026-0006-qna) (this document’s link)  
- [vSphere Security Configuration & Hardening Guides](https://brcm.tech/vcf-scg) (the reference for hardening VMware vSphere and Cloud Foundation, virtual machines, and in-guest settings like VMware Tools)  
- [VMware Cloud Foundation Security Advisories](https://support.broadcom.com/web/ecx/security-advisory?segment=VC) (list of all disclosed security vulnerabilities)  
- [VMware Security Advisory Mailing List](https://go-vmware.broadcom.com/vmsa_email_alert) (please subscribe for proactive notifications of security advisories)  
- [VMware Product Interoperability Matrix](https://interopmatrix.broadcom.com/Interoperability) (use to determine whether vCenter versions are compatible with ESX versions)  
- [VMware Ports & Protocols](https://ports.broadcom.com/) (assistance in determining ingress and egress firewall rule sets)  
- [VMware vSphere Critical Patch Downloads](https://support.broadcom.com/group/ecx/productdownloads?subfamily=VMware+vSphere&tab=Solutions) (support.broadcom.com)  
- [Asynchronous Patching Guide, KB 88287](https://knowledge.broadcom.com/external/article?legacyId=88287) (the patching path for VMware Cloud Foundation 5.x)

## Note on Product Naming

VMware Cloud Foundation 9.0 and VMware vSphere Foundation 9.0 change the name of the hypervisor from VMware ESXi to VMware ESX. Moving forward, the terms "ESX" and "ESXi" may be used interchangeably to refer to current, supported hypervisor versions. Patch and build identifiers still carry the ESXi prefix.

## Questions & Answers

### 1. Who does this affect?

You are affected if you are running any version of VMware ESX, VMware vCenter, VMware Workstation, or VMware Fusion prior to the versions listed as "fixed" in the VMSA. This includes ESX and vCenter deployed standalone and as part of VMware Cloud Foundation, VMware vSphere Foundation, VMware Telco Cloud Platform, and VMware Telco Cloud Infrastructure.

For a definitive list of affected versions, please refer to the VMSA directly. If there is any uncertainty about whether a system is affected, presume it is vulnerable and take action immediately.

### 2. When do I need to act?

These issues qualify under ITIL methodologies as an emergency change, requiring prompt action from your organization. However, the specific response timing depends on your unique circumstances. Consult immediately with your organization's information security staff. They will assess the situation and determine the most appropriate course of action for your specific organizational context.

### 3. What should I do to protect myself?

Install one of the fixed versions listed in the VMware Security Advisory. Patches are cumulative, so versions newer than the ones listed also resolve these issues.

### 4. What products are affected?

VMware ESX, VMware vCenter, VMware Workstation, and VMware Fusion. Any product that contains ESX or vCenter is therefore also affected, including VMware Cloud Foundation, VMware vSphere Foundation, VMware Telco Cloud Platform, and VMware Telco Cloud Infrastructure.

### 5. What CVE numbers are involved in these disclosures?

Five: CVE-2026-59309 (vCenter authentication bypass), CVE-2026-59310 (vCenter directory traversal), CVE-2026-47876 (ESX VMXNET3 out-of-bounds write), CVE-2026-41703 (ESX, Workstation, and Fusion out-of-bounds read), and CVE-2026-41709 (ESX insufficient logging).

### 6. What is the severity of the vulnerabilities?

The advisory as a whole is rated Critical. Individual scores range from 2.7 to 9.8, scored using version 3.1 of the Common Vulnerability Scoring System (CVSS).

### 7. Are there additional details about the vectors of the vulnerabilities?

VMware Security Advisories link to the FIRST CVSS v3.1 calculator with the vectors pre-filled for the individual vulnerabilities. This information is found in the References section of the advisory.

### 8. Are the vulnerabilities being exploited “in the wild?”

Broadcom has no information to suggest that exploitation of these issues has occurred in the wild. This document will be updated with new information as it becomes available.

### 9. Is this a “VM escape?”

Yes, for CVE-2026-47876. An attacker who already holds local administrative privileges inside a virtual machine that uses the VMXNET3 virtual network adapter may execute code on the ESX host. Virtual machines that use other virtual network adapters are not affected by that issue. Update ESX to resolve it.

CVE-2026-41703 is not. It can disclose information or cause a denial-of-service condition in the host process, but it does not permit code execution on the host. On Workstation and Fusion, its effect is limited to information disclosure.

### 10. Would using non-paravirtualized devices, like e1000, be safer?

Virtual machines that use other virtual network adapters are not affected by CVE-2026-47876, but changing adapter types is not a sound general strategy. Non-paravirtualized devices, such as the e1000 virtual NIC, have also had vulnerabilities in their drivers. Switching to them would also forgo the performance improvements that paravirtualized drivers provide, which can improve I/O by as much as 40%. Update ESX rather than changing virtual hardware.

### 11. Do I have to update VMware vCenter?

Yes. vCenter is affected by CVE-2026-59309 and CVE-2026-59310.

### 12. Do I have to update VMware ESX?

Yes. ESX is affected by CVE-2026-47876, CVE-2026-41703, and CVE-2026-41709.

### 13. Do I have to update VMware Workstation or VMware Fusion?

Yes. VMware Workstation 25H2 and VMware Fusion 25H2 are affected by CVE-2026-41703 and are fixed in 26H1. On Workstation and Fusion the issue is rated Low, with a CVSSv3 base score of 2.7, and its effect is limited to information disclosure.

### 14. Do I have to update VMware Tools?

No. VMXNET3 has an in-guest driver, but CVE-2026-47876 is on the ESX side of the communication and is resolved by updating ESX.

Broadcom always recommends applying in-guest VMware Tools updates as part of routine maintenance. The VMXNET3 and VMware Paravirtual SCSI (PVSCSI) drivers are also available natively as part of guest operating system installations and driver updates directly from the guest OS vendors. Ensure that patching tools and methods, such as WSUS, include them. To be clear, though, patching ESX will resolve the issues in this VMSA.

### 15. Do I have to update SDDC Manager?

The SDDC Manager component is not directly part of this VMSA, but this release does include an update for it on VCF 9.0.2. Review the release notes to determine if the update is applicable to your environment.

### 16. Do I have to update VCF Operations or VCF Automation?

No. These components are not affected by this VMSA.

### 17. Do I have to update VMware NSX?

No. NSX is not affected by this VMSA.

### 18. Will there be a patch for VMware Cloud Foundation?

Yes, fixed versions and instructions are listed and linked in the VMSA.

### 19. Will there be a patch for VMware Telco Cloud Platform and VMware Telco Cloud Infrastructure?

Yes. Please follow the instructions linked in the VMSA itself.

### 20. Are there workarounds for these vulnerabilities?

No. There may be other mitigations and compensating controls available in your organization, depending on your security posture, defense-in-depth strategies, and configurations of perimeter firewalls and appliance firewalls. All organizations must decide for themselves whether to rely on those protections; VMware Global Support (GS) cannot decide for you what is appropriate for your organization.

For assistance that is tailored to your environment and organization please contact your account team about VMware Professional Services.

### 21. Do I have to apply other patches first before applying this patch?

No. All patches released publicly in this manner are cumulative and do not require prior patches to be applied first.

### 22. If I am not using Enhanced Linked Mode am I safe?

No. The issues in this VMSA are in vCenter itself, not in Enhanced Linked Mode (ELM), and they are present whether or not you use ELM. Update vCenter.

### 23. If I am not using Integrated Windows Authentication am I safe?

No. Integrated Windows Authentication (IWA) is not involved in this advisory, and none of the five issues relate to Active Directory integration. The vCenter issues are in vCenter itself and are present regardless of how you have configured identity sources. Updating vCenter resolves them.

### 24. What versions or builds are affected by these issues?

You are affected if you are running any version of the affected software prior to the fixed versions listed in the VMSA. Please consult the VMSA itself for the definitive list of products and affected versions. If you have a question about whether you are affected, it is likely that you are and should take action immediately.

Broadcom always recommends applying the latest updates to all software products.

### 25. How do I check the build or version number of VMware vCenter?

The build information is available in the Summary tab of the vSphere Client. It can also be queried with PowerCLI. Once you connect using `Connect-VIServer`, the build is available in the `$global:DefaultVIServer.Build` variable, and the version is available in `$global:DefaultVIServer.Version`.

### 26. How do I check the build or version number of VMware ESX?

The build information is available in the Summary tab of the vSphere Client. It can also be queried with PowerCLI:

```powershell
Get-VMHost | Select-Object Name,Version,Build
```

### 27. If I update vCenter will it affect running workloads?

No. vCenter is the management interface to a vSphere environment. You will lose the use of the vSphere Client briefly during the update, and other management methods will be similarly affected, but virtual machine and container workloads will continue to run.

### 28. If I update ESX will it affect running workloads?

Updating ESX requires a host restart. Broadcom recommends the use of vMotion to relocate virtual machines to alternate hosts while you update in a "rolling reboot" fashion. Virtual machines that cannot use vMotion will need to be powered down during the host restart.

Lower-disruption mechanisms may reduce that effect, including ESX Live Patch and vCenter Quick Patch.

### 29. Are these updates compatible with Live Patch and Quick Patch?

Some are, yes, if your environment supports Live Patch on ESX, or Quick Patch on vCenter. Check the release notes for the versions listed in the VMSA to see which mechanisms apply to these patches.

Live Patch was introduced in VMware ESX 8.0.3, and the scope of issues that can be live-patched has improved with every successive release. Beginning in VCF 9.1, hosts that use a TPM are also eligible for Live Patch. vCenter has an equivalent mechanism, Quick Patch.

The Cloud Foundation blog also has more information about [VMware vCenter Quick Patch](https://blogs.vmware.com/cloud-foundation/2026/05/12/vcenter-quick-patch/) and [VMware ESX Live Patch](https://blogs.vmware.com/cloud-foundation/2025/07/15/live-patch-gets-even-better-in-vsphere-with-vmware-cloud-foundation-9-0/). Whether an update supports Live Patch depends on the type of issue, its complexity, the effect on system stability, and the source and target versions, among other criteria.

### 30. Can I use the vCenter VAMI to apply these updates?

Yes. The patch is available through the standard update mechanisms for VMware vSphere and VMware Cloud Foundation. Consult the product documentation for the version of the product you use.

### 31. Are there any known issues with this patch?

Yes. Some updates cause a “back in time” upgrade restriction. See question 38.

### 32. Does this impact VMware vSphere 6.5 or 6.7?

Presume that it does. Broadcom does not evaluate products past their End of General Support dates as part of security advisories, and downlevel versions that the VMSA does not list should be assumed to be affected.

### 33. Does this impact VMware vSphere 7.0?

Yes. VMware vSphere 7 reached End of General Support on October 2, 2025. If your organization has an extended support contract, please use those processes to request patches for these issues on vSphere 7.

### 34. Do I have to update to vSphere 8 Update 3 to receive this patch on vSphere 8?

Not necessarily. VMware vSphere 8 Update 3 is the best version of vSphere 8 and new security updates are built atop it. We strongly urge customers to apply that version, or upgrade to VVF/VCF 9.1.

Updates for vSphere 8 Update 2 will be available in the future for customers who require them.

### 35. There was a commitment made to provide critical patches for perpetual-license vSphere customers. How do I download those patches?

On April 15, 2024, Broadcom announced via blog post that all customers, including those with expired support contracts, will have access to all patches for Critical Severity Security Alerts for supported versions of VMware vSphere. This policy can be found in [KB 314603](https://knowledge.broadcom.com/external/article?articleNumber=314603).

These patches are located on support.broadcom.com. You will need to create an account, which can be done in a few minutes and at no cost.

1. Log in and choose "VMware Cloud Foundation" from the drop-down menu near the top right.  
2. Choose "My Downloads" from the menu on the left.  
3. Choose "VMware vSphere" as the product (page two of the list).  
4. Choose the "Solutions" tab.  
5. Choose the edition and version of vSphere.

A direct link to this location is in the links above. You may need to log in first and then visit the link.

### 36. I am using a third-party solution such as HPE SimpliVity, Dell EMC VxRail, and so on. Is it safe for me to apply the update?

Third-party engineered systems control their patch levels and configurations as part of their qualification and testing processes. Using security guidance that is not explicitly for that product and product version is never advised. If you use engineered and integrated solutions, please contact those vendors directly for guidance. Broadcom is not involved in, and cannot speak to, third-party product release schedules.

### 37. Are VMware Cloud and hosted products updated?

VMSA information is delivered as a message inside hosted, cloud, and software-as-a-service products where applicable. Please check the administrative consoles of those services for further relevant messages and details about this VMSA. Additional questions about the service should be answered through the support processes for that service.

### 38. Do these patches cause "back in time" upgrade issues?

Yes. A “back in time” restriction occurs when a patch updates a product branch that carries a newer build number than the target of a planned upgrade. The vSphere 8.0 and 9.0 updates in this advisory block upgrades to VMware Cloud Foundation 9.x, which report a “back in time” error. As has been the case with previous restrictions of this type, upgrade compatibility is reestablished in subsequent releases.

Organizations that are amidst an upgrade should weigh their options and timelines before applying these updates. More information about “back in time” restrictions and the compatibility matrix is available in [KB 67077](https://knowledge.broadcom.com/external/article?legacyId=67077).

## Change Log

Specific changes to this document can be tracked with GitHub's "History" and "Blame" functions (buttons above).

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.
