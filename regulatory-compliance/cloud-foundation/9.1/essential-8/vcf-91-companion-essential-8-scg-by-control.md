# Companion Guide to the Australian Signals Directorate Essential Eight for VMware Cloud Foundation 9.1 -- Framework Controls by SCG Coverage

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight

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

22 framework controls have at least one Security Configuration Guide hardening control mapped to them through the SCF crosswalk.

### Control ML1-P1

> Patch applications: An automated method of asset discovery is used at least fortnightly to support the detection of assets for subsequent vulnerability scanning activities. A vulnerability scanner with an up-to-date vulnerability database is used for vulnerability scanning activities. A vulnerability scanner is used at least daily to identify missing patches or updates for vulnerabilities in online services. A vulnerability scanner is used at least weekly to identify missing patches or updates for vulnerabilities in office productivity suites, web browsers and their extensions, email clients, PDF software, and security products. Patches, updates or other vendor mitigations for vulnerabilities in online services are applied within 48 hours of release when vulnerabilities are assessed as critical by vendors or when working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in online services are applied within two weeks of release when vulnerabilities are assessed as non-critical by vendors and no working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in office productivity suites, web browsers and their extensions, email clients, PDF software, and security products are applied within two weeks of release. Online services that are no longer supported by vendors are removed. Office productivity suites, web browsers and their extensions, email clients, PDF software, Adobe Flash Player, and security products that are no longer supported by vendors are removed.

**Bridging SCF Controls:** TDA-17, VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.supported -- vCenter must run a version that has not reached End of General Support.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control ML1-P2

> Patch operating systems: An automated method of asset discovery is used at least fortnightly to support the detection of assets for subsequent vulnerability scanning activities. A vulnerability scanner with an up-to-date vulnerability database is used for vulnerability scanning activities. A vulnerability scanner is used at least daily to identify missing patches or updates for vulnerabilities in operating systems of internet-facing servers and internet-facing network devices. A vulnerability scanner is used at least fortnightly to identify missing patches or updates for vulnerabilities in operating systems of workstations, non-internet-facing servers and non-internet-facing network devices. Patches, updates or other vendor mitigations for vulnerabilities in operating systems of internet-facing servers and internet-facing network devices are applied within 48 hours of release when vulnerabilities are assessed as critical by vendors or when working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in operating systems of internet-facing servers and internet-facing network devices are applied within two weeks of release when vulnerabilities are assessed as non-critical by vendors and no working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in operating systems of workstations, non-internet-facing servers and non-internet-facing network devices are applied within one month of release. Operating systems that are no longer supported by vendors are replaced.

**Bridging SCF Controls:** TDA-17, VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.supported -- vCenter must run a version that has not reached End of General Support.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control ML1-P4

> Restrict administrative privileges: Requests for privileged access to systems, applications and data repositories are validated when first requested. Privileged users are assigned a dedicated privileged user account to be used solely for duties requiring privileged access. Privileged user accounts (excluding those explicitly authorised to access online services) are prevented from accessing the internet, email and web services. Privileged user accounts explicitly authorised to access online services are strictly limited to only what is required for users and services to undertake their duties. Privileged users use separate privileged and unprivileged operating environments. Unprivileged user accounts cannot logon to privileged operating environments. Privileged user accounts (excluding local administrator accounts) cannot logon to unprivileged operating environments.

**Bridging SCF Controls:** IAC-16, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control ML1-P6

> Restrict Microsoft Office macros: Microsoft Office macros are disabled for users that do not have a demonstrated business requirement. Microsoft Office macros in files originating from the internet are blocked. Microsoft Office macro antivirus scanning is enabled. Microsoft Office macro security settings cannot be changed by users.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control ML1-P7

> User application hardening: Internet Explorer 11 is disabled or removed. Web browsers do not process Java from the internet. Web browsers do not process web advertisements from the internet. Web browser security settings cannot be changed by users.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control ML1-P8

