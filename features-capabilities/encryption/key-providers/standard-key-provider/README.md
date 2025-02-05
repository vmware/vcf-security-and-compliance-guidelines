# Standard Key Provider
The Standard Key Provider is a key provider that connects vSphere and Cloud Foundation to an external Key Management System (KMS) or Hardware Security Module (HSM) using the KMIP protocol, allowing the KMS to generate, store, and manage encryption keys separately from vSphere and Cloud Foundation.

The other key provider option is the Native Key Provider. Please visit [Key Providers in VMware vSphere and VMware Cloud Foundation](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/key-providers) for more information.

## How to Get Started

1. Configure a KMS in your environment. This is beyond the scope of this document, please follow the documentation for your KMS.
2. Ensure that your KMS is configured for redundancy and reliability. The KMS should not be hosted inside the environment it is protecting.
3. Configure a Standard Key Provider instance in your test environment, providing the KMS connection information according to your KMS documentation.
4. Ensure that the key provider is configured as the default key provider.
5. Add a vTPM to a VM to check whether the key provider is working.
6. Read the Q&A below to answer other questions you might have.

## Documentation

- [vSphere Security](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security-8-0.html) -- you will want the section on:
- [Configuring and Managing a Standard Key Provider](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security-8-0/configuring-and-managing-a-standard-key-provider.html), 

## Code Samples

You can find sample scripts pertaining to Standard Key Providers in the [code-samples](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/code-samples) directory.

## Questions & Answers

### Do you have any recommendations for KMS vendors?

Broadcom used to track key management systems (KMS) in the VMware Compatibility Guide, but this is no longer the case. KMS vendors should provide connection and compatibility information for their products in their documentation. Broadly speaking, any KMS that supports the KMIP protocol will work with the Standard Key Provider.

### What version of KMIP does Standard Key Provider support?

KMIP 1.1.

### Can I connect multiple vSphere or Cloud Foundation instances to the same KMS?

Yes. You need to do this if you intend to use Cross-vCenter vMotion to move encrypted VMs between clusters. Ensure that each key provider is named identically.

### How many keys will my environment store in the KMS?

This is a common question for environments with KMSes licensed per key. There will be one Key Encryption Key (KEK) stored in the KMS for each object that is encrypted, so:

- A KEK for each encrypted VM (vTPM or full VM encryption)
- A KEK for each vSAN disk group
- A KEK for each ESX host

So if you have 1000 VMs on 32 hosts, and each host has two vSAN disk groups, you will have 1096 keys stored in the KMS.

### Does the Standard Key Provider delete keys when they are no longer needed?

It is very difficult to tell if a key is no longer needed. You might still need a key to restore a backup or power on a DR site, for instance. That makes automatic deletion of keys potentially dangerous. As such, vSphere and Cloud Foundation do not delete encryption keys from a KMS.

### Does Standard Key Provider block deletion of the key provider if VMs are using it?

No. You can delete a key provider that is in use. If you delete a provider in error just re-add it with the same name.

If virtual machines which use that key provider are running, they will continue running, but once those virtual machines are powered off, they will be unable to power on again until the correct key provider is restored.

There is a sample script available in the [code-samples](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/code-samples) directory that can be used to audit the use of a key provider.

### I need to reduce the number of keys in my KMS. How do I do that?

Create a new KMS partition. Configure a new Standard Key Provider instance to use that KMS partition. Set the new key provider as the default key provider. Do a shallow rekey of all VMs and vSAN datastores, which will only migrate the active VMs to the new provider.

There is a sample script available in the [code-samples](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/code-samples) directory that can be used to change key providers.

### Can I share a KMS with other devices, like my tape library or storage array?

Yes. We suggest using a separate KMS partition and credentials for the different devices, in keeping with good security practices.

### Can I control which KMS in the KMS cluster is used?

Yes and no. When you configure a Standard Key Provider you enter connection information for all the nodes in the KMS cluster. vCenter will use those connections in a round-robin fashion. You cannot specify weights or priorities for the connections.

You do not have to add all KMS nodes to the key provider, so that might be a way to control which KMS node is used, but it is a bit unwieldy.

### What happens if the KMS is unavailable?

If one node of a KMS cluster is unavailable, vCenter will try the next node in the cluster until it finds a working node.

