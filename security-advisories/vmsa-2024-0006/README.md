# VMSA-2024-0006: Questions & Answers

> [!WARNING]
> This information is about an older security vulnerability and is not current. It is kept online for reference. Please review the [VMware Security Advisories web page](https://www.broadcom.com/support/vmware-security-advisories) for the latest information to protect yourself and your organizations. Thank you.

Introduction
------------

On March 5, 2024, Broadcom issued a security advisory, VMSA-2024-0006, which addresses security vulnerabilities discovered in VMware ESXi, VMware Workstation Pro & Player, and VMware Fusion. An attacker with privileged access (root or administrator) to the guest OS inside a virtual machine may use these vulnerabilities to access the hypervisor.

In short, patching these products is the fastest method to resolve the issues. Depending on your environment there may be a workaround available, via removal of USB controllers from virtual machines. That may be infeasible at scale and may impact virtual machine console access. See the Q&A below for more information.

The VMware Security Advisory (VMSA) is the definitive source for information regarding affected products and versions, workarounds, and appropriate patches necessary for maintaining your organization's security. This document serves as a supplementary guide to the advisory, providing self-service information to assist you and your organization in determining an appropriate response.

Current Update
--------------

Updated at 2000 PST (-0800) on March 5, 2024.

Next Expected Update
--------------------

There is not a regular update schedule for this document.

Questions & Answers
-------------------

### Who does this affect?

This affects customers who have deployed VMware Workstation, VMware Fusion, and/or VMware ESXi by itself or as part of VMware vSphere or VMware Cloud Foundation.

### When should I act?

In ITIL terms, this situation qualifies as an emergency change, necessitating prompt action from your organization. However, the appropriate security response varies depending on specific circumstances. It's important to consult with your organization's information security staff to decide the best course of action tailored to your organization's needs.

### How can I protect myself?

You can protect yourself and your organization by updating these products to versions at or newer than those listed in the VMSA.

### Which products are affected?

The VMSA lists all supported products and versions that are affected.

### Is vSphere 6.x affected?

Yes. Any software product past the end of its general support timeframes should be assumed to be at risk. Please upgrade to vSphere 7 or 8 as soon as possible.

If you have an extended support contract covering ESXi 6.7, 6.5, or VMware Cloud Foundation 3.x please follow the instructions in the VMSA to retrieve the updates.

### What CVE numbers are associated with these disclosures?

CVE-2024-22252, CVE-2024-22253, CVE-2024-22254, CVE-2024-22255.

### What is the severity of the vulnerabilities disclosed in this VMSA?

VMware Security Advisories determine severities using version 3.1 of the Common Vulnerability Scoring Standard (CVSS). For specific scores, please refer to the VMSA itself.

### Are there more details on the vectors of the individual vulnerabilities?

Yes, VMware Security Advisories provide links to the FIRST CVSS v3.1 calculator, with vectors pre-filled for each individual vulnerability. You can find this information in the 'References' section of the advisory.

### Are the vulnerabilities disclosed being exploited “in the wild?”

As of now, VMware is not aware of any "in the wild" exploitation of these vulnerabilities. If this situation changes, both the VMSA and this document will be updated accordingly. For proactive alerts, please subscribe to the VMSA mailing list.

### Is it necessary to patch VMware vCenter Server?

vCenter Server is not directly affected by this VMSA. Broadcom does strongly recommend keeping vCenter Server synchronized with ESXi versions.

### Is it necessary to patch VMware ESXi?

Yes; ESXi is affected by this VMSA.

### Is it necessary to patch VMware Cloud Foundation?

Yes; VMware Cloud Foundation is affected by this VMSA.

### Can I just firewall the affected products instead of patching?

All organizations have different environments and needs. Whether firewalls are appropriate compensating controls in your environment for this situation is for you and your information security staff to assess. In this particular case, the vulnerabilities can be exploited by anyone with administrator/root-level privileged access to a workload.

### Are there workarounds for these vulnerabilities?

You may be able to remove the USB controller from the VM, which may affect virtual machine console functionality. Each organization must assess for themselves how to effectively configure these measures for their environment. Broadcom strongly recommends patching to remove the vulnerability, as workarounds introduce complexity and do not resolve the underlying issue.

### Are there any downsides to using the workaround?

The workarounds listed involve removing the USB controllers from virtual machines. This may not be feasible at scale, and some supported operating systems require USB for keyboard & mouse access via the virtual console (through vCenter Server or ESXi but does not affect Remote Desktop). You may also lose some functionality such as USB passthrough.

That said, most Windows and Linux versions support use of the virtual PS/2 mouse and keyboard, and removing unnecessary devices such as USB controllers is recommended as part of the [security hardening guidance VMware publishes](http://brcm.tech/vcf-scg).

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


(If you are auditing for potentially unnecessary virtual hardware a larger list is:  "VirtualUSBController|VirtualUSBXHCIController|VirtualParallelPort|VirtualFloppy|VirtualSerialPort|VirtualHdAudioCard|VirtualEnsoniq1371|VirtualCdrom|VirtualAHCIController")

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


Replace or assign a value to the $vmname variable and uncomment the ReconfigVM line to actually make the change (it is commented here for safety). It is also set up for use with the longer hardware list from above (though you may need to run it twice to remove the AHCI controllers, because of dependencies). Also, by removing $vmname altogether you can iterate over all virtual machines in an environment (dangerous!).

As with all code samples, we provide them to assist customers who wish to automate their work. However, all environments are different, and VMware cannot take responsibility for the effects of this code sample in your environment. Please ensure that you have tested this in a controlled environment, understand the effects prior to using it in a production setting, have gained proper authorization to make these changes, and have communicated the changes to your organization prior to making them.

Snapshots also capture VM configuration, which means that you can take a snapshot of a VM for testing or to mitigate the risk of this change. It also means that snapshots of a virtual machine may contain USB controllers, so if they are reverted you may be vulnerable again. This is why patching ESXi is always recommended as the best method for securing the environment, as it eliminates the vulnerability completely. If you do take a snapshot, ensure that you remove it in a timely manner to avoid the common performance and capacity issues that can develop from long-term snapshots.

Changelog
---------

2024-03-05, 0800 PST (-0800): Initial publication.

2024-03-05, 2000 PST (-0800): Update to indicate that extended support patches are available for ESXi 6.5, 6.7, and VCF 3.x.

Disclaimer
----------

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided “AS IS.”  Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.