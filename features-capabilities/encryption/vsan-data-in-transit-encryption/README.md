# vSAN Data-in-Transit Encryption

vSAN Data-in-Transit Encryption encrypts vSAN storage traffic as it moves between hosts in a cluster, protecting data on the vSAN network against interception. It is configured per cluster and uses ephemeral keys, so no key provider is required. It can be enabled independently of vSAN Data-at-Rest Encryption, and the two are often used together for protection of both stored data and storage traffic.

The Security Configuration Guide includes audit guidance for vSAN encryption in the vsan-9 control family, including the data-in-transit controls for both vSAN Express Storage Architecture (ESA) and Original Storage Architecture (OSA) clusters. See the [Security Configuration & Hardening Guide](../../../security-configuration-hardening-guide/) for details.

## Documentation

- [vSAN Documentation](https://techdocs.broadcom.com/us/en/vmware-cis/vsan.html)

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.