> Regular backups: Backups of data, applications and settings are performed and retained in accordance with business criticality and business continuity requirements. Backups of data, applications and settings are synchronised to enable restoration to a common point in time. Backups of data, applications and settings are retained in a secure and resilient manner. Restoration of data, applications and settings from backups to a common point in time is tested as part of disaster recovery exercises. Unprivileged user accounts cannot access backups belonging to other user accounts. Unprivileged user accounts are prevented from modifying and deleting backups.

**Bridging SCF Controls:** BCD-11

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.

### Control ML2-P1

> Patch applications: An automated method of asset discovery is used at least fortnightly to support the detection of assets for subsequent vulnerability scanning activities. A vulnerability scanner with an up-to-date vulnerability database is used for vulnerability scanning activities. A vulnerability scanner is used at least daily to identify missing patches or updates for vulnerabilities in online services. A vulnerability scanner is used at least weekly to identify missing patches or updates for vulnerabilities in office productivity suites, web browsers and their extensions, email clients, PDF software, and security products. A vulnerability scanner is used at least fortnightly to identify missing patches or updates for vulnerabilities in applications other than office productivity suites, web browsers and their extensions, email clients, PDF software, and security products. Patches, updates or other vendor mitigations for vulnerabilities in online services are applied within 48 hours of release when vulnerabilities are assessed as critical by vendors or when working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in online services are applied within two weeks of release when vulnerabilities are assessed as non-critical by vendors and no working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in office productivity suites, web browsers and their extensions, email clients, PDF software, and security products are applied within two weeks of release. Patches, updates or other vendor mitigations for vulnerabilities in applications other than office productivity suites, web browsers and their extensions, email clients, PDF software, and security products are applied within one month of release. Online services that are no longer supported by vendors are removed. Office productivity suites, web browsers and their extensions, email clients, PDF software, Adobe Flash Player, and security products that are no longer supported by vendors are removed.

**Bridging SCF Controls:** TDA-17, VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.supported -- vCenter must run a version that has not reached End of General Support.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control ML2-P2

> Patch operating systems: An automated method of asset discovery is used at least fortnightly to support the detection of assets for subsequent vulnerability scanning activities. A vulnerability scanner with an up-to-date vulnerability database is used for vulnerability scanning activities. A vulnerability scanner is used at least daily to identify missing patches or updates for vulnerabilities in operating systems of internet-facing servers and internet-facing network devices. A vulnerability scanner is used at least fortnightly to identify missing patches or updates for vulnerabilities in operating systems of workstations, non-internet-facing servers and non-internet-facing network devices. Patches, updates or other vendor mitigations for vulnerabilities in operating systems of internet-facing servers and internet-facing network devices are applied within 48 hours of release when vulnerabilities are assessed as critical by vendors or when working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in operating systems of internet-facing servers and internet-facing network devices are applied within two weeks of release when vulnerabilities are assessed as non-critical by vendors and no working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in operating systems of workstations, non-internet-facing servers and non-internet-facing network devices are applied within one month of release. Operating systems that are no longer supported by vendors are replaced.

**Bridging SCF Controls:** TDA-17, VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.supported -- vCenter must run a version that has not reached End of General Support.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control ML2-P3