If all nodes in a KMS cluster are unavailable, vCenter and vSAN will not be able to complete cryptographic operations. If this is a situation where hosts are rebooting, the host will boot but have encryption mode errors, will not be able to mount vSAN datastores, and will not be able to run encrypted VMs.

However, if the cluster is otherwise operational, the ESX hosts will have the keys for the VMs cached, so there will not be an immediate interruption in service. See the next answer for more detail.

### What happens if vCenter is unavailable?

vSAN communicates directly with the KMS to eliminate a dependency on vCenter. If the KMS is reachable but vCenter is not, vSAN will continue to work, but not be manageable until vCenter is available again.

For other encryption operations, Standard Key Providers proxy connections to the external KMS through vCenter. If vCenter is unavailable new cryptographic operations will fail (adding a vTPM, encrypting vSAN, encrypting a VM, and so on). However, all ESX hosts cache the encryption keys for all encrypted objects in their memory, so workloads can continue to run, as well as power off and on, even if vCenter or the KMS is unavailable. In practice this tends to not be a problem, because if vCenter is unavailable there aren't new management operations going on anyway.

When vCenter or the KMS are not available, and the cluster is otherwise operational (not rebooting due to a power outage, patching, etc.), all registered VMs will continue to operate, and can be powered on, powered off, and rebooted at will. You cannot rekey the VM, as that requires interaction with the KMS, nor can you create new encrypted VMs.

The ESX encryption key cache is memory only, and by default is never written to disk or into memory dumps. If you desire, you can enable the ESX Key Persistence feature, which will store the encryption keys in the TPM-protected encrypted host configuration data. However, by doing this you make the Standard Key Provider susceptible to physical theft, just like the Native Key Provider. Someone who steals or otherwises gains access to a host with Key Persistence enabled will be able to decrypt the encrypted VMs and vSAN datastores on that host because the keys are already stored there.

### If ESX caches encryption keys, how do I clear the cache?

Reboot the ESX host.

### On reboot, will the ESX host re-download the encryption keys from the KMS?

Yes.

### How large is the communication with the KMS?

The communications between the KMS and your virtual environment will depend on how many encrypted objects (VMs, etc.) you have, with more objects meaning larger communications. However, these keys are not large, so the overall amount of traffic will be relatively small by modern standards.

### How frequent is the communication with the KMS?

As noted in several other answers, the KMS is only communicated with when vSphere/VCF requires a new key (new encrypted VM, rekeying, enablement of vSAN data-at-rest encryption, etc.), or when a host restarts and needs to retrieve keys for the encrypted objects in its cluster. Outside of that, the only communication is health checks.

### What is the maximum latency supported between a KMS and vSphere/VCF?

