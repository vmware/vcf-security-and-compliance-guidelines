# Companion Guide to CMMC 2.0 for VMware Cloud Foundation 9.1 -- Framework Controls by SCG Coverage

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://dodcio.defense.gov/CMMC/

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

56 framework controls have at least one Security Configuration Guide hardening control mapped to them through the SCF crosswalk.

### Control AC.L1-b.1.i

> Limit information system access to authorized users, processes acting on behalf of authorized users, or devices (including other information systems)

**Bridging SCF Controls:** IAC-02, IAC-20

**Relevant SCG Controls:**

- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control AC.L2-3.1.1

> Limit system access to authorized users, processes acting on behalf of authorized users, and devices (including other systems).

**Bridging SCF Controls:** IAC-02, IAC-20

**Relevant SCG Controls:**

- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control AC.L2-3.1.3

> Control the flow of CUI in accordance with approved authorizations.

**Bridging SCF Controls:** NET-04

**Relevant SCG Controls:**

- esx-9.network-bpdu -- Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.network-rpf-promisc -- The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.
- esx-9.network-standard-reject-forged-transmit -- Reject forged transmits on standard switches and port groups.
- esx-9.network-standard-reject-mac-changes -- Reject guest MAC address changes on standard switches and port groups.
- esx-9.network-standard-reject-promiscuous-mode -- Reject promiscuous mode on standard switches and port groups.
- vcenter-9.network-reject-promiscuous-mode-dvportgroup -- Reject promiscuous mode on distributed switches and port groups.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-vgt -- Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.

### Control AC.L2-3.1.5

> Employ the principle of least privilege, including for specific security functions and privileged accounts.

**Bridging SCF Controls:** IAC-16, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control AC.L2-3.1.8

> Limit unsuccessful logon attempts.

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

### Control AC.L2-3.1.9

> Provide privacy and security notices consistent with applicable CUI rules.

**Bridging SCF Controls:** SEA-18

**Relevant SCG Controls:**

- esx-9.etc-issue -- Configure the login banner for ESX host SSH connections.
- esx-9.login-message -- Configure the ESX host login banner for the DCUI and Host Client.
- networks-9.login-message -- Configure the VCF Operations for Networks login banner.
- nsx-9.login-message -- Configure the NSX Manager login banner.
- operations-9.login-message -- Configure the VCF Operations login banner.
- vcenter-9.etc-issue -- Configure the vCenter SSH login banner (/etc/issue).
- vcenter-9.login-message -- Configure the vCenter login banner for the vSphere Client.

### Control AC.L2-3.1.10

> Use session lock with pattern-hiding displays to prevent access and viewing of data after a period of inactivity.

**Bridging SCF Controls:** IAC-24

**Relevant SCG Controls:**

- vm-9.vmrc-lock -- Virtual machines must be configured to lock when the last console connection is closed.

### Control AC.L2-3.1.11

> Terminate (automatically) a user session after a defined condition.

**Bridging SCF Controls:** IAC-25

**Relevant SCG Controls:**

- esx-9.api-soap-timeout -- The ESX host must configure a session timeout for the vSphere API.
- esx-9.dcui-timeout -- Set a timeout to automatically terminate idle DCUI sessions on the ESX host.
- esx-9.session-timeout -- The ESX Host Client must enforce an idle session timeout.
- esx-9.shell-interactive-timeout -- Configure the inactivity timeout to automatically terminate idle ESX host shells.
- esx-9.shell-timeout -- Set a timeout to limit how long the ESX Shell and SSH services are allowed to run.
- networks-9.session-timeout -- VCF Operations for Networks must enforce an idle session timeout.
- nsx-9.session-timeout -- NSX Manager must enforce an idle session timeout on its API and CLI.
- operations-9.session-timeout -- VCF Operations must enforce an idle session timeout.
- vcenter-9.session-timeout -- Enforce an idle session timeout for the vSphere Client.

### Control AC.L2-3.1.12

> Monitor and control remote access sessions.

**Bridging SCF Controls:** NET-14

**Relevant SCG Controls:**

- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.

### Control AC.L2-3.1.15

> Authorize remote execution of privileged commands and remote access to security-relevant information.

**Bridging SCF Controls:** NET-14.4

**Relevant SCG Controls:**

- esx-9.ssh -- The ESX host's SSH service must be deactivated except for temporary diagnostic use.
- vcenter-9.ssh -- Deactivate SSH access to the vCenter appliance except for temporary diagnostic use.

### Control AC.L3-3.1.3e

> Secured Information Transfer

**Bridging SCF Controls:** NET-04

**Relevant SCG Controls:**

