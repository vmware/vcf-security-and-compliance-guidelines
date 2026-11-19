# VMSA-2026-0009: Questions & Answers

## Introduction

On November 19, 2026, Broadcom released a critical VMware Security Advisory (VMSA), VMSA-2026-0009, addressing security vulnerabilities found and resolved in VMware vCenter, VMware SDDC Manager, and VMware Tools for Windows. These components are part of the larger VMware Cloud Foundation, VMware vSphere Foundation, VMware Telco Cloud Platform, and VMware Telco Cloud Infrastructure software stacks.

The VMSA will always be the source of truth for which products and versions are affected and the proper patches to keep your organization secure. This document is a supplement to the advisory and includes self-service information to help you and your organization decide how to respond.

The advisory covers five issues: an authentication bypass in the VMware Directory Service in vCenter, three issues in SDDC Manager (an SQL injection, an authenticated command injection, and a local privilege escalation), and a SAML token signature bypass in VMware Tools for Windows. The vCenter issue permits an attacker with network access to vCenter to bypass authentication and gain unauthorized access to the system. The SDDC Manager issues permit an authenticated attacker to read and write the SDDC Manager database, to execute arbitrary commands on the appliance, and, with administrative privileges, to elevate privileges to root. The VMware Tools issue permits an attacker with access to a local privileged process on a Windows virtual machine that is configured with guest alias mapping to elevate privileges inside that virtual machine.

You are affected if you are running any version of VMware vCenter, SDDC Manager, VMware Tools for Windows, VMware Cloud Foundation, VMware vSphere Foundation, VMware Telco Cloud Platform, or VMware Telco Cloud Infrastructure prior to the versions listed as "fixed" in the VMSA. Please consult the VMSA itself for the definitive list of affected versions. If you have a question about whether you are affected, it is likely that you are and should take action immediately.

## Current Update

This document reflects VMSA-2026-0009, the initial advisory, published November 19, 2026.

## Next Expected Update

There is not a regular update schedule for this document; it will be updated as needed.

## Relevant Links

