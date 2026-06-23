# Companion Guide to IEC 62443-4-2 for VMware Cloud Foundation 9.1 -- Framework Controls by SCG Coverage

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://webstore.iec.ch/en/publication/34421

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

78 framework controls have at least one Security Configuration Guide hardening control mapped to them through the SCF crosswalk.

### Control CR 1.1

> Human user identification and authentication: Provide the capability to identify and authenticate all human users on all interfaces capable of human user access.  Unique identification and authentication: Capability to uniquely identify and authenticate all human users.  Multifactor authentication for untrusted networks: Capability to employ multi-factor authentication for all human user access from an untrusted network.  Authenticator feedback: Obscure feedback of authentication information (e.g., asterisks) during entry.  Unsuccessful login attempts: Enforce a limit of consecutive invalid login attempts before lockout or delay.  System use notification: Display a notification message before establishing user identification.  Access via untrusted networks: Monitor and control all access attempts from untrusted networks.  Strength of symmetric key-based authentication: Capability to manage symmetric keys securely.  Symmetric key protection: Hardware-based protection for symmetric keys.

**Bridging SCF Controls:** IAC-02

**Relevant SCG Controls:**

- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control CR 1.2

> Software process and device identification and authentication: Capability to identify and authenticate all software processes and devices.  Unique identification and authentication: Capability to uniquely identify and authenticate all software processes and devices.

**Bridging SCF Controls:** IAC-04

**Relevant SCG Controls:**

- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control CR 1.2(1)

> Software process and device identification and authentication: Capability to identify and authenticate all software processes and devices.  Unique identification and authentication: Capability to uniquely identify and authenticate all software processes and devices.

**Bridging SCF Controls:** IAC-04

**Relevant SCG Controls:**

- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control CR 1.5

> Authenticator management: Support the management of authenticators (passwords, tokens, keys) used by the component.  Hardware security for authenticators: Capability to protect authenticators using hardware mechanisms (e.g., TPM).  Authenticator management enhancement: Additional requirements for secure authenticator storage.

**Bridging SCF Controls:** IAC-10

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.

### Control CR 1.5(a)

> Sub-item (a) of CR 1.5 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 1.5 requirement in the standard.

**Bridging SCF Controls:** IAC-10.8

**Relevant SCG Controls:**

- esx-9.ad-admin-group-name -- The ESX host must not use the default "ESX Admins" Active Directory group.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- sddc-9.api-admin -- SDDC Manager must configure the API admin account.

### Control CR 1.5(b)

> Sub-item (b) of CR 1.5 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 1.5 requirement in the standard.

**Bridging SCF Controls:** IAC-10.8

**Relevant SCG Controls:**

- esx-9.ad-admin-group-name -- The ESX host must not use the default "ESX Admins" Active Directory group.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- sddc-9.api-admin -- SDDC Manager must configure the API admin account.

### Control CR 1.5(c)

> Sub-item (c) of CR 1.5 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 1.5 requirement in the standard.

**Bridging SCF Controls:** IAC-10.1

**Relevant SCG Controls:**

- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control CR 1.7

> Password strength enhancement: Capability to enforce specific password complexity rules.  Strength of password-based authentication: Enforce configurable password strength requirements.

**Bridging SCF Controls:** IAC-10.1

**Relevant SCG Controls:**

- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control CR 1.7(1)

> Password strength enhancement: Capability to enforce specific password complexity rules.  Strength of password-based authentication: Enforce configurable password strength requirements.

**Bridging SCF Controls:** IAC-10.1

**Relevant SCG Controls:**

- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control CR 1.7(2)

> Requirement enhancement (2) of CR 1.7 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 1.7 requirement in the standard.

**Bridging SCF Controls:** IAC-10.1

**Relevant SCG Controls:**

- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control CR 1.9

> Strength of function: Ensure that authentication mechanisms are robust against brute force attacks.  Strength of function enhancement: Specific metrics for resistance to automated login attempts.

**Bridging SCF Controls:** IAC-10

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.

### Control CR 1.9(a)

> Sub-item (a) of CR 1.9 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 1.9 requirement in the standard.

**Bridging SCF Controls:** IAC-10.2

**Relevant SCG Controls:**

- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.log-forwarding-tls-x509 -- The ESX host must use strict x509 verification for TLS-enabled remote logging endpoints.
- operations-9.certificates-validation -- VCF Operations must activate certificate validation.

### Control CR 1.9(b)

> Sub-item (b) of CR 1.9 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 1.9 requirement in the standard.

**Bridging SCF Controls:** IAC-10.2

**Relevant SCG Controls:**

- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.log-forwarding-tls-x509 -- The ESX host must use strict x509 verification for TLS-enabled remote logging endpoints.
- operations-9.certificates-validation -- VCF Operations must activate certificate validation.

### Control CR 1.9(c)

> Sub-item (c) of CR 1.9 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 1.9 requirement in the standard.

**Bridging SCF Controls:** IAC-10.2

**Relevant SCG Controls:**

- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.log-forwarding-tls-x509 -- The ESX host must use strict x509 verification for TLS-enabled remote logging endpoints.
- operations-9.certificates-validation -- VCF Operations must activate certificate validation.

### Control CR 1.9(d)

> Sub-item (d) of CR 1.9 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 1.9 requirement in the standard.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control CR 1.9(e)

> Sub-item (e) of CR 1.9 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 1.9 requirement in the standard.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control CR 1.9(f)

> Sub-item (f) of CR 1.9 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 1.9 requirement in the standard.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control CR 1.11

> Unsuccessful login attempts: Enforce a limit of consecutive invalid login attempts before lockout or delay.

**Bridging SCF Controls:** IAC-22

**Relevant SCG Controls:**