> Multi-factor authentication: Multi-factor authentication is used to authenticate users to their organisation’s online services that process, store or communicate their organisation’s sensitive data. Multi-factor authentication is used to authenticate users to third-party online services that process, store or communicate their organisation’s sensitive data. Multi-factor authentication (where available) is used to authenticate users to third-party online services that process, store or communicate their organisation’s non-sensitive data. Multi-factor authentication is used to authenticate users to their organisation’s online customer services that process, store or communicate their organisation’s sensitive customer data. Multi-factor authentication is used to authenticate users to third-party online customer services that process, store or communicate their organisation’s sensitive customer data. Multi-factor authentication is used to authenticate customers to online customer services that process, store or communicate sensitive customer data. Multi-factor authentication is used to authenticate privileged users of systems. Multi-factor authentication is used to authenticate unprivileged users of systems. Multi-factor authentication uses either: something users have and something users know, or something users have that is unlocked by something users know or are. Multi-factor authentication used for authenticating users of online services is phishing-resistant. Multi-factor authentication used for authenticating customers of online customer services provides a phishing-resistant option. Multi-factor authentication used for authenticating users of systems is phishing-resistant. Successful and unsuccessful multi-factor authentication events are centrally logged. Event logs are protected from unauthorised modification and deletion. Event logs from internet-facing servers are analysed in a timely manner to detect cyber security events. Cyber security events are analysed in a timely manner to identify cyber security incidents. Cyber security incidents are reported to the Chief Information Security Officer, or one of their delegates, as soon as possible after they occur or are discovered. Cyber security incidents are reported to ASD as soon as possible after they occur or are discovered. Following the identification of a cyber security incident, the cyber security incident response plan is enacted.

**Bridging SCF Controls:** MON-02.2, MON-03, MON-08

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control ML2-P4

> Restrict administrative privileges: Requests for privileged access to systems, applications and data repositories are validated when first requested. Privileged access to systems, applications and data repositories is disabled after 12 months unless revalidated. Privileged access to systems and applications is disabled after 45 days of inactivity. Privileged users are assigned a dedicated privileged user account to be used solely for duties requiring privileged access. Privileged user accounts (excluding those explicitly authorised to access online services) are prevented from accessing the internet, email and web services. Privileged user accounts explicitly authorised to access online services are strictly limited to only what is required for users and services to undertake their duties. Privileged users use separate privileged and unprivileged operating environments. Privileged operating environments are not virtualised within unprivileged operating environments. Unprivileged user accounts cannot logon to privileged operating environments. Privileged user accounts (excluding local administrator accounts) cannot logon to unprivileged operating environments. Administrative activities are conducted through jump servers. Credentials for break glass accounts, local administrator accounts and service accounts are long, unique, unpredictable and managed. Privileged access events are centrally logged. Privileged user account and security group management events are centrally logged. Event logs are protected from unauthorised modification and deletion. Event logs from internet-facing servers are analysed in a timely manner to detect cyber security events. Cyber security events are analysed in a timely manner to identify cyber security incidents. Cyber security incidents are reported to the Chief Information Security Officer, or one of their delegates, as soon as possible after they occur or are discovered. Cyber security incidents are reported to ASD as soon as possible after they occur or are discovered. Following the identification of a cyber security incident, the cyber security incident response plan is enacted.

**Bridging SCF Controls:** IAC-15.3, IAC-15.9, IAC-16, IAC-21, MON-02.2, MON-08

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- fleet-9.jit-inactivity -- Configure an inactivity expiry for Just-In-Time users.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.
- sddc-9.api-admin -- SDDC Manager must configure the API admin account.
- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control ML2-P5

> Application control: Application control is implemented on workstations. Application control is implemented on internet-facing servers. Application control is applied to user profiles and temporary folders used by operating systems, web browsers and email clients. Application control is applied to all locations other than user profiles and temporary folders used by operating systems, web browsers and email clients. Application control restricts the execution of executables, software libraries, scripts, installers, compiled HTML, HTML applications and control panel applets to an organisation-approved set. Microsoft’s recommended application blocklist is implemented. Application control rulesets are validated on an annual or more frequent basis. Allowed and blocked application control events are centrally logged. Event logs are protected from unauthorised modification and deletion. Event logs from internet-facing servers are analysed in a timely manner to detect cyber security events. Cyber security events are analysed in a timely manner to identify cyber security incidents. Cyber security incidents are reported to the Chief Information Security Officer, or one of their delegates, as soon as possible after they occur or are discovered. Cyber security incidents are reported to ASD as soon as possible after they occur or are discovered. Following the identification of a cyber security incident, the cyber security incident response plan is enacted.

