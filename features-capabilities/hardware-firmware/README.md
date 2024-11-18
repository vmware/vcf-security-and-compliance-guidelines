# Hardware Security Vulnerabilities and VMware Cloud Foundation

Broadcom ships CPU microcode as part of our VMware ESX hypervisor releases to help ensure a predictable and consistent execution environment for workloads. A particular ESX release will contain microcode for supported CPUs that was available during development and testing of that release, and will update CPU microcode on system boot if it is downlevel.

Our hardware partners also supply CPU microcode as part of their hardware firmware updates. In contrast to what ESX contains, hardware firmware updates are more comprehensive and address issues with UEFI firmware, management controllers and engines, chipsets, memory controllers, and other components that are out of scope for ESX. If there has been a recent vulnerability disclosure from a CPU vendor the hardware firmware may also contain newer CPU microcode than is available at that moment with ESX. As such, customers who wish to mitigate recently disclosed CPU vulnerabilities should use system firmware updates to do so.

Hardware firmware is not supplied by Broadcom. Please work with your hardware vendor to acquire and apply it. Other questions regarding hardware vulnerabilities, including those about performance and functionality changes, should also be addressed to your hardware vendor.

Security is defined by three pillars: confidentiality, integrity, and availability. Hardware firmware updates routinely address all three to create a stable and secure environment. Broadcom strongly recommends that customers maintain current hardware firmware on their systems. vSphere Lifecycle Manager can work in concert with system management tools from our hardware partners to update and manage both the ESX system image configuration and the hardware firmware revisions simultaneously. For more information see the vSphere product documentation.

## CPU Vulnerabilities and ESX Schedulers

Security flaws within CPUs pose risks to computing environments. These processor-level vulnerabilities are concerning because they can bypass existing security measures, and efforts to exploit them remain undetectable through standard security scanning tools. Unlike software patches, CPU hardware cannot be easily modified after manufacturing and deployment in servers or workstations.

While VMware ESX does not cause these vulnerabilities, its CPU scheduler can help protect against some exploits by helping to control the use of HyperThreading or Symmetric Multi-Threading (SMT). For example, the L1TF vulnerability showed that Intel CPU cores could leak data between threads. The ESX Side-Channel Aware Scheduler (SCAv1) addressed this by disabling Intel Hyper-Threading, which improved security but reduced CPU capacity. The MDS vulnerability presents similar data leakage risks between processes, making SCAv1 an effective mitigation choice. In environments with different security requirements, you may determine that using Hyper-Threading within virtual machines aligns with your security policy. For these cases, SCAv2 enables Hyper-Threading use, which helps recover some performance and capacity while maintaining appropriate security levels.

### Which Scheduler Should I Use?
The choice of scheduler depends on the workloads you are running and the security requirements of your environment. It comes down to the answers to a few questions:

#### Does any VM on the cluster or host contain data, secrets, or credentials that you would not want to be leaked to an adversary?
Most organizations must answer "yes." An adversary could be business competitors, criminal hacking groups, or state-sponsored Advanced Persistent Threat (APT) teams. These actors often target intellectual property, financial records, employee data, customer information, authentication credentials, encryption keys, digital certificates, and critical business documents.

For example, if someone accessed your Chief Financial Officer's password-protected financial projections, it could expose your organization to financial risks, legal issues, or reputational damage.

#### Does any VM have multiple users or processes where you do not want to leak secrets between those users or processes? This includes VBS, containers, terminal servers, etc.?
When selecting a scheduler, consider whether processes within a VM require different security boundaries. L1TF and MDS vulnerabilities can allow information leakage between processes. If these processes belong to different users, customers, or applications, they share the same security context, which may present unacceptable risks for your organization.

VMware ESXi supports VBS (also known as Microsoft Device Guard and Credential Guard) for Windows 10, Windows Server 2016, and Windows Server 2019 VMs since vSphere 6.7. VBS creates an isolated security environment using the Hyper-V subsystem to protect credentials and sensitive data. While VBS effectively prevents credential theft and malware attacks, both default and SCAv2 schedulers may allow information leakage. Though VBS remains beneficial even without SCAv1, factor this limitation into your security planning.

This consideration extends to terminal servers with multiple users and environments using containers or nested virtualization. For instance, a single large VM might run several distinct applications in containers, each requiring its own security boundary.

#### Does any VM run untrusted code, including Java or Javascript, or from untrusted sources?
While a knee-jerk reaction here might be “absolutely not!” you may want to consider the use of desktop OSes, web browsers, terminal servers, and the use of software available from the open Internet. Are users able to browse web sites and potentially run Javascript from uncontrolled sources? Are you using container images pulled from public registries? Do you use software modules from repositories like NPM, CPAN, PowerShell Gallery, or other places that allow public contributions? Are all software update repositories (WSUS, SCCM, Yum repositories, etc.) cryptographically signed, verified, and backed by a vendor? These are not judgments, but simply thoughts about how untrusted code might sneak into an environment and affect the answer to this question.

#### Do you have CPU capacity headroom in the cluster?
The performance impacts of these remediations affect every workload differently. That said, SCAv1 worst case performance loss is generally regarded as 30%, and SCAv2 is generally 10%. If you don’t have extra CPU headroom in your cluster you may have issues. Assuming that is the case, and you cannot tolerate slower workloads, there are options to consider.

