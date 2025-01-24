# FIPS 140-2 and FIPS 140-3 Support in VMware vSphere and VMware Cloud Foundation

FIPS validation of VMware cryptography libraries ensures cryptographic modules meet rigorous federal security standards, providing users with independently verified protection of sensitive data and compliance with government requirements. 

## How to Get Started

If your organization is required to meet FIPS 140-3 requirements, consult the [Security Configuration Guides](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/security-configuration-hardening-guide) or the [DISA STIG guidance](https://github.com/vmware/dod-compliance-and-automation/tree/master) for instructions and examples on configuring FIPS 140-3.

By default, ESX is configured for FIPS compatibility. vCenter is not configured for FIPS by default.

## Documentation

- [FIPS 140-2 & 140-3 Validated Cryptographic Modules](https://www.vmware.com/solutions/security/certifications/fips)
- [vCenter Server and FIPS](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security-8-0/understanding-vsphere-hardening-and-compliance/vcenter-server-and-fips.html)
- [Activate and Deactivate FIPS on the vCenter Server Appliance](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security-8-0/understanding-vsphere-hardening-and-compliance/vcenter-server-and-fips/enable-and-disable-fips-on-the-vcenter-server-appliance.html)

## Code Samples

You can find sample scripts pertaining to enabling FIPS compatibility in the [Security Configuration Guides](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/security-configuration-hardening-guide) or the [DISA STIG guidance](https://github.com/vmware/dod-compliance-and-automation/tree/master).

## Questions & Answers

### Are there any caveats to enabling FIPS 140-2/140-3?

There can be. Because FIPS compatibility changes the ciphers available there may be some external compatibility issues with other systems. We encourage you to test connectivity prior to enabling it in production environments.

Enabling FIPS compatibility in vCenter requires a reboot of the VCSA.

### Some of the certifications list FIPS 140-2, where is FIPS 140-3?

Under United States' federal policy, FIPS 140-2 validations continue to be valid until the validation's "Sunset Date" is reached. Broadcom is committed to maintaining FIPS certifications and 140-3 validation is ongoing.

### How can I tell which module is being used?

The [FIPS 140-2 & 140-3 Validated Cryptographic Modules](https://www.vmware.com/solutions/security/certifications/fips) page lists the modules, but where they're being used is not always clear. You can figure out which module applies to a particular component by looking at the "Tested Configuration(s)" in the NIST certification page.

Two examples:

1. ESX 8.0 is covered by [certificate 4815](https://csrc.nist.gov/projects/cryptographic-module-validation-program/certificate/4815) and [certificate 4442](https://csrc.nist.gov/projects/cryptographic-module-validation-program/certificate/4442).
2. vCenter Server 8.0 is based on PhotonOS 4.0 and is covered by several certificates, such as [4861](https://csrc.nist.gov/projects/cryptographic-module-validation-program/certificate/4861).

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This  repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.