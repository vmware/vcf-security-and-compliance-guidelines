# Australian Signals Directorate Essential Eight

The **Essential Eight**, published by the Australian Signals Directorate (ASD), is a set of prioritised mitigation strategies from the Strategies to Mitigate Cyber Security Incidents: patch applications, patch operating systems, multi-factor authentication, restrict administrative privileges, application control, restrict Microsoft Office macros, user application hardening, and regular backups. The Essential Eight Maturity Model defines three target maturity levels for each strategy; this guide carries one control row per strategy per maturity level.

## Permanent Link

The full set of VMware Cloud Foundation (VCF) compliance companion guides is accessible at [https://brcm.tech/vcf-compliance](https://brcm.tech/vcf-compliance).

## Using These Materials

XLSX, CSV, Markdown, and PDF formats are provided as a convenience for people working with this data on a daily basis. The XLSX contains an Introduction sheet and a Controls sheet; the CSV carries the Controls data alone; the Markdown file combines both in a readable single document with one heading per control; the PDF is a print-formatted rendering of the Markdown document. Each control row carries the following columns:

- **Control ID** -- the regulatory framework's control identifier.
- **SCF ID** -- the mapping to the Secure Controls Framework (SCF) control or controls, where one exists.
- **Description** -- the regulatory framework control's text, included here for reference.
- **Aggregate Coverage** -- the strongest position any one of the assessed products holds for that control. See below for definitions.
- **A Coverage and a Response column per assessed product** -- VMware Cloud Foundation (abbreviated VCF in the column headers), VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, and VMware Avi Load Balancer. The Coverage column holds that product's own coverage level; the Response column describes how the product meets or can help meet the requirements in the control.

This guide covers VMware Cloud Foundation 9.1 and the separately licensed advanced services assessed alongside it. The VCF columns cover the full platform, including its consumption services and Private AI Services capabilities. No single product addresses a control in full; the per-product columns make the division of responsibility explicit. A product that does not apply to a given control carries a brief out-of-scope statement in place of a response.

### Coverage Values

- **Meets** -- the product directly provides the capability described in the control. No additional organizational process, external product, or human activity is needed beyond configuring the product itself.
- **Contributes** -- the product provides technical capabilities that help satisfy the control, but the control also requires something outside the product to be fully met, such as an organizational process, human activity, or an additional tool.
- **Not Applicable** -- the control does not apply to the product. Physical facility controls, staffing decisions, organizational governance processes, and domains the product does not operate in fall here.
- **Not Supported** -- the control is relevant to the product's domain (infrastructure, networking, security), but the product lacks the specific capability the control requires.
- **Not Assessed** -- the control has not yet been evaluated against the product.

## Broadcom Resources

- [Essential Eight Companion Guide for VMware Cloud Foundation 9.1 (XLSX)](https://raw.githubusercontent.com/vmware/vcf-security-and-compliance-guidelines/main/regulatory-compliance/cloud-foundation/9.1/essential-8/vcf-91-companion-essential-8.xlsx) -- direct download
- [Essential Eight Companion Guide for VMware Cloud Foundation 9.1 (CSV)](https://raw.githubusercontent.com/vmware/vcf-security-and-compliance-guidelines/main/regulatory-compliance/cloud-foundation/9.1/essential-8/vcf-91-companion-essential-8.csv) -- direct download
- [Essential Eight Companion Guide for VMware Cloud Foundation 9.1 (Markdown)](https://raw.githubusercontent.com/vmware/vcf-security-and-compliance-guidelines/main/regulatory-compliance/cloud-foundation/9.1/essential-8/vcf-91-companion-essential-8.md) -- direct download
- [Essential Eight Companion Guide for VMware Cloud Foundation 9.1 (PDF)](https://raw.githubusercontent.com/vmware/vcf-security-and-compliance-guidelines/main/regulatory-compliance/cloud-foundation/9.1/essential-8/vcf-91-companion-essential-8.pdf) -- direct download

To download these files from the GitHub web interface, use the "Raw" or "Download raw file" button on the file's page. Right-clicking the links above and choosing "Save Link As" also works.

The CSV version can be used to view changes over time via GitHub's built-in history and diff functions.

Security hardening guides, additional security documentation, Q&A, sample scripts, and more can be found at [https://brcm.tech/vcf-security](https://brcm.tech/vcf-security).

## External Resources

- [Essential Eight (cyber.gov.au)](https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight)

## Disclaimer

This repository and information contained within is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.