**Bridging SCF Controls:** CFG-02, CFG-03.2, MON-02.2, MON-03, MON-08

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- esx-9.vib-trusted-binaries -- The ESX host must only execute binaries delivered through a signed VIB.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control ML2-P6

> Restrict Microsoft Office macros: Microsoft Office macros are disabled for users that do not have a demonstrated business requirement. Microsoft Office macros in files originating from the internet are blocked. Microsoft Office macro antivirus scanning is enabled. Microsoft Office macros are blocked from making Win32 API calls. Microsoft Office macro security settings cannot be changed by users.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control ML2-P7

> User application hardening: Internet Explorer 11 is disabled or removed. Web browsers do not process Java from the internet. Web browsers do not process web advertisements from the internet. Web browsers are hardened using ASD and vendor hardening guidance, with the most restrictive guidance taking precedence when conflicts occur. Web browser security settings cannot be changed by users. Microsoft Office is blocked from creating child processes. Microsoft Office is blocked from creating executable content. Microsoft Office is blocked from injecting code into other processes. Microsoft Office is configured to prevent activation of Object Linking and Embedding packages. Office productivity suites are hardened using ASD and vendor hardening guidance, with the most restrictive guidance taking precedence when conflicts occur. Office productivity suite security settings cannot be changed by users. PDF software is blocked from creating child processes. PDF software is hardened using ASD and vendor hardening guidance, with the most restrictive guidance taking precedence when conflicts occur. PDF software security settings cannot be changed by users. PowerShell module logging, script block logging and transcription events are centrally logged. Command line process creation events are centrally logged. Event logs are protected from unauthorised modification and deletion. Event logs from internet-facing servers are analysed in a timely manner to detect cyber security events. Cyber security events are analysed in a timely manner to identify cyber security incidents. Cyber security incidents are reported to the Chief Information Security Officer, or one of their delegates, as soon as possible after they occur or are discovered. Cyber security incidents are reported to ASD as soon as possible after they occur or are discovered. Following the identification of a cyber security incident, the cyber security incident response plan is enacted.

**Bridging SCF Controls:** CFG-02, MON-02.2, MON-08

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control ML2-P8

> Regular backups: Backups of data, applications and settings are performed and retained in accordance with business criticality and business continuity requirements. Backups of data, applications and settings are synchronised to enable restoration to a common point in time. Backups of data, applications and settings are retained in a secure and resilient manner. Restoration of data, applications and settings from backups to a common point in time is tested as part of disaster recovery exercises. Unprivileged user accounts cannot access backups belonging to other user accounts. Privileged user accounts (excluding backup administrator accounts) cannot access backups belonging to other user accounts. Unprivileged user accounts are prevented from modifying and deleting backups. Privileged user accounts (excluding backup administrator accounts) are prevented from modifying and deleting backups.

**Bridging SCF Controls:** BCD-11

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.

### Control ML3-P1

> Patch applications: An automated method of asset discovery is used at least fortnightly to support the detection of assets for subsequent vulnerability scanning activities. A vulnerability scanner with an up-to-date vulnerability database is used for vulnerability scanning activities. A vulnerability scanner is used at least daily to identify missing patches or updates for vulnerabilities in online services. A vulnerability scanner is used at least weekly to identify missing patches or updates for vulnerabilities in office productivity suites, web browsers and their extensions, email clients, PDF software, and security products. A vulnerability scanner is used at least fortnightly to identify missing patches or updates for vulnerabilities in applications other than office productivity suites, web browsers and their extensions, email clients, PDF software, and security products. Patches, updates or other vendor mitigations for vulnerabilities in online services are applied within 48 hours of release when vulnerabilities are assessed as critical by vendors or when working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in online services are applied within two weeks of release when vulnerabilities are assessed as non-critical by vendors and no working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in office productivity suites, web browsers and their extensions, email clients, PDF software, and security products are applied within 48 hours of release when vulnerabilities are assessed as critical by vendors or when working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in office productivity suites, web browsers and their extensions, email clients, PDF software, and security products are applied within two weeks of release when vulnerabilities are assessed as non-critical by vendors and no working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in applications other than office productivity suites, web browsers and their extensions, email clients, PDF software, and security products are applied within one month of release. Online services that are no longer supported by vendors are removed. Office productivity suites, web browsers and their extensions, email clients, PDF software, Adobe Flash Player, and security products that are no longer supported by vendors are removed. Applications other than office productivity suites, web browsers and their extensions, email clients, PDF software, Adobe Flash Player, and security products that are no longer supported by vendors are removed.

