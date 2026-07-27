# Confidential Computing in VMware Cloud Foundation

Confidential computing protects data *in use*: the data that lives in a virtual machine's memory while the workload is running. It extends the protection model beyond the two forms of encryption that already exist in VMware Cloud Foundation (VCF). Data-at-rest encryption (such as VM Encryption and vSAN encryption) and data-in-transit encryption (such as TLS and Encrypted vMotion) cover the first two states; confidential computing covers the third, data in use.

The CPU's encryption engine (the AMD Secure Processor or the Intel TDX module) manages per-VM encryption keys for each confidential VM, and the hardware isolates guest memory even from the hypervisor and the people who administer it. The motivation is direct: because the CPU holds the keys and the hypervisor does not, an attacker with SSH access and administrative credentials on an ESX host cannot use the hypervisor to read confidential-VM memory in cleartext. Cloud and multi-tenant isolation are secondary motivations.

The threat confidential computing addresses is access to a running VM's memory by anything other than the VM itself, including the hypervisor, other VMs, host software, external devices, and infrastructure administrators. Common target workloads include Private AI, Key Management Services, secure databases, and regulated workloads.

## How It Works

VCF supports one memory-encryption technology per CPU vendor: Intel TDX (Trust Domain Extensions) on Intel processors, and AMD SEV-SNP (Secure Encrypted Virtualization with Secure Nested Paging) on AMD EPYC processors. Both are configured the same way at the platform level and enabled per-VM through the Confidential Compute panel in vCenter.

Both rest on a similar trust model: the silicon and the guest are trusted, while the hypervisor is trusted only to keep the VM *available*, not to see its data. External devices, host software, other VMs, and the people administering the infrastructure are all untrusted. The differences between the two technologies are in the hardware mechanism, the processor and guest-OS requirements, and the attestation tooling.

## Documentation

