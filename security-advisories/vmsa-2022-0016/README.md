# VMSA-2022-0016: Questions & Answers | VMware
Introduction
------------

On June 14, 2022 Intel announced security advisories addressing security vulnerabilities in Intel CPU hardware. VMware has issued a VMware Security Advisory (VMSA) covering the subset of these issues that impact VMware software and customers, detailing implications for customers who use DirectPath I/O (PCI Passthrough & SR-IOV) functionality, and offering a revision to the CPU vulnerability workarounds present in Side-Channel Aware Scheduler version 2 (SCAv2) to assist customers.

**These issues are vulnerabilities in Intel server hardware and not with VMware software**. However, VMware can use the flexibility of the vSphere platforms to help affected customers mitigate the issues. Those mitigations are what we detail in the VMSA and in this list of questions and answers.

Next Expected Update
--------------------

There is not a regular update schedule for this document. This list of questions will be updated if new questions arise; please check back before completing updates or mitigations.

Disclaimer
----------

This set of documents is intended to provide general guidance for organizations that are considering VMware solutions to help them address security and compliance requirements. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided “AS IS.” VMware makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of security and regulatory compliance requirements.

Questions & Answers
-------------------

NOTE: Please use the index on the left side to navigate, as the Q&A you need most may be near the bottom of the document. New information added after the original publication date is added to the end of the list to preserve links to the subsections.

### Who is affected?

Organizations running VMware vSphere on Intel-based server platforms, who also use DirectPath I/O (PCI Passthrough) or SR-IOV to present physical hardware directly to virtual machines.

### When do I need to act?

VMware has scored this issue as CVSS 3.8, or “Low.” It only affects organizations who use DirectPath I/O functionality to present physical hardware directly to a virtual machine. Your organization should assess if it is affected, the impact to performance and system capacity if the mitigations are applied, and then make a decision based on your organization’s tolerance for risk. See “Do I need to patch ESXi?” below for a decision tree flowchart.

### What should I do to protect myself?

If your environment uses DirectPath I/O the issues can be mitigated by disabling or limiting the use of Hyper-Threading, based on your organization’s risk tolerance and available compute capacity. On VMware vSphere this entails the use of the Side-Channel Aware CPU Schedulers, SCAv1 or SCAv2 (see below).

Use of the Side-Channel Aware Schedulers is made more complex because these CPU schedulers detect native CPU vulnerability remediations in CPU hardware and disable their own mitigations to maximize performance. To mitigate these new vulnerabilities customers will need to use the new ESXi advanced parameter VMkernel.Boot.forceHyperthreadingMitigation in order to force SCAv2 to remain active.

Alternately, improvements to vSphere 7's networking stack have dramatically reduced variable latency (jitter) and improved bandwidth. Other improvements to the way GPUs and other peripherals are handled may mean that DirectPath I/O is no longer required in your environment. Migration from DirectPath I/O to virtualized equivalents are beyond the scope of these documents. Please contact your account team and/or Technical Account Manager for assistance in evaluating those options.

### Why is the VMware classification of this issue different than Intel’s?

Context is important when assessing potential security threats. These issues impact VMware products in very specific ways that are less severe than the more generic approach used by Intel to develop their CVSS scores.

### Is using DirectPath I/O (PCI Passthrough) a problem?

Giving a guest workload direct access to system hardware entails some risk, as that guest workload forgoes the security of the hypervisor and can directly interact with peripherals. In turn, those peripherals can interact directly with system hardware.