**Bridging SCF Controls:** TDA-17, VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.supported -- vCenter must run a version that has not reached End of General Support.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control ML3-P2

> Patch operating systems: An automated method of asset discovery is used at least fortnightly to support the detection of assets for subsequent vulnerability scanning activities. A vulnerability scanner with an up-to-date vulnerability database is used for vulnerability scanning activities. A vulnerability scanner is used at least daily to identify missing patches or updates for vulnerabilities in operating systems of internet-facing servers and internet-facing network devices. A vulnerability scanner is used at least fortnightly to identify missing patches or updates for vulnerabilities in operating systems of workstations, non-internet-facing servers and non-internet-facing network devices. A vulnerability scanner is used at least fortnightly to identify missing patches or updates for vulnerabilities in drivers. A vulnerability scanner is used at least fortnightly to identify missing patches or updates for vulnerabilities in firmware. Patches, updates or other vendor mitigations for vulnerabilities in operating systems of internet-facing servers and internet-facing network devices are applied within 48 hours of release when vulnerabilities are assessed as critical by vendors or when working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in operating systems of internet-facing servers and internet-facing network devices are applied within two weeks of release when vulnerabilities are assessed as non-critical by vendors and no working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in operating systems of workstations, non-internet-facing servers and non-internet-facing network devices are applied within 48 hours of release when vulnerabilities are assessed as critical by vendors or when working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in operating systems of workstations, non-internet-facing servers and non-internet-facing network devices are applied within one month of release when vulnerabilities are assessed as non-critical by vendors and no working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in drivers are applied within 48 hours of release when vulnerabilities are assessed as critical by vendors or when working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in drivers are applied within one month of release when vulnerabilities are assessed as non-critical by vendors and no working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in firmware are applied within 48 hours of release when vulnerabilities are assessed as critical by vendors or when working exploits exist. Patches, updates or other vendor mitigations for vulnerabilities in firmware are applied within one month of release when vulnerabilities are assessed as non-critical by vendors and no working exploits exist. The latest release, or the previous release, of operating systems are used. Operating systems that are no longer supported by vendors are replaced.

**Bridging SCF Controls:** TDA-17, VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.supported -- vCenter must run a version that has not reached End of General Support.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control ML3-P3

