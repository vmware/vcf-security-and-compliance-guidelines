# VM Encryption
VM Encryption provides comprehensive data protection at rest and in transit on storage fabrics by encrypting virtual machines, including VM files, virtual disks, and snapshots. VM Encryption uses AES-256 encryption and leverages Standard or Native Key Providers. VM Encryption operates transparently to guest operating systems and applications, requiring no modifications to VMs while protecting sensitive data from unauthorized access at the storage level. The encryption is policy-driven, allowing administrators to apply encryption requirements through storage policies, and includes support for encrypted vMotion to ensure data remains protected during live migrations between hosts.

## How to Get Started

1. You will first need a key provider. Watch [Native Key Provider (NKP) and Virtual TPM (vTPM) in 10 Minutes](https://youtu.be/RzOx8FxLHf8) -- if you are new to the idea of key providers, start here. It'll take 12 minutes (Bob lied about the length). vTPM uses VM Encryption, so the topics are relevant to both vTPM and VM Encryption.
2. Try it in your test environment. Set up a Native Key Provider, then add a vTPM to a VM. Did it work? Probably. If not, you probably checked the "Require TPM" box and your hosts don't have TPMs. Delete the key provider, and restore it from the backup .P12 file again. Don't check that box this time, though.
3. Install a guest OS like Windows 11. vMotion that guest between two ESX hosts. Should be 100% uneventful.
4. Move on to encrypt more of the VM by changing the storage policy to require encryption.
5. Read through the Q&A below to answer all the rest of the questions.

## Documentation

- [vSphere Security](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security-8-0.html) -- you will want the sections on:
- [Virtual Machine Encryption](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security-8-0/virtual-machine-encryption/virtual-machine-encryption.html)
- [Configuring and Managing vSphere Native Key Provider](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security-8-0/configuring-and-managing-vsphere-native-key-provider.html), or the section on [Standard Key Providers](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security-8-0/configuring-and-managing-a-standard-key-provider.html) if that's how you would like to proceed (a Standard Key Provider is a connection to an external key management system, such as a Hardware Security Module (HSM) or a cloud-based key management service).
- [Virtual Machine Encryption Best Practices](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security-8-0/virtual-machine-encryption/virtual-machine-encryption-best-practices.html)

## Code Samples

You can find sample scripts pertaining to VM Encryption in the [code-samples](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/code-samples) directory.

## Questions & Answers

### What is VM Encryption in VMware vSphere?
VM Encryption is a feature that encrypts virtual machine files at rest, including VM configuration files (VMX), virtual disks (VMDKs), snapshots, and swap files. It uses industry-standard AES-256 encryption and integrates with key management systems to protect sensitive data from unauthorized access at the storage level. The encryption operates transparently to guest operating systems and applications, requiring no modifications to VMs while protecting data at the storage level.

### What do I need before I can start using VM Encryption?
All supported versions of vSphere and Cloud Foundation support VM Encryption. You must have a configured key provider, which can be either the Native Key Provider built into vSphere or a Standard Key Provider that connects to an external KMS. You'll also need to create an encryption storage policy in vCenter and have appropriate vSphere licensing. While vTPM is available in all editions, full VM Encryption requires Enterprise Plus licensing or VMware Cloud Foundation.

### Does VM Encryption protect data in transit on a storage fabric?
Yes, once the data is encrypted by ESX it will be transmitted in that encrypted form across the storage fabric.

### Does VM Encryption work with NFS?
Yes.

### Does VM Encryption work with iSCSI?
Yes.

### Does VM Encryption work with FCoE?
Yes.

### Does VM Encryption work with Fibre Channel?
Yes.

### Why do I need a key provider?
The encryption functions in Cloud Foundation and vSphere are modular so that you can choose the solution that best fits your environment. A key provider is a component that provides and stores the encryption keys to Cloud Foundation and vSphere.

### What is the difference between Native Key Provider and Standard Key Provider?
Native Key Provider (NKP) is built directly into vSphere and doesn't require any external key management system. It stores encryption keys locally on ESX hosts within their encrypted configuration. Standard Key Provider, on the other hand, connects to an external Key Management System (KMS) using the KMIP protocol and stores all keys externally. You'd typically choose NKP for simplicity and when you have strong physical security controls, while Standard Key Provider is better when you need centralized key management or have concerns about physical host theft.

### Do I need to encrypt the entire VM to use features like vTPM?
No, you don't need to encrypt everything. VM Encryption is granular. When you add a vTPM to a virtual machine, it only encrypts the VM configuration files and swap files, not the virtual disks (VMDKs). This gives you the flexibility to choose whether you want just the minimum encryption needed for vTPM functionality or full VM encryption including all disks. Many organizations start with vTPM-only encryption and expand later based on their security requirements.

### Will VM Encryption affect my VM's performance?
Yes. The performance impact is minimal for most workloads. You might notice an increase in CPU usage during encryption and decryption operations, and boot times may increase slightly due to the additional security measures. If your VMs are swapping to disk, there will be additional CPU overhead because the swap files are encrypted. However, during normal operations, the performance difference is typically negligible because the encryption and decryption happen at the hypervisor level very efficiently.

### How much does VM Encryption affect my VM's performance?
Broadcom cannot provide specific performance numbers for VM Encryption, because it depends heavily on the workload, your storage devices, your hardware, and your storage fabric.

### Can I still use vMotion, DRS, and HA with encrypted VMs?
Yes, all standard vSphere features continue to work normally with encrypted VMs. Encrypted VMs automatically require encrypted vMotion for security, which happens transparently. For Cross-vCenter vMotion, you'll need to ensure the same key provider is configured at both the source and destination sites, with exactly the same name. DRS and HA function exactly as they do with non-encrypted VMs, so your availability and load balancing capabilities remain intact.

### How do I actually encrypt a VM?
For new VMs, start by ensuring you have a key provider configured and set as default, and that you have an encryption storage policy created. During the VM creation wizard, you can select the encryption storage policy to encrypt the entire VM, or simply add a vTPM device which automatically encrypts the VM home files. For existing VMs, you can power off the VM and edit its settings to change the storage policy to an encryption policy, or add a vTPM device if you only need partial encryption. Some encryption operations can be done online while the VM is running.

### Can I encrypt VMs that are already running in production?
The virtual machine needs to be powered off before encryption can be enabled the first time.

### What requirements are there for encrypting a VM?
The VM must be powered off before encryption can be enabled, and there needs to be enough free space on the datastore to accommodate a second copy of the VMDK files.

### What encryption keys are used by VM Encryption?
Each encrypted object (VM, vSAN disk group, ESX host) used a Data Encryption Key (DEK) to encrypt the object configuration files. The DEK is a 256-bit key that is unique to the VM or object and generated by ESX. The DEK is stored in the VM configuration file for portability (replication, backups, etc.).

The DEK is then encrypted with a Key Encryption Key (KEK) using the key provider. If the key provider is a Standard Key Provider, the KEK is stored in the KMS. If the key provider is the Native Key Provider, the KEK is computed locally on the ESX host and stored in memory.

### What happens to my encrypted VMs if my KMS, attached to my Standard Key Provider, goes down?
Your encrypted VMs will continue running normally because ESX hosts cache the necessary encryption keys in memory. You can still power VMs on and off as needed, and all running workloads continue without interruption. You will not be able to create new encrypted VMs or perform rekey operations until your KMS is available again.

### What happens to my encrypted VMs if vCenter goes down?
If you are using Native Key Provider: nothing. Each host can operate independently of vCenter for encryption operations.

If you are using Standard Key Provider: vCenter is in the critical path for VM Encryption operations when using a Standard Key Provider and a KMS, so the answer is similar to when the KMS is unavailable. Your encrypted VMs will continue running normally because ESX hosts cache the necessary encryption keys in memory. You can still power VMs on and off as needed, and all running workloads continue without interruption. You will not be able to create new encrypted VMs or perform rekey operations until vCenter is available again. Once vCenter returns, all encryption management functionality resumes immediately, assuming the KMS is also available.

Note: vSAN data-at-rest encryption, when configured with a Standard Key Provider, talks to the KMS directly and is not impacted by vCenter being unavailable. This is to avoid a dependency loop.

### Where does the host cache the encryption keys?
In host memory. If you have the Key Persistence feature enabled, the keys will be stored on the host using the encrypted host configuration. We do not recommend using Key Persistence without careful analysis of the risks to your environment, as the network controls on a KMS are often critical to the security of your environment, especially in environments where physical access controls are not strong.

### What keys are cached by the host?
The host will cache encryption keys for all encrypted virtual machines in the cluster. This includes VMs that are powered off, and VMs that are not running on that particular host. This is done to ensure that DRS and HA operations can be performed without requiring vCenter to be available (since vCenter might be inside the cluster).

### What happens if the host reboots?
When using Native Key Provider: the host will be able to operate independently of vCenter for encryption operations.

When using Standard Key Provider: the host will attempt to retrieve the encryption keys it needs from the Standard Key Provider. vCenter is in the critical path for VM Encryption operations, so if vCenter is unavailable, the host will not be able to enter host encryption mode and run encrypted VMs. Same if the KMS is unavailable.

### Can I change from one key provider to another?
Yes, migrating between key providers is fully supported and can be done while VMs are running. You configure the new key provider, set it as the default, and then perform a "shallow rekey" operation on your VMs. This process only changes the Key Encryption Key (KEK) and doesn't require downtime. For vSAN encrypted datastores, you can trigger a similar rekey operation through the vSphere Client interface.

### What's the difference between "shallow rekey" and "deep rekey"?
A shallow rekey changes only the Key Encryption Key (KEK), which is the key that protects the actual data encryption keys. This operation can be performed while VMs are powered on and running, making it ideal for key rotation or provider changes. A deep rekey changes the Data Encryption Key (DEK) itself, which means all the encrypted data gets re-encrypted with a new key. Deep rekeys require the VM to be powered off and take longer to complete since all data must be rewritten.

### Do I need TPM hardware on my ESX hosts?
TPM hardware is not required for VM Encryption or vTPM functionality, though it's strongly recommended for enhanced security. When present, TPMs protect the host's encrypted configuration where Native Key Provider stores its keys. 

Note: if you are configuring a Native Key Provider on hosts that do not have hardware TPM 2.0, do not enable the "Use key provider only with TPM protected ESX hosts." A host will always use a TPM if it is present, even if the option is not enabled.

### What are the most common mistakes when setting up VM Encryption?
The most frequent issue is forgetting to back up the Native Key Provider before trying to use it, as vSphere won't let you proceed without a backup. Another common problem is enabling the TPM requirement when some hosts lack TPM hardware. People also sometimes forget to set a default key provider or try to access the vSphere Client via IP address instead of FQDN, which prevents proper certificate validation for backup operations. Not testing encryption in a lab environment first can lead to surprises in production, and forgetting to configure matching key providers at disaster recovery sites can cause problems during failover scenarios.

### Is VM Encryption the same as guest OS encryption (like BitLocker)?
VM Encryption and guest OS encryption operate at different layers and serve different purposes. VM Encryption protects at the hypervisor level and is completely transparent to the guest operating system, while guest OS encryption like BitLocker operates inside the VM and is managed by the guest OS. You can use both together, though be aware that double encryption may impact performance, especially when combined with vSAN encryption which would create a third layer of encryption.

### Can I use VM Encryption with vSAN?
Yes. A common occurrence of this is using vTPMs on VMs that reside on encrypted vSAN datastores.

### Is it a good idea to use multiple forms of data-at-rest encryption?
In many cases, no, because it adds complexity and significantly reduces performance.

However, some workloads may benefit from enabling in-guest encryption, to reduce trust in the virtual infrastructure administrators. The most common example is BitLocker on Windows Active Directory Domain Controllers.

For most other workloads, the ease of management that VM Encryption and vSAN encryption provide is superior to managing multiple encryption solutions and in-guest encryption.

### Can I use BitLocker with VM Encryption?
Yes. Most commonly this is done with a vTPM, and the whole VM is not encrypted.

However, you can run BitLocker on VM Encryption on vSAN encryption, if you really wanted to. This is not recommended, as it adds complexity and reduces performance (see the previous question).

### Can I use one key provider vSAN and another key provider for VM Encryption?
Yes! A design pattern you might consider is using a Standard Key Provider for vSAN, where you get protections against physical theft and/or loss of control of storage volumes, and a Native Key Provider for VM Encryption and/or vTPM.

### How do I know if a VM is encrypted?
You can check encryption status in several ways. The VM summary page in the vSphere Client shows encryption status clearly. VMs with vTPM devices will show as "Encrypted" even if their disks aren't encrypted. You can also look for encryption icons in the VM list view, or use PowerCLI to check for the presence of encryption keys in the VM configuration. The storage policy assigned to the VM also indicates whether encryption is applied.

There are also mechanisms in PowerCLI to check for encryption keys in the VM configuration.

### What happens if I lose my encryption keys?
If you lose your Native Key Provider backup (.p12 file) and don't have a vCenter backup, your encrypted VMs become permanently inaccessible. There is no backdoor or recovery method. For Standard Key Provider setups, losing access to your KMS has the same result. This is why proper backup procedures and testing recovery scenarios are absolutely critical before encrypting production workloads.

### Is there a key escrow service feature for VM Encryption?
Not as part of vSphere or Cloud Foundation.

### How do I handle encrypted VMs in my disaster recovery site?
Your DR site needs the same key provider configured as your primary site. For Native Key Provider, export the backup and import it at the DR site with the same name. For Standard Key Provider, ensure your KMS is accessible from the DR site or has a replica there. Test failover scenarios regularly to ensure encrypted VMs can be powered on at the DR site when needed.

### Can I clone an encrypted VM?
Yes, you can clone encrypted VMs. In vSphere 6.7 and 7, cloning creates an exact copy including the vTPM contents. vSphere 8 gives you the choice to either copy or replace the TPM during cloning. Be aware that cloning a VM with vTPM creates an identical TPM, which may not be desirable for some use cases like BitLocker or unique identity requirements.

### How do encryption operations affect my backup software?
Most modern backup solutions support encrypted VMs, but you should verify with your vendor. The backup software needs appropriate permissions to access encrypted VMs. Some backup solutions may have limitations with certain encryption features or require specific configurations. Always test backup and restore operations with encrypted VMs before relying on them in production.

If your backup software uses a proxy VM to directly mount the VMDKs, you will need to configure the proxy VM with VM Encryption. An easy way to accomplish this is by adding a vTPM device to the proxy VM.

Defer to your backup software vendor and their documentation.

### Can I encrypt just specific disks of a VM?
Yes, VM Encryption is applied at the disk level through storage policies. You can have different storage policies for different disks, allowing you to encrypt only sensitive data disks while leaving others unencrypted. This granular control helps optimize performance and storage efficiency when full encryption isn't required.

### What network ports need to be open for encryption to work?
For Native Key Provider, no additional ports are needed since it's built into vSphere. For Standard Key Provider, you need to open the KMIP port (typically 5696/tcp) from vCenter to your KMS. If using vSAN Encryption with a Standard Key Provider, all ESX hosts also need access to the KMS on the same port.

### How long does it take to encrypt a VM?
Initial encryption requires the VM to be powered off, and the duration depends on the size of the virtual disks and storage performance. A rough estimate is that encryption proceeds at about the same rate as your storage write speed. Shallow rekey operations are much faster, typically completing in seconds. Plan encryption operations during maintenance windows and test with similar-sized VMs to estimate timing.

### Can I decrypt a VM after it's been encrypted?
Yes, you can decrypt VMs by changing their storage policy to a non-encrypted policy. The VM must be powered off for this operation.

### What's the difference between VM Encryption and Encrypted vMotion?
VM Encryption protects data at rest on storage, while Encrypted vMotion protects data in transit during migration between hosts. They're independent features - you can use either or both. Encrypted vMotion is automatically required for encrypted VMs, but you can also enable it for non-encrypted VMs to protect data during migrations.

### How do I monitor encryption operations and key provider health?
vSphere provides alarms for key provider health and encryption operations. You can monitor these through vCenter alarms and events. Failed encryption operations, key provider connectivity issues, and certificate problems all generate specific alarms. Regular monitoring helps catch issues before they impact operations.

### Can I use different key providers for different VMs in the same cluster?
Yes, you can have multiple key providers configured and use different ones for different VMs. Different key providers can be configured as the default for different clusters.

### Can I use different key providers for different parts of a single VM?
Yes, but this is not recommended. This might happen if you changed the default key provider and didn't re-encrypt/shallow rekey the VM.

For example:

1. You have a Native Key Provider configured as the default key provider for your cluster.
2. You created a VM with a vTPM device.
3. You decided to add a Standard Key Provider as the default key provider for your cluster.
4. You added a new encrypted VMDK to that VM.

This scenario would result in the VM being encrypted with both key providers, which can be confusing and problematic.

To fix this, set the default key provider to what you prefer, and then re-encrypt/shallow rekey the VM. You will not need to power the VM off to do this.

### How does VM Encryption work with snapshots?
Snapshots of encrypted VMs are also encrypted using the same keys as the parent VM. This ensures data protection is maintained throughout the snapshot chain..

### What are the storage requirements for encrypted VMs?
When running, encrypted VMs require the same amount of storage as non-encrypted VMs. Encryption does not increase storage consumption. However, the initial encryption process will require a full copy of the VMDK files while the data is being encrypted.

Note that deduplication effectiveness will be reduced since encrypted data appears random and does not deduplicate well (or at all).

### Can I use VM Encryption with Content Libraries?
VMs with vTPM devices must be stored as VM Templates (VMTX format) in Content Libraries. You cannot export encrypted VMs directly to OVF/OVA format through the vSphere Client - the vTPM must be removed first. The OVF Tool can help automate this process with placeholder attributes.

### What should I know about encryption and deduplication?
Encryption renders data deduplication ineffective because encrypted data appears random. If your storage array relies on deduplication for space savings, expect higher storage consumption after enabling encryption. Consider this impact when planning storage capacity for encrypted workloads.

This is also true for vSAN if an encrypted VM is stored on the vSAN datastore. You might consider using vSAN data-at-rest encryption instead of VM Encryption instead, which does preserve deduplication.

### Can encrypted VMs use GPU or PCI passthrough?
Yes, encrypted VMs can use vGPUs and DirectPath I/O.

### What audit events are generated for encryption operations?
vSphere logs all encryption operations including VM encryption, decryption, rekey operations, and key provider changes. These events include username, timestamp, key IDs, and operation types. You can export these events for compliance auditing and security monitoring.

### How do I size my KMS for Standard Key Provider?
Each encrypted object (VM, vSAN disk group, ESX host) requires one key in the KMS. For example, 1000 VMs on 32 hosts with two vSAN disk groups each would need 1,096 keys. Consider this when licensing KMS solutions that charge per key or have key limits.

As noted above, you can mix & match key providers and encryption policies in the same cluster. A design pattern some organizations use is a Standard Key Provider for vSAN, where you get protections against physical theft and/or loss of control of storage volumes, and a Native Key Provider for VM Encryption and/or vTPM.

### What's the recovery process if vCenter is completely lost?
With Native Key Provider, you can rebuild vCenter and import the saved .p12 backup file to regain access to encrypted VMs. With Standard Key Provider, you need to reconfigure the KMS connection. This is why documenting your encryption configuration and testing recovery procedures is critical.

Always ensure that the key provider name remains exactly the same as the one you used when you configured the key provider, as that is how the VMs will be able to find it.

### Can I use VM Encryption with Fault Tolerance (FT)?
Encrypted VMs require encrypted Fault Tolerance logging traffic. This works automatically but requires sufficient network bandwidth for the encrypted FT logging. The performance impact is generally minimal for most workloads but should be tested for latency-sensitive applications.

### How does encryption affect thin provisioned disks?
Encryption doesn't change how thin provisioning works - thin disks remain thin after encryption.

### What happens if I accidentally delete my key provider?
If you delete an in-use key provider, the host will continue caching the encryption key so there will not be an immediate interruption in service. This is both good and bad, as you may not know there is a problem until you try to power on a VM that was encrypted with that key provider.

Immediately recreate the key provider with the same name. For Native Key Provider, restore from your backup. For Standard Key Provider, reconfigure the KMS connection.

### What is a safe way to delete a key provider?
All environments are different, but here are some general thoughts:

Audit the environment to ensure that no VMs are using the key provider before deleting it. You can do this with PowerCLI, see the Code Samples section above. You could also do a shallow rekey of all VMs, ESX keys, and vSAN datastores to ensure they are on the key provider you expect (this also causes a key roation, which is often a good thing).

Audit the environment to ensure that no storage-level or array snapshots may require the key provider if the snapshot is restored.

If you are using Native Key Provider, ensure you have a backup of the Native Key Provider instance before deleting it, so that you can restore it if needed.

If you are using a Standard Key Provider, remove the key provider but do not delete the data on the KMS.

Once the key provider is removed, reboot a single host. Did it restart without complaint? Can you vMotion an encrypted VM back to that host?

### Can I encrypt the vCenter VM itself?
Not using VM Encryption.

vCenter can reside on an encrypted vSAN datastore. 

### I have a virtual KMS appliance, can I encrypt that?
No. Very bad things happen when using a Standard Key Provider for vSAN and the KMS itself is a virtual appliance running on that same encrypted vSAN datastore.

If the KMS is unreachable no encryption operations will succeed. Plan accordingly.

### Does VM Encryption automatically rotate keys?
No. You must rotate keys either through the re-encrypt/shallow rekey process or with a PowerCLI script (see the Code Samples section above).

### What should I test before going to production?
Test the complete lifecycle: encryption, vMotion, backup/restore, key provider changes, disaster recovery failover, and host reboots. Verify your monitoring catches key provider failures. Practice recovery scenarios including vCenter rebuild and key provider restoration. Document all procedures and ensure your team is trained.

### What's the impact on Storage vMotion with encrypted VMs?
Storage vMotion of encrypted VMs works normally.

### How do I handle encryption in a stretched cluster?
For stretched clusters, ensure both sites have access to the same key provider, and that the key provider is highly available.

### What are the implications for array-based replication?
Since VM Encryption happens at the hypervisor level, array-based replication will replicate the encrypted data. Test your array-based recovery procedures to ensure encrypted VMs can be registered and powered on at the replica site.

### Can I use VM Encryption with NSX?
Yes, VM Encryption is fully compatible with NSX. The two technologies operate at different layers - VM Encryption protects data at rest while NSX can provide network encryption for data in transit. Using both provides defense in depth for sensitive workloads.

### What should I know about encryption and memory dumps?
By default, ESX never writes encryption keys to memory dumps. This means support teams can safely analyze memory dumps without risk of key exposure. However, this also means encrypted VM memory contents won't be readable in dumps, which may affect troubleshooting capabilities.

### How do I estimate the CPU overhead of encryption?
Modern CPUs with AES-NI instructions handle encryption very efficiently. Typical overhead is 2-5% for most workloads, but all workloads vary. CPU impact is higher during initial encryption, rekey operations, or if VMs are actively swapping. Monitor CPU ready time and usage during pilot deployments to understand impact in your environment.

### Can I use encryption with third-party multipathing software?
VM Encryption operates above the storage layer, so it's compatible with any multipathing solution supported by vSphere. The encryption is transparent to storage connectivity, whether using native vSphere multipathing or third-party solutions.

### What's the difference between host encryption mode and VM encryption?
Host encryption mode is an ESX state that allows the host to run encrypted VMs. It's automatically enabled when needed and doesn't encrypt the host itself. VM encryption specifically protects individual VM files. The two work together but serve different purposes in the encryption framework.

### How do I migrate from legacy encryption solutions?
If you're currently using in-guest encryption or third-party encryption tools, plan a phased migration. You can run both solutions temporarily, decrypt at the guest level, then enable VM Encryption. Test thoroughly as some legacy solutions may conflict with vSphere encryption features.

It may also be possible to use vCenter Converter or VMware HCX to help migrate.

### What happens with linked clones and encryption?
Linked clones of encrypted parent VMs inherit the encryption. However, consider the performance impact as each linked clone needs its own encryption operations. For VDI environments using linked clones, test the impact on boot storms and steady-state performance.

### Can I script encryption operations?
Yes, all encryption operations are available through PowerCLI and vSphere APIs. You can automate VM encryption, key provider management, and rekey operations. This is especially useful for large environments or when integrating encryption into existing automation workflows.

### How does encryption work with vRealize Automation?
vRealize Automation can deploy encrypted VMs through blueprints that specify encryption storage policies.

### What are the FIPS compliance considerations?
vSphere uses FIPS-validated cryptographic modules. Native Key Provider meets FIPS 140-3 Level 1 requirements (which is the limit for any software implementation). For higher FIPS levels requiring hardware security modules, use Standard Key Provider with a compliant external KMS/HSM.

### Should I encrypt temporary or test VMs?
This depends on your security policies and what data these VMs might access. Consider that encrypted VMs can't be easily moved to non-encrypted environments. Many organizations use separate key providers or policies for non-production workloads to simplify management.

### What's the impact on instant clones?
Instant clones of encrypted parent VMs are also encrypted. The encryption adds minimal overhead to the instant clone creation process. However, consider the cumulative CPU impact when creating many instant clones simultaneously, such as in VDI desktop pools.

### How do I track encryption compliance across my environment?
Use vRealize Operations or PowerCLI scripts to report on encryption status across your VMs. Create custom alarms for non-encrypted VMs that should be encrypted according to policy. Regular compliance reporting helps ensure encryption policies are consistently applied.

### Can VMs using VM Encryption be backed up?
Yes. VM Encryption is supported for backup and restore operations, however, if your backup software uses the VDDK (standard APIs for backups and restores) the data will be decrypted before being sent to the backup system. This lets your backup software do its own deduplication and compression, and operate independently of VM Encryption and vSphere key providers.

### So you're saying that my VM backups will not be encrypted?
The backup data will be protected in transit by TLS, but the VM data itself will not be encrypted. It is the responsibility of the backup software to encrypt the data again.

### Can I restore a backup to an encrypted VM?
It depends on your backup software. Many backup solutions offer the option to recreate an encrypted VM and then restore data to it. Check with your backup vendor.

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This  repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.