The risks of the use of PCI Passthrough have been outlined in the VMware vSphere Security Configuration Guide since the vSphere 5.1 release. Organizations that use the feature accept the risk. For more information visit [PCI and PCIe Devices and ESXi](https://docs.vmware.com/en/VMware-vSphere/7.0/com.vmware.vsphere.security.doc/GUID-E5CFB1FB-9216-4C1D-B49A-81AAAC414025.html).

In general, VMware recommends customers use virtualized methods of accessing hardware.

### What is in the patch released by VMware?

The software release associated with VMSA-2022-0016 includes CPU microcode from Intel that mitigates CVE-2022-21123, CVE-2022-21125, and CVE-2022-21166, as well as support for a new VMkernel parameter, VMkernel.Boot.forceHyperthreadingMitigation.

There are also minor updates to other components. Please see the release notes for more information.

### What about the other Intel CVEs that were disclosed?

VMware Security Advisories (VMSAs) only cover issues relevant to VMware products. Additional vulnerabilities disclosed by Intel were evaluated and found to not impact VMware software.

### Why is there no patch for VMware vSphere 6.5?

The SCAv2 CPU scheduler which enables these new mitigations is only available on vSphere 6.7 Update 2 and newer. SCAv2 depends on architectural changes to ESXi that were made in version 6.7.

Workarounds for this issue on vSphere 6.5 include:

*   upgrading to newer vSphere versions like 7.0 U3e (preferred) or 6.7 U3r,
*   discontinuing use of DirectPath I/O,
*   ensuring that virtual machines using DirectPath I/O are maintained and operated by trusted staff and organizations.

There may be other compensating controls available, which is for you and your information security staﬀ to assess.

### What are the Side-Channel Aware Schedulers?

These types of attacks against CPU hardware are often referred to as “side-channel attacks.” Side-channel attacks are attacks on how a feature or function is implemented, rather than against the feature or function itself. CPUs are complex devices and security researchers have found ways to coerce a CPU into loading data into areas of the CPU that are not subject to full privilege checks.

These side-channel attacks are CPU vulnerabilities, in hardware, and not vulnerabilities in VMware software. However, the mitigations for many of the vulnerabilities involve disabling or limiting the scope of Hyper-Threading. VMware is in a unique position to be able to help customers flexibly and quickly control the use of Hyper-Threading using ESXi, hence the Side-Channel Aware (SCA) CPU schedulers.

SCA version 1 (SCAv1) is an ESXi CPU scheduler that does not implement Hyper-Threading. A virtual machine will never be scheduled on a “sibling” logical CPU core with a different virtual machine.

SCA version 2 (SCAv2) is an ESXi CPU scheduler that allows the use of Hyper-Threading “sibling” cores within a virtual machine that has multiple vCPUs configured.

SCAv2 is not necessarily a better version of SCAv1, they both do different things and have different impacts on performance and security.

![image-20220614100702-1](https://images.core.vmware.com/sites/default/files/inline-images/image-20220614100702-1.png)

### Does using a Side-Channel Aware Scheduler result in performance changes?

All workloads are different, but the use of Hyper-Threading typically results in 40% additional CPU capacity on a server. Conversely, disabling Hyper-Threading by using SCAv1, or by disabling Hyper-Threading in the system firmware, will reduce the system’s compute capacity.

SCAv2 allows the use of some Hyper-Threading by virtual machines with multiple vCPUs configured. Generally speaking, use of SCAv2 results in the loss of ~10% of compute capacity.

All workloads and environments are different. These schedulers are set on a per-host basis, so it is possible to enable the scheduler on one host, vMotion a workload to it, monitor that workload, and then vMotion it off if there is an unacceptable performance degradation. It isn't recommended to configure clustered ESXi hosts differently for long periods of time, however.

### What does VMkernel.Boot.forceHyperthreadingMitigation do?

Side-Channel Aware Schedulers do not apply mitigations if a CPU already has native mitigations built in. However, CPUs that have these mitigations are susceptible to these newly-disclosed vulnerabilities. A way was needed to force the Hyper-Threading mitigations to be enabled regardless of the CPU, hence VMkernel.Boot.forceHyperthreadingMitigation. Configuring this advanced parameter will force the SCAv2 scheduler to always apply mitigations.

### Is this something I need to worry about?

All environments are different, and all organizations have different tolerances for risk. Because there are performance considerations and business implications when using the Side-Channel Aware schedulers this is a discussion your organization needs to have with your security and risk management staff (if you use DirectPath I/O). Only your organization has visibility to the broader environment and risk tolerance of the enterprise, so it would not be appropriate for VMware to advise on this matter.

### Can I just firewall the affected products instead of patching or using the workaround?

CPU vulnerabilities are typically not subject to firewalls and other network-based security controls. Consult your firewall vendor for more information. All organizations have diﬀerent environments, and whether there are system designs or other compensating controls available in your environment is best determined by you and your information security staﬀ.

### If I wait to patch will the CPU microcode and new parameters be present in future updates to vSphere?

Yes, updates to products are always cumulative when it comes to security. Applying the latest updates will also apply all earlier security updates.

### Does this impact non-Intel CPUs?

This disclosure does not affect non-Intel CPUs. Please check your CPU manufacturer’s web site for information about vulnerabilities that may affect those platforms.

### Does this impact Dynamic DirectPath I/O and/or NVIDIA GRID vGPUs as well?

Yes, those are all forms of DirectPath I/O where a PCI device is being presented directly to the virtual machine.

### I have extended support on one or more of the aﬀected products. How can I get a patch for this?

Please follow the extended support process to request patches and other information.

### Are there any downsides to applying these mitigations?

There are performance & CPU capacity implications with using the SCA schedulers, as they impact the use of Hyper-Threading. See the discussion above in “Does using a Side-Channel Aware Scheduler result in performance changes?”

### Is this a vulnerability in vSphere?

No, this is a vulnerability in server hardware.

### Do I have to patch ESXi hosts?

VMware always recommends applying the latest updates to installed products and system firmware as a big part of defense-in-depth. Use the following decision tree to help determine if you should apply and/or configure these mitigations:

![image-20220614080651-1](https://images.core.vmware.com/sites/default/files/inline-images/image-20220614080651-1.png)

### If I apply these ESXi updates do I also need to update my system firmware?

System firmware updates from hardware vendors also includes updates to BIOS, management engine, and other system components outside the scope of ESXi updates. It is important to keep system firmware updated to remove attack vectors in those components, too.

### Will there be a patch for VMware Cloud Foundation?

Yes, there is an asynchronous patch for VMware Cloud Foundation. Please follow the instructions linked in the VMSA itself for patching. Once updated, the advanced settings will need to be configured on the hosts if you wish to mitigate these issues.

### What are the CVE numbers involved in VMSA-2022-0016?

CVE-2022-21123, CVE-2022-21125, CVE-2022-21166

### Can I use PowerCLI to find virtual machines with DirectPath I/O?

Yes. As with all code samples, this is provided for educational purposes and without warranty or support, and VMware assumes no responsibility for its use in your environment.

`foreach ($VM in Get-VM) {`  
    `$VMview = Get-View -VIObject $VM`  
    `$VMview.Config.Hardware.Device | Where-Object {$_.GetType().Name -match "VirtualPCIPassthrough"} | Foreach-Object {`  
        ``Write-Host "$VM`: VM has a DirectPath I/O device configured."``  
    `}`  
`}`

### Can I use PowerCLI to set the ESXi advanced parameters?

Yes. As with all code samples, this is provided for educational purposes and without warranty or support, and VMware assumes no responsibility for its use in your environment.

Also note that you cannot set VMkernel.Boot.forceHyperthreadingMitigation until the VMSA-2022-0016 or subsequent patches have been applied and the hosts restarted.

`Get-VMHost | Get-AdvancedSetting -Name VMkernel.Boot.forceHyperthreadingMitigation | Set-AdvancedSetting -Value $true`

### Can I use PowerCLI to determine if a host is using an SCA scheduler?

Yes. As with all code samples, this is provided for educational purposes and without warranty or support, and VMware assumes no responsibility for its use in your environment.

`Get-VMHost | Get-AdvancedSetting -Name` `VMkernel.Boot.HyperthreadingMitigation`  
`Get-VMHost | Get-AdvancedSetting -Name VMkernel.Boot.HyperthreadingMitigationIntraVM`

Default scheduler is VMkernel.Boot.HyperthreadingMitigation = FALSE

SCAv1 scheduler is VMkernel.Boot.HyperthreadingMitigation = TRUE and VMkernel.Boot.HyperthreadingMitigationIntraVM = TRUE

SCAv2 scheduler is VMkernel.Boot.HyperthreadingMitigation = TRUE and VMkernel.Boot.HyperthreadingMitigationIntraVM = FALSE

### I am using a third-party solution, like Dell EMC VxRail, HPE SimpliVity, and so on. Is it safe for me to apply either the workarounds or the patch?

VMware is proud of the robust partner ecosystem and community built around our products, but we cannot speak to our partners’ solutions. Nor would they want us to.

Engineered and integrated solutions like Dell EMC VxRail, HPE SimpliVity, and even VMware Cloud Foundation control their patch levels and conﬁgurations as part of their qualiﬁcation and testing processes. Using security guidance that is not explicitly for that product and product version is never advised. VMware covers VMware Cloud Foundation in our security advisory materials, but if you have additional engineered and integrated solutions in use, you should contact those vendors directly for guidance.

### I have feedback about the products and/or processes. How do I provide it to you?

VMware appreciates any and all feedback on our products and processes. Please contact your Account Executive, Solutions Engineer, or Technical Account Manager. They have processes for submitting feedback on your behalf.

Please help us help you – many features and improvements have been realized because of suggestions made by customers. If we can make life better for you, please tell us how.

### Are cloud services and hosted products patched?

VMware provides information in-product for vulnerabilities disclosed in VMware Security Advisories that may be relevant to the service.

### Does this impact use of SR-IOV?

Yes, SR-IOV is a form of PCI Passthrough and is impacted by these advisories.

Change Log
----------

All times are in Pacific Daylight (-0700)

2022-06-14, 1000: Initial release.

2022-06-15: 1200: Added information about SR-IOV being impacted.