> Multi-factor authentication: Multi-factor authentication is used to authenticate users to their organisation’s online services that process, store or communicate their organisation’s sensitive data. Multi-factor authentication is used to authenticate users to third-party online services that process, store or communicate their organisation’s sensitive data. Multi-factor authentication (where available) is used to authenticate users to third-party online services that process, store or communicate their organisation’s non-sensitive data. Multi-factor authentication is used to authenticate users to their organisation’s online customer services that process, store or communicate their organisation’s sensitive customer data. Multi-factor authentication is used to authenticate users to third-party online customer services that process, store or communicate their organisation’s sensitive customer data. Multi-factor authentication is used to authenticate customers to online customer services that process, store or communicate sensitive customer data. Multi-factor authentication is used to authenticate privileged users of systems. Multi-factor authentication is used to authenticate unprivileged users of systems. Multi-factor authentication is used to authenticate users of data repositories. Multi-factor authentication uses either: something users have and something users know, or something users have that is unlocked by something users know or are. Multi-factor authentication used for authenticating users of online services is phishing-resistant. Multi-factor authentication used for authenticating customers of online customer services is phishing-resistant. Multi-factor authentication used for authenticating users of systems is phishing-resistant. Multi-factor authentication used for authenticating users of data repositories is phishing-resistant. Successful and unsuccessful multi-factor authentication events are centrally logged. Event logs are protected from unauthorised modification and deletion. Event logs from internet-facing servers are analysed in a timely manner to detect cyber security events. Event logs from non-internet-facing servers are analysed in a timely manner to detect cyber security events. Event logs from workstations are analysed in a timely manner to detect cyber security events. Cyber security events are analysed in a timely manner to identify cyber security incidents. Cyber security incidents are reported to the Chief Information Security Officer, or one of their delegates, as soon as possible after they occur or are discovered. Cyber security incidents are reported to ASD as soon as possible after they occur or are discovered. Following the identification of a cyber security incident, the cyber security incident response plan is enacted.

**Bridging SCF Controls:** MON-02.2, MON-03, MON-08

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control ML3-P4

> Restrict administrative privileges: Requests for privileged access to systems, applications and data repositories are validated when first requested. Privileged access to systems, applications and data repositories is disabled after 12 months unless revalidated. Privileged access to systems and applications is disabled after 45 days of inactivity. Privileged users are assigned a dedicated privileged user account to be used solely for duties requiring privileged access. Privileged access to systems, applications and data repositories is limited to only what is required for users and services to undertake their duties. Privileged user accounts (excluding those explicitly authorised to access online services) are prevented from accessing the internet, email and web services. Privileged user accounts explicitly authorised to access online services are strictly limited to only what is required for users and services to undertake their duties. Secure Admin Workstations are used in the performance of administrative activities. Privileged users use separate privileged and unprivileged operating environments. Privileged operating environments are not virtualised within unprivileged operating environments. Unprivileged user accounts cannot logon to privileged operating environments. Privileged user accounts (excluding local administrator accounts) cannot logon to unprivileged operating environments. Just-in-time administration is used for administering systems and applications. Administrative activities are conducted through jump servers. Credentials for break glass accounts, local administrator accounts and service accounts are long, unique, unpredictable and managed. Memory integrity functionality is enabled. Local Security Authority protection functionality is enabled. Credential Guard functionality is enabled. Remote Credential Guard functionality is enabled. Privileged access events are centrally logged. Privileged user account and security group management events are centrally logged. Event logs are protected from unauthorised modification and deletion.

**Bridging SCF Controls:** CFG-02, IAC-15.3, IAC-15.9, IAC-16, IAC-21, MON-02.2, MON-08

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- fleet-9.jit-inactivity -- Configure an inactivity expiry for Just-In-Time users.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.
- sddc-9.api-admin -- SDDC Manager must configure the API admin account.
- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control ML3-P5

> Application control: Application control is implemented on workstations. Application control is implemented on internet-facing servers. Application control is implemented on non-internet-facing servers. Application control is applied to user profiles and temporary folders used by operating systems, web browsers and email clients. Application control is applied to all locations other than user profiles and temporary folders used by operating systems, web browsers and email clients. Application control restricts the execution of executables, software libraries, scripts, installers, compiled HTML, HTML applications and control panel applets to an organisation-approved set. Application control restricts the execution of drivers to an organisation-approved set. Microsoft’s recommended application blocklist is implemented. Microsoft’s vulnerable driver blocklist is implemented. Application control rulesets are validated on an annual or more frequent basis. Allowed and blocked application control events are centrally logged. Event logs are protected from unauthorised modification and deletion.

**Bridging SCF Controls:** CFG-02, CFG-03.2, MON-02.2, MON-03, MON-08

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- esx-9.vib-trusted-binaries -- The ESX host must only execute binaries delivered through a signed VIB.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control ML3-P6