- esx-9.account-lockout-duration -- The ESX host must enforce an unlock timeout.
- esx-9.account-lockout-max-attempts -- The ESX host must enforce a limit on consecutive invalid logon attempts by a user.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.account-lockout-max-attempts -- NSX Manager must enforce an account lockout after consecutive failed authentication attempts.
- operations-9.account-lockout -- VCF Operations must lock accounts after consecutive failed logon attempts.
- vcenter-9.account-lockout-duration -- Set the vCenter account auto-unlock interval.
- vcenter-9.account-lockout-max-attempts -- Lock vCenter accounts after repeated failed login attempts.
- vcenter-9.account-lockout-reset -- Set the vCenter failed-login counting interval.

### Control CR 1.11(a)

> Sub-item (a) of CR 1.11 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 1.11 requirement in the standard.

**Bridging SCF Controls:** IAC-22

**Relevant SCG Controls:**

- esx-9.account-lockout-duration -- The ESX host must enforce an unlock timeout.
- esx-9.account-lockout-max-attempts -- The ESX host must enforce a limit on consecutive invalid logon attempts by a user.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.account-lockout-max-attempts -- NSX Manager must enforce an account lockout after consecutive failed authentication attempts.
- operations-9.account-lockout -- VCF Operations must lock accounts after consecutive failed logon attempts.
- vcenter-9.account-lockout-duration -- Set the vCenter account auto-unlock interval.
- vcenter-9.account-lockout-max-attempts -- Lock vCenter accounts after repeated failed login attempts.
- vcenter-9.account-lockout-reset -- Set the vCenter failed-login counting interval.

### Control CR 1.11(b)

> Sub-item (b) of CR 1.11 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 1.11 requirement in the standard.

**Bridging SCF Controls:** IAC-22

**Relevant SCG Controls:**

- esx-9.account-lockout-duration -- The ESX host must enforce an unlock timeout.
- esx-9.account-lockout-max-attempts -- The ESX host must enforce a limit on consecutive invalid logon attempts by a user.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.account-lockout-max-attempts -- NSX Manager must enforce an account lockout after consecutive failed authentication attempts.
- operations-9.account-lockout -- VCF Operations must lock accounts after consecutive failed logon attempts.
- vcenter-9.account-lockout-duration -- Set the vCenter account auto-unlock interval.
- vcenter-9.account-lockout-max-attempts -- Lock vCenter accounts after repeated failed login attempts.
- vcenter-9.account-lockout-reset -- Set the vCenter failed-login counting interval.

### Control CR 1.12

> System use notification: Display a notification message before establishing user identification.

**Bridging SCF Controls:** SEA-18

**Relevant SCG Controls:**

- esx-9.etc-issue -- Configure the login banner for ESX host SSH connections.
- esx-9.login-message -- Configure the ESX host login banner for the DCUI and Host Client.
- networks-9.login-message -- Configure the VCF Operations for Networks login banner.
- nsx-9.login-message -- Configure the NSX Manager login banner.
- operations-9.login-message -- Configure the VCF Operations login banner.
- vcenter-9.etc-issue -- Configure the vCenter SSH login banner (/etc/issue).
- vcenter-9.login-message -- Configure the vCenter login banner for the vSphere Client.

### Control CR 2.2

> Wireless use control: Capability to authorize and restrict the use of wireless communications.

**Bridging SCF Controls:** CFG-02, CFG-03

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.ceip-disable -- Disable the ESX Customer Experience Improvement Program.
- esx-9.deactivate-mob -- The ESX Managed Object Browser (MOB) must be disabled.
- esx-9.deactivate-shell -- The ESX Shell must be disabled.
- esx-9.forensic-snapshots -- Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- esx-9.hardware-ports -- Disable or physically protect unused external server ports.
- esx-9.hardware-virtual-nic -- The ESX host must not enable virtual hardware management network interfaces.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.snmp -- The SNMP service on the ESX host must not be configured to start automatically.
- esx-9.ssh -- The ESX host's SSH service must be deactivated except for temporary diagnostic use.
- guest-9.tools-deactivate-appinfo -- The guest OS must deactivate Appinfo information gathering unless required.
- guest-9.tools-deactivate-containerinfo -- The guest OS must deactivate ContainerInfo unless required.
- guest-9.tools-deactivate-guestoperations -- The guest OS must deactivate Guest Operations unless required.
- guest-9.tools-deactivate-gueststoreupgrade -- The guest OS must deactivate Guest Store Upgrade operations unless required.
- guest-9.tools-deactivate-servicediscovery -- The guest OS must deactivate Service Discovery unless required.
- installer-9.security -- The VCF Installer appliance must be removed or powered off after deployment completes, unless it has been converted into the SDDC Manager.
- nsx-9.ceip-disable -- Disable the NSX Manager Customer Experience Improvement Program.
- nsx-9.dhcp-disable -- NSX Tier-0 Gateway must not enable DHCP unless it is required.
- nsx-9.multicast-disable -- NSX Tier-0 Gateway must disable multicast and PIM where they are not required.
- nsx-9.snmp -- NSX Manager must not use SNMP v1 or v2c.
- nsx-9.ssh -- The NSX Manager SSH service must be deactivated except for temporary diagnostic use.
- nsx-9.t1-dhcp-disable -- Disable Tier-1 Gateway DHCP service when not in use.
- nsx-9.t1-multicast-disable -- Disable Tier-1 Gateway multicast when not in use.
- operations-9.ceip-disable -- Disable the VCF Operations Customer Experience Improvement Program.
- operations-9.in-page-feedback -- Disable VCF Operations in-page feedback.
- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.
- vcenter-9.ceip-disable -- Disable the vCenter Customer Experience Improvement Program.
- vcenter-9.client-feedback -- Disable vSphere Client in-product feedback.
- vcenter-9.client-telemetry -- Disable vSphere Client UI telemetry.
- vcenter-9.network-restrict-discovery-protocol -- Disable CDP/LLDP discovery protocols on distributed switches unless required.
- vcenter-9.snmp -- Disable SNMP v1 and v2c receivers on vCenter.
- vcenter-9.ssh -- Deactivate SSH access to the vCenter appliance except for temporary diagnostic use.
- vcenter-9.vds-health-check-disable -- Disable the vSphere Distributed Switch health check when not troubleshooting.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.deactivate-console-copy -- Virtual machines must have console copy operations deactivated.
- vm-9.deactivate-console-paste -- Virtual machines must have console paste operations deactivated.
- vm-9.deactivate-disk-shrinking-shrink -- Virtual machines must have virtual disk shrinking operations deactivated.
- vm-9.deactivate-disk-shrinking-wiper -- Virtual machines must have virtual disk wiping operations deactivated.
- vm-9.deactivate-non-essential-3d-features -- Virtual machines must have 3D graphics features deactivated when not required.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vm-9.efi-boot-types -- Virtual machines must prevent booting from unauthorized sources.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.isolation-tools-dnd-deactivate -- Virtual machines must have console drag and drop operations deactivated.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.
- vm-9.persistent-disk -- Virtual machines must not use independent, nonpersistent disks.
- vm-9.remove-unnecessary-devices -- Virtual machines must remove unnecessary virtual hardware.
- vm-9.restrict-host-info -- Virtual machines must not be able to obtain host information from the hypervisor.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.

