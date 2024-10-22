# Encryption Capabilities in VMware vSphere and VMware Cloud Foundation

Introduction
------------

Encryption on computer systems comes in one of three forms:

- **Data-at-rest encryption** is the encryption of data as it is stored on
  computer systems. This is typically done at the file system level, with
  filesystem-level encryption like VM Encryption, vSAN Data-at-Rest Encryption,
  or even in-guest encryption.

- **Data-in-transit encryption** is the encryption of data as it travels between
  systems or devices. This is typically done with a protocol such as SSL or
  TLS.

- **Data-in-use encryption** is the encryption of data as it is in use by
  computer systems. This is typically done with in-memory encryption, such as
  with AMD SEV-ES, AMD SEV-SNP, Intel SGX, or Intel TDX.

VMware vSphere and VMware Cloud Foundation do all these things. 

Data-at-Rest Encryption
-----------------------

Data-at-rest encryption in VMware vSphere and Cloud Foundation can be enabled:

- For virtual machines using VM Encryption, which allows you to selectively
  encrypt some or all of the components (VMDK, configuration, etc.) of a
  virtual machine.

- For virtual machines via the virtual TPM (vTPM), which uses VM Encryption
  to selectively encrypt the VM NVRAM and swap files to protect the secrets
  held in the vTPM

- For entire vSAN datastores, as part of the data-at-rest protections in vSAN

- For ESXi hosts, where host core dumps and support bundles are encrypted, as
  they may contain data about encrypted virtual machines

- Inside the virtual machines as with any OS installation, though this is
  outside the scope of discussion here.

To enable VM Encryption, vTPM, or vSAN Data-at-Rest Encryption, you must first
configure a key provider. For more information about choosing and operating a
key provider, see our [Key Providers in VMware vSphere and VMware Cloud
Foundation](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/features-capabilities/encryption/key-providers/README.md) section.

Data-in-Transit Encryption
--------------------------

In its default configuration, VMware vSphere encrypts all internal cluster management network traffic using TLS 1.2. This includes communications between the administrators and the vSphere Client, the vSphere Client and vCenter Server, communications between vCenter Server and ESXi hosts, and default communications between ESXi hosts for vSphere HA, DRS, Content Library, vSphere Replication, vSphere Trust Authority, and Lifecycle Manager. Customers cannot disable these types of secure communications without altering the product in unsupported ways.

vSphere can be configured to use communications protocols that are unencrypted, though not recommended unless needed. Examples of this include, but are not limited to:

*   Use of LDAP, but not LDAPS, to communicate with an authentication source,
*   Use of SNMP version 1 or 2 for monitoring ESXi,
*   Use of Fibre Channel, iSCSI, or NFS to connect to storage resources without the simultanous use of VM Encryption,
*   Use of SMTP to send email alerts,
*   Use of vSAN without enabling vSAN data-in-transit encryption,

and so on. The use of these protocols is a design decision, and secure alternatives and compensating controls are available in all cases.

For unencrypted virtual machines, VMware vMotion and VMware vSphere Fault Tolerance are configured by default on a per-VM basis for “opportunistic” encryption. This means that on computing hardware that supports AES-NI it will be encrypted, and on hardware that does not support AES-NI it will fall back to unencrypted. Practically speaking, all computing hardware supported by vSphere 8 includes AES-NI CPU instructions, but to guarantee encrypted communications customers should configure those settings to “required.”

Virtual machines configured with VM Encryption and/or vTPM virtual devices will always require vMotion encryption.

The security of network communications to and from guest operating systems and workloads are the responsibility of the customer, and outside the scope of this document.

Data-in-Use Encryption
----------------------

VMware vSphere supports both Intel Software Guard Extensions (SGX) and AMD Secure Encrypted Virtualization-Encrypted State (SEV-ES) as hardware-based security technologies for confidential computing. Through vSphere, Intel SGX enables applications to create secure enclaves, which are isolated regions of memory that protect sensitive code and data from unauthorized access, even from privileged system software. For AMD SEV-ES, vSphere provides support for encrypting virtual machine register state and memory contents, protecting guest data from the hypervisor itself. When deploying secure workloads, administrators can enable these features through vSphere's management interface, allowing VMs to leverage the underlying CPU security features. While both technologies serve similar purposes in protecting sensitive workloads, they use different architectural approaches - SGX operates at the application level with enclaves, while SEV-ES works at the VM level with encrypted memory pages and CPU state.