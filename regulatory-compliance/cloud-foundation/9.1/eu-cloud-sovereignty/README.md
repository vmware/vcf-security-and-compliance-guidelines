# EU Cloud Sovereignty Framework

The **Cloud Sovereignty Framework**, published by the European Commission's Directorate-General for Digital Services (version 1.2.1, October 2025), defines how the EU assesses and procures sovereign cloud services. It sets out eight Sovereignty Objectives (SOV-1 through SOV-8) covering strategic, legal and jurisdictional, data and AI, operational, supply chain, technology, security and compliance, and environmental sustainability dimensions. Tenderers are assessed against each objective through Sovereignty Effectiveness Assurance Levels (SEAL-0, no sovereignty, through SEAL-4, full digital sovereignty) and a weighted Sovereignty Score. The framework assesses cloud service providers; this guide describes how an organization operating VMware Cloud Foundation can draw on platform capabilities when addressing each objective. The framework has no Secure Controls Framework crosswalk, so the objective-to-SCF mapping here was authored for the VCF assessment.

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

- [EU Cloud Sovereignty Framework Companion Guide for VMware Cloud Foundation 9.1 (XLSX)](https://raw.githubusercontent.com/vmware/vcf-security-and-compliance-guidelines/main/regulatory-compliance/cloud-foundation/9.1/eu-cloud-sovereignty/vcf-91-companion-eu-cloud-sovereignty.xlsx) -- direct download
- [EU Cloud Sovereignty Framework Companion Guide for VMware Cloud Foundation 9.1 (CSV)](https://raw.githubusercontent.com/vmware/vcf-security-and-compliance-guidelines/main/regulatory-compliance/cloud-foundation/9.1/eu-cloud-sovereignty/vcf-91-companion-eu-cloud-sovereignty.csv) -- direct download
- [EU Cloud Sovereignty Framework Companion Guide for VMware Cloud Foundation 9.1 (Markdown)](https://raw.githubusercontent.com/vmware/vcf-security-and-compliance-guidelines/main/regulatory-compliance/cloud-foundation/9.1/eu-cloud-sovereignty/vcf-91-companion-eu-cloud-sovereignty.md) -- direct download
- [EU Cloud Sovereignty Framework Companion Guide for VMware Cloud Foundation 9.1 (PDF)](https://raw.githubusercontent.com/vmware/vcf-security-and-compliance-guidelines/main/regulatory-compliance/cloud-foundation/9.1/eu-cloud-sovereignty/vcf-91-companion-eu-cloud-sovereignty.pdf) -- direct download

To download these files from the GitHub web interface, use the "Raw" or "Download raw file" button on the file's page. Right-clicking the links above and choosing "Save Link As" also works.

The CSV version can be used to view changes over time via GitHub's built-in history and diff functions.

Security hardening guides, additional security documentation, Q&A, sample scripts, and more can be found at [https://brcm.tech/vcf-security](https://brcm.tech/vcf-security).

## External Resources

- [Cloud Sovereignty Framework (commission.europa.eu)](https://commission.europa.eu/document/download/09579818-64a6-4dd5-9577-446ab6219113_en)
- [Commission advances cloud sovereignty through strategic procurement (commission.europa.eu)](https://commission.europa.eu/news-and-media/news/commission-advances-cloud-sovereignty-through-strategic-procurement-2026-04-17_en)

## Disclaimer

This repository and information contained within is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.