### Control CR 2.5

> Session lock: Inhibit further access to the component after a period of inactivity.

**Bridging SCF Controls:** IAC-24

**Relevant SCG Controls:**

- vm-9.vmrc-lock -- Virtual machines must be configured to lock when the last console connection is closed.

### Control CR 2.5(a)

> Sub-item (a) of CR 2.5 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 2.5 requirement in the standard.

**Bridging SCF Controls:** IAC-24

**Relevant SCG Controls:**

- vm-9.vmrc-lock -- Virtual machines must be configured to lock when the last console connection is closed.

### Control CR 2.5(b)

> Sub-item (b) of CR 2.5 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 2.5 requirement in the standard.

**Bridging SCF Controls:** IAC-24

**Relevant SCG Controls:**

- vm-9.vmrc-lock -- Virtual machines must be configured to lock when the last console connection is closed.

### Control CR 2.7

> Session termination: Automatically terminate local/remote sessions after defined conditions.

**Bridging SCF Controls:** IAC-23

**Relevant SCG Controls:**

- operations-9.concurrent-sessions -- VCF Operations must limit the number of concurrent sessions.
- vm-9.limit-console-connections -- Virtual machines must limit console sharing.

### Control CR 2.8

> Auditable events: Capability to generate audit records for security-relevant events.

**Bridging SCF Controls:** MON-01.4, MON-03

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control CR 2.9(a)

> Sub-item (a) of CR 2.9 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 2.9 requirement in the standard.

**Bridging SCF Controls:** MON-04

**Relevant SCG Controls:**

- esx-9.hardware-boot -- The environment must use adequately sized persistent, non-SD, non-USB devices for ESX boot volumes.
- esx-9.log-audit-local-capacity -- The ESX host must store audit records for a time period consistent with your records retention policy.
- vm-9.log-retention -- Virtual machines must limit the number of retained diagnostic logs.
- vm-9.log-rotation-size -- Virtual machines must limit the size of diagnostic logs.

### Control CR 2.9(b)

> Sub-item (b) of CR 2.9 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 2.9 requirement in the standard.

**Bridging SCF Controls:** MON-04

**Relevant SCG Controls:**

- esx-9.hardware-boot -- The environment must use adequately sized persistent, non-SD, non-USB devices for ESX boot volumes.
- esx-9.log-audit-local-capacity -- The ESX host must store audit records for a time period consistent with your records retention policy.
- vm-9.log-retention -- Virtual machines must limit the number of retained diagnostic logs.
- vm-9.log-rotation-size -- Virtual machines must limit the size of diagnostic logs.

### Control CR 2.10(b)

> Sub-item (b) of CR 2.10 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 2.10 requirement in the standard.

**Bridging SCF Controls:** BCD-12.2

**Relevant SCG Controls:**

- nsx-9.service-resilience -- When NSX Manager runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.
- operations-9.service-resilience -- When VCF Operations runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.
- vcenter-9.service-resilience-ha -- Enable vSphere High Availability on clusters.

### Control CR 2.11

> Timestamps: Capability to include timestamps in audit records.  Time synchronization: Capability to synchronize the component clock with an NTP source.  Time synchronization protection: Protect the time synchronization process from tampering.

**Bridging SCF Controls:** MON-07

**Relevant SCG Controls:**

- nsx-9.timezone-utc -- Set NSX Manager timezone to UTC for consistent audit timestamps.

### Control CR 2.11(1)

> Timestamps: Capability to include timestamps in audit records.  Time synchronization: Capability to synchronize the component clock with an NTP source.  Time synchronization protection: Protect the time synchronization process from tampering.

**Bridging SCF Controls:** MON-07.1

**Relevant SCG Controls:**

- esx-9.hardware-management-time -- Synchronize hardware management controller time with organizational reference sources.
- esx-9.time -- The ESX host must synchronize its clock with organizational reference sources.
- fleet-9.time -- Configure fleet-wide time synchronization.
- pnr-9.time -- The VCF Protection and Recovery appliance must synchronize its clock with organizational reference sources.
- vcenter-9.time -- vCenter must synchronize its clock with organizational reference sources.

### Control CR 2.11(2)

