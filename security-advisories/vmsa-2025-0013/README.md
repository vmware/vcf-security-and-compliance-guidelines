# VMSA-2025-0013: Questions & Answers

## Introduction

On July 15, 2025, Broadcom released a critical VMware Security Advisory (VMSA), VMSA-2025-0013, addressing security vulnerabilities found and resolved as part of the response to the Pwn2Own 2025 event in Berlin, Germany.

The VMSA will always be the source of truth for which products and versions are affected and the proper patches to keep your organization secure. This document is a supplement to the advisory and includes self-service information to help you and your organization decide how to respond.

You are affected if you are running any version of VMware ESX, VMware vSphere, VMware Cloud Foundation, VMware Telco Cloud Platform, or VMware Tools prior to the versions listed as "fixed" in the VMSA. Please consult the VMSA itself for the definitive list of affected versions. If you have a question about whether you are affected, it is probable that you are and should take action immediately.

## Current Update

Updated on July 15, 2025 at 0430 PST (-0800)

## Next Expected Update

There is not a regular update schedule for this document; it will be updated as needed.

## Relevant Links

[VMware Security Advisory VMSA-2025-0013](https://support.broadcom.com/web/ecx/support-content-notification/-/external/content/SecurityAdvisories/0/35877) (the security advisory itself)  
[VMSA-2025-0013 Questions & Answers](https://brcm.tech/vmsa-2025-0013-qna) (this document’s shortened ink)  
[vSphere Security Configuration & Hardening Guides](https://brcm.tech/vcf-scg) (the reference for hardening VMware vSphere, virtual machines, and in-guest settings like VMware Tools)  
[VMware Cloud Foundation Security Advisories](https://support.broadcom.com/web/ecx/security-advisory?segment=VC) (list of all disclosed security vulnerabilities)  
[VMware Security Advisory Mailing List](https://go-vmware.broadcom.com/vmsa_email_alert) (please subscribe for proactive notifications of security advisories)  

## Note on Product Naming

VMware Cloud Foundation 9.0 and VMware vSphere Foundation 9.0 change the name of the hypervisor from VMware ESXi to VMware ESX. Moving forward, the terms "ESX" and "ESXi" may be used interchangeably to refer to current, supported hypervisor versions.

## Questions & Answers

### 1. Who does this affect?

You are affected if you are running any version of VMware ESX, VMware vSphere, VMware Tools on Microsoft Windows guest OSes, VMware Cloud Foundation, VMware Telco Cloud Platform, VMware Workstation, or VMware Fusion prior to the versions listed as "fixed" in the VMSA.

For a definitive list of affected versions, please refer to the VMSA directly. If there is any uncertainty about whether a system is affected, it should be presumed vulnerable and immediate action should be taken.

### 2. When do I need to act?

These issues qualify under ITIL methodologies as an emergency change, requiring prompt action from your organization. However, the specific response timing depends on your unique circumstances. It is advisable to consult immediately with your organization's information security staff. They will assess the situation and determine the most appropriate course of action for your specific organizational context.

### 3. What should I do to protect myself?

To ensure full protection for your organization, install one of the update versions listed in the VMware Security Advisory. Patches are cumulative; versions newer than those listed will also resolve the issues.

### 4. What products are affected?

Any products that contain VMware ESX and VMware Tools are affected, including VMware vSphere, VMware Cloud Foundation, and VMware Telco Cloud Platform. Additionally, VMware Workstation and VMware Fusion are affected.

### 5. What CVE numbers are involved in these disclosures?

CVE-2025-41236, CVE-2025-41237, CVE-2025-41238, CVE-2025-41239

### 6. What is the severity of the vulnerabilities?

CVE-2025-41236, CVE-2025-41237, CVE-2025-41238, and CVE-2025-41239 have CVSS scores ranging from 6.2 to 9.3 and are considered critical.

### 7. Are there additional details about the vectors of the vulnerabilities?

VMware Security Advisories link to the FIRST CVSS v3.1 calculator with the vectors pre-filled for the individual vulnerabilities. This information is found in the References section of the advisory.

### 8. Are the vulnerabilities being exploited “in the wild?”

Broadcom has no information to suggest that exploitation of these issues has occurred in the wild.

### 9. Is this a “VM Escape?”

Yes. This is a situation where an attacker who has already compromised a virtual machine's guest OS and gained privileged access (administrator or root) could escape into the hypervisor itself.

### 10. Is this a “0-Day?”

No. A 'zero-day' exploit is a vulnerability unknown to the vendor that can be exploited before any patch exists. The Pwn2Own contest is a legitimate security research competition where participants demonstrate previously unknown vulnerabilities to vendors in a controlled environment. Similar to the industry-standard 'coordinated disclosure' process, Pwn2Own gives vendors exclusive access to these vulnerabilities before they become public. Since Broadcom learns about the vulnerability through Pwn2Own and has the opportunity to develop and test a patch before any malicious exploitation can occur, this is NOT a 'zero-day' exploit.

### 11. Are these the “Pwn2Own” vulnerabilities?

Yes.

### 12. Do I have to update VMware vCenter?

No. While it is recommended that vCenter be maintained at the latest patch levels, this advisory does not affect vCenter directly.

### 13. Do I have to update VMware ESX?

Yes. ESX is affected by this VMSA. 

### 14. Do I need to update VMware Tools?

Yes. VMware Tools on Microsoft Windows guest OSes is affected by this advisory, and it is strongly recommended that Windows guests have their Tools updated so that the vSockets driver is updated.

Linux distributions typically use the open-vm-tools package, which is part of the distribution itself and not supplied directly by Broadcom. In this case, because Linux guest OSes are not affected, we do not suggest any additional work beyond patching the guest as usual.

### 15. Are the updated VMware Tools drivers available in Windows Update?

No. The vSockets driver that is part of this advisory is not present in Windows Update or on Microsoft Windows installation media. You will need to update VMware Tools if they are installed on Microsoft Windows guest OSes.

### 16. If I update ESX, do I have to update VMware Tools?

This advisory addresses several distinct issues across different components. Broadcom strongly recommends that you update all affected components.

### 17. Are the fixed VMware Tools bundled with ESX?

No. Due to the way VMware Tools are developed and packaged, the updated versions are not included in the base ESX installation image for this patch. To install the latest VMware Tools as part of ESX, you must add the VMware Tools Async Release component add-on to your Update Manager baseline or Lifecycle Manager image. Managing Tools asynchronously is the recommended strategy for maintaining VMware Tools as part of ESX in your environment.

More information on doing this is available as part of [KB 322293](https://knowledge.broadcom.com/external/article/322293/how-to-update-the-vmware-tools-version-i.html).

### 18. Is this patch eligible for Live Patch?

Yes, on VMware Cloud Foundation and VMware vSphere Foundation 9.0. While Live Patching was introduced in vSphere 8.0.3, its scope is much more limited than in 9.0, and there has not yet been an opportunity to use it for a patch. Traditional vMotion-based approaches are still the recommended approach for vSphere 8.

It is also worth noting that hosts employing a TPM are not eligible for live patching due to the additional security that acts to prevent changes like these (which classically have been associated with attackers but obviously are not in the case of Live Patch). Resolving this is part of our vision for the product but is not available at this time.

### 19. Do I have to apply other patches first before applying this patch?

No. All patches released publicly in this manner are cumulative, and do not require prior patches to be applied first.

### 20. I currently have an active entitlement however I cannot see all the fixed versions relating to the VMSA.

To access a patch from any version, you must have a license key of the same version to view and download. If the licenses on your site ID contain one version, you will have to upgrade or downgrade licenses to access another version. For more information about upgrading or downgrading licenses, see [Upgrade and Downgrade VMware License Keys](https://knowledge.broadcom.com/external/article/281797/upgrade-and-downgrade-vmware-license-key.html).

### 21. Do I have to update SDDC Manager?

No. SDDC Manager is not affected by this VMSA.

### 22. Do I have to update VMware Cloud Foundation Operations, Automation, or Aria Suite components?

No. These components are not affected by this VMSA.

### 23. Do I have to update VMware NSX?

No. NSX is not affected by this VMSA.

### 24. Will there be a patch for VMware Cloud Foundation?

Yes, there is an asynchronous patch for supported versions of VMware Cloud Foundation. Please follow the instructions linked in the VMSA itself.

### 25. Will there be a patch for VMware Telco Cloud Platform?

Yes. Please follow the instructions linked in the VMSA itself.

### 26. Are there workarounds for these vulnerabilities?

There are no feasible workarounds for these vulnerabilities. There may be options for defense, depending on your environment, but there are no other meaningful workarounds that do not involve updating and restarting hosts (if Live Patch is not applicable).

For assistance that is tailored to your environment and organization, please contact your account team.

### 27. If I do not install VMware Tools am I safe?

No. An attacker with privileged access to your guest operating system can install or re-enable VMware Tools themselves.

Note the VMware Tools portions of this advisory only applies to VMware Tools running on Microsoft Windows guest OSes.

### 28. What versions or builds are affected by these issues?

You are affected if you are running any version of the affected software prior to the fixed versions listed in the VMSA. Please consult the VMSA itself for the definitive list of products and affected versions. If you have a question about whether you are affected, it is likely that you are and should take action immediately.

Broadcom always recommends applying the latest updates to all software products.

### 29. How do I check the build or version number of VMware ESX?

The build information is available in the Summary tab of the vSphere Client. It can also be easily queried with PowerCLI:

```Get-VMhost | Select-Object Name,Version,Build```

### 30. If I update ESX will it affect running workloads?

Broadcom recommends the use of vMotion to relocate virtual machines to alternate hosts while you update in a "rolling reboot" fashion. Virtual machines that do not use vMotion will need to be powered down during the host restart.

### 31. How do I ensure that VMware Tools is the correct version on the ESX hosts?

VMware vSphere Lifecycle Manager allows you to include asynchronous updates for VMware Tools in the images deployed and managed on ESX hosts. Refer to [KB 322293](https://knowledge.broadcom.com/external/article/322293/how-to-update-the-vmware-tools-version-i.html) and the product documentation for more information.

### 32. Are there any known issues with this patch?

There are no known issues with the updates listed in VMSA-2025-0013 beyond the “back in time” note below.

### 33. I am amidst an upgrade, will this cause issues?

This update will trigger “back in time” warnings. Please consult the upgrade matrix for more information.

### 34. Does this impact VMware vSphere 6.5 or 6.7?

Yes. Customers should use the extended support process for access to patches. Broadcom strongly encourages all customers using products past their End of General Support dates to upgrade.

### 35. Do I have to update to vSphere 8 Update 3 to receive this patch on vSphere 8?

Yes. vSphere 8 Update 3 was released in July 2024 and is considered the best version of vSphere 8, intended for long-term stability and support.

### 36. Do I have to update to vSphere 7 Update 3 to receive this patch on vSphere 7?

Yes. vSphere 7 Update 3 was released in January 2022 and is considered the best version of vSphere 7, intended for long-term stability and support.

Please note that VMware vSphere 7 reaches its End of General Support on October 2, 2025. Please consider upgrading.

### 37. I am using a third-party solution such as HPE SimpliVity, Dell EMC VxRail, and so on. Is it safe for me to apply the update?

Third-party engineered systems control their patch levels and configurations as part of their qualification and testing processes. Using security guidance that is not explicitly for that product and product version is never advised. If you use engineered and integrated solutions, please contact those vendors directly for guidance. Broadcom is not involved in, and cannot speak to, third-party product release schedules.

### 38. Are VMware Cloud and hosted products updated?

VMSA information is delivered as a message inside hosted, cloud, and software-as-a-service products where applicable. Please check the administrative consoles of those services for further relevant messages and details about this VMSA. Additional questions about the service should be answered through the support processes for that service.

## Change Log

Specific changes to this document can be easily tracked with GitHub's versioning functions (buttons above).

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.
