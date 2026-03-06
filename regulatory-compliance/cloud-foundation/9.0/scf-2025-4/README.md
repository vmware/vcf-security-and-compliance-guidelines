# Secure Controls Framework (SCF) 2025.4

The **Secure Controls Framework (SCF)** is an open-source meta-framework that provides a comprehensive catalog of security and privacy controls. SCF maps its controls to over one hundred statutory, regulatory, and contractual frameworks, allowing organizations to address multiple compliance obligations through a single control set. Version 2025.4 is the current release.

## Permanent Link

The full set of VMware Cloud Foundation (VCF) compliance companion guides is accessible at [https://brcm.tech/vcf-compliance](https://brcm.tech/vcf-compliance).

## Using These Materials

Both XLSX and CSV formats are provided as a convenience for people working with this data on a daily basis. Each file contains five columns:

- **Control ID** -- the regulatory framework's control identifier.
- **SCF ID** -- the mapping to the Secure Controls Framework (SCF) control, where one exists.
- **Description** -- the regulatory framework control's description, included here for reference.
- **Control Coverage** -- indicates how the product relates to the control. See below for definitions.
- **Response** -- describes how the product meets or can help meet the requirements in the control.

### Control Coverage Values

- **Meets** -- the product directly provides the capability described in the control. No additional organizational process, external product, or human activity is needed beyond configuring the product itself.
- **Contributes** -- the product provides technical capabilities that help satisfy the control, but the control also requires something outside the product to be fully met, such as an organizational process, human activity, or an additional tool.
- **Not Applicable** -- the control does not apply to the product. Physical facility controls, staffing decisions, organizational governance processes, and domains the product does not operate in fall here.
- **Not Supported** -- the control is relevant to the product's domain (infrastructure, networking, security), but the product lacks the specific capability the control requires.
- **Not Assessed** -- the control has not yet been evaluated against the product.

## Broadcom Resources

- [SCF 2025.4 Companion Guide for VMware Cloud Foundation 9.0 (XLSX)](https://raw.githubusercontent.com/vmware/vcf-security-and-compliance-guidelines/main/regulatory-compliance/cloud-foundation/9.0/scf-2025-4/vcf-90-companion-scf-2025-4.xlsx) -- direct download
- [SCF 2025.4 Companion Guide for VMware Cloud Foundation 9.0 (CSV)](https://raw.githubusercontent.com/vmware/vcf-security-and-compliance-guidelines/main/regulatory-compliance/cloud-foundation/9.0/scf-2025-4/vcf-90-companion-scf-2025-4.csv) -- direct download

To download these files from the GitHub web interface, use the "Raw" or "Download raw file" button on the file's page. Right-clicking the links above and choosing "Save Link As" also works.

The CSV version can be used to view changes over time via GitHub's built-in history and diff functions.

Security hardening guides, additional security documentation, Q&A, sample scripts, and more can be found at [https://brcm.tech/vcf-security](https://brcm.tech/vcf-security).

## External Resources

- [Secure Controls Framework (SCF)](https://securecontrolsframework.com/)
- [SCF Control Catalog Downloads](https://securecontrolsframework.com/scf-download/)

## Disclaimer

This repository and information contained within is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.