> Restrict Microsoft Office macros: Microsoft Office macros are disabled for users that do not have a demonstrated business requirement. Only Microsoft Office macros running from within a sandboxed environment, a Trusted Location or that are digitally signed by a trusted publisher are allowed to execute. Microsoft Office macros are checked to ensure they are free of malicious code before being digitally signed or placed within Trusted Locations. Only privileged users responsible for checking that Microsoft Office macros are free of malicious code can write to and modify content within Trusted Locations. Microsoft Office macros digitally signed by an untrusted publisher cannot be enabled via the Message Bar or Backstage View. Microsoft Office macros digitally signed by signatures other than V3 signatures cannot be enabled via the Message Bar or Backstage View. Microsoft Office’s list of trusted publishers is validated on an annual or more frequent basis. Microsoft Office macros in files originating from the internet are blocked. Microsoft Office macro antivirus scanning is enabled. Microsoft Office macros are blocked from making Win32 API calls. Microsoft Office macro security settings cannot be changed by users.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control ML3-P7

> User application hardening: Internet Explorer 11 is disabled or removed. Web browsers do not process Java from the internet. Web browsers do not process web advertisements from the internet. Web browsers are hardened using ASD and vendor hardening guidance, with the most restrictive guidance taking precedence when conflicts occur. Web browser security settings cannot be changed by users. Microsoft Office is blocked from creating child processes. Microsoft Office is blocked from creating executable content. Microsoft Office is blocked from injecting code into other processes. Microsoft Office is configured to prevent activation of Object Linking and Embedding packages. Office productivity suites are hardened using ASD and vendor hardening guidance, with the most restrictive guidance taking precedence when conflicts occur. Office productivity suite security settings cannot be changed by users. PDF software is blocked from creating child processes. PDF software is hardened using ASD and vendor hardening guidance, with the most restrictive guidance taking precedence when conflicts occur. PDF software security settings cannot be changed by users. .NET Framework 3.5 (includes .NET 2.0 and 3.0) is disabled or removed. Windows PowerShell 2.0 is disabled or removed. PowerShell is configured to use Constrained Language Mode. PowerShell module logging, script block logging and transcription events are centrally logged. Command line process creation events are centrally logged. Event logs are protected from unauthorised modification and deletion. Event logs from internet-facing servers are analysed in a timely manner to detect cyber security events. Event logs from non-internet-facing servers are analysed in a timely manner to detect cyber security events. Event logs from workstations are analysed in a timely manner to detect cyber security events. Cyber security events are analysed in a timely manner to identify cyber security incidents. Cyber security incidents are reported to the Chief Information Security Officer, or one of their delegates, as soon as possible after they occur or are discovered. Cyber security incidents are reported to ASD as soon as possible after they occur or are discovered. Following the identification of a cyber security incident, the cyber security incident response plan is enacted.

**Bridging SCF Controls:** CFG-02, MON-02.2, MON-08

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control ML3-P8

> Regular backups: Backups of data, applications and settings are performed and retained in accordance with business criticality and business continuity requirements. Backups of data, applications and settings are synchronised to enable restoration to a common point in time. Backups of data, applications and settings are retained in a secure and resilient manner. Restoration of data, applications and settings from backups to a common point in time is tested as part of disaster recovery exercises. Unprivileged user accounts cannot access backups belonging to other user accounts. Unprivileged user accounts cannot access their own backups. Privileged user accounts (excluding backup administrator accounts) cannot access backups belonging to other user accounts. Privileged user accounts (excluding backup administrator accounts) cannot access their own backups. Unprivileged accounts are prevented from modifying and deleting backups. Privileged user accounts (excluding backup administrator accounts) are prevented from modifying and deleting backups. Backup administrator accounts are prevented from modifying and deleting backups during their retention period.

**Bridging SCF Controls:** BCD-11

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.