- [Confidential Computing in VMware Cloud Foundation 9](https://www.youtube.com/watch?v=RsaYfD3P9Ns) -- video overview
- [**20251031-VCF9-Confidential-Computing.pdf**](20251031-VCF9-Confidential-Computing.pdf?raw=true) -- an overview of confidential computing concepts and their use with VCF 9
- [Confidential Computing in VMware Cloud Foundation 9.0](https://blogs.vmware.com/cloud-foundation/2025/08/06/confidential-computing-vmware-cloud-foundation-9-0/) -- VCF blog
- [Securing Virtual Machines with Intel TDX](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/9-0/vsphere-security/securing-virtual-machines-in-the-vsphere-client/securing-virtual-machines-with-intel-tdx.html)
- [Securing Virtual Machines with AMD SEV-SNP](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/9-0/vsphere-security/securing-virtual-machines-in-the-vsphere-client/securing-virtual-machines-with-amd-secure-encrypted-virtualization-secure-nested-paging.html)
- [vSphere Security](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/9-0/vsphere-security.html)

## Questions & Answers

### How is confidential computing different from encryption at rest and in transit?

At-rest encryption protects data stored on disk; in-transit encryption protects data moving across the network. Both leave data exposed in one place: host memory, where it must be in cleartext for the CPU to process it. Confidential computing closes that gap by encrypting the VM's memory while it runs, so the workload is protected in all three states. It complements, and does not replace, VM Encryption, vSAN encryption, TLS, and Encrypted vMotion.

### What is the threat model?

Confidential computing is designed so that only the VM itself (and the CPU silicon) works with the VM's memory in cleartext. The hypervisor, host software, external devices, other VMs, and infrastructure administrators are all outside that boundary. The CPU encrypts the VM's memory with per-VM keys that the hypervisor does not hold, so root-equivalent SSH access to the ESX host does not carry access to a confidential VM's memory the way it would for a conventional VM. The hypervisor is trusted only to keep the VM available, not to see its data.

### What hardware does VCF support for confidential computing?

One technology per CPU vendor: Intel TDX on Intel processors and AMD SEV-SNP on AMD EPYC processors. Both are per-VM, both treat the hypervisor as untrusted for confidentiality, and both target the same workloads (Private AI, Key Management Services, secure databases, and regulatory-compliance scenarios). They differ in the hardware mechanism, the processor and guest-OS requirements, and the attestation tooling. (Intel SGX and AMD SEV-ES are earlier, narrower data-in-use technologies; SGX protects individual application enclaves rather than a whole VM.)

### What are the requirements for Intel TDX?

- **Processors:** Intel Xeon "Emerald Rapids" (5th generation) or later.
- **Guest OS:** a guest kernel of 6.11 or newer carrying the VMware hypercall patches (for example, Ubuntu 24.10).
- **Firmware:** TDX enabled in server firmware, which requires Total Memory Encryption (TME), TME-MT, TDX, and SGX all to be enabled.
- **Virtual hardware:** VM hardware version 22 or later.
- **VM configuration:** enable per-VM with the VMX option `tdx.enable = "TRUE"` (through the Confidential Compute panel).

### How does attestation work with Intel TDX?

Attestation requires a TDX-Quote-Pod VIB installed on the host. Inside the guest, attestation reports are generated through the Linux TSM configfs subsystem.

### What vSphere features are incompatible with Intel TDX VMs?

A number of features do not work with TDX VMs: CPU and memory hotplug, Suspend/Resume, vTPM, Fault Tolerance, legacy BIOS, UEFI Secure Boot, vMotion, Instant Clone, virtual IOMMU, virtual performance monitoring counters, and in-guest VMware Tools. Plan deployments around these limitations. (An equivalent incompatibility list is not published for SEV-SNP, so do not assume the two behave identically here.)

### What are the requirements for AMD SEV-SNP?

- **Processors:** AMD EPYC "Milan" (Zen 3) or later.
- **Guest OS:** guest kernels 5.19 or newer, with 6.9 or later recommended for stability fixes. For kernels earlier than 6.5, disable unaccepted memory with `ehv.disableUnacceptedMem = TRUE`.
- **Virtual hardware:** VM hardware version 22 or later.
- **VM configuration:** enabled per-VM through the Confidential Compute panel in vCenter.

### How does AMD SEV-SNP protect and verify memory?

SEV-SNP builds on the earlier AMD SEV and SEV-ES by adding a Reverse Map Table (RMP), a hardware structure with one entry per 4 KB DRAM page that tracks page ownership and access rights. Both host and VM memory accesses are checked against the RMP to help defend against relay, aliasing, and memory re-mapping attacks. Guest page tables carry an encryption bit (the "C-bit"): C=1 marks private, encrypted memory, and C=0 marks shared, unencrypted memory used to communicate with the hypervisor.

### How does attestation work with AMD SEV-SNP?

SEV-SNP supports two models:

- **Post-boot:** generate a report with `snpguest report`, then validate it with `snpguest verify` against AMD platform certificates fetched from the AMD Key Distribution Service (KDS).
- **Pre-boot:** generate an ID Block and Authentication Information Structure with the AMD tools, specifying the expected measurements (Family ID, Image ID, Guest SVN). The hardware validates the expected measurement against the launch digest before the VM is allowed to start.

### How do Intel TDX and AMD SEV-SNP compare?

Both are per-VM, both treat the hypervisor as untrusted for data confidentiality, and both aim at the same four workload categories. The practical differences are mechanism and ecosystem. TDX relies on a TDX Module plus quote generation through a host VIB and the guest's TSM configfs interface, and its validated guest list is narrow (essentially a single Ubuntu build on kernel 6.11 or newer). SEV-SNP centers on the RMP and C-bit page model, supports a wider and older range of guest kernels, and offers both pre-boot and post-boot attestation. TDX has a published feature-incompatibility list; an equivalent list is not stated for SEV-SNP.

### How do I check confidential computing status on a host?

- **Intel TDX:** `vsish -e get /hardware/cpu/tdx/moduleInfo`, or the Managed Object Browser at `https://<host>/mob/?moid=ha-host&doPath=hardware.tdxInfo`
- **AMD SEV-SNP:** `vsish -e get /vmkModules/sev/config` and `/vmkModules/sev/status`, or the Managed Object Browser at `https://<host>/mob/?moid=ha-host&doPath=hardware.sevInfo`

### Can I see confidential computing status across my environment?

Yes, beginning with VCF Operations 9.1. The Security Operations page (under the Protect tab) shows confidential computing status collected each cycle by the vCenter adapter. For each host, it lists which CC technology the host supports (TDX or SEV-SNP) and the host's configuration status: enabled, disabled, or disabled specifically in BIOS, which distinguishes "supports but turned off" from "unsupported." For each VM, it reports the confidential-VM type. Two widgets, "Host Support for Confidential VM" (enabled / disabled / unsupported) and "Confidential VM Summary" (CC-enabled vs. CC-disabled), summarize this, and detail pages show per-host VM counts, CPU and memory capacity, and the CPU/memory allocated to confidential VMs, with column filtering, sorting, and CSV export for compliance reporting. Data rolls up to the vSphere World level, and the feature requires no special upgrade steps.

### What changed for Quick Boot in VCF 9.1?

Quick Boot lets an ESX host restart without a full firmware re-initialization, shortening maintenance windows. In VCF 9.0 it was disabled on any host with TDX or SEV-SNP enabled; VCF 9.1 re-enables it, but the two platforms get there differently:

- **Intel TDX:** the BIOS loads a firmware component (the TDX "C module") at physical boot that reserves and owns a protected, encrypted region of host memory; any read of those pages by the hypervisor or an external device raises a machine check exception. Because Quick Boot bypasses BIOS initialization, it would otherwise skip loading the C module and leave that range uninitialized. VCF 9.1 enumerates and preserves the C module's memory reservations across the Quick Boot sequence and hands that memory back intact when the VMkernel relaunches, so no full hardware reset is needed.
- **AMD SEV-SNP:** platform initialization requires the time-consuming `SNP_INIT_EX` firmware command, which must be issued on every boot, including Quick Boot, because the AMD Secure Processor needs it for SEV-SNP to function. Expect some additional boot time on SEV-SNP hosts compared to non-SEV-SNP hosts; this overhead comes from the Secure Processor firmware, not from the Quick Boot algorithm itself.

### What is the upgrade path for hosts with TDX or SEV-SNP enabled?

Upgrading a TDX or SEV-SNP host from VCF 9.0 to 9.1 requires a full reboot, not Quick Boot: because Quick Boot was disabled in 9.0, there is no Quick Boot state to preserve. That full reboot establishes the 9.1 state, after which subsequent 9.1-and-later upgrades can use Quick Boot. Upgrades from vSphere 8.0 U2/U3 to 9.1 are unaffected, because 8.x never disabled Quick Boot for confidential-computing hosts.

### How do I troubleshoot confidential computing issues?

The VMkernel log already contains TDX and SEV lines at default verbosity. For CC-specific issues you can raise the log verbosity on the TDX or SEV VMkernel modules specifically. As always, capture host firmware and platform details when working with Broadcom support.

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.
