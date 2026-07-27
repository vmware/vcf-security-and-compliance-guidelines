# Encryption Capabilities in VMware vSphere and VMware Cloud Foundation

Introduction
------------

Encryption on computer systems comes in one of three forms:

- **Data-at-rest encryption** protects data as it is stored on computer
  systems, typically at the file system level with VM Encryption, vSAN
  Data-at-Rest Encryption, or in-guest encryption.

- **Data-in-transit encryption** protects data as it travels between
  systems or devices, typically with a protocol such as SSL or TLS.

- **Data-in-use encryption** protects data while it is in use by computer
  systems, typically with in-memory encryption such as AMD SEV-ES, AMD
  SEV-SNP, Intel SGX, or Intel TDX.

VMware vSphere and VMware Cloud Foundation support all three forms.

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

- For VMware ESX hosts, where host core dumps and support bundles are encrypted, as
  they may contain data about encrypted virtual machines

- Inside the virtual machines as with any OS installation, though this is
  outside the scope of discussion here.

To enable VM Encryption, vTPM, or vSAN Data-at-Rest Encryption, you must first
configure a key provider. For more information about choosing and operating a
key provider, see our [Key Providers in VMware vSphere and VMware Cloud
Foundation](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/features-capabilities/encryption/key-providers/README.md) section.

Data-in-Transit Encryption
--------------------------

In its default configuration, VMware vSphere encrypts all internal cluster management network traffic using TLS (TLS 1.2, with TLS 1.3 also supported in vSphere 8.0 Update 3 and newer). This includes communications between the administrators and the vSphere Client, the vSphere Client and VMware vCenter, communications between vCenter and ESX hosts, and default communications between ESX hosts for vSphere HA, DRS, Content Library, vSphere Replication, and Lifecycle Manager. Customers cannot disable these types of secure communications without altering the product in unsupported ways.

You can configure vSphere to use unencrypted protocols, but avoid them unless required. Examples include:

*   Use of LDAP, but not LDAPS, to communicate with an authentication source
*   Use of SNMP version 1 or 2 for monitoring ESX
*   Use of Fibre Channel, iSCSI, or NFS to connect to storage resources without the simultaneous use of VM Encryption
*   Use of SMTP to send email alerts
*   Use of vSAN without enabling vSAN data-in-transit encryption

The use of these protocols is a design decision, and secure alternatives and compensating controls are available in all cases.

For unencrypted virtual machines, VMware vMotion and VMware vSphere Fault Tolerance are configured by default on a per-VM basis for “opportunistic” encryption. On hardware with AES-NI, vSphere encrypts the vMotion or Fault Tolerance traffic; on hardware without AES-NI, the traffic passes unencrypted. Practically speaking, every x64 processor supported by current vSphere and VMware Cloud Foundation releases includes AES-NI CPU instructions, but customers who want these communications to require encryption, and to fail rather than fall back, should configure those settings to “required.”

Virtual machines configured with VM Encryption and/or vTPM virtual devices will always require vMotion encryption.

The security of network communications to and from guest operating systems and workloads is the responsibility of the customer, and outside the scope of this document.

Data-in-Use Encryption
----------------------

VMware vSphere supports several hardware-based security technologies for confidential computing: Intel Software Guard Extensions (SGX), AMD Secure Encrypted Virtualization-Encrypted State (SEV-ES), and, in newer VMware Cloud Foundation releases (subject to version and licensing), Intel Trust Domain Extensions (TDX) and AMD SEV-SNP.

Through vSphere, Intel SGX enables applications to create secure enclaves, which are isolated regions of memory that restrict access to sensitive code and data, even from privileged system software. SGX operates at the application level.

AMD SEV-ES encrypts virtual machine register state and memory contents, which protects guest data from the hypervisor itself. Intel TDX and AMD SEV-SNP extend this model, isolating entire virtual machines with encrypted memory and CPU state plus additional integrity protections. These technologies work at the VM level rather than the application level.

Administrators enable these features per VM in the vSphere Client.