> Timestamps: Capability to include timestamps in audit records.  Time synchronization: Capability to synchronize the component clock with an NTP source.  Time synchronization protection: Protect the time synchronization process from tampering.

**Bridging SCF Controls:** SEA-20

**Relevant SCG Controls:**

- esx-9.hardware-management-time -- Synchronize hardware management controller time with organizational reference sources.
- esx-9.time -- The ESX host must synchronize its clock with organizational reference sources.
- fleet-9.time -- Configure fleet-wide time synchronization.
- pnr-9.time -- The VCF Protection and Recovery appliance must synchronize its clock with organizational reference sources.
- vcenter-9.time -- vCenter must synchronize its clock with organizational reference sources.

### Control CR 3.1

> Communication integrity: Components shall provide the capability to protect the integrity of data in transit.  Communication integrity enhancement: Use of cryptographic mechanisms to protect integrity.  Support for updates: Provide a mechanism to verify and apply security updates.  Physical tamper resistance/detection: Capability to detect or resist physical tampering.  Provisioning Product: Ensure secure provisioning of the product during manufacturing.  Integrity of the boot process: Verify the integrity of the boot process (Secure Boot).  Integrity of data at rest: Protect the integrity of sensitive data stored on the component.

**Bridging SCF Controls:** CRY-04

**Relevant SCG Controls:**

- nsx-9.bgp-encryption -- Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.
- nsx-9.ospf-encryption -- NSX Tier-0 Gateway must enable OSPF authentication.
- operations-9.logs-ssl-api -- Enable SSL for API log ingestion in VCF Operations.
- operations-9.logs-ssl-syslog -- Enable SSL for syslog log ingestion in VCF Operations.
- vm-9.ft-encrypted -- Virtual machines must require encryption for Fault Tolerance.
- vm-9.vmotion-encrypted -- Virtual machines must require encryption for vMotion.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.

### Control CR 3.1(1)

> Communication integrity: Components shall provide the capability to protect the integrity of data in transit.  Communication integrity enhancement: Use of cryptographic mechanisms to protect integrity.  Support for updates: Provide a mechanism to verify and apply security updates.  Physical tamper resistance/detection: Capability to detect or resist physical tampering.  Provisioning Product: Ensure secure provisioning of the product during manufacturing.  Integrity of the boot process: Verify the integrity of the boot process (Secure Boot).  Integrity of data at rest: Protect the integrity of sensitive data stored on the component.

**Bridging SCF Controls:** CRY-04

**Relevant SCG Controls:**

- nsx-9.bgp-encryption -- Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.
- nsx-9.ospf-encryption -- NSX Tier-0 Gateway must enable OSPF authentication.
- operations-9.logs-ssl-api -- Enable SSL for API log ingestion in VCF Operations.
- operations-9.logs-ssl-syslog -- Enable SSL for syslog log ingestion in VCF Operations.
- vm-9.ft-encrypted -- Virtual machines must require encryption for Fault Tolerance.
- vm-9.vmotion-encrypted -- Virtual machines must require encryption for vMotion.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.

### Control CR 3.4(1)

> Software and information integrity: Provide the capability to verify the integrity of software, firmware, and data at rest.  Authenticity of software/firmware: Capability to verify the authenticity of software and firmware before installation.  Automated notification of integrity violations: Provide automated notification if integrity violations are detected.

**Bridging SCF Controls:** CHG-04.2

**Relevant SCG Controls:**

- esx-9.vib-acceptance-level-supported -- The ESX host image profile acceptance level must be PartnerSupported or higher.
- operations-9.unsigned-pak -- VCF Operations must disable unsigned management pack installation.
- vcenter-9.content-library-ovf -- VMware vCenter must enable the OVF security policy on content libraries.

### Control CR 3.8

> Requirement CR 3.8 in IEC 62443-4-2. The licensed standard text is not reproduced here; refer to the standard.

**Bridging SCF Controls:** NET-09

**Relevant SCG Controls:**

- nsx-9.bgp-encryption -- Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.
- nsx-9.ospf-encryption -- NSX Tier-0 Gateway must enable OSPF authentication.

### Control CR 3.8(a)

> Session integrity: Protect the integrity of communication sessions at the application layer.  Invalidate session identifiers: Capability to invalidate session identifiers upon logout or timeout.  Unique session identifiers: Generate unique session identifiers.

**Bridging SCF Controls:** NET-09

**Relevant SCG Controls:**

- nsx-9.bgp-encryption -- Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.
- nsx-9.ospf-encryption -- NSX Tier-0 Gateway must enable OSPF authentication.

### Control CR 3.8(b)

> Session integrity: Protect the integrity of communication sessions at the application layer.  Invalidate session identifiers: Capability to invalidate session identifiers upon logout or timeout.  Unique session identifiers: Generate unique session identifiers.

**Bridging SCF Controls:** NET-09

**Relevant SCG Controls:**

- nsx-9.bgp-encryption -- Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.
- nsx-9.ospf-encryption -- NSX Tier-0 Gateway must enable OSPF authentication.

### Control CR 3.8(c)

> Session integrity: Protect the integrity of communication sessions at the application layer.  Invalidate session identifiers: Capability to invalidate session identifiers upon logout or timeout.  Unique session identifiers: Generate unique session identifiers.

**Bridging SCF Controls:** NET-09

**Relevant SCG Controls:**

- nsx-9.bgp-encryption -- Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.
- nsx-9.ospf-encryption -- NSX Tier-0 Gateway must enable OSPF authentication.

### Control CR 3.9

> Audit storage capacity: Ensure sufficient storage for audit records and define behavior when full.  Warning on capacity: Provide a warning when audit storage reaches a defined threshold.

**Bridging SCF Controls:** MON-08

**Relevant SCG Controls:**

- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.

### Control CR 3.14

> Integrity of data at rest: Protect the integrity of sensitive data stored on the component.

