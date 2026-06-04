# Code Samples: Key Providers

This directory contains code samples pertaining to encryption capabilities in VMware vSphere and VMware Cloud Foundation.

These scripts are examples of how you might automate encryption key management tasks in your environment. Customize them to meet your specific needs and run them in a test environment first.

## audit-keyprovider.ps1

Demonstrates how to audit encryption status across a vCenter Server, including examples of how to:

- Enumerate configured key providers and identify the system default
- Detect vTPM-only VMs vs. VMs with encrypted hard disks
- Audit encryption status of VM templates, which are often overlooked
- Detect vSAN OSA vs. ESA storage architecture and report the cluster-level KEK
- Query per-host vSAN encryption details (KEK, Host Key, DEK Generation ID) via ESXCLI
- Enumerate vSAN disk groups on OSA clusters
- Report host-level encryption key provider and key ID
- Detect encrypted First Class Disks (FCDs) across datastores, relevant for Kubernetes/Tanzu environments

## change-keyprovider.ps1

Demonstrates how to migrate a vCenter Server from one key provider to another, performing a shallow rekey of all encrypted objects. Includes examples of how to:

- **Pre-flight safety checks**: Validate vSAN cluster health via `Test-VsanClusterHealth` and check for active resync operations via `Get-VsanResyncingComponent` before making changes
- **Key provider defaults**: Set the vCenter system default and remove per-cluster overrides
- **VM rekey**: Rekey encrypted VMs, detecting vTPM-only VMs to use `-SkipHardDisks` and avoid unnecessary warnings
- **Template rekey**: Convert encrypted templates to VMs, rekey, and convert back
- **vSAN rekey**: Set the key provider on encrypted vSAN clusters and perform a shallow rekey
- **Host rekey**: Rekey ESXi hosts participating in encryption
- **FCD detection**: Identify encrypted First Class Disks that require manual rekey via storage policy
- **Post-change verification**: Confirm all objects migrated to the new key provider and report failures

```powershell
.\change-keyprovider.ps1 -NewKeyProviderName "NEW-PROVIDER"
```

## Support
Please see [SUPPORT.md](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/SUPPORT.md).

## License
Please see [LICENSE.md](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/LICENSE.md).

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This  repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.