- esx-9.network-bpdu -- Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.network-rpf-promisc -- The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.
- esx-9.network-standard-reject-forged-transmit -- Reject forged transmits on standard switches and port groups.
- esx-9.network-standard-reject-mac-changes -- Reject guest MAC address changes on standard switches and port groups.
- esx-9.network-standard-reject-promiscuous-mode -- Reject promiscuous mode on standard switches and port groups.
- vcenter-9.network-reject-promiscuous-mode-dvportgroup -- Reject promiscuous mode on distributed switches and port groups.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-vgt -- Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.

### Control AU.L2-3.3.1

> Create and retain system audit logs and records to the extent needed to enable the monitoring, analysis, investigation, and reporting of unlawful or unauthorized system activity. SP 800-171, REVISION 2 PROTECTING CONTROLLED UNCLASSIFIED INFORMATION _________________________________________________________________________________________________ CHAPTER THREE PAGE 18 This publication is available free of charge from: https://doi.org/10.6028/NIST.SP.800-171r2

**Bridging SCF Controls:** MON-02, MON-10

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-audit-local-capacity -- The ESX host must store audit records for a time period consistent with your records retention policy.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.action-history-retention -- Retain VCF Operations remediation action history for an appropriate interval.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- operations-9.log-retention -- Configure the VCF Operations log retention period.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.events-database-retention -- VMware vCenter must retain task and event data for an appropriate interval.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.
- vm-9.log-retention -- Virtual machines must limit the number of retained diagnostic logs.

### Control AU.L2-3.3.2

> Ensure that the actions of individual system users can be uniquely traced to those users, so they can be held accountable for their actions.

**Bridging SCF Controls:** MON-03

**Relevant SCG Controls:**

- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control AU.L2-3.3.3

> Review and update logged events. SP 800-171, REVISION 2 PROTECTING CONTROLLED UNCLASSIFIED INFORMATION _________________________________________________________________________________________________ CHAPTER THREE PAGE 19 This publication is available free of charge from: https://doi.org/10.6028/NIST.SP.800-171r2

**Bridging SCF Controls:** CFG-02, MON-02

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control AU.L2-3.3.5

> Correlate audit record review, analysis, and reporting processes for investigation and response to indications of unlawful, unauthorized, suspicious, or unusual activity.

**Bridging SCF Controls:** MON-02

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.

### Control AU.L2-3.3.6

> Provide audit record reduction and report generation to support on-demand analysis and reporting.

**Bridging SCF Controls:** MON-02

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.

### Control AU.L2-3.3.7

> Provide a system capability that compares and synchronizes internal system clocks with an authoritative source to generate time stamps for audit records.

**Bridging SCF Controls:** MON-07.1, SEA-20

**Relevant SCG Controls:**

- esx-9.hardware-management-time -- Synchronize hardware management controller time with organizational reference sources.
- esx-9.time -- The ESX host must synchronize its clock with organizational reference sources.
- fleet-9.time -- Configure fleet-wide time synchronization.
- pnr-9.time -- The VCF Protection and Recovery appliance must synchronize its clock with organizational reference sources.
- vcenter-9.time -- vCenter must synchronize its clock with organizational reference sources.

### Control AU.L2-3.3.8

> Protect audit information and audit logging tools from unauthorized access, modification, and deletion.

**Bridging SCF Controls:** MON-02, MON-08

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.

### Control AU.L2-3.3.9

> Limit management of audit logging functionality to a subset of privileged users.

**Bridging SCF Controls:** MON-02

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.

### Control CM.L2-3.4.1

> Establish and maintain baseline configurations and inventories of organizational systems (including hardware, software, firmware, and documentation) throughout the respective system development life cycles.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control CM.L2-3.4.2

> Establish and enforce security configuration settings for information technology products employed in organizational systems.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control CM.L2-3.4.3

> Track, review, approve or disapprove, and log changes to organizational systems.

**Bridging SCF Controls:** CHG-02

**Relevant SCG Controls:**

- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.

### Control CM.L2-3.4.5

> Define, document, approve, and enforce physical and logical access restrictions associated with changes to organizational systems.

**Bridging SCF Controls:** CHG-04

**Relevant SCG Controls:**

- esx-9.hardware-management-config-lock -- Lock the hardware management controller configuration after provisioning.
- guest-9.tools-add-feature -- The guest OS must disable automatic addition of optional VMware Tools features.
- guest-9.tools-allow-transforms -- The guest OS must disable MSI transforms in VMware Tools auto-upgrades.
- guest-9.tools-globalconf -- The guest OS must deactivate GlobalConf unless required.
- guest-9.tools-prevent-recustomization -- The guest OS must prevent re-customization of an already-deployed VM.
- guest-9.tools-remove-feature -- The guest OS must disable automatic removal of optional VMware Tools features.
- vsan-9.managed-disk-claim -- vSAN must disable managed disk claims.