Follow the "Maximum latency supported between vSphere client and vCenter Server" guidance found at [configmax.broadcom.com](https://configmax.broadcom.com/guest?vmwareproduct=vSphere&release=vSphere%208.0&categories=4-0). As of this update it is 100 ms.

### What happens if the latency to my KMS is greater than the supported amount?

Support guidance is a combination of what Broadcom has tested and reasonable guidance on what will work. It does not mean it won't work, but we will not be able to support you well if you are outside the limits and encounter problems. That said, try it, as many organizations use centralized KMS to protect remote sites. Specifically test:

- Are there persistent, or intermittent, KMS health check alarms?
- What happens when a VM is first encrypted?
- What happens when vSAN data-at-rest encryption is enabled?
- What happens when a VM is rekeyed?
- What happens when vSAN is rekeyed?
- What happens when an ESX host is restarted, and is in a cluster with a number of encrypted VMs?

You might also consider placing a KMS node closer to the affected systems.

There is a temptation to enable Key Persistence in these situations, but remember that Key Persistence stores decryption information on the host, which often defeats the reason you're using a remote KMS (to mitigate the situation where an attacker gains physical access to the host). If physical access control isn't an issue for you, Native Key Provider might also be an adequate solution for enabling encryption.

### What firewall rules do I need between my KMS and vSphere/VCF?

You need to open the KMIP port (usually 5696/tcp, but can be different) on all the configured KMS nodes to client access from vCenter. If you use vSAN data-at-rest encryption, you need to open the KMIP port to client access from all ESX hosts participating in vSAN.

### I am getting alarms that my KMS is unavailable. What should I do?

Check the KMS connection information to ensure it is valid. Ensure the KMS is operational and that the correct ports are open and not blocked by firewalls. Check the latency of vCenter to the KMS.

You can create a second key provider with a different name and the same connection information to help troubleshoot.

### My KMS is unreliable. Should I turn on Key Persistence?

Key Persistence changes the threat model for the Standard Key Provider. Do not enable it unless you are confident that your environment is protected from physical theft, loss, and other related threats. While Key Persistence might help temporarily, it is far better to make the KMS stable by resolving the underlying issues.

### Can I move from Standard Key Provider to Native Key Provider, or vice-versa?

Yes. Define a new key provider, set it as the new default provider for the cluster, and then use the UI or PowerCLI to shallow rekey/re-encrypt to the new provider (instructions for rekeying are below). This will cause vSphere to re-encrypt the DEKs with a new KEK from the new key provider. A similar process is available for vSAN, too (also below).

There is a sample script available in the [code-samples](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/code-samples) directory that can be used to change key providers.

### Can I use the Standard Key Provider with a standalone host?

Organizations must use vCenter to manage the Standard Key Provider, and hosts must be inside a vSphere cluster object. However, you can put a single host inside a vCenter cluster object.

### Do I need a Trusted Platform Module 2.0 (TPM) for my ESX hosts?

While we recommend a TPM, one is not required to use the Standard Key Provider.

### Are there situations where the Standard Key Provider might not be suitable for use?

Threats and risks are something that organizations must assess for themselves when designing systems and organizational processes. Use of an external KMS can add complexity and cost to an environment, as well as introduce dependencies. Make sure that you understand the dependencies on the KMS and that you have avoided dependency loops.

### What encryption technologies work with the Standard Key Provider?

VM Encryption, vTPM, and vSAN Encryption work with Native Key Provider.

### Does ESX Configuration Encryption require a Standard Key Provider?

No.

### Do the VMware Certificate Authority (VMCA) functions use the Standard Key Provider?

No, the VMCA and its certificate operations do not use Native Key Provider, though they all use the same shared encryption libraries present in vSphere.

### Does Encrypted vSphere vMotion require the Standard Key Provider?

No. It uses the same underlying encryption libraries in vSphere, but it handles encryption operations itself. The keys used for vMotion Encryption are one-time use keys known as “nonces.” The vMotion encryption keys are ephemeral and not stored anywhere except temporarily in memory of vCenter and the two ESX hosts involved.

### Does vMotion work for virtual machines that are encrypted?

Yes, all vSphere features continue to work when you use virtual machine Encryption, vSAN Encryption, or vTPM with the Standard Key Provider.

### Can I use Cross-vCenter vMotion to migrate encrypted virtual machines?

Yes. Encrypted virtual machines need to find their key provider configured at the destination. Simply configure the same key provider, with the same name, on the destination cluster.

### Does DRS work for virtual machines that are encrypted?

Yes, all vSphere features continue to work when you use virtual machine Encryption, vSAN Encryption, or vTPM with the Standard Key Provider.

### Does vSphere HA work for virtual machines that are encrypted?

Yes, all vSphere features continue to work when you use virtual machine Encryption, vSAN Encryption, or vTPM with the Standard Key Provider.

### What is a KEK?

KEK stands for Key Encryption Key and is a key used to encrypt other encryption keys.

### What is a DEK?

DEK stands for Data Encryption Key and is the key that is used to encrypt individual virtual machine objects, like the NVRAM file where vTPM data is stored, VMDKs, etc. In vSphere, the DEK is encrypted with a KEK and written into the virtual machine configuration file for portability (replication, backups, etc.).

### Can the backups of key providers be automated?

Yes, you can use the vCenter File-Based Backup & Restore function which also backs up key provider data as part of the overall vCenter backup.

### Can I have more than one Standard Key Provider?

Yes, you can have up to 32 key providers, of any combination. However, only one key provider can be set as default.

### How does the Standard Key Provider work with Enhanced Linked Mode (ELM)?

Key providers only serve hosts that are directly attached to a vCenter, and are not automatically replicated between the vCenters that participate in Enhanced Linked Mode. Configure the individual vCenter key providers separately.

### I have many vCenters. Should I configure them all with different Standard Key Provider instances, or should I use the same one everywhere?

This is a design decision on your part, but both options are supported. If you want to use Cross-vCenter vMotion to migrate encrypted workloads between clusters you will need the same key provider configured on both the source and the destination.

### Does the virtual machine have to be off to rekey/re-encrypt it?

A re-encrypt or “shallow rekey” can be done with the virtual machine powered on and operational. It only changes the KEK/KDK. A “deep rekey” changes the Data Encryption Key (DEK), which is what protects the virtual machine configuration files and VMDKs. A deep rekey requires the virtual machine to be powered off. To change the key provider you only need to do a shallow rekey or “re-encrypt” from the vSphere Client.

### How do I do a “shallow rekey” of a VM?

A shallow rekey changes the KEK/KDK on a VM and can be done in several ways. In the vSphere Client, select the VM or VMs, right-click or “Actions,” select “VM Policies” and then “Re-encrypt.”

Alternately, use PowerCLI to automate the task:

```
$keyprovider = Get-KeyProvider -Name $keyprovidername -ErrorAction Stop
Set-VM -VM $vm -KeyProvider $keyprovider -SkipHardDisks

```


You can also put this action in a loop, which is helpful when changing between key providers:

```
foreach ($vm in Get-VM) {
    $vmview = Get-View $vm
    if ($vmview.Config.KeyId) {
        Set-VM -VM $vm -KeyProvider $keyprovider -SkipHardDisks -Confirm:$false -ErrorAction Stop
    }
}

```

You can use the vSphere API directly from a variety of languages. For more information visit [https://developer.vmware.com](https://developer.vmware.com/).

Shallow rekeys can be done while the VM is powered on. The guest OS will never know!

You can find relevant scripts in the [code-samples](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/code-samples) directory.

### How do I do a “deep rekey” of a VM?

A deep rekey changes the DEK for a VM and can be done in several ways. You can decrypt and then encrypt the VM again, or use PowerCLI to automate the task:

```
$keyprovider = Get-KeyProvider -Name $keyprovidername -ErrorAction Stop
Set-VM -VM $vm -KeyProvider $keyprovider -SkipHardDisks

```


You can use the vSphere API directly from a variety of languages. For more information visit [https://developer.vmware.com](https://developer.vmware.com/).

Deep rekeys must be done with the VM powered off.

You can find relevant scripts in the [code-samples](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/code-samples) directory.

### How can I rekey vSAN datastores?

You can configure a new key provider for vSAN in the vSphere Client, and then trigger a rekey operation from the UI. Or you can use PowerCLI:

```
$keyprovider = Get-KeyProvider -Name $keyprovidername
foreach ($cluster in Get-Cluster) {
    $clusterinfo = Get-VsanClusterConfiguration -Cluster $cluster
    if ($clusterinfo.EncryptionEnabled) {
        Write-Host "[REKEY] Rekeying vSAN datastores in $cluster to $keyprovider ($date)" -ForegroundColor Green
        Start-VsanEncryptionConfiguration -Cluster $cluster -KeyProvider $keyprovider -Confirm:$false -ErrorAction Stop | Out-Null
        Start-VsanEncryptionConfiguration -Cluster $cluster -ShallowRekey -Confirm:$false -ErrorAction Stop | Out-Null
    } else {
        Write-Host "[SKIP]  $cluster does not have an encrypted vSAN datastore ($date)" -ForegroundColor White
    }
}

```

You can find relevant scripts in the [code-samples](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/code-samples) directory.

### How can I tell if a VM is using the Standard Key Provider?

You cannot tell directly if a VM is using the Standard Key Provider, but you can find VMs that are encrypted by using the $VM.ExtensionData.Config.KeyID objects in PowerCLI, like:

```
foreach ($VM in Get-VM) {
    if ($vm.ExtensionData.Config.KeyId) {
        echo $vm.name
    }
}

```

You can find relevant scripts in the [code-samples](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/code-samples) directory.

### If I move a host with encrypted virtual machines on it to another vCenter, what will happen?

vCenter synchronizes and remediates key provider configurations every five minutes by default, controlled by the vpxd.KMS.remediationInterval vCenter advanced option. This means there is a short time where everything may appear to continue to work, but that may be deceptive.

If the same Key Provider instance is configured in both locations everything will continue to work. If not, and the virtual machines are running, they will continue running, but once those virtual machines are powered off, they will be unable to power on again until the correct key provider is imported.

If encrypted virtual machines are not running, they will become locked, and alarms will be displayed. Once the correct key provider is imported a vSphere administrator can re-enable encryption mode on the host. This will unlock all encrypted virtual machines and allow them to be powered on.

After this move, we suggest re-encrypting/re-keying virtual machines to your preferred key provider to ensure consistency.

### I use VMware Live Site Recovery. What considerations are there to ensure encrypted virtual machines can run on the DR site?

When using Site Recovery Manager, you must configure both vCenter instances with the same Key Provider. For more information see [VMware Live Site Recovery and Virtual Machine Encryption](https://techdocs.broadcom.com/us/en/vmware-cis/live-recovery/live-site-recovery/9-0/how-do-i-protect-my-environment/interoperability-of-srm-with-other-software/site-recovery-manager-and-virtual-machine-encryption.html).

### Does VMware vCenter HA support the Standard Key Provider?

Yes..

### Can I have both a Native Key Provider and a Standard Key Provider?

Yes. This is also a technique to set cross-vCenter vMotion up between sites if there isn’t a common key provider between them. Create a “migration” Native Key Provider instance on the source, import it on the destination, rekey the virtual machine to the “migration” Native Key Provider instance, and vMotion it. At the destination you can rekey the virtual machine using the desired key provider.

### Can I rename the Standard Key Provider?

Not directly. Choose the name wisely if you plan to use it elsewhere, so that you do not have name collisions. You can create a new key provider, set it as the default, and do a shallow rekey/re-encrypt to move virtual machines to the new provider. See instructions in this FAQ for more information on rekeying VMs.

An example of how to automate this process with PowerCLI is provided in the [code-samples](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/code-samples) directory.

### How often does the Standard Key Provider rotate keys?

Standard Key Provider does not rotate its keys automatically, as that could endanger other environments where that key is used.

An example of how to automate this process with PowerCLI is provided in the [code-samples](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/code-samples) directory.

### If I delete a Native Key Provider should I delete the .p12 files I’ve stored?

Whether you should delete them or not is up to you. The backup key files (.p12 files) might be necessary to decrypt replica or backed-up copies of virtual machines.

### How do I tell which virtual machines are using a key provider?

This information is visible in the virutal machine summary tab in vCenter. You can also use PowerCLI to retrieve this information. An example of this process is provided in the [code-samples](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/code-samples) directory.

### What FIPS 140-3 levels does the Standard Key Provider support?

The Standard Key Provider does not generate keys itself, so FIPS 140-3 levels are not applicable.

### Is the Standard Key Provider certified for use with PCI DSS, HIPAA, NIST 800-53, ISO 27001, etc.?

The Standard Key Provider is often used to meet data-at-rest requirements found in a variety of regulatory compliance frameworks. Compliance certification happens against implementations of software, not the software itself, and will depend on the design and implementation decisions you make when building your environment. That said, numerous environments that are subject to regulatory compliance have been built using the Standard Key Provider.

Please consult your compliance auditors for more information about how system design choices may affect your compliance goals.

### I replicate to a DR site; how will I decrypt my replicated virtual machines?

Configure the Standard Key Provider identically on the target site.

### Do I need to set the Standard Key Provider to be the default before I remove the old provider?

If you delete the key provider that was the default, you will not have a new default until you assign one (we do not have enough information to safely assign a new default so we leave it to an administrator to do). There should always be a default key provider configured.

### Are encryption keys persisted across ESX reboots?

No. On boot, ESX will retrieve the necessary keys from the KMS.

### Can I customize the length of the keys that are used for the KEK or DEK?

No, they are a fixed length and cannot be altered.

### How are Standard Key Provider keys protected in transit?

All management communications between vCenter and a KMS are protected with TLS.

### How are Standard Key Provider keys protected at rest?

This is a function of the KMS; keys provided by the KMS are not stored on the cluster.

However, if Key Persistence is enabled, the keys will be stored on the hosts using the encrypted host configuration, with the key persisted in the host TPM. This configuration is not recommended, see the discussion in previous questions.

### In theory, could an attacker get the Key Encryption Keys by monitoring network traffic on the VCSA, then be able to decrypt all the VMs that are on the same cluster?

In theory, yes, but if an attacker has this level of access they can already do whatever they want with the cluster, and would simply be wasting their time.



## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This  repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.