First, while you can enable different schedulers on different hosts within a cluster, it is not a good idea to do so. Always enable the same scheduler on all hosts in a cluster. Having differing schedulers is a recipe for confusion, errors, and security & performance problems. That said, a valid approach might be to sequester workloads that need the per-process protections of SCAv1 on a separate cluster and run SCAv2 on other clusters that are compatible with the workloads’ risk.

Second, enabling SCAv2 gets you some protections, though not the full protections of SCAv1. If you need SCAv1 you should aim for SCAv1, but SCAv2 may be a stopgap.

Third, if you have enabled Enhanced vMotion Compatibility (EVC) in your clusters it is easy to add additional capacity. Simply acquire additional capacity and add it to the cluster. EVC is a tremendous “future-proofing” tool that is often overlooked when building clusters, as it masks out the differences between CPU generations so that virtual machines can vMotion seamlessly between old and new hardware. Every 18 months or so new CPUs become available, and those new CPUs always have new instructions and features that make vMotion unable to move VMs between the servers. EVC “masks” the new instructions out which allows vMotion to continue working. Later, when the whole cluster is upgraded and old equipment retired, the EVC level can be changed to support the newer CPUs, and VMs can take advantage of any newer CPU features. In practice, most enterprise workloads do not take advantage of new CPU features, and the benefit EVC brings in upgrade and expansion flexibility far outweighs any slight performance differences.

Fourth, if your hardware is aging there might be other benefits to considering a refresh, including decreasing server counts due to improvements in performance and system sizing options (which, in turn, saves data center space, power, cooling, port count, and other infrastructure costs), the opportunity to use vSAN and its data-at-rest & stretched cluster capabilities, and so on.

#### ESX Side-Channel Aware Scheduler Advanced Parameters
You can control the ESX scheduler choices using the following advanced parameters:

- hyperthreadingMitigation
- hyperthreadingMitigationIntraVM

For more information on configuring these parameters, see [Implementing Hypervisor-Specific Mitigations for Microarchitectural Data Sampling (MDS) Vulnerabilities](https://knowledge.broadcom.com/external/article/318872/implementing-hypervisorspecific-mitigati.html)

## Questions & Answers

### Q1: Are these types of vulnerabilities this specific to VMware software?
No. They are hardware vulnerabilities in server and desktop processors. All major operating systems (VMware ESXi, Microsoft Windows, Linux distributions) implement software mitigations since hardware-level fixes are unavailable. CPU vulnerabilities affect physical hardware and virtual environments equally. Check your operating system vendor's documentation for specific mitigation approaches, performance impacts, and design considerations. Note that some operating systems omit vulnerability mitigations for privileged processes to maintain performance.

### Q2: Will firewalls detect these vulnerabilities?
No, but confirm with your security vendor.

### Q3: Will endpoint detection and response (EDR) or antivirus software detect these vulnerabilities?
No, but confirm with your security vendor.

### Q4: Can new hardware resolve these issues?
Possibly. Recent Intel processors include built-in mitigations. AMD processors have different vulnerability profiles. Review your processor and hardware vendor documentation for details.

### Q5: If my CPU has mitigations built-in and I use a scheduler, will I still see performance impacts?
The SCAv1 and SCAv2 schedulers test for existing mitigations and will not apply mitigations that are already present. So no, you will not see performance impacts.

### Q6: What additional steps are needed beyond CPU scheduler changes?
After implementing new vSphere CPU scheduler settings per VMware Knowledge Base articles, enable guest operating system mitigations and restart VMs. Keep hardware firmware current to address other vulnerabilities and resolve compatibility issues with components like network interface cards.

### Q7: Does this affect cloud environments?
Yes. Confirm with your service provider that mitigations are in place.

### Q8: Must I act if my compliance framework doesn't address these issues?
Security requirements often exceed compliance standards. Most compliance frameworks require current, vendor-supported software and hardware with security updates. Consult your compliance team, VMware account representative, or technical account manager. Focus on security controls rather than mere compliance.

### Q9: Does VMware support all CPU scheduler options?
Yes, including all changes in related Knowledge Base articles.

### Q10: Will switching to SCAv2 resolve all issues?
No. Security needs vary by organisation. Evaluate business risk, cost, and potential legal implications. This decision requires input from key stakeholders (Chief Information Security Officer, Chief Financial Officer, Chief Information Officer, Chief Executive Officer).

### Q11: Why do virtual machines need a complete restart after guest OS remediation?
The ESXi hypervisor runs virtual machines as processes called virtual machine monitors. These processes manage guest OS and hardware interactions. New CPU mitigations require restarting this process through a VM power cycle. Use PowerCLI for automation.

vSphere 6.7 and newer has the vmx.reboot.powerCycle parameter. When set to true, ESXi power-cycles VMs on next restart. Enable via PowerCLI:
```Get-VM | New-AdvancedSetting -Name 'vmx.reboot.powerCycle' -value $true```
This setting will be cleared when the VM is powered off. Note that this setting is also useful for changing EVC levels.

### Q12: What is the recommended remediation sequence?
Update vCenter first, then ESXi hosts. This sequence ensures proper Enhanced vMotion Compatibility (EVC) and Distributed Resource Scheduler (DRS) coordination.

### Q13: What are the performance impacts?
Impact varies by workload. Expect up to 30% performance reduction with SCAv1 and 10% with SCAv2 in worst cases.

### Q14: Are BIOS updates needed with vSphere microcode updates?
Yes. VMware provides essential CPU instruction updates. Hardware vendors offer additional firmware updates for management engines, out-of-band controllers (iLO, iDRAC), and component firmware.

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This  repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.