### Control CM.L2-3.4.6

> Employ the principle of least functionality by configuring organizational systems to provide only essential capabilities.

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

### Control CM.L2-3.4.7

> Restrict, disable, or prevent the use of nonessential programs, functions, ports, protocols, and services. SP 800-171, REVISION 2 PROTECTING CONTROLLED UNCLASSIFIED INFORMATION _________________________________________________________________________________________________ CHAPTER THREE PAGE 23 This publication is available free of charge from: https://doi.org/10.6028/NIST.SP.800-171r2

**Bridging SCF Controls:** CFG-03.1, CFG-03.2

**Relevant SCG Controls:**

- esx-9.vib-trusted-binaries -- The ESX host must only execute binaries delivered through a signed VIB.
- nsx-9.inactive-interfaces -- NSX Tier-0 Gateway must remove inactive interfaces.
- nsx-9.routing-protocols-unused -- Disable Tier-0 Gateway routing protocols that are not in use.
- nsx-9.t1-inactive-interfaces -- Remove inactive interfaces and stale linked segments from Tier-1 Gateways.

### Control CM.L3-3.4.2e

> Automated Detection

**Bridging SCF Controls:** CFG-06

**Relevant SCG Controls:**

- vcenter-9.network-reset-port -- Reset distributed switch port configuration when a virtual machine disconnects.
- vcenter-9.network-restrict-port-level-overrides -- Disallow per-port policy overrides on distributed port groups, except port blocking.
- vsan-9.force-provisioning -- vSAN must not provision storage when storage policy requirements cannot be met.

### Control IA.L1-b.1.v

> Identify information system users, processes acting on behalf of users, or devices

**Bridging SCF Controls:** IAC-02, IAC-04

**Relevant SCG Controls:**

- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control IA.L1-b.1.vi

> Authenticate (or verify) the identities of those users, processes, or devices, as a prerequisite to allowing access to organizational information systems

**Bridging SCF Controls:** IAC-02, IAC-04

**Relevant SCG Controls:**

- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control IA.L2-3.5.1

> Identify system users, processes acting on behalf of users, and devices.

**Bridging SCF Controls:** IAC-02, IAC-04

**Relevant SCG Controls:**

- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control IA.L2-3.5.2

> Authenticate (or verify) the identities of users, processes, or devices, as a prerequisite to allowing access to organizational systems.

**Bridging SCF Controls:** IAC-02, IAC-04

**Relevant SCG Controls:**

- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control IA.L2-3.5.3

> Use multifactor authentication for local and network access to privileged accounts and for network access to non-privileged accounts.24 25

**Bridging SCF Controls:** IAC-06.1

**Relevant SCG Controls:**

- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control IA.L2-3.5.6

> Disable identifiers after a defined period of inactivity.

**Bridging SCF Controls:** IAC-15.3

**Relevant SCG Controls:**

- fleet-9.jit-inactivity -- Configure an inactivity expiry for Just-In-Time users.

### Control IA.L2-3.5.7

> Enforce a minimum password complexity and change of characters when new passwords are created.

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

### Control IA.L2-3.5.8

> Prohibit password reuse for a specified number of generations.

**Bridging SCF Controls:** IAC-10

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.

### Control IA.L2-3.5.9

> Allow temporary password use for system logons with an immediate change to a permanent password.

**Bridging SCF Controls:** IAC-10

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.

### Control IA.L3-3.5.1e

> Bidirectional Authentication

**Bridging SCF Controls:** IAC-04

**Relevant SCG Controls:**

- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control MP.L2-3.8.6

> Implement cryptographic mechanisms to protect the confidentiality of CUI stored on digital media during transport unless otherwise protected by alternative physical safeguards.

**Bridging SCF Controls:** CRY-01.1, CRY-05

**Relevant SCG Controls:**

- esx-9.memory-tiering-encryption -- The ESX host should encrypt data written to tiered memory devices.
- esx-9.tpm-configuration -- The ESX host must require TPM-based configuration encryption.
- vsan-9.encryption-rest -- vSAN must protect data at rest.

### Control MP.L2-3.8.9

> Protect the confidentiality of backup CUI at storage locations.

**Bridging SCF Controls:** BCD-11, BCD-11.4

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.
- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.

### Control RA.L2-3.11.3

> Remediate vulnerabilities in accordance with risk assessments.

**Bridging SCF Controls:** VPM-04, VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control SC.L1-b.1.x

> Monitor, control, and protect organizational communications ( i.e., information transmitted or received by organizational information systems) at the external boundaries and key internal boundaries of the information systems

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

