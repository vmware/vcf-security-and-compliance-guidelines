# Key Providers in VMware vSphere and VMware Cloud Foundation

Key providers in VMware vSphere and VMware Cloud Foundation are essential security tools that manage encryption keys throughout a virtual environment. Think of them as secure digital vaults that create and distribute the keys needed to protect virtual machines and their data. These providers can either be built into vSphere/VCF (Native Key Provider) or connected to external key management systems (Standard Key Provider), ensuring that important information stays protected while virtual machines are running, being moved, or stored.

## What uses a key provider?

These vSphere and Cloud Foundation features rely on a key provider:

1. VM Encryption
2. Virtual TPM (vTPM)
3. vSAN Data-at-Rest Encryption

Encrypted vMotion, Encrypted Fault Tolerance, management network connections which use TLS encryption, VMware Certificate Authority, and ESX Encrypted Configuration DO NOT use a key provider.

## Types of Key Providers

There are two types of key providers:

- [Standard Key Provider](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/key-providers/standard-key-provider), which uses the KMIP protocol to speak to an external Key Management System (not provided as part of vSphere/VCF).

- [Native Key Provider](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/key-providers/native-key-provider), which is part of vSphere/VCF and handles encryption keys internally within the system. Anyone running vSphere 7.0.2 or VCF 4.3 or newer can use the Native Key Provider if their entire environment is running that version or newer.

## Which Key Provider Should I Use?

As with anything, it depends on your requirements. Native Key Provider is the best choice if you are looking for a fully integrated solution that is easy to use, but because the encryption keys are stored on ESX hosts, it relies on physical security. If someone can steal your host, they will be able to boot and unlock encrypted VMs and vSAN datastores on their own, and from there can attack the hypervisor using other methods, such as vulnerabilities in the hypervisor itself, to gain further access.

You can mitigate this risk by using a Standard Key Provider, which can be secured with network security controls so that someone who possesses stolen hardware cannot access the keys. However, an external KMS represents additional complexity and cost.

You can also use the key providers together. Use the Standard Key Provider with a KMS to protect vSAN datastores, and use Native Key Provider to enable vTPM. This is an increasingly common configuration and helps mitigate risks and lowers environment complexity. vSAN has its own key provider settings and does not follow the default key provider, so this configuration works well.

## Key Provider Availability

Native Key Providers are an integral part of ESX, so they are always available to the hosts regardless of vCenter availability.

Standard Key Providers proxy connections to the external KMS through vCenter, so if vCenter is unavailable new cryptographic operations will fail (adding a vTPM, encrypting vSAN, encrypting a VM, and so on). However, all ESX hosts cache the encryption keys for all encrypted objects in their memory, so workloads can continue to run, as well as power off and on, even if vCenter or the KMS is unavailable. In practice this tends to not be a problem, because if vCenter is unavailable there aren't new management operations going on anyway.

## Implementation Notes for Key Providers

You can define a total of 32 key providers per vCenter. Key providers are configured on all hosts attached to that vCenter. You cannot selectively assign key providers to hosts. However, beginning with vSphere 8.0.1 you can specify different default key providers on a per-cluster basis. All key providers will be synchronized across all hosts attached to vCenter, though, which has implications for physical security.

If you use Enhanced Linked Mode the providers are not synchronized, and will only be available to hosts that are directly attached to a particular vCenter. You will need to manually synchronize the key providers across all linked vCenter instances. You can configure (or restore, for Native Key Provider) the same provider across multiple vCenters if you want, which will enable seamless use of cross-vCenter vMotion, as well as the ability to import DR copies of encrypted VMs.

Encrypted objects find their key provider by name, so do not use the same name for different providers, even across different vCenters. It will be confusing and error-prone, especially for Native Key Provider backups where you might end up with multiple files on disk with the same name and risk overwriting one. If the provider is unique always give it a unique name. If it's shared, such as with a Standard Key Provider, always give it the same name.

Broadcom used to track key management systems (KMS) in the VMware Compatibility Guide, but this is no longer the case. KMS vendors should provide connection and compatibility information for their products in their documentation. Broadly speaking, any KMS that supports the KMIP protocol will work with the Standard Key Provider.

External KMS systems need to be highly available, and not hosted inside the environment they are protecting. This may seem obvious, but it is possible to use storage vMotion to move a virtual KMS on to a vSAN datastore which gets its encryption keys from that KMS, which will result in a data loss situation at some point in the future because of the dependency loop.

## Types of Encryption Keys

Two encryption keys are used for flexibility and security:

- Data Encryption Key (DEK) which protects the object itself. The DEK is stored in the .VMX configuration file for the virtual machine, and is encrypted with the KEK.

- Key Encryption Key (KEK) or Key Derivation Key (KDK) which protects the DEK.
  - On Standard Key Providers the KEK is stored with the KMS. There is one KEK per object (VM, disk group, etc.).
  - On Native Key Providers the KDK is used instead of the KEK, and helps compute/derive the KEK. Functionally it acts the same as the KEK, but it is not stored with the key provider.

Hosts only have one key for their core dumps and support bundles.

## Rekeying

At times it is necessary to rotate keys:

- Changing the DEK is referred to as a "deep rekey." A deep rekey of a virtual machine requires the virtual machine to be powered off, and requires enough free space on the datastore to accommodate a full   copy of the data stored by the VM. As an example, if the VM is 4.5 TB on disk you will need 4.5 TB of free space on that datastore to do a deep rekey.

  A deep rekey of vSAN does not require downtime, but will reformat/rewrite the disk groups and objects in the background, which can be time consuming (though you do not have to sit and watch it), performance-intensive on the network, and impart wear on flash/NVMe/SSD devices, reducing their lifespan.  You will need enough free space to accommodate the temporary loss of a disk group (for OSA) or the recreation of the largest objects on the datastore (for ESA). You can speed the process by checking the box to allow vSAN to reduce the redundancy it maintains, but in a production environment that is
  not advised. Just let it proceed in the background.

  Also note that the initial encryption of a VM or a vSAN volume is the same deep rekey process, including space requirements.

- Changing the KEK is referred to as a "shallow rekey." A shallow rekey of both virtual machines and vSAN can be done quickly and requires no downtime. It is relatively fast because it only re-encrypts the DEK with a new KEK. vSphere/VCF can do that operation with everything online, and workloads do not notice. A shallow rekey can be initiated from the vSphere Client by right-clicking a virtual machine and selecting "VM Policies" and then "Re-encrypt." It can also be initiated from PowerCLI using the Set-VM cmdlet. An example of that is provided in the [code-samples](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/code-samples) directory.

## Changing Key Providers

We can use the shallow rekey operation to change key providers, by instructing vSphere/VCF to get the new KEK from a different key provider. You can switch between both types of provider using this method. It is very flexible, and you get a "free" key rotation in the process, too. An example of that is provided in the [code-samples](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/features-capabilities/encryption/code-samples) directory.

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This  repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.