**Bridging SCF Controls:** END-06.5

**Relevant SCG Controls:**

- esx-9.hardware-boot-order -- Restrict the server firmware boot order to authorized boot devices.
- esx-9.hardware-cpu-intel-txt -- Enable Intel TXT in system firmware where available.
- esx-9.hardware-secureboot -- Enable UEFI Secure Boot.
- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.secureboot-enforcement -- The ESX host must enable Secure Boot enforcement for configuration encryption.
- esx-9.tpm-trusted-binaries -- The ESX host must enforce execInstalledOnly.
- vm-9.efi-boot-types -- Virtual machines must prevent booting from unauthorized sources.
- vm-9.secure-boot -- The guest OS must enable Secure Boot.

### Control CR 4.1(a)

> Data in transit confidentiality: Protect the confidentiality of sensitive data in transit.

**Bridging SCF Controls:** CRY-05

**Relevant SCG Controls:**

- esx-9.memory-tiering-encryption -- The ESX host should encrypt data written to tiered memory devices.
- esx-9.tpm-configuration -- The ESX host must require TPM-based configuration encryption.
- vsan-9.encryption-rest -- vSAN must protect data at rest.

### Control CR 4.1(b)

> Sub-item (b) of CR 4.1 in IEC 62443-4-2. The licensed standard text is not reproduced at this granularity; refer to the CR 4.1 requirement in the standard.

**Bridging SCF Controls:** CRY-03

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.tls-ciphers -- The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- esx-9.vmotion-encryption-offload -- Accelerate vMotion encryption using available hardware offload on ESX hosts.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- nsx-9.tls-ciphers -- NSX Manager must use TLS with approved protocol versions and cipher suites.
- operations-9.logs-ssl-api -- Enable SSL for API log ingestion in VCF Operations.
- operations-9.logs-ssl-syslog -- Enable SSL for syslog log ingestion in VCF Operations.
- vcenter-9.smtp -- Send vCenter notification email over a secure SMTP connection.
- vcenter-9.tls-ciphers -- vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- vm-9.ft-encrypted -- Virtual machines must require encryption for Fault Tolerance.
- vm-9.vmotion-encrypted -- Virtual machines must require encryption for vMotion.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control CR 4.3

> Use of cryptography: Use industry-recognized cryptographic standards and algorithms.

**Bridging SCF Controls:** CRY-01

**Relevant SCG Controls:**

- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

### Control CR 5.1

> Network segmentation: Capability to support logical or physical network segmentation.

**Bridging SCF Controls:** NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control CR 5.2

> Zone boundary protection: Control data flow through zone boundaries.

**Bridging SCF Controls:** NET-03

**Relevant SCG Controls:**

- nsx-9.ibgp-source-loopback -- Configure Tier-0 Gateway iBGP peering to use the loopback address as the source.
- nsx-9.reverse-path-forwarding -- NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.network-mac-learning -- Disable MAC learning on distributed switch port groups unless a workload requires it.
- vcenter-9.network-reject-forged-transmit-dvportgroup -- Reject forged transmits on distributed switches and port groups.
- vcenter-9.network-reject-mac-changes-dvportgroup -- Reject guest MAC address changes on distributed switches and port groups.
- vcenter-9.network-reset-port -- Reset distributed switch port configuration when a virtual machine disconnects.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-restrict-port-level-overrides -- Disallow per-port policy overrides on distributed port groups, except port blocking.
- vcenter-9.network-restrict-port-mirroring -- Remove unauthorized port mirroring sessions on distributed switches.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.

### Control CR 5.3

> General purpose person-to-person communication: Restrict person-to-person communication (e.g., email) from IACS components.

**Bridging SCF Controls:** NET-04.1

**Relevant SCG Controls:**

- esx-9.firewall-incoming-default -- The ESX host must configure the firewall to block network traffic by default.
- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.
- vcf-9.perimeter-firewall -- Limit access to VCF component management interfaces with perimeter firewalls.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.

### Control CR 6.1

> Audit reporting: Capability to report audit records to a centralized repository.  Automated reporting: Provide automated transmission of audit records.

**Bridging SCF Controls:** MON-08

**Relevant SCG Controls:**

- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.

### Control CR 6.1(1)

> Audit reporting: Capability to report audit records to a centralized repository.  Automated reporting: Provide automated transmission of audit records.

**Bridging SCF Controls:** MON-08

**Relevant SCG Controls:**

- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.

### Control CR 7.1

> Denial of service protection: Capability to maintain essential functions during a DoS attack.  Resource management: Manage resources to prevent exhaustion.

**Bridging SCF Controls:** BCD-12.2, NET-02.1

**Relevant SCG Controls:**

- esx-9.network-bpdu -- Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.
- nsx-9.bgp-max-prefixes -- Configure BGP maximum prefix limits on Tier-0 Gateway neighbors.
- nsx-9.reverse-path-forwarding -- NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.
- nsx-9.service-resilience -- When NSX Manager runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.
- nsx-9.t0-ipv6-hop-limit -- The NSX Tier-0 Gateway must advertise a sufficient IPv6 Router Advertisement hop limit.
- nsx-9.t1-ipv6-hop-limit -- The NSX Tier-1 Gateway must advertise a sufficient IPv6 Router Advertisement hop limit.
- operations-9.service-resilience -- When VCF Operations runs as a multi-node cluster, DRS anti-affinity rules must separate the nodes across hosts.
- vcenter-9.network-nioc -- Enable Network I/O Control on distributed switches.
- vcenter-9.service-resilience-ha -- Enable vSphere High Availability on clusters.

### Control CR 7.1(1)

> Denial of service protection: Capability to maintain essential functions during a DoS attack.  Resource management: Manage resources to prevent exhaustion.

**Bridging SCF Controls:** NET-02.1

