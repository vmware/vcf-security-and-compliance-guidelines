# Key Providers in VMware vSphere and VMware Cloud Foundation

Types of Key Providers
----------------------

To enable data-at-rest encryption, you need to configure a key provider. A
key provider does what its name suggests: provides encryption keys to the
environment. There are two types of key providers:

- Standard Key Provider, which uses the KMIP protocol to speak to an external
  Key Management System (not provided as part of vSphere/VCF). Standard Key
  Providers have been available since vSphere 6.5.

- Native Key Provider, which is part of vSphere/VCF and handles encryption
  keys internally within the system. Anyone running vSphere 7.0.2 or VCF 4.2
  or newer can use the Native Key Provider.

You can define up to 32 key providers per vCenter. Key providers are
configured on all hosts attached to that vCenter. You cannot selectively
assign key providers to hosts. Beginning with vSphere 8.0.1 you can specify
different default providers on a per-cluster basis.

If you use Enhanced Linked Mode the providers are not synchronized, and will
only be available to hosts that are directly attached to a particular vCenter.

You can configure (or restore, for Native Key Provider) the same provider
across multiple vCenters if you want, which will enable seamless use of 
cross-vCenter vMotion, as well as the ability to import DR copies of 
encrypted VMs.

Encrypted objects find their key provider by name, so do not use the same name
for different providers, even across different vCenters. It will be confusing
and error-prone, especially for Native Key Provider backups where you might
end up with multiple files on disk with the same name. 

If the provider is unique always give it a unique name. If it's shared, such as
with a Standard Key Provider, always give it the same name.

VMware (and now Broadcom) used to track key management systems (KMS) in the VMware Compatibility
Guide, but this is no longer the case. KMS vendors should provide connection and compatibility
information for their products in their documentation.

Types of Encryption Keys
------------------------

There are two keys associated with data-at-rest encryption:

- Data Encryption Key (DEK) which protects the object itself.

- Key Encryption Key (KEK) which protects the DEK.

Hosts only have one key for their core dumps and support bundles.

Two keys are used for flexibility and security. The DEK is generated inside
vSphere and stored in the .VMX configuration file for the virtual machine. To
protect it, it is encrypted with the KEK, where the KEK is stored with the key
provider.

Rekeying
--------

At times it is necessary to rotate keys:

- Changing the DEK is referred to as a "deep rekey." A deep rekey of a virtual
  machine requires the virtual machine to be powered off, and requires enough
  free space on the datastore to accommodate a full copy of the data stored
  by the VM. As an example, if the VM is 4.5 TB on disk you will need 4.5 TB
  of free space on that datastore to do a deep rekey.

  A deep rekey of vSAN does not require downtime, but will reformat/rewrite the
  disk groups and objects in the background, which can be time consuming (though
  you do not have to sit and watch it), performance-intensive on the network,
  and impart wear on flash/NVMe/SSD devices, reducing their lifespan. 
  You will need enough free space to accommodate the temporary loss of a disk
  group (for OSA) or the recreation of the largest objects on the datastore
  (for ESA). You can speed the process by checking the box to allow vSAN to
  reduce the redundancy it maintains, but in a production environment that is
  not advised. Just let it proceed in the background.

  Also note that the initial encryption of a VM or a vSAN volume is the same
  deep rekey process, including space requirements.

- Changing the KEK is referred to as a "shallow rekey." A shallow rekey of
  both virtual machines and vSAN can be done quickly and requires no downtime.
  It is relatively fast because it only re-encrypts the DEK with a new
  KEK. vSphere/VCF can do that operation with everything online, and workloads
  do not notice.

Changing Key Providers
----------------------

We can use the shallow rekey operation to change key providers, by instructing
vSphere/VCF to get the new KEK from a different key provider. You can switch
between both types of provider using this method. It is very flexible, and you
get a "free" key rotation in the process, too.

Disclaimer
----------

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This  repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.