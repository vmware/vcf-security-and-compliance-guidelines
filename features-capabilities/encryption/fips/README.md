# FIPS Support in VMware vSphere and VMware Cloud Foundation

FIPS validation is independent verification that VMware cryptographic modules meet the FIPS 140 requirements, which supports compliance with US government requirements.

## How to Get Started

If your organization is obligated to meet FIPS requirements you can enable FIPS compatibility. For VMware Cloud Foundation, specify FIPS in the deployment worksheet, or consult the documentation for guidance on enabling it. For VMware vSphere, consult the [Security Configuration Guides](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/security-configuration-hardening-guide) or the [DISA STIG guidance](https://www.vmware.com/resources/certifications/stigs) for instructions and examples on configuring FIPS support.

In VMware Cloud Foundation 9.x, FIPS is enabled by default for ESX, vCenter, NSX, and a number of other components (see [FIPS Compliance for VCF Components](https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-9-0-and-later/9-1/fleet-management/fips-compliance-for-vcf-components.html) for the per-component list and the components that remain off by default). In standalone VMware vSphere 8.x the situation differs: ESX has FIPS permanently enabled, but vCenter ships with FIPS off and must be enabled manually.

## Documentation

- [FIPS 140-2 & 140-3 Validated Cryptographic Modules](https://www.vmware.com/resources/certifications/fips)
- [FIPS Compliance for VCF Components (VCF 9.1)](https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-9-0-and-later/9-1/fleet-management/fips-compliance-for-vcf-components.html)
- [vCenter Server and FIPS (vSphere 8.0)](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security-8-0/understanding-vsphere-hardening-and-compliance/vcenter-server-and-fips.html)
- [Activate and Deactivate FIPS on the vCenter Server Appliance (vSphere 8.0)](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security-8-0/understanding-vsphere-hardening-and-compliance/vcenter-server-and-fips/enable-and-disable-fips-on-the-vcenter-server-appliance.html)

## Code Samples

You can find sample scripts pertaining to enabling FIPS compatibility in the [Security Configuration Guides](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/security-configuration-hardening-guide) or the [DISA STIG guidance](https://www.vmware.com/resources/certifications/stigs).

## Questions & Answers

### How can I tell which module is being used?

The [FIPS 140-2 & 140-3 Validated Cryptographic Modules](https://www.vmware.com/resources/certifications/fips) page lists the modules, but where they're being used is not always clear. You can figure out which module applies to a particular component by looking at the "Tested Configuration(s)" in the NIST certification page.

As an example, for VMware Cloud Foundation 5.2.1:

- Cloud Builder VM 5.2.1: certificates 4028, 4233, 4861 (Photon 4)
- SDDC Manager 5.2.1: certificates 4028, 4233, 4861 (Photon 4)
- VMware vCenter Server Appliance 8.0 Update 3c: certificates 4028, 4233, 4861 (Photon 4)
- VMware ESXi 8.0 Update 3b: certificates 4028, 4442, 4815 (ESXi)
- VMware vSAN Witness Appliance 8.0 Update 3: certificates 4028, 4442, 4815 (ESXi)
- VMware NSX 4.2.1: certificates 4028, 4861, 4286 (Ubuntu)
- VMware Aria Suite Lifecycle Manager 8.18 and other Suite components: certificates 4028, 4233, 4861 (Photon 4), except for...
- ...VMware Aria Operations for Networks 8.18: certificates 4028, 4861 (Ubuntu)

### Is vSAN FIPS-capable?

vSAN File Services does not support FIPS at this time due to compatibility issues with the file sharing protocols. The rest of vSAN does, and is covered by the ESX and vCenter validations.

### How do I enable FIPS?

A fresh installation of VMware Cloud Foundation 9.x already has FIPS enabled by default for most components. For the components that are off by default, and for earlier VCF releases, the deployment tools can enable FIPS for you when you specify it.

A deployed system will need to have each component changed individually. Follow the product documentation for that.

ESX has FIPS permanently enabled by default.

### Will enabling FIPS make the TLS ciphers pass audits?

FIPS support does have an effect on TLS ciphers, but what you probably want is to set your TLS Profile (in vSphere 8.0 Update 3 and newer) to NIST_2024, which restricts the ciphers to those in the 2024 NIST guidance.

### Are there any caveats to enabling FIPS 140-2/140-3?

VMware Cloud Foundation documentation lists considerations when using FIPS. Because FIPS compatibility changes the available ciphers, other systems and plugins can lose connectivity. RSA SecurID and some US Federal Common Access Cards (CAC) use incompatible ciphers; consider switching to a federated identity source. Test connectivity before enabling FIPS in production environments.

Where vCenter FIPS is a toggle rather than the default (standalone vSphere 8.x, or a previously deployed system being changed after the fact), enabling FIPS compatibility in vCenter requires a reboot of the VCSA. The reboot begins immediately when you change the setting.

TLS 1.3 is disabled by default on port 443/tcp on ESX since the reverse proxy is not FIPS validated for TLS 1.3 usage (and ESX has FIPS permanently enabled). If you wish to enable TLS 1.3 see [Enabling non-FIPS TLS 1.3 on port 443 in ESX](https://knowledge.broadcom.com/external/article/312033/enabling-nonfips-tls-13-on-port-443-in-e.html).

### Some of the certifications list FIPS 140-2, where is FIPS 140-3?

Under United States' federal policy, FIPS 140-2 validations continue to be valid until the validation's "Sunset Date" is reached. Broadcom maintains its FIPS certifications, and FIPS 140-3 validations are in progress.

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.