**Relevant SCG Controls:**

- esx-9.network-bpdu -- Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.
- nsx-9.bgp-max-prefixes -- Configure BGP maximum prefix limits on Tier-0 Gateway neighbors.
- nsx-9.reverse-path-forwarding -- NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.
- nsx-9.t0-ipv6-hop-limit -- The NSX Tier-0 Gateway must advertise a sufficient IPv6 Router Advertisement hop limit.
- nsx-9.t1-ipv6-hop-limit -- The NSX Tier-1 Gateway must advertise a sufficient IPv6 Router Advertisement hop limit.
- vcenter-9.network-nioc -- Enable Network I/O Control on distributed switches.

### Control CR 7.2

> Resource management: Allocate resources to prioritize essential functions.

**Bridging SCF Controls:** CAP-01

**Relevant SCG Controls:**

- vcenter-9.drs -- VMware vCenter must enable the Distributed Resource Scheduler for resilience and to enable automated patching.
- vsan-9.automatic-rebalance -- vSAN must enable automatic data rebalancing.
- vsan-9.operations-reserve -- vSAN must reserve space to complete internal maintenance operations.

### Control CR 7.3

> Control system backup: Support the backup of configuration and user data.  Verify backup integrity: Capability to verify the integrity of backups.

**Bridging SCF Controls:** BCD-11

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.

### Control CR 7.6

> Network and security configuration settings: Protect configuration settings from unauthorized changes.  Automated configuration monitoring: Monitor for unauthorized configuration changes.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control CR 7.7

> Least functionality: Disable unnecessary ports, protocols, and services.

**Bridging SCF Controls:** CFG-03

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.ceip-disable -- Disable the ESX Customer Experience Improvement Program.
- esx-9.deactivate-mob -- The ESX Managed Object Browser (MOB) must be disabled.
- esx-9.deactivate-shell -- The ESX Shell must be disabled.
- esx-9.forensic-snapshots -- Leave forensic memory snapshots disabled except on hosts used for deliberate memory capture.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- esx-9.hardware-ports -- Disable or physically protect unused external server ports.
- esx-9.hardware-virtual-nic -- The ESX host must not enable virtual hardware management network interfaces.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.snmp -- The SNMP service on the ESX host must not be configured to start automatically.
- esx-9.ssh -- The ESX host's SSH service must be deactivated except for temporary diagnostic use.
- guest-9.tools-deactivate-appinfo -- The guest OS must deactivate Appinfo information gathering unless required.
- guest-9.tools-deactivate-containerinfo -- The guest OS must deactivate ContainerInfo unless required.
- guest-9.tools-deactivate-guestoperations -- The guest OS must deactivate Guest Operations unless required.
- guest-9.tools-deactivate-gueststoreupgrade -- The guest OS must deactivate Guest Store Upgrade operations unless required.
- guest-9.tools-deactivate-servicediscovery -- The guest OS must deactivate Service Discovery unless required.
- installer-9.security -- The VCF Installer appliance must be removed or powered off after deployment completes, unless it has been converted into the SDDC Manager.
- nsx-9.ceip-disable -- Disable the NSX Manager Customer Experience Improvement Program.
- nsx-9.dhcp-disable -- NSX Tier-0 Gateway must not enable DHCP unless it is required.
- nsx-9.multicast-disable -- NSX Tier-0 Gateway must disable multicast and PIM where they are not required.
- nsx-9.snmp -- NSX Manager must not use SNMP v1 or v2c.
- nsx-9.ssh -- The NSX Manager SSH service must be deactivated except for temporary diagnostic use.
- nsx-9.t1-dhcp-disable -- Disable Tier-1 Gateway DHCP service when not in use.
- nsx-9.t1-multicast-disable -- Disable Tier-1 Gateway multicast when not in use.
- operations-9.ceip-disable -- Disable the VCF Operations Customer Experience Improvement Program.
- operations-9.in-page-feedback -- Disable VCF Operations in-page feedback.
- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.
- vcenter-9.ceip-disable -- Disable the vCenter Customer Experience Improvement Program.
- vcenter-9.client-feedback -- Disable vSphere Client in-product feedback.
- vcenter-9.client-telemetry -- Disable vSphere Client UI telemetry.
- vcenter-9.network-restrict-discovery-protocol -- Disable CDP/LLDP discovery protocols on distributed switches unless required.
- vcenter-9.snmp -- Disable SNMP v1 and v2c receivers on vCenter.
- vcenter-9.ssh -- Deactivate SSH access to the vCenter appliance except for temporary diagnostic use.
- vcenter-9.vds-health-check-disable -- Disable the vSphere Distributed Switch health check when not troubleshooting.
- vm-9.deactivate-console-copy -- Virtual machines must have console copy operations deactivated.
- vm-9.deactivate-console-paste -- Virtual machines must have console paste operations deactivated.
- vm-9.deactivate-disk-shrinking-shrink -- Virtual machines must have virtual disk shrinking operations deactivated.
- vm-9.deactivate-disk-shrinking-wiper -- Virtual machines must have virtual disk wiping operations deactivated.
- vm-9.deactivate-non-essential-3d-features -- Virtual machines must have 3D graphics features deactivated when not required.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vm-9.efi-boot-types -- Virtual machines must prevent booting from unauthorized sources.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.isolation-tools-dnd-deactivate -- Virtual machines must have console drag and drop operations deactivated.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.
- vm-9.persistent-disk -- Virtual machines must not use independent, nonpersistent disks.
- vm-9.remove-unnecessary-devices -- Virtual machines must remove unnecessary virtual hardware.
- vm-9.restrict-host-info -- Virtual machines must not be able to obtain host information from the hypervisor.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.

### Control EDR 2.4(1)

> Mobile code integrity: Verify the integrity of mobile code before execution.  Mobile code authenticity: Verify the authenticity of mobile code before execution.  Mobile code authorization: Allow only authorized mobile code to execute.  Mobile code security: Provide the capability to enforce a security policy for mobile code.  Mobile code execution environment: Run mobile code in a confined environment.

**Bridging SCF Controls:** CHG-04.2

**Relevant SCG Controls:**

- esx-9.vib-acceptance-level-supported -- The ESX host image profile acceptance level must be PartnerSupported or higher.
- operations-9.unsigned-pak -- VCF Operations must disable unsigned management pack installation.
- vcenter-9.content-library-ovf -- VMware vCenter must enable the OVF security policy on content libraries.

### Control EDR 3.12

> Provisioning Product: Ensure secure unique identity provisioning during manufacturing.

**Bridging SCF Controls:** AST-18

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.

### Control EDR 3.13(a)

> Integrity of boot process: Verify firmware integrity before execution.  Boot process authenticity: Verify firmware authenticity before execution.  Secure boot: Provide a hardware-rooted secure boot process.

**Bridging SCF Controls:** AST-18

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.

### Control EDR 3.13(b)

> Integrity of boot process: Verify firmware integrity before execution.  Boot process authenticity: Verify firmware authenticity before execution.  Secure boot: Provide a hardware-rooted secure boot process.

**Bridging SCF Controls:** AST-18

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.

### Control EDR 3.14

> Integrity of data at rest: Protect embedded storage from unauthorized modification.  Cryptographic integrity: Use cryptography to protect data at rest integrity.

**Bridging SCF Controls:** END-06.5

**Relevant SCG Controls:**

- esx-9.hardware-boot-order -- Restrict the server firmware boot order to authorized boot devices.
- esx-9.hardware-cpu-intel-txt -- Enable Intel TXT in system firmware where available.
- esx-9.hardware-secureboot -- Enable UEFI Secure Boot.
- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.secureboot-enforcement -- The ESX host must enable Secure Boot enforcement for configuration encryption.
- esx-9.tpm-trusted-binaries -- The ESX host must enforce execInstalledOnly.
- vm-9.efi-boot-types -- Virtual machines must prevent booting from unauthorized sources.
- vm-9.secure-boot -- The guest OS must enable Secure Boot.

### Control EDR 3.14(1)

> Integrity of data at rest: Protect embedded storage from unauthorized modification.  Cryptographic integrity: Use cryptography to protect data at rest integrity.

**Bridging SCF Controls:** END-06.6

**Relevant SCG Controls:**

- esx-9.hardware-cpu-intel-txt -- Enable Intel TXT in system firmware where available.
- esx-9.hardware-secureboot -- Enable UEFI Secure Boot.
- esx-9.secureboot-enforcement -- The ESX host must enable Secure Boot enforcement for configuration encryption.
- vm-9.secure-boot -- The guest OS must enable Secure Boot.

### Control HDR 3.10(1)

> Host update support: Capability to update host OS and applications.  Verified host updates: Verify authenticity/integrity of host updates.

**Bridging SCF Controls:** CHG-04.2

**Relevant SCG Controls:**

- esx-9.vib-acceptance-level-supported -- The ESX host image profile acceptance level must be PartnerSupported or higher.
- operations-9.unsigned-pak -- VCF Operations must disable unsigned management pack installation.
- vcenter-9.content-library-ovf -- VMware vCenter must enable the OVF security policy on content libraries.

### Control HDR 3.12

> Host provisioning: Securely provision host unique identifiers.

**Bridging SCF Controls:** AST-18

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.

### Control HDR 3.13(a)

> Host boot integrity: Verify integrity of the host OS bootloader.  Host boot authenticity: Verify authenticity of the host OS bootloader.

**Bridging SCF Controls:** AST-18

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.

### Control HDR 3.14

> Host data at rest integrity: Protect host file system integrity.  Host storage encryption: Use cryptography for host data at rest.

**Bridging SCF Controls:** END-06.5

**Relevant SCG Controls:**

- esx-9.hardware-boot-order -- Restrict the server firmware boot order to authorized boot devices.
- esx-9.hardware-cpu-intel-txt -- Enable Intel TXT in system firmware where available.
- esx-9.hardware-secureboot -- Enable UEFI Secure Boot.
- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.secureboot-enforcement -- The ESX host must enable Secure Boot enforcement for configuration encryption.
- esx-9.tpm-trusted-binaries -- The ESX host must enforce execInstalledOnly.
- vm-9.efi-boot-types -- Virtual machines must prevent booting from unauthorized sources.
- vm-9.secure-boot -- The guest OS must enable Secure Boot.

### Control HDR 3.14(1)

> Host data at rest integrity: Protect host file system integrity.  Host storage encryption: Use cryptography for host data at rest.

**Bridging SCF Controls:** END-06.6

**Relevant SCG Controls:**

- esx-9.hardware-cpu-intel-txt -- Enable Intel TXT in system firmware where available.
- esx-9.hardware-secureboot -- Enable UEFI Secure Boot.
- esx-9.secureboot-enforcement -- The ESX host must enable Secure Boot enforcement for configuration encryption.
- vm-9.secure-boot -- The guest OS must enable Secure Boot.

### Control NDR 1.13(1)

> Untrusted network access: Control network traffic from untrusted zones.  Network access control (NAC): Implement NAC for untrusted devices.

**Bridging SCF Controls:** NET-04, NET-04.1

**Relevant SCG Controls:**