### Control SC.L1-b.1.xi

> Implement subnetworks for publicly accessible system components that are physically or logically separated from internal networks

**Bridging SCF Controls:** NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control SC.L2-3.13.1

> Monitor, control, and protect communications (i.e., information transmitted or received by organizational systems) at the external boundaries and key internal boundaries of organizational systems.

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

### Control SC.L2-3.13.3

> Separate user functionality from system management functionality.

**Bridging SCF Controls:** SEA-03.2

**Relevant SCG Controls:**

- esx-9.hardware-virtual-nic -- The ESX host must not enable virtual hardware management network interfaces.

### Control SC.L2-3.13.4

> Prevent unauthorized and unintended information transfer via shared system resources.

**Bridging SCF Controls:** SEA-05

**Relevant SCG Controls:**

- esx-9.memeagerzero -- The ESX host must enable volatile key destruction.
- esx-9.transparent-page-sharing -- The ESX host must restrict inter-VM transparent page sharing to VMs configured with sched.mem.pshare.salt.
- vm-9.deactivate-console-copy -- Virtual machines must have console copy operations deactivated.
- vm-9.deactivate-console-paste -- Virtual machines must have console paste operations deactivated.
- vm-9.isolation-tools-dnd-deactivate -- Virtual machines must have console drag and drop operations deactivated.
- vm-9.transparentpagesharing-inter-vm-enabled -- Virtual machines must restrict sharing of memory pages between VMs.

### Control SC.L2-3.13.5

> Implement subnetworks for publicly accessible system components that are physically or logically separated from internal networks.

**Bridging SCF Controls:** NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control SC.L2-3.13.6

> Deny network communications traffic by default and allow network communications traffic by exception (i.e., deny all, permit by exception).

**Bridging SCF Controls:** NET-04.1

**Relevant SCG Controls:**

- esx-9.firewall-incoming-default -- The ESX host must configure the firewall to block network traffic by default.
- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.
- vcf-9.perimeter-firewall -- Limit access to VCF component management interfaces with perimeter firewalls.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.

### Control SC.L2-3.13.8

> Implement cryptographic mechanisms to prevent unauthorized disclosure of CUI during transmission unless otherwise protected by alternative physical safeguards.

**Bridging SCF Controls:** CRY-01.1, CRY-03

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
- vsan-9.encryption-rest -- vSAN must protect data at rest.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control SC.L2-3.13.10

> Establish and manage cryptographic keys for cryptography employed in organizational systems.

**Bridging SCF Controls:** CRY-09

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control SC.L2-3.13.11

> Employ FIPS-validated cryptography when used to protect the confidentiality of CUI.

**Bridging SCF Controls:** CRY-01

**Relevant SCG Controls:**

- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.

### Control SC.L2-3.13.14

> Control and monitor the use of Voice over Internet Protocol (VoIP) technologies.

**Bridging SCF Controls:** NET-13

**Relevant SCG Controls:**

- vcenter-9.smtp -- Send vCenter notification email over a secure SMTP connection.

### Control SC.L2-3.13.15

> Protect the authenticity of communications sessions.

**Bridging SCF Controls:** NET-09

**Relevant SCG Controls:**

- nsx-9.bgp-encryption -- Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.
- nsx-9.ospf-encryption -- NSX Tier-0 Gateway must enable OSPF authentication.

### Control SC.L2-3.13.16

> Protect the confidentiality of CUI at rest.

**Bridging SCF Controls:** CRY-05

**Relevant SCG Controls:**

- esx-9.memory-tiering-encryption -- The ESX host should encrypt data written to tiered memory devices.
- esx-9.tpm-configuration -- The ESX host must require TPM-based configuration encryption.
- vsan-9.encryption-rest -- vSAN must protect data at rest.

### Control SI.L1-b.1.xii

> Identify, report, and correct information and information system flaws in a timely manner

**Bridging SCF Controls:** VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control SI.L2-3.14.1

> Identify, report, and correct system flaws in a timely manner.

**Bridging SCF Controls:** VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control SI.L3-3.14.1e

> Integrity Verification

**Bridging SCF Controls:** AST-18, CRY-13, TDA-01.2

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.vib-acceptance-level-supported -- The ESX host image profile acceptance level must be PartnerSupported or higher.
- operations-9.unsigned-pak -- VCF Operations must disable unsigned management pack installation.
- vsan-9.object-checksum -- vSAN must calculate object checksums to protect data integrity.

### Control SI.L3-3.14.3e

> Specialized Asset Security

**Bridging SCF Controls:** NET-06, NET-06.4

**Relevant SCG Controls:**

- esx-9.hardware-management-authentication -- Use strong, isolated identity management on hardware management controllers.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.
