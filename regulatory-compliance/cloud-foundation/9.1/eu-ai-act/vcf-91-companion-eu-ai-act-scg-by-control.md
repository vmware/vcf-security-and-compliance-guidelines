# Companion Guide to Regulation (EU) 2024/1689 Artificial Intelligence Act for VMware Cloud Foundation 9.1 -- Framework Controls by SCG Coverage

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://eur-lex.europa.eu/eli/reg/2024/1689/oj

This guidance evolves. Please check the current revision at: https://brcm.tech/vcf-compliance

## Disclaimer

This kit is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.

This material is provided as is and any express or implied warranties, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose are disclaimed. In no event shall the copyright holder or contributors be liable for any direct, indirect, incidental, special, exemplary, or consequential damages (including, but not limited to, procurement of substitute goods or services; loss of use, data, or profits; or business interruption) however caused and on any theory of liability, whether in contract, strict liability, or tort (including negligence or otherwise) arising in any way out of the use of this software, even if advised of the possibility of such damage. The provider makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of this sample. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations. You acknowledge that there may be performance or other considerations, and that these examples may make assumptions which may not be valid in your environment or organization.

## Third Party Identifiers and Mappings

This document includes regulatory compliance and security control identifiers from external sources as a convenience to end users. This does not constitute endorsement, in either direction.

There is not a one-to-one mapping of product capabilities to third-party controls. A product capability, or set of capabilities, may be applicable to multiple controls. Conversely, a control may be satisfied with the use of multiple capabilities.

Control identifier numbers have been included from the Secure Controls Framework, version 2026.1, under the terms of the Creative Commons Attribution-NoDerivatives 4.0 International Public License. No modifications have been made to the control identifier numbers under the terms of the license.

https://securecontrolsframework.com/

## Framework Controls With Relevant SCG Hardening Controls

4 framework controls have at least one Security Configuration Guide hardening control mapped to them through the SCF crosswalk.

### Control 12.1

> High-risk AI systems shall technically allow for the automatic recording of events (logs) over the lifetime of the system.

**Bridging SCF Controls:** MON-01.4

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.

### Control 17.1(e)

> Technical specifications, including standards, to be applied and, where the relevant harmonised standards are not applied in full or do not cover all of the relevant requirements set out in Section 2, the means to be used to ensure that the high-risk AI system complies with those requirements.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 19.1

> Providers of high-risk AI systems shall keep the logs referred to in Article 12(1), automatically generated by their high-risk AI systems, to the extent such logs are under their control. Without prejudice to applicable Union or national law, the logs shall be kept for a period appropriate to the intended purpose of the high-risk AI system, of at least six months, unless provided otherwise in the applicable Union or national law, in particular in Union law on the protection of personal data.

**Bridging SCF Controls:** MON-10

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.log-audit-local-capacity -- The ESX host must store audit records for a time period consistent with your records retention policy.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.action-history-retention -- Retain VCF Operations remediation action history for an appropriate interval.
- operations-9.log-retention -- Configure the VCF Operations log retention period.
- vcenter-9.events-database-retention -- VMware vCenter must retain task and event data for an appropriate interval.
- vm-9.log-retention -- Virtual machines must limit the number of retained diagnostic logs.

### Control 19.2

> Providers that are financial institutions subject to requirements regarding their internal governance, arrangements or processes under Union financial services law shall maintain the logs automatically generated by their high-risk AI systems as part of the documentation kept under the relevant financial services law.

**Bridging SCF Controls:** MON-10

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.log-audit-local-capacity -- The ESX host must store audit records for a time period consistent with your records retention policy.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.action-history-retention -- Retain VCF Operations remediation action history for an appropriate interval.
- operations-9.log-retention -- Configure the VCF Operations log retention period.
- vcenter-9.events-database-retention -- VMware vCenter must retain task and event data for an appropriate interval.
- vm-9.log-retention -- Virtual machines must limit the number of retained diagnostic logs.