- esx-9.firewall-incoming-default -- The ESX host must configure the firewall to block network traffic by default.
- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- esx-9.network-bpdu -- Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.network-rpf-promisc -- The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.
- esx-9.network-standard-reject-forged-transmit -- Reject forged transmits on standard switches and port groups.
- esx-9.network-standard-reject-mac-changes -- Reject guest MAC address changes on standard switches and port groups.
- esx-9.network-standard-reject-promiscuous-mode -- Reject promiscuous mode on standard switches and port groups.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.network-reject-promiscuous-mode-dvportgroup -- Reject promiscuous mode on distributed switches and port groups.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-vgt -- Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.
- vcf-9.perimeter-firewall -- Limit access to VCF component management interfaces with perimeter firewalls.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.

### Control NDR 3.10(1)

> Network device updates: Support secure updates for network device firmware.  Verified network updates: Cryptographically verify network firmware updates.

**Bridging SCF Controls:** CHG-04.2

**Relevant SCG Controls:**

- esx-9.vib-acceptance-level-supported -- The ESX host image profile acceptance level must be PartnerSupported or higher.
- operations-9.unsigned-pak -- VCF Operations must disable unsigned management pack installation.
- vcenter-9.content-library-ovf -- VMware vCenter must enable the OVF security policy on content libraries.

### Control NDR 3.12

> Network provisioning: Securely provision network device identities.

**Bridging SCF Controls:** AST-18

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.

### Control NDR 3.13(a)

> Network boot integrity: Verify network device bootloader integrity.  Network boot authenticity: Verify network device bootloader authenticity.

**Bridging SCF Controls:** AST-18

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.

### Control NDR 3.13(b)

> Network boot integrity: Verify network device bootloader integrity.  Network boot authenticity: Verify network device bootloader authenticity.

**Bridging SCF Controls:** AST-18

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.

### Control NDR 3.14

> Network data at rest: Protect sensitive data stored on network devices.  Network config encryption: Encrypt stored configuration files.

**Bridging SCF Controls:** END-06.5

**Relevant SCG Controls:**

- esx-9.hardware-boot-order -- Restrict the server firmware boot order to authorized boot devices.
- esx-9.hardware-cpu-intel-txt -- Enable Intel TXT in system firmware where available.
- esx-9.hardware-secureboot -- Enable UEFI Secure Boot.
- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.secureboot-enforcement -- The ESX host must enable Secure Boot enforcement for configuration encryption.
- esx-9.tpm-trusted-binaries -- The ESX host must enforce execInstalledOnly.
- vm-9.efi-boot-types -- Virtual machines must prevent booting from unauthorized sources.
- vm-9.secure-boot -- The guest OS must enable Secure Boot.

### Control NDR 3.14(1)

> Network data at rest: Protect sensitive data stored on network devices.  Network config encryption: Encrypt stored configuration files.

**Bridging SCF Controls:** END-06.6

**Relevant SCG Controls:**

- esx-9.hardware-cpu-intel-txt -- Enable Intel TXT in system firmware where available.
- esx-9.hardware-secureboot -- Enable UEFI Secure Boot.
- esx-9.secureboot-enforcement -- The ESX host must enable Secure Boot enforcement for configuration encryption.
- vm-9.secure-boot -- The guest OS must enable Secure Boot.

### Control NDR 5.2

> Zone boundary protection: Control flow between different security zones.  Deny by default: Implement a "deny all, permit by exception" policy.  Stateful inspection: Use stateful traffic filtering at boundaries.  Fail close: Ensure boundary protection fails to a secure (closed) state.

**Bridging SCF Controls:** NET-03

**Relevant SCG Controls:**

- nsx-9.ibgp-source-loopback -- Configure Tier-0 Gateway iBGP peering to use the loopback address as the source.
- nsx-9.reverse-path-forwarding -- NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.network-mac-learning -- Disable MAC learning on distributed switch port groups unless a workload requires it.
- vcenter-9.network-reject-forged-transmit-dvportgroup -- Reject forged transmits on distributed switches and port groups.
- vcenter-9.network-reject-mac-changes-dvportgroup -- Reject guest MAC address changes on distributed switches and port groups.
- vcenter-9.network-reset-port -- Reset distributed switch port configuration when a virtual machine disconnects.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-restrict-port-level-overrides -- Disallow per-port policy overrides on distributed port groups, except port blocking.
- vcenter-9.network-restrict-port-mirroring -- Remove unauthorized port mirroring sessions on distributed switches.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.

### Control NDR 5.2(1)

> Zone boundary protection: Control flow between different security zones.  Deny by default: Implement a "deny all, permit by exception" policy.  Stateful inspection: Use stateful traffic filtering at boundaries.  Fail close: Ensure boundary protection fails to a secure (closed) state.

**Bridging SCF Controls:** NET-04.1

**Relevant SCG Controls:**

- esx-9.firewall-incoming-default -- The ESX host must configure the firewall to block network traffic by default.
- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.
- vcf-9.perimeter-firewall -- Limit access to VCF component management interfaces with perimeter firewalls.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.

### Control NDR 5.2(2)

> Zone boundary protection: Control flow between different security zones.  Deny by default: Implement a "deny all, permit by exception" policy.  Stateful inspection: Use stateful traffic filtering at boundaries.  Fail close: Ensure boundary protection fails to a secure (closed) state.

**Bridging SCF Controls:** NET-04.1

**Relevant SCG Controls:**

- esx-9.firewall-incoming-default -- The ESX host must configure the firewall to block network traffic by default.
- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.
- vcf-9.perimeter-firewall -- Limit access to VCF component management interfaces with perimeter firewalls.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.

### Control NDR 5.3

> Network communication restriction: Block general purpose person-to-person traffic.

**Bridging SCF Controls:** NET-04.1

**Relevant SCG Controls:**

- esx-9.firewall-incoming-default -- The ESX host must configure the firewall to block network traffic by default.
- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.
- vcf-9.perimeter-firewall -- Limit access to VCF component management interfaces with perimeter firewalls.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.