- [VMware Security Advisory VMSA-2026-0009](https://support.broadcom.com/web/ecx/security-advisory?) (the security advisory itself)
- [VMSA-2026-0009 Questions & Answers](https://brcm.tech/vmsa-2026-0009-qna) (this document's link)
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

You are affected if you are running any version of VMware vCenter, SDDC Manager, or VMware Tools for Windows prior to the versions listed as "fixed" in the VMSA. This includes vCenter and SDDC Manager deployed standalone and as part of VMware Cloud Foundation, VMware vSphere Foundation, VMware Telco Cloud Platform, and VMware Telco Cloud Infrastructure, as well as VMware Tools installed in Windows virtual machines.

For a definitive list of affected versions, please refer to the VMSA directly. If there is any uncertainty about whether a system is affected, presume it is vulnerable and take action immediately.

### 2. When do I need to act?

The vCenter issue qualifies under ITIL methodologies as an emergency change, requiring prompt action from your organization. However, the specific response timing depends on your unique circumstances. Consult immediately with your organization's information security staff. They will assess the situation and determine the most appropriate course of action for your specific organizational context.

### 3. What should I do to protect myself?

Install one of the fixed versions listed in the VMware Security Advisory. Patches are cumulative, so versions newer than the ones listed also resolve these issues. Broadcom always recommends applying the latest updates to all software products.

### 4. What CVE numbers are involved in these disclosures?

Five: CVE-2026-123890 (vCenter authentication bypass), CVE-2026-123891 (SDDC Manager SQL injection), CVE-2026-123892 (SDDC Manager authenticated command injection), CVE-2026-123893 (SDDC Manager local privilege escalation), and CVE-2026-123894 (VMware Tools for Windows SAML token signature bypass).

### 5. What is the severity of the vulnerabilities?

The advisory as a whole is rated Critical. Individual scores range from 6.7 to 9.8, scored using version 3.1 of the Common Vulnerability Scoring System (CVSS).

### 6. Are there additional details about the vectors of the vulnerabilities?

VMware Security Advisories link to the FIRST CVSS v3.1 calculator with the vectors pre-filled for the individual vulnerabilities. This information is found in the References section of the advisory.

### 7. Is CVE-2026-123890 related to CVE-2026-59309 from VMSA-2026-0006?

CVE-2026-123890 is a new and distinct issue. All systems running software below the versions listed in the VMSA need this update.

### 8. Is this a "VM escape?"

No. None of the issues in this advisory permit code execution on an ESX host from a virtual machine. CVE-2026-123894 is a privilege escalation that stays inside the Windows guest operating system: an attacker who already has access to a local privileged process in the virtual machine may elevate privileges within that virtual machine.

### 9. Do I have to update VMware vCenter?

Yes. vCenter is affected by CVE-2026-123890.

### 10. Do I have to update VMware ESX?

No. ESX is not affected by this VMSA.

### 11. Do I have to update SDDC Manager?

Yes. SDDC Manager is affected by CVE-2026-123891, CVE-2026-123892, and CVE-2026-123893. The fixed versions are 9.1.1.0200 for 9.1.x, 9.0.2.0100 for 9.0.x, and 5.2.5 for 5.x.

### 12. I am already running SDDC Manager 9.1.1.0. Am I already protected?

Yes, for the SDDC Manager issues. The advisory notes that CVE-2026-123891 and CVE-2026-123892 were first resolved in SDDC Manager 9.1.0.0, and CVE-2026-123893 was first resolved in 9.1.1.0. SDDC Manager 9.1.1.0200 is the latest version and contains the fixes for all three. Broadcom recommends updating to the latest version.

### 13. Do I have to update VMware Tools?

Yes, in Windows virtual machines. CVE-2026-123894 affects VMware Tools for Windows 13.x, 12.x, and 11.x. It is fixed in VMware Tools 13.1.5.0 for 13.x, and in 12.5.5 for 12.x and 11.x. For 32-bit Windows, VMware Tools 12.4.10, which is part of the VMware Tools 12.5.5 release, also resolves the issue.

The advisory lists only VMware Tools for Windows. VMware Tools for other guest operating systems is not listed as affected.

Upgrading virtual machine hardware versions is not required.

When updating VMware Tools, consider using this opportunity to install the "Capsule PK" driver present in VMware Tools 13.1.5 and newer, which allows recent vCenter and ESX 8.0 and 9.1.1 versions to automatically repair deprecated Windows Secure Boot UEFI platform keys on virtual machines with a virtual Trusted Platform Module (vTPM) installed.

### 14. Do I have to update VCF Operations or VCF Automation?

No. These components are not affected by this VMSA.

### 15. Do I have to update VMware NSX?

No. NSX is not affected by this VMSA.

### 16. Do I have to update VMware Workstation or VMware Fusion?

No. Workstation and Fusion are not affected by this VMSA. However, Windows virtual machines running on Workstation and Fusion typically have VMware Tools installed. If those virtual machines might be moved or imported into a VMware Cloud Foundation or VMware vSphere Foundation environment, check that they run a fixed version of VMware Tools.

### 17. Will there be a patch for VMware Cloud Foundation?

Yes, fixed versions and instructions are listed and linked in the VMSA. VMware Cloud Foundation 5.x customers apply vCenter 8.0 U3m using the asynchronous patching process described in [KB 88287](https://knowledge.broadcom.com/external/article?legacyId=88287), and update SDDC Manager to 5.2.5.

### 18. Will there be a patch for VMware Telco Cloud Platform and VMware Telco Cloud Infrastructure?

Yes. Please follow the instructions linked in the VMSA itself.

### 19. Are there workarounds for these vulnerabilities?

Not as listed by Broadcom. There may be other mitigations and compensating controls available in your organization, depending on your security posture, defense-in-depth strategies, and configurations of perimeter firewalls and appliance firewalls. All organizations must decide for themselves whether to rely on those protections; Broadcom and VMware Global Support (GS) cannot decide for you what is appropriate for your organization.

For assistance that is tailored to your environment and organization please contact your account team about VMware Professional Services.

### 20. Do I have to apply other patches first, such as those for VMSA-2026-0008?

No. All patches released publicly in this manner are cumulative and do not require prior patches to be applied first. A single update therefore applies all updates available to that product and/or version branch, and there is no need to apply separate patches for individual CVEs. The fixed versions in this advisory also contain the fixes for VMSA-2026-0008.

### 21. Does this advisory address other recent CVEs, such as those in OpenSSH, NGINX, or Apache components?

If the CVE was mitigated or resolved as part of a previous software release then it will be addressed, given the cumulative nature of software updates.

For more information about the disposition of CVEs inside VMware Cloud Foundation 9.1 and newer, find the "CVE Status for VCF" downloadable CSV file on the "Additional Downloads" tab in the download portal.

### 22. If I am not using Enhanced Linked Mode am I safe?

No. The vCenter issue is in vCenter itself, not in Enhanced Linked Mode (ELM), and it is present whether or not you use ELM. Update vCenter.

Moving forward, ELM is deprecated in VCF 9.0 and replaced by vCenter Groups in VCF 9.1, which is a federated approach that solves the need to manage and update all ELM-connected vCenters together (which makes updates a lot easier). Please update your environment to VCF 9.1 to take advantage of this and hundreds of additional features that make maintenance easier.

### 23. How do I check the build or version number of VMware vCenter?

The build information is available in the Summary tab of the vSphere Client. It can also be queried with PowerCLI. Once you connect using `Connect-VIServer`, the build is available in the `$global:DefaultVIServer.Build` variable, and the version is available in `$global:DefaultVIServer.Version`.

### 24. How do I check the version of VMware Tools in my Windows virtual machines?

The VMware Tools version is shown in the Summary tab of each virtual machine in the vSphere Client. It can also be queried with PowerCLI:

```powershell
Get-VM | Where-Object { $_.Guest.OSFullName -like "*Windows*" } | Select-Object Name,@{N="ToolsVersion";E={$_.Guest.ToolsVersion}}
```

### 25. If I update vCenter will it affect running workloads?

No. vCenter is the management interface to a VCF environment. You will lose the use of the vSphere Client briefly during the update, and other management methods will be similarly affected, but virtual machine and container workloads will continue to run.

Some data-at-rest encryption operations against a Standard Key Provider/KMS, such as new encryption and key rotations, will be unavailable while vCenter is offline. Existing encrypted workloads, vSphere HA, and VMware vSAN continue to operate. This is the same behavior ESX and vCenter have exhibited since vSphere 6.5, so nothing new, but we mention it to note it as an operational consideration.

### 26. If I update SDDC Manager will it affect running workloads?

No. SDDC Manager manages the lifecycle of VMware Cloud Foundation components and does not run workloads. Virtual machine and container workloads continue to run while SDDC Manager is updated.

### 27. Are these updates compatible with vCenter Quick Patch?

No. The vCenter updates in this advisory are not eligible for vCenter Quick Patch.

vCenter Quick Patch was introduced in VCF 9.1 and is not present in earlier versions. The release notes for each update state whether it is eligible for Quick Patch, and an eligible update requires the system to be running the immediately preceding update (N-1) of that major version. Systems that are further behind use the conventional update methods to catch up. The Cloud Foundation blog has more information about [VMware vCenter Quick Patch](https://blogs.vmware.com/cloud-foundation/2026/05/12/vcenter-quick-patch/).

### 28. Can I use the vCenter VAMI to apply these updates?

Yes. The patch is available through the standard update mechanisms for VMware vSphere and VMware Cloud Foundation. Consult the product documentation for the version of the product you use.

### 29. Are there any known issues with this patch?

This update will cause a "Back-in-Time" issue with upgrades in progress. See question 39.

### 30. Does this impact VMware vSphere 6.5 or 6.7?

Presume that it does. Broadcom does not evaluate products past their End of General Support dates as part of security advisories, and downlevel versions that the VMSA does not list should be assumed to be affected. Broadcom strongly encourages customers running downlevel versions to upgrade to VCF 9.1.

### 31. Does this impact VMware vSphere 7.0?

Yes, and the advisory has been updated. VMware vSphere 7 reached End of General Support on October 2, 2025. If your organization has an active extended support contract, please use those support processes to request patches for these issues. Broadcom strongly encourages customers running downlevel versions to upgrade to VCF 9.1.

### 32. Do I have to update to vSphere 8 Update 3 to receive this patch on vSphere 8 or VCF 5.x?

Yes. The vCenter 8.0 fixed version in this advisory is 8.0 U3m. VMware vSphere 8 Update 3 is the best version of vSphere 8 and new security updates are built atop it. We strongly urge customers to apply that version, or upgrade to VVF/VCF 9.1. The latest patch for VMware vSphere 8.0 Update 3 contains all released security AND bug fixes, improving system confidentiality, integrity, and availability.

VMware Cloud Foundation 5.x customers apply these updates using the asynchronous patching process described in [KB 88287](https://knowledge.broadcom.com/external/article?legacyId=88287).

### 33. What is a guest alias, and how do I check for them?

A guest alias is part of the VMware Guest Authentication service (VGAuth) in VMware Tools. It maps a vSphere identity, a certificate and subject name from a SAML token issued by vCenter Single Sign-On, to an account in the guest operating system. Guest Operations requests can then authenticate to the guest with that SAML token in place of a guest username and password. A mapped alias, created with `mapCert` set to true, also lets the request omit the guest account name.

Guest aliases are stored inside the guest operating system, not on ESX or vCenter. They can be created in two ways:

- inside the guest, with the VGAuth command-line tool installed with VMware Tools (`VGAuthCLI.exe` on Windows);
- through the vSphere API `GuestAliasManager` object, which requires valid credentials for the guest account being mapped.

To check a single Windows virtual machine, run `VGAuthCLI.exe list` as an administrator in the guest.

To check at scale, query the `GuestAliasManager` through vCenter. Each query needs VMware Tools running in the guest, valid guest credentials, and the "Guest operation alias query" privilege in vSphere. The following PowerCLI example lists mapped aliases on powered-on Windows virtual machines:

```powershell
$cred = Get-Credential  # a guest OS administrator account
$auth = New-Object VMware.Vim.NamePasswordAuthentication -Property @{
    Username = $cred.UserName
    Password = $cred.GetNetworkCredential().Password
    InteractiveSession = $false
}
$guestOps = Get-View (Get-View ServiceInstance).Content.GuestOperationsManager
$aliasMgr = Get-View $guestOps.AliasManager

Get-VM | Where-Object { $_.PowerState -eq "PoweredOn" -and $_.Guest.OSFullName -like "*Windows*" } | ForEach-Object {
    $vm = $_
    try {
        $aliasMgr.ListGuestMappedAliases($vm.ExtensionData.MoRef, $auth) | ForEach-Object {
            [pscustomobject]@{
                VM       = $vm.Name
                Username = $_.Username
                Subjects = ($_.Subjects | ForEach-Object { $_.Name }) -join ", "
            }
        }
    } catch {
        Write-Warning "$($vm.Name): $($_.Exception.Message)"
    }
}
```

`ListGuestMappedAliases` returns mapped aliases only. To list the aliases for a specific guest account, call `ListGuestAliases` with that account's username. Organizations that manage Windows guests with an endpoint management tool can also run `VGAuthCLI.exe list` through that tool.

More information is in the vSphere Web Services API reference for [GuestAliasManager](https://developer.broadcom.com/xapis/vsphere-web-services-api/latest/vim.vm.guest.AliasManager.html).

### 34. If I do not use guest aliases, am I safe?

The attack vector described in the advisory requires a Windows virtual machine that is configured with guest alias mapping. However, the advisory lists no workaround for CVE-2026-123894, and guest alias configuration can change over time. Update VMware Tools as part of your response to this advisory.

### 35. Does disabling guest operations, as described in the VMware Security Configuration Guide, protect against CVE-2026-123894?

No. The Security Configuration Guide control to deactivate guest operations in VMware Tools stops guest operations requests from vSphere. CVE-2026-123894 is exploited by an attacker who already has access to a local privileged process inside the guest, which does not use that path. Disabling guest operations also does not remove guest aliases that are already configured. Update VMware Tools to resolve this issue.

Virtual machines with guest operations disabled cannot be queried through the vSphere `GuestAliasManager`, so the PowerCLI example in question 33 reports an error for them. Check those virtual machines by running `VGAuthCLI.exe list` inside the guest, directly or through an endpoint management tool.

### 36. Can I stop or uninstall VMware Tools instead of updating it?

Stopping or removing VMware Tools is not a workaround for CVE-2026-123894. Update VMware Tools to a fixed version.

VMware Tools provides services that virtual machines depend on, including time synchronization, guest operating system shutdown and restart from vSphere, heartbeats for vSphere HA virtual machine monitoring, and quiescing for backups. Removing it disables those functions. VMware Tools also provides paravirtual network and storage drivers, but Windows and Linux include those drivers natively.

### 37. I am using a third-party solution such as HPE SimpliVity, Dell EMC VxRail, and so on. Is it safe for me to apply the update?

Third-party engineered systems control their patch levels and configurations as part of their qualification and testing processes. Using security guidance that is not explicitly for that product and product version is never advised. If you use engineered and integrated solutions, please contact those vendors directly for guidance. Broadcom is not involved in, and cannot speak to, third-party product release schedules.

### 38. Are VMware Cloud and hosted products updated?

VMSA information is delivered as a message inside hosted, cloud, and software-as-a-service products where applicable. Please check the administrative consoles of those services for further relevant messages and details about this VMSA. Additional questions about the service should be answered through the support processes for that service.

### 39. Do these patches cause "Back-in-Time" upgrade issues?

A "Back-in-Time" restriction occurs when a patch updates a product branch that carries a newer build number than the target of a planned upgrade. As has been the case with previous restrictions of this type, upgrade compatibility is reestablished in subsequent releases. In this case vCenter 8.0 U3m and 9.0.2.0200 block upgrades to VCF 9.1.1, and customers should wait, briefly, for VCF 9.1.2.

Organizations that are amidst an upgrade should weigh their options and timelines before applying these updates. More information about "Back-in-Time" restrictions and the compatibility matrix is available in [KB 67077](https://knowledge.broadcom.com/external/article?legacyId=67077).

If you are amidst an upgrade and impacted by this, the two obvious options are to wait or to speed up. If you upgrade vCenter to 9.1.1 first, you can apply the security update there and still manage downlevel ESX hosts. If you opt to wait, you can work on prerequisites in the meantime, since components such as VCF Operations and the NSX Managers usually have to be upgraded ahead of vCenter.

### 40. Is the updated vCenter compatible with my ESX hosts?

Most likely, yes. In the past we have always advised that vCenter should be updated ahead of ESX hosts, but that requirement is not universally true any longer. Check the [VMware Product Interoperability Matrix](https://interopmatrix.broadcom.com/Interoperability), where you can specify "VMware vCenter" at a particular version against "VMware ESX" at another. If you use VMware vSAN, include it in the interoperability check as well. Confirm that the fixed vCenter version supports the ESX versions you already run.

### 41. Are these issues ones that were found by AI?

All of the CVEs disclosed in this advisory are attributable to specific security researchers (you can see the thanks in each of the CVE sections). We cannot speak to whether they used AI.

### 42. Do these patches contain other improvements or fixes?

These patches represent the most current versions of the products at the time of the VMSA. As noted above, the patches are cumulative and contain all previous updates. If you read the release notes you may also see other issues which were resolved, too, where the fix was ready to be made public and could be included in the update. When in doubt use the version numbers to guide your decisions.

### 43. Why is the date of the VMSA different than the date that appears for the update in the VAMI?

The date in the VAMI is the date the update was compiled and packaged internally, not the date of the advisory. Nothing can or should be inferred from the length of time between the two dates.

## Change Log

Specific changes to this document can be tracked with GitHub's "History" and "Blame" functions (buttons above).
