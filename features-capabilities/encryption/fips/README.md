# FIPS Support in VMware vSphere and VMware Cloud Foundation

FIPS validation of VMware cryptography libraries ensures cryptographic modules meet rigorous federal security standards, providing users with independently verified protection of sensitive data and compliance with government requirements. 

## How to Get Started

If your organization is obligated to meet FIPS requirements you can enable FIPS compatibility. For VMware Cloud Foundation, specify FIPS in the deployment worksheet, or consult the documentation for guidance on enabling it. For VMware vSphere, consult the [Security Configuration Guides](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/security-configuration-hardening-guide) or the [DISA STIG guidance](https://github.com/vmware/dod-compliance-and-automation/tree/master) for instructions and examples on configuring FIPS support.

By default, ESX is configured for FIPS compatibility. vCenter is not configured for FIPS by default.

## Documentation

- [FIPS 140-2 & 140-3 Validated Cryptographic Modules](https://www.vmware.com/solutions/security/certifications/fips)
- [vCenter Server and FIPS](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security-8-0/understanding-vsphere-hardening-and-compliance/vcenter-server-and-fips.html)
- [Activate and Deactivate FIPS on the vCenter Server Appliance](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security-8-0/understanding-vsphere-hardening-and-compliance/vcenter-server-and-fips/enable-and-disable-fips-on-the-vcenter-server-appliance.html)

## Code Samples

You can find sample scripts pertaining to enabling FIPS compatibility in the [Security Configuration Guides](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/security-configuration-hardening-guide) or the [DISA STIG guidance](https://github.com/vmware/dod-compliance-and-automation/tree/master).

## Questions & Answers

### How can I tell which module is being used?

The [FIPS 140-2 & 140-3 Validated Cryptographic Modules](https://www.vmware.com/solutions/security/certifications/fips) page lists the modules, but where they're being used is not always clear. You can figure out which module applies to a particular component by looking at the "Tested Configuration(s)" in the NIST certification page.

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

vSAN File Services does not support FIPS at this time. The rest of vSAN does, and is covered by the ESXi and vCenter validations.

### How do I enable FIPS?

A fresh installation of VMware Cloud Foundation can enable FIPS for you, by specifying that in the deployment tools.

A deployed system will need to have each component changed individually. Follow the product documentation for that.

ESX has FIPS permanenently enabled by default.

### Will enabling FIPS make the TLS ciphers pass audits?

FIPS support does have an effect on TLS ciphers, but what you probably want is to set your TLS Profile (in vSphere 8.0.2 and newer) to NIST_2024, which will restrict the ciphers to the best choices, per NIST 2024 guidance.

### Are there any caveats to enabling FIPS 140-2/140-3?

VMware Cloud Foundation documentation lists considerations when using FIPS. In general, because FIPS compatibility changes the ciphers available there may be some external compatibility issues with other systems and plugins. We encourage you to test connectivity prior to enabling it in production environments. Most notably, RSA SecureID and some US Federal Common Access Cards (CAC) have ciphers which are incompatible. Consider switching to a federated identity source.

Enabling FIPS compatibility in vCenter requires a reboot of the VCSA, which will happen immediately upon changing the setting!

TLS 1.3 is disabled by default on port 443/tcp on ESX since the reverse proxy is not FIPS validated for TLS 1.3 usage (and ESX has FIPS permanently enabled). If you wish to enable TLS 1.3 see [Enabling non-FIPS TLS 1.3 on port 443 in ESX](https://knowledge.broadcom.com/external/article/312033/enabling-nonfips-tls-13-on-port-443-in-e.html).

### Some of the certifications list FIPS 140-2, where is FIPS 140-3?

Under United States' federal policy, FIPS 140-2 validations continue to be valid until the validation's "Sunset Date" is reached. Broadcom is committed to maintaining FIPS certifications and 140-3 validation is ongoing.

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This  repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.