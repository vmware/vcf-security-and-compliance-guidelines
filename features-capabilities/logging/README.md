# Logging in VMware vSphere and VMware Cloud Foundation

Logging and auditing provide visibility into infrastructure operations, user activities, and security incidents across vSphere and Cloud Foundation environments. Comprehensive logging enables organizations to detect unauthorized access, track configuration changes, investigate security events, and maintain regulatory compliance. VMware platforms generate logs at multiple layers, including ESXi hosts, vCenter Server, NSX, vSAN, and SDDC Manager. VMware provides VCF Operations for Logs (formerly vRealize Log Insight) for centralized log management, offering real-time log aggregation, analytics, and pre-built content packs. This guide covers native logging capabilities, log forwarding, SIEM integration, and best practices for log retention and analysis.

## Resources

- VMware ESX Audit Log Event Reference for VMware ESX 8.0: [(Markdown)](vmware-esx-audit-log-event-reference-803.md) [(Direct PDF)](https://raw.githubusercontent.com/vmware/vcf-security-and-compliance-guidelines/main/features-capabilities/logging/vmware-esx-audit-log-event-reference-803.pdf)

- VMware ESX Audit Log Event Reference for VMware ESX 9.0: [(Markdown)](vmware-esx-audit-log-event-reference-900.md) [(Direct PDF)](https://raw.githubusercontent.com/vmware/vcf-security-and-compliance-guidelines/main/features-capabilities/logging/vmware-esx-audit-log-event-reference-900.pdf)

## Documentation

- [vSphere Security](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/9-0/vsphere-security.html)
- [ESX Log Files, Syslog Options, and Log File Locations](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/9-0/esx-installation-and-setup/setting-up-esxi/configuring-system-logging/Chunk1261896571.html#GUID-F35D7005-58EB-48AC-99D5-B9942EB2A8EF-en)

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This  repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.