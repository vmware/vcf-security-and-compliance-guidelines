# vSAN Data-at-Rest Encryption

vSAN Data-at-Rest Encryption encrypts data on the vSAN datastore itself, protecting against threats such as physical theft of storage devices and improper decommissioning of hardware. It is configured per cluster, encrypts all objects on the datastore, and operates below the virtual machine layer, so it is transparent to guest operating systems and applications and works alongside vSAN features like deduplication and compression.

vSAN Data-at-Rest Encryption requires a key provider. It can use a Standard Key Provider (a connection to an external key management system) or the Native Key Provider built into vCenter. For more information about choosing and operating a key provider, see [Key Providers in VMware vSphere and VMware Cloud Foundation](../key-providers/README.md).

vSAN Data-at-Rest Encryption and VM Encryption are separate features and can be used together. VM Encryption protects individual virtual machines wherever they are stored; vSAN encryption protects the whole datastore.

## Documentation

- [vSAN Documentation](https://techdocs.broadcom.com/us/en/vmware-cis/vsan.html)

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.
