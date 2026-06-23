# Companion Guide to NIST SP 800-171 Revision 3 for VMware Cloud Foundation 9.1 -- Framework Controls by SCG Coverage

## Version

910-20260623-01

## About This Dataset

This dataset is derived mechanically from the VMware Cloud Foundation Security Configuration Guide 9.1 and the Secure Controls Framework (SCF) 2026.1 crosswalk. Each SCG hardening control carries one or more SCF control identifiers; a control is treated as relevant to this framework when one of its SCF identifiers maps to a control of this framework in the SCF crosswalk. The SCG describes platform hardening settings, so frameworks built around technical configuration map to many SCG controls while frameworks built around organizational process map to few.

Most regulatory and compliance frameworks are satisfied through a combination of product capabilities and organizational process, not through technical configuration alone. The Security Configuration Guide covers the platform's technical hardening settings, so this crosswalk shows only that slice of how a framework is addressed. A short list of mapped controls usually means the framework is largely organizational, not that the platform offers little toward it; the relevant product capabilities are described elsewhere. For the fuller picture of how the assessed products support this framework, including capabilities that are not expressed as hardening settings, consult the companion guide for this framework and the other guidance at https://brcm.tech/vcf-security.

https://csrc.nist.gov/pubs/sp/800/171/r3/final

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

121 framework controls have at least one Security Configuration Guide hardening control mapped to them through the SCF crosswalk.

### Control 03.01.01.c.01

> Authorized users of the system.

**Bridging SCF Controls:** IAC-15.5

**Relevant SCG Controls:**

- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.

### Control 03.01.01.c.03

> Access authorizations (i.e., privileges) for each account.

**Bridging SCF Controls:** IAC-20, IAC-20.1, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcenter-9.content-library-authentication -- VMware vCenter must require authentication for published content libraries.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 03.01.01.d.01

> A valid access authorization.

**Bridging SCF Controls:** IAC-20, IAC-20.1, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcenter-9.content-library-authentication -- VMware vCenter must require authentication for published content libraries.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 03.01.01.d.02

> Intended system usage.

**Bridging SCF Controls:** IAC-20, IAC-20.1, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcenter-9.content-library-authentication -- VMware vCenter must require authentication for published content libraries.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 03.01.01.e

> Monitor the use of system accounts.

**Bridging SCF Controls:** IAC-15.7

**Relevant SCG Controls:**

- esx-9.disable-accounts-dcui -- The ESX host must disable shell access for the dcui account.
- nsx-9.disable-accounts -- Disable unused NSX Manager local accounts.
- vcenter-9.disable-accounts -- VMware vCenter must have unnecessary or unused user accounts disabled or removed.

### Control 03.01.01.f.02

> The accounts have been inactive for [Assignment: organization-defined time period].

**Bridging SCF Controls:** IAC-15.3

**Relevant SCG Controls:**

- fleet-9.jit-inactivity -- Configure an inactivity expiry for Just-In-Time users.

### Control 03.01.01.g.01

> [Assignment: organization-defined time period] when accounts are no longer required.

**Bridging SCF Controls:** IAC-07

**Relevant SCG Controls:**

- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.

### Control 03.01.01.g.02

> [Assignment: organization-defined time period] when users are terminated or transferred.

**Bridging SCF Controls:** IAC-07

**Relevant SCG Controls:**

- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.

### Control 03.01.01.g.03

> [Assignment: organization-defined time period] when system usage or the need-to-know changes for an individual.

**Bridging SCF Controls:** IAC-07, IAC-17

**Relevant SCG Controls:**

- esx-9.ad-admin-validate-interval -- The ESX host must not disable validation of users and groups.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.

### Control 03.01.01.h

> Require that users log out of the system after [Assignment: organization-defined time period] of expected inactivity or when [Assignment: organization-defined circumstances].

**Bridging SCF Controls:** CFG-02, IAC-25

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
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 03.01.02

> Access Enforcement: Enforce approved authorizations for logical access to CUI and system resources in accordance with applicable access control policies.

**Bridging SCF Controls:** CFG-08, IAC-20, IAC-20.1

**Relevant SCG Controls:**

- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.credential-ownership-enforcement -- VCF Operations must enable credential ownership enforcement.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcenter-9.content-library-authentication -- VMware vCenter must require authentication for published content libraries.

### Control 03.01.03

> Information Flow Enforcement: Enforce approved authorizations for controlling the flow of CUI within the system and between connected systems.

**Bridging SCF Controls:** IAC-20, IAC-20.1, NET-04

**Relevant SCG Controls:**

- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- esx-9.network-bpdu -- Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.network-rpf-promisc -- The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.
- esx-9.network-standard-reject-forged-transmit -- Reject forged transmits on standard switches and port groups.
- esx-9.network-standard-reject-mac-changes -- Reject guest MAC address changes on standard switches and port groups.
- esx-9.network-standard-reject-promiscuous-mode -- Reject promiscuous mode on standard switches and port groups.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcenter-9.content-library-authentication -- VMware vCenter must require authentication for published content libraries.
- vcenter-9.network-reject-promiscuous-mode-dvportgroup -- Reject promiscuous mode on distributed switches and port groups.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-vgt -- Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.

### Control 03.01.04.b

> Define system access authorizations to support separation of duties.

**Bridging SCF Controls:** IAC-20, IAC-20.1, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcenter-9.content-library-authentication -- VMware vCenter must require authentication for published content libraries.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 03.01.05.a

> Allow only authorized system access for users (or processes acting on behalf of users) that is necessary to accomplish assigned organizational tasks.

**Bridging SCF Controls:** IAC-20, IAC-20.1, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcenter-9.content-library-authentication -- VMware vCenter must require authentication for published content libraries.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 03.01.05.b

> Authorize access to [Assignment: organization-defined security functions] and [Assignment: organization-defined security-relevant information].

**Bridging SCF Controls:** IAC-20, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 03.01.05.c

> Review the privileges assigned to roles or classes of users [Assignment: organization-defined frequency] to validate the need for such privileges.

**Bridging SCF Controls:** IAC-15.7, IAC-17

**Relevant SCG Controls:**

- esx-9.ad-admin-validate-interval -- The ESX host must not disable validation of users and groups.
- esx-9.disable-accounts-dcui -- The ESX host must disable shell access for the dcui account.
- nsx-9.disable-accounts -- Disable unused NSX Manager local accounts.
- vcenter-9.disable-accounts -- VMware vCenter must have unnecessary or unused user accounts disabled or removed.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.

### Control 03.01.05.d

> Reassign or remove privileges, as necessary.

**Bridging SCF Controls:** IAC-17

**Relevant SCG Controls:**

- esx-9.ad-admin-validate-interval -- The ESX host must not disable validation of users and groups.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.

### Control 03.01.06.a

> Restrict privileged accounts on the system to [Assignment: organization-defined personnel or roles].

**Bridging SCF Controls:** IAC-16, IAC-20, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.
- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 03.01.07.a

> Prevent non-privileged users from executing privileged functions.

**Bridging SCF Controls:** IAC-16, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 03.01.07.b

> Log the execution of privileged functions.

**Bridging SCF Controls:** IAC-16

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- vcenter-9.bashshelladministrators -- VMware vCenter must restrict membership of the SystemConfiguration.BashShellAdministrators SSO group.

### Control 03.01.08.a

> Enforce a limit of [Assignment: organization-defined number] consecutive invalid logon attempts by a user during a [Assignment: organization-defined time period].

**Bridging SCF Controls:** CFG-02, IAC-22

**Relevant SCG Controls:**

- esx-9.account-lockout-duration -- The ESX host must enforce an unlock timeout.
- esx-9.account-lockout-max-attempts -- The ESX host must enforce a limit on consecutive invalid logon attempts by a user.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.account-lockout-max-attempts -- NSX Manager must enforce an account lockout after consecutive failed authentication attempts.
- operations-9.account-lockout -- VCF Operations must lock accounts after consecutive failed logon attempts.
- vcenter-9.account-lockout-duration -- Set the vCenter account auto-unlock interval.
- vcenter-9.account-lockout-max-attempts -- Lock vCenter accounts after repeated failed login attempts.
- vcenter-9.account-lockout-reset -- Set the vCenter failed-login counting interval.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 03.01.08.b

> Automatically [Selection (one or more): lock the account or node for an [Assignment: organization-defined time period]; lock the account or node until released by an administrator; delay next logon prompt; notify system administrator; take other action] when the maximum number of unsuccessful attempts is exceeded.

**Bridging SCF Controls:** CFG-02, IAC-22

**Relevant SCG Controls:**

- esx-9.account-lockout-duration -- The ESX host must enforce an unlock timeout.
- esx-9.account-lockout-max-attempts -- The ESX host must enforce a limit on consecutive invalid logon attempts by a user.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.account-lockout-max-attempts -- NSX Manager must enforce an account lockout after consecutive failed authentication attempts.
- operations-9.account-lockout -- VCF Operations must lock accounts after consecutive failed logon attempts.
- vcenter-9.account-lockout-duration -- Set the vCenter account auto-unlock interval.
- vcenter-9.account-lockout-max-attempts -- Lock vCenter accounts after repeated failed login attempts.
- vcenter-9.account-lockout-reset -- Set the vCenter failed-login counting interval.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 03.01.09

> System Use Notification: Display a system use notification message with privacy and security notices consistent with applicable CUI rules before granting access to the system.

**Bridging SCF Controls:** CFG-02, SEA-18

**Relevant SCG Controls:**

- esx-9.etc-issue -- Configure the login banner for ESX host SSH connections.
- esx-9.login-message -- Configure the ESX host login banner for the DCUI and Host Client.
- networks-9.login-message -- Configure the VCF Operations for Networks login banner.
- nsx-9.login-message -- Configure the NSX Manager login banner.
- operations-9.login-message -- Configure the VCF Operations login banner.
- vcenter-9.etc-issue -- Configure the vCenter SSH login banner (/etc/issue).
- vcenter-9.login-message -- Configure the vCenter login banner for the vSphere Client.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 03.01.10.a

> Prevent access to the system by [Selection (one or more): initiating a device lock after [Assignment: organization-defined time period] of inactivity; requiring the user to initiate a device lock before leaving the system unattended].

**Bridging SCF Controls:** CFG-02, IAC-24

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.vmrc-lock -- Virtual machines must be configured to lock when the last console connection is closed.

### Control 03.01.10.b

> Retain the device lock until the user reestablishes access using established identification and authentication procedures.

**Bridging SCF Controls:** CFG-02, IAC-24

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vm-9.vmrc-lock -- Virtual machines must be configured to lock when the last console connection is closed.

### Control 03.01.10.c

> Conceal, via the device lock, information previously visible on the display with a publicly viewable image.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 03.01.11

> Session Termination: Terminate a user session automatically after [Assignment: organization-defined conditions or trigger events requiring session disconnect].

**Bridging SCF Controls:** CFG-02, IAC-25

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
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 03.01.12.a

> Establish usage restrictions, configuration requirements, and connection requirements for each type of allowable remote system access.

**Bridging SCF Controls:** CFG-02, NET-03, NET-14

**Relevant SCG Controls:**

- nsx-9.ibgp-source-loopback -- Configure Tier-0 Gateway iBGP peering to use the loopback address as the source.
- nsx-9.reverse-path-forwarding -- NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.
- vcenter-9.network-mac-learning -- Disable MAC learning on distributed switch port groups unless a workload requires it.
- vcenter-9.network-reject-forged-transmit-dvportgroup -- Reject forged transmits on distributed switches and port groups.
- vcenter-9.network-reject-mac-changes-dvportgroup -- Reject guest MAC address changes on distributed switches and port groups.
- vcenter-9.network-reset-port -- Reset distributed switch port configuration when a virtual machine disconnects.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-restrict-port-level-overrides -- Disallow per-port policy overrides on distributed port groups, except port blocking.
- vcenter-9.network-restrict-port-mirroring -- Remove unauthorized port mirroring sessions on distributed switches.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.

### Control 03.01.12.b

> Authorize each type of remote system access prior to establishing such connections.

**Bridging SCF Controls:** NET-14

**Relevant SCG Controls:**

- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.

### Control 03.01.12.c

> Route remote access to the system through authorized and managed access control points.

**Bridging SCF Controls:** NET-14

**Relevant SCG Controls:**

- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.

### Control 03.01.12.d

> Authorize the remote execution of privileged commands and remote access to security-relevant information.

**Bridging SCF Controls:** NET-14, NET-14.4

**Relevant SCG Controls:**

- esx-9.ssh -- The ESX host's SSH service must be deactivated except for temporary diagnostic use.
- pnr-9.ssh -- The VCF Protection and Recovery appliance SSH service must be deactivated except for temporary diagnostic use.
- vcenter-9.ssh -- Deactivate SSH access to the vCenter appliance except for temporary diagnostic use.

### Control 03.01.16.a

> Establish usage restrictions, configuration requirements, and connection requirements for each type of wireless access to the system.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 03.01.18.a

> Establish usage restrictions, configuration requirements, and connection requirements for mobile devices.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 03.01.18.b

> Authorize the connection of mobile devices to the system.

**Bridging SCF Controls:** IAC-04

**Relevant SCG Controls:**

- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control 03.03.01.a

> Specify the following event types selected for logging within the system: [Assignment: organization-defined event types].

**Bridging SCF Controls:** MON-01.4, MON-02.7, MON-03

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- vcenter-9.events-remote-logging -- Enable remote logging of vCenter events.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control 03.03.01.b

> Review and update the event types selected for logging [Assignment: organization-defined frequency].

**Bridging SCF Controls:** MON-02.2

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.

### Control 03.03.02.a

> Include the following content in audit records:

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

### Control 03.03.02.a.01

> What type of event occurred.

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

### Control 03.03.02.a.02

> When the event occurred.

**Bridging SCF Controls:** MON-03, MON-07

**Relevant SCG Controls:**

- esx-9.log-audit-local -- The ESX host must enable audit record logging.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-level -- The ESX host must produce audit records containing information to establish what type of events occurred.
- guest-9.tools-logs -- The guest OS must enable VMware Tools logging.
- networks-9.audit-identity -- Capture user identity in VCF Operations for Networks audit logs.
- nsx-9.log-level -- NSX Manager must set service logging levels to capture audit-relevant events.
- nsx-9.timezone-utc -- Set NSX Manager timezone to UTC for consistent audit timestamps.
- vcenter-9.logs-level-global -- Configure the vCenter logging level to capture security-relevant events.
- vm-9.log-enable -- Virtual machines must enable diagnostic logging.

### Control 03.03.02.a.03

> Where the event occurred.

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

### Control 03.03.02.a.04

> Source of the event.

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

### Control 03.03.02.a.05

> Outcome of the event.

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

### Control 03.03.02.a.06

> Identity of the individuals, subjects, objects, or entities associated with the event.

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

### Control 03.03.02.b

> Provide additional information for audit records as needed.

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

### Control 03.03.03.a

> Generate audit records for the selected event types and audit record content specified in 03.03.01 and 03.03.02.

**Bridging SCF Controls:** MON-01.4

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.

### Control 03.03.03.b

> Retain audit records for a time period consistent with the records retention policy.

**Bridging SCF Controls:** MON-08, MON-10

**Relevant SCG Controls:**

- automation-9.activity-log -- Retain the VCF Automation activity log for the audit window and keep debug output disabled.
- esx-9.log-audit-local-capacity -- The ESX host must store audit records for a time period consistent with your records retention policy.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.action-history-retention -- Retain VCF Operations remediation action history for an appropriate interval.
- operations-9.log-retention -- Configure the VCF Operations log retention period.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.
- vcenter-9.events-database-retention -- VMware vCenter must retain task and event data for an appropriate interval.
- vm-9.log-retention -- Virtual machines must limit the number of retained diagnostic logs.

### Control 03.03.05.a

> Review and analyze system audit records [Assignment: organization-defined frequency] for indications and the potential impact of inappropriate or unusual activity.

**Bridging SCF Controls:** MON-02, MON-02.2

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.

### Control 03.03.05.c

> Analyze and correlate audit records across different repositories to gain organization-wide situational awareness.

**Bridging SCF Controls:** MON-02, MON-02.2

**Relevant SCG Controls:**

- esx-9.hardware-management-log-forwarding -- Forward hardware management controller logs to a central log server.
- esx-9.log-audit-forwarding -- The ESX host must transmit audit records to a remote host.
- esx-9.log-forwarding -- The ESX host must forward system and audit logs to a remote log collection point.
- guest-9.tools-log-forwarding -- The guest OS must send VMware Tools logs to the system log service.
- operations-9.log-collection -- Configure VCF Operations log collection for all deployed components.
- pnr-9.log-forwarding -- The VCF Protection and Recovery appliance must forward its logs to a central log server.
- vcenter-9.log-forwarding -- VMware vCenter must forward its logs to a central log server.

### Control 03.03.06.b

> Preserve the original content and time ordering of audit records.

**Bridging SCF Controls:** MON-08

**Relevant SCG Controls:**

- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.

### Control 03.03.07.a

> Use internal system clocks to generate time stamps for audit records.

**Bridging SCF Controls:** MON-07

**Relevant SCG Controls:**

- nsx-9.timezone-utc -- Set NSX Manager timezone to UTC for consistent audit timestamps.

### Control 03.03.07.b

> Record time stamps for audit records that meet [Assignment: organization-defined granularity of time measurement] and that use Coordinated Universal Time (UTC), have a fixed local time offset from UTC, or include the local time offset as part of the time stamp.

**Bridging SCF Controls:** MON-07.1

**Relevant SCG Controls:**

- esx-9.hardware-management-time -- Synchronize hardware management controller time with organizational reference sources.
- esx-9.time -- The ESX host must synchronize its clock with organizational reference sources.
- fleet-9.time -- Configure fleet-wide time synchronization.
- pnr-9.time -- The VCF Protection and Recovery appliance must synchronize its clock with organizational reference sources.
- vcenter-9.time -- vCenter must synchronize its clock with organizational reference sources.

### Control 03.03.08.a

> Protect audit information and audit logging tools from unauthorized access, modification, and deletion.

**Bridging SCF Controls:** IAC-21, MON-08

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- esx-9.log-audit-persistent -- Configure a persistent log location for all locally stored audit records on the ESX host.
- esx-9.log-filter -- The ESX host must not enable log filtering.
- esx-9.log-persistent -- Configure a persistent log location for all locally stored logs on the ESX host.
- operations-9.logs-authenticated-ingestion -- Require authenticated log ingestion in VCF Operations.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 03.03.08.b

> Authorize access to management of audit logging functionality to only a subset of privileged users or roles.

**Bridging SCF Controls:** IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.

### Control 03.04.01.a

> Develop and maintain under configuration control, a current baseline configuration of the system.

**Bridging SCF Controls:** CFG-02, CFG-02.7

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 03.04.02.a

> Establish, document, and implement the following configuration settings for the system that reflect the most restrictive mode consistent with operational requirements: [Assignment: organization-defined configuration settings].

**Bridging SCF Controls:** CFG-02, CFG-03, CFG-06

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
- vcenter-9.network-reset-port -- Reset distributed switch port configuration when a virtual machine disconnects.
- vcenter-9.network-restrict-discovery-protocol -- Disable CDP/LLDP discovery protocols on distributed switches unless required.
- vcenter-9.network-restrict-port-level-overrides -- Disallow per-port policy overrides on distributed port groups, except port blocking.
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
- vsan-9.force-provisioning -- vSAN must not provision storage when storage policy requirements cannot be met.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.

### Control 03.04.02.b

> Identify, document, and approve any deviations from established configuration settings.

**Bridging SCF Controls:** CFG-02.7, CFG-06, CHG-02, CHG-04

**Relevant SCG Controls:**

- esx-9.hardware-management-config-lock -- Lock the hardware management controller configuration after provisioning.
- guest-9.tools-add-feature -- The guest OS must disable automatic addition of optional VMware Tools features.
- guest-9.tools-allow-transforms -- The guest OS must disable MSI transforms in VMware Tools auto-upgrades.
- guest-9.tools-globalconf -- The guest OS must deactivate GlobalConf unless required.
- guest-9.tools-prevent-recustomization -- The guest OS must prevent re-customization of an already-deployed VM.
- guest-9.tools-remove-feature -- The guest OS must disable automatic removal of optional VMware Tools features.
- vcenter-9.network-reset-port -- Reset distributed switch port configuration when a virtual machine disconnects.
- vcenter-9.network-restrict-port-level-overrides -- Disallow per-port policy overrides on distributed port groups, except port blocking.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.
- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.
- vsan-9.force-provisioning -- vSAN must not provision storage when storage policy requirements cannot be met.
- vsan-9.managed-disk-claim -- vSAN must disable managed disk claims.

### Control 03.04.03.a

> Define the types of changes to the system that are configuration-controlled.

**Bridging SCF Controls:** CFG-06, CHG-02

**Relevant SCG Controls:**

- vcenter-9.network-reset-port -- Reset distributed switch port configuration when a virtual machine disconnects.
- vcenter-9.network-restrict-port-level-overrides -- Disallow per-port policy overrides on distributed port groups, except port blocking.
- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.
- vsan-9.force-provisioning -- vSAN must not provision storage when storage policy requirements cannot be met.

### Control 03.04.03.b

> Review proposed configuration-controlled changes to the system, and approve or disapprove such changes with explicit consideration for security impacts.

**Bridging SCF Controls:** CHG-02

**Relevant SCG Controls:**

- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.

### Control 03.04.03.c

> Implement and document approved configuration-controlled changes to the system.

**Bridging SCF Controls:** CHG-02

**Relevant SCG Controls:**

- vsan-9.auto-policy-management -- vSAN automatic policy management must remain disabled.

### Control 03.04.05

> Access Restrictions for Change: Define, document, approve, and enforce physical and logical access restrictions associated with changes to the system.

**Bridging SCF Controls:** CHG-04, IAC-21

**Relevant SCG Controls:**

- esx-9.ad-admin-group-autoadd -- The ESX host must not automatically grant administrative permissions to Active Directory groups.
- esx-9.hardware-management-config-lock -- Lock the hardware management controller configuration after provisioning.
- esx-9.lockdown-dcui-access -- Maintain the DCUI.Access list for administrative recovery if Lockdown Mode isolates the host.
- esx-9.lockdown-exception-users -- Keep the Lockdown Mode Exception Users list to the minimum necessary.
- guest-9.tools-add-feature -- The guest OS must disable automatic addition of optional VMware Tools features.
- guest-9.tools-allow-transforms -- The guest OS must disable MSI transforms in VMware Tools auto-upgrades.
- guest-9.tools-globalconf -- The guest OS must deactivate GlobalConf unless required.
- guest-9.tools-prevent-recustomization -- The guest OS must prevent re-customization of an already-deployed VM.
- guest-9.tools-remove-feature -- The guest OS must disable automatic removal of optional VMware Tools features.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.
- vm-9.isolation-device-connectable-deactivate -- Virtual machines must prevent unauthorized removal, connection, and modification of devices.
- vm-9.pci-passthrough -- Virtual machines must limit PCI device passthrough functionality.
- vsan-9.managed-disk-claim -- vSAN must disable managed disk claims.

### Control 03.04.06.a

> Configure the system to provide only mission-essential capabilities.

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

### Control 03.04.06.b

> Prohibit or restrict use of the following functions, ports, protocols, connections, and services: [Assignment: organization-defined functions, ports, protocols, connections, and services].

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

### Control 03.04.06.c

> Review the system [Assignment: organization-defined frequency] to identify unnecessary or nonsecure functions, ports, protocols, connections, and services.

**Bridging SCF Controls:** CFG-03.1

**Relevant SCG Controls:**

- nsx-9.inactive-interfaces -- NSX Tier-0 Gateway must remove inactive interfaces.
- nsx-9.routing-protocols-unused -- Disable Tier-0 Gateway routing protocols that are not in use.
- nsx-9.t1-inactive-interfaces -- Remove inactive interfaces and stale linked segments from Tier-1 Gateways.

### Control 03.04.06.d

> Disable or remove functions, ports, protocols, connections, and services that are unnecessary or nonsecure.

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

### Control 03.04.08.a

> Identify software programs authorized to execute on the system.

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

### Control 03.04.08.b

> Implement a deny-all, allow-by-exception policy for the execution of authorized software programs on the system.

**Bridging SCF Controls:** CFG-03.2

**Relevant SCG Controls:**

- esx-9.vib-trusted-binaries -- The ESX host must only execute binaries delivered through a signed VIB.

### Control 03.04.08.c

> Review and update the list of authorized software programs [Assignment: organization-defined frequency].

**Bridging SCF Controls:** CFG-03.1

**Relevant SCG Controls:**

- nsx-9.inactive-interfaces -- NSX Tier-0 Gateway must remove inactive interfaces.
- nsx-9.routing-protocols-unused -- Disable Tier-0 Gateway routing protocols that are not in use.
- nsx-9.t1-inactive-interfaces -- Remove inactive interfaces and stale linked segments from Tier-1 Gateways.

### Control 03.05.01.a

> Uniquely identify and authenticate system users, and associate that unique identification with processes acting on behalf of those users.

**Bridging SCF Controls:** IAC-01.2, IAC-02

**Relevant SCG Controls:**

- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control 03.05.02

> Device Identification and Authentication: Uniquely identify and authenticate [Assignment: organization-defined devices or types of devices] before establishing a system connection.

**Bridging SCF Controls:** IAC-01.2, IAC-04

**Relevant SCG Controls:**

- esx-9.iscsi-mutual-chap -- Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.
- vsan-9.iscsi-mutual-chap -- vSAN iSCSI target must enable bidirectional/mutual CHAP authentication.

### Control 03.05.03

> Multi-Factor Authentication: Implement multi-factor authentication for access to privileged and non-privileged accounts.

**Bridging SCF Controls:** IAC-06.1

**Relevant SCG Controls:**

- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control 03.05.05.a

> Receive authorization from organizational personnel or roles to assign an individual, group, role, service, or device identifier.

**Bridging SCF Controls:** IAC-07

**Relevant SCG Controls:**

- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.

### Control 03.05.05.d

> Manage individual identifiers by uniquely identifying each individual as [Assignment: organization-defined characteristic identifying individual status].

**Bridging SCF Controls:** IAC-01.2, IAC-02

**Relevant SCG Controls:**

- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.
- vcf-9.mfa -- Integrate VMware Cloud Foundation with an identity provider that enforces multifactor authentication.

### Control 03.05.07.a

> Maintain a list of commonly-used, expected, or compromised passwords, and update the list [Assignment: organization-defined frequency] and when organizational passwords are suspected to have been compromised.

**Bridging SCF Controls:** IAC-01.2, IAC-10, IAC-10.4

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control 03.05.07.b

> Verify that passwords are not found on the list of commonly used, expected, or compromised passwords when users create or update passwords.

**Bridging SCF Controls:** IAC-01.2, IAC-10, IAC-10.4

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control 03.05.07.c

> Transmit passwords only over cryptographically protected channels.

**Bridging SCF Controls:** IAC-01.2, IAC-10

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.

### Control 03.05.07.d

> Store passwords in a cryptographically protected form.

**Bridging SCF Controls:** CFG-02, IAC-01.2, IAC-10

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 03.05.07.e

> Select a new password upon first use after account recovery.

**Bridging SCF Controls:** CFG-02, IAC-01.2, IAC-10, IAC-10.1, IAC-10.8

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.ad-admin-group-name -- The ESX host must not use the default "ESX Admins" Active Directory group.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- sddc-9.api-admin -- SDDC Manager must configure the API admin account.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 03.05.07.f

> Enforce the following composition and complexity rules for passwords: [Assignment: organization-defined composition and complexity rules].

**Bridging SCF Controls:** CFG-02, IAC-10, IAC-10.1

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 03.05.12.a

> Verify the identity of the individual, group, role, service, or device receiving the authenticator as part of the initial authenticator distribution.

**Bridging SCF Controls:** IAC-10

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.

### Control 03.05.12.b

> Establish initial authenticator content for any authenticators issued by the organization.

**Bridging SCF Controls:** IAC-10, IAC-10.1

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control 03.05.12.c

> Establish and implement administrative procedures for initial authenticator distribution; for lost, compromised, or damaged authenticators; and for revoking authenticators.

**Bridging SCF Controls:** IAC-10, IAC-10.1

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control 03.05.12.d

> Change default authenticators at first use.

**Bridging SCF Controls:** CFG-02, IAC-01.2, IAC-10, IAC-10.1, IAC-10.8

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.ad-admin-group-name -- The ESX host must not use the default "ESX Admins" Active Directory group.
- esx-9.hardware-management-security -- Harden integrated hardware management controllers.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- sddc-9.api-admin -- SDDC Manager must configure the API admin account.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 03.05.12.e

> Change or refresh authenticators [Assignment: organization-defined frequency] or when the following events occur: [Assignment: organization-defined events].

**Bridging SCF Controls:** IAC-10, IAC-10.1

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control 03.05.12.f

> Protect authenticator content from unauthorized disclosure and modification.

**Bridging SCF Controls:** IAC-01.2, IAC-10, IAC-10.1

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- automation-9.timeouts -- Limit the VCF Automation API token lifetime.
- esx-9.account-password-history -- The ESX host must enforce password history for users.
- esx-9.password-complexity -- Enforce password complexity on ESX local accounts.
- esx-9.password-max-age -- The ESX host must be configured with an appropriate maximum password age.
- fleet-9.access-token -- Limit the maximum lifetime of access tokens.
- fleet-9.api-token -- Limit the maximum lifetime of API tokens.
- fleet-9.password-policy -- Configure a fleet-wide password policy.
- nsx-9.password-complexity -- Enforce password complexity on NSX Manager local accounts.
- operations-9.password-complexity -- Enforce password complexity on VCF Operations local accounts.
- sddc-9.basic-auth-disable -- Disable HTTP Basic Authentication on the SDDC Manager API.
- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.
- vcenter-9.password-complexity -- Enforce password complexity for vCenter SSO accounts.
- vcenter-9.password-history -- Restrict password reuse on vCenter SSO accounts.
- vcenter-9.password-max-age -- Disable forced password expiration on vCenter SSO accounts.
- vcenter-9.vami-password-max-age -- Disable forced password expiration on the vCenter appliance root account.
- vcenter-9.vpxuser-length -- Keep the vpxuser password at or above its default length.

### Control 03.06.05.d

> Protect the incident response plan from unauthorized disclosure.

**Bridging SCF Controls:** IAC-20.1

**Relevant SCG Controls:**

- vcenter-9.content-library-authentication -- VMware vCenter must require authentication for published content libraries.

### Control 03.07.05.a

> Approve and monitor nonlocal maintenance and diagnostic activities.

**Bridging SCF Controls:** IAC-01.2

**Relevant SCG Controls:**

- vcenter-9.administration-sso-groups -- VMware vCenter must separate authentication and authorization for administrators.

### Control 03.07.05.c

> Terminate session and network connections when nonlocal maintenance is completed.

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

### Control 03.08.07.a

> Restrict or prohibit the use of [Assignment: organization-defined types of system media].

**Bridging SCF Controls:** CFG-02, DCH-12

**Relevant SCG Controls:**

- esx-9.hardware-boot-order -- Restrict the server firmware boot order to authorized boot devices.
- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 03.08.09.a

> Protect the confidentiality of backup information.

**Bridging SCF Controls:** BCD-11, BCD-11.4

**Relevant SCG Controls:**

- nsx-9.backup -- Configure scheduled backups of NSX Manager.
- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.

### Control 03.08.09.b

> Implement cryptographic mechanisms to prevent the unauthorized disclosure of CUI at backup storage locations.

**Bridging SCF Controls:** BCD-11.4

**Relevant SCG Controls:**

- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.

### Control 03.09.02.a.01

> Disable system access within [Assignment: organization-defined time period].

**Bridging SCF Controls:** IAC-07

**Relevant SCG Controls:**

- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.

### Control 03.09.02.a.02

> Terminate or revoke authenticators and credentials associated with the individual.

**Bridging SCF Controls:** IAC-07

**Relevant SCG Controls:**

- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.

### Control 03.09.02.b.02

> Modify access authorization to correspond with any changes in operational need.

**Bridging SCF Controls:** IAC-20

**Relevant SCG Controls:**

- esx-9.lockdown-mode -- The ESX host must enable Lockdown Mode.
- fleet-9.all-users-group -- Do not automatically include all users in role assignments.
- operations-9.non-imported-vidm -- Restrict VCF Operations access to imported identity-provider users.

### Control 03.10.01.a

> Develop, approve, and maintain a list of individuals with authorized access to the facility where the system resides.

**Bridging SCF Controls:** IAC-20.1

**Relevant SCG Controls:**

- vcenter-9.content-library-authentication -- VMware vCenter must require authentication for published content libraries.

### Control 03.10.01.c

> Review the facility access list [Assignment: organization-defined frequency].

**Bridging SCF Controls:** IAC-17

**Relevant SCG Controls:**

- esx-9.ad-admin-validate-interval -- The ESX host must not disable validation of users and groups.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.

### Control 03.10.01.d

> Remove individuals from the facility access list when access is no longer required.

**Bridging SCF Controls:** IAC-17

**Relevant SCG Controls:**

- esx-9.ad-admin-validate-interval -- The ESX host must not disable validation of users and groups.
- vcf-9.permissions-roles -- Review and right-size accounts, permissions, and role assignments across all VCF components.

### Control 03.11.01.a

> Assess the risk (including supply chain risk) of unauthorized disclosure resulting from the processing, storage, or transmission of CUI.

**Bridging SCF Controls:** TPM-03

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control 03.11.02.b

> Remediate system vulnerabilities within [Assignment: organization-defined response times].

**Bridging SCF Controls:** VPM-04, VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control 03.12.02.a.02

> To reduce or eliminate known system vulnerabilities.

**Bridging SCF Controls:** VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control 03.13.01.a

> Monitor and control communications at external managed interfaces to the system and key internal managed interfaces within the system.

**Bridging SCF Controls:** NET-03, NET-04, NET-04.1

**Relevant SCG Controls:**

- esx-9.firewall-incoming-default -- The ESX host must configure the firewall to block network traffic by default.
- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- esx-9.network-bpdu -- Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.network-rpf-promisc -- The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.
- esx-9.network-standard-reject-forged-transmit -- Reject forged transmits on standard switches and port groups.
- esx-9.network-standard-reject-mac-changes -- Reject guest MAC address changes on standard switches and port groups.
- esx-9.network-standard-reject-promiscuous-mode -- Reject promiscuous mode on standard switches and port groups.
- nsx-9.ibgp-source-loopback -- Configure Tier-0 Gateway iBGP peering to use the loopback address as the source.
- nsx-9.reverse-path-forwarding -- NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.network-mac-learning -- Disable MAC learning on distributed switch port groups unless a workload requires it.
- vcenter-9.network-reject-forged-transmit-dvportgroup -- Reject forged transmits on distributed switches and port groups.
- vcenter-9.network-reject-mac-changes-dvportgroup -- Reject guest MAC address changes on distributed switches and port groups.
- vcenter-9.network-reject-promiscuous-mode-dvportgroup -- Reject promiscuous mode on distributed switches and port groups.
- vcenter-9.network-reset-port -- Reset distributed switch port configuration when a virtual machine disconnects.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-restrict-port-level-overrides -- Disallow per-port policy overrides on distributed port groups, except port blocking.
- vcenter-9.network-restrict-port-mirroring -- Remove unauthorized port mirroring sessions on distributed switches.
- vcenter-9.network-vgt -- Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.
- vcf-9.perimeter-firewall -- Limit access to VCF component management interfaces with perimeter firewalls.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.

### Control 03.13.01.b

> Implement subnetworks for publicly accessible system components that are physically or logically separated from internal networks.

**Bridging SCF Controls:** NET-03, NET-06

**Relevant SCG Controls:**

- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
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
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 03.13.01.c

> Connect to external systems only through managed interfaces that consist of boundary protection devices arranged in accordance with an organizational security architecture.

**Bridging SCF Controls:** NET-03, NET-04

**Relevant SCG Controls:**

- esx-9.network-bpdu -- Enable the Bridge Protocol Data Unit (BPDU) filter on the ESX host.
- esx-9.network-dvfilter -- Use of the dvFilter network APIs must be restricted on the ESX host.
- esx-9.network-rpf-promisc -- The ESX host must perform reverse path forwarding checks on promiscuous mode port groups.
- esx-9.network-standard-reject-forged-transmit -- Reject forged transmits on standard switches and port groups.
- esx-9.network-standard-reject-mac-changes -- Reject guest MAC address changes on standard switches and port groups.
- esx-9.network-standard-reject-promiscuous-mode -- Reject promiscuous mode on standard switches and port groups.
- nsx-9.ibgp-source-loopback -- Configure Tier-0 Gateway iBGP peering to use the loopback address as the source.
- nsx-9.reverse-path-forwarding -- NSX Tier-0 Gateway must enable unicast Reverse Path Forwarding to drop spoofed-source packets.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.network-mac-learning -- Disable MAC learning on distributed switch port groups unless a workload requires it.
- vcenter-9.network-reject-forged-transmit-dvportgroup -- Reject forged transmits on distributed switches and port groups.
- vcenter-9.network-reject-mac-changes-dvportgroup -- Reject guest MAC address changes on distributed switches and port groups.
- vcenter-9.network-reject-promiscuous-mode-dvportgroup -- Reject promiscuous mode on distributed switches and port groups.
- vcenter-9.network-reset-port -- Reset distributed switch port configuration when a virtual machine disconnects.
- vcenter-9.network-restrict-netflow-usage -- Send distributed switch NetFlow data only to authorized collectors.
- vcenter-9.network-restrict-port-level-overrides -- Disallow per-port policy overrides on distributed port groups, except port blocking.
- vcenter-9.network-restrict-port-mirroring -- Remove unauthorized port mirroring sessions on distributed switches.
- vcenter-9.network-vgt -- Restrict VLAN trunking (Virtual Guest Tagging) on distributed port groups to authorized VMs.
- vm-9.dvfilter -- Virtual machines must limit access through the dvFilter API.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.
- vsan-9.hcl-internet -- Disable or proxy the vSAN Health Check Hardware Compatibility List (HCL) download.
- vsan-9.network-isolation-vsan-iscsi-target -- Isolate vSAN iSCSI Target traffic on dedicated VMkernel interfaces.

### Control 03.13.04

> Information in Shared System Resources: Prevent unauthorized and unintended information transfer via shared system resources.

**Bridging SCF Controls:** SEA-05

**Relevant SCG Controls:**

- esx-9.memeagerzero -- The ESX host must enable volatile key destruction.
- esx-9.transparent-page-sharing -- The ESX host must restrict inter-VM transparent page sharing to VMs configured with sched.mem.pshare.salt.
- vm-9.deactivate-console-copy -- Virtual machines must have console copy operations deactivated.
- vm-9.deactivate-console-paste -- Virtual machines must have console paste operations deactivated.
- vm-9.isolation-tools-dnd-deactivate -- Virtual machines must have console drag and drop operations deactivated.
- vm-9.transparentpagesharing-inter-vm-enabled -- Virtual machines must restrict sharing of memory pages between VMs.

### Control 03.13.06

> Network Communications – Deny by Default – Allow by Exception: Deny network communications traffic by default, and allow network communications traffic by exception.

**Bridging SCF Controls:** NET-04.1

**Relevant SCG Controls:**

- esx-9.firewall-incoming-default -- The ESX host must configure the firewall to block network traffic by default.
- esx-9.firewall-restrict-access -- Configure the ESX host firewall to only allow traffic from authorized networks.
- operations-9.firewall-hardening -- VCF Operations must enable firewall hardening.
- vcenter-9.vami-firewall-restrict-access -- Configure the vCenter appliance firewall to allow inbound traffic only from authorized networks.
- vcf-9.perimeter-firewall -- Limit access to VCF component management interfaces with perimeter firewalls.
- vsan-9.file-services-access-control-nfs -- NFS file shares on vSAN File Services must be configured to restrict access.

### Control 03.13.08

> Transmission and Storage Confidentiality: Implement cryptographic mechanisms to prevent the unauthorized disclosure of CUI during transmission and while in storage.

**Bridging SCF Controls:** CRY-01, CRY-01.1, CRY-03, CRY-05

**Relevant SCG Controls:**

- automation-9.oidc-settings -- Bound VCF Automation OIDC token lifetimes and keep redirect targets HTTPS-only.
- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- esx-9.log-forwarding-tls-ciphers -- The ESX host must verify certificates for TLS remote logging endpoints.
- esx-9.memory-tiering-encryption -- The ESX host should encrypt data written to tiered memory devices.
- esx-9.nfs-traffic-protection -- Protect NFS datastore traffic on the ESX host using encryption or network isolation.
- esx-9.tls-ciphers -- The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- esx-9.tpm-configuration -- The ESX host must require TPM-based configuration encryption.
- esx-9.vmk-storage -- The ESX host must protect the confidentiality and integrity of transmitted storage traffic.
- esx-9.vmk-vmotion -- The ESX host must protect the confidentiality and integrity of transmitted vMotion traffic.
- esx-9.vmotion-encryption-offload -- Accelerate vMotion encryption using available hardware offload on ESX hosts.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- nsx-9.tls-ciphers -- NSX Manager must use TLS with approved protocol versions and cipher suites.
- operations-9.logs-ssl-api -- Enable SSL for API log ingestion in VCF Operations.
- operations-9.logs-ssl-syslog -- Enable SSL for syslog log ingestion in VCF Operations.
- vcenter-9.smtp -- Send vCenter notification email over a secure SMTP connection.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.
- vcenter-9.tls-ciphers -- vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- vm-9.ft-encrypted -- Virtual machines must require encryption for Fault Tolerance.
- vm-9.vmotion-encrypted -- Virtual machines must require encryption for vMotion.
- vsan-9.encryption-rest -- vSAN must protect data at rest.
- vsan-9.encryption-transit-esa -- vSAN must protect data in transit between hosts.
- vsan-9.encryption-transit-osa -- vSAN must protect data in transit between hosts.
- vsan-9.file-services-authentication-smb -- SMB file shares on vSAN File Services must require protocol encryption.
- vsan-9.storage-cluster-traffic-protection -- vSAN Storage Cluster compute-to-storage traffic must be encrypted or isolated.

### Control 03.13.10

> Cryptographic Key Establishment and Management: Establish and manage cryptographic keys in the system in accordance with the following key management requirements: [Assignment: organization-defined requirements for key generation, distribution, storage, access, and destruction].

**Bridging SCF Controls:** CRY-09, CRY-09.3

**Relevant SCG Controls:**

- esx-9.hardware-tpm -- Install and enable a TPM 2.0 on each ESX host.
- esx-9.key-persistence -- Disable Key Persistence on ESX hosts that do not have controlled physical access.
- esx-9.tpm-recovery-key-backup -- The ESX host configuration encryption recovery key must be backed up to a secure off-host location.
- vcenter-9.native-key-provider-backup -- Protect Native Key Provider backups with a strong password.
- vsan-9.rekey-interval -- Re-issue vSAN encryption Key Encryption Keys (KEKs) on a regular schedule.

### Control 03.13.11

> Cryptographic Protection: Implement the following types of cryptography to protect the confidentiality of CUI: [Assignment: organization-defined types of cryptography].

**Bridging SCF Controls:** CRY-01, CRY-01.5

**Relevant SCG Controls:**

- esx-9.entropy -- The ESX host must use sufficient entropy for cryptographic operations.
- esx-9.hardware-cpu-amd-cc -- Enable AMD SEV-ES and SEV-SNP in system firmware where available, and size the SEV ASID pool appropriately.
- esx-9.hardware-cpu-intel-cc -- Enable Intel SGX and TDX in system firmware where available.
- esx-9.tls-ciphers -- The ESX host's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.
- nsx-9.load-balancer-fips -- Enable FIPS-validated cryptography for NSX load balancers.
- nsx-9.tls-ciphers -- NSX Manager must use TLS with approved protocol versions and cipher suites.
- vcenter-9.snmp3 -- Enforce SNMPv3 authentication and privacy where SNMP is enabled on vCenter.
- vcenter-9.tls-ciphers -- vCenter's TLS profile must restrict negotiated ciphers and protocols to a modern, approved set.

### Control 03.13.12.b

> Provide an explicit indication of use to users physically present at the devices.

**Bridging SCF Controls:** CFG-02

**Relevant SCG Controls:**

- vcf-9.secure-baseline -- Apply the controls in this guidance, and document the rationale for any deviations.

### Control 03.13.15

> Session Authenticity: Protect the authenticity of communications sessions.

**Bridging SCF Controls:** NET-09

**Relevant SCG Controls:**

- nsx-9.bgp-encryption -- Enable BGP authentication on Tier-0 Gateway peers with a unique password per autonomous system.
- nsx-9.ospf-encryption -- NSX Tier-0 Gateway must enable OSPF authentication.

### Control 03.14.01.a

> Identify, report, and correct system flaws.

**Bridging SCF Controls:** VPM-04, VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control 03.14.01.b

> Install security-relevant software and firmware updates within [Assignment: organization-defined time period] of the release of the updates.

**Bridging SCF Controls:** VPM-04, VPM-05

**Relevant SCG Controls:**

- esx-9.hardware-firmware-updates -- Ensure all system and device firmware is auditable, authentic, and up to date.
- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.
- esx-9.updates -- The ESX host must have all available software updates and patches installed.
- guest-9.tools-updates -- The guest OS must run a current version of VMware Tools.
- guest-9.tools-upgrade -- The guest OS must enable VMware Tools auto-upgrade, or use an equivalent external update path.
- vcenter-9.vami-updates -- vCenter must have all available software updates and patches installed.
- vm-9.virtual-hardware -- Virtual machines must use a minimum supported virtual hardware version.

### Control 03.14.06.a.01

> Attacks and indicators of potential attacks.

**Bridging SCF Controls:** MON-01.4

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.

### Control 03.14.06.b

> Identify unauthorized use of the system.

**Bridging SCF Controls:** MON-01.4

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.

### Control 03.14.06.c

> Monitor inbound and outbound communications traffic to detect unusual or unauthorized activities or conditions.

**Bridging SCF Controls:** MON-01.4

**Relevant SCG Controls:**

- esx-9.cpu-hyperthread-warning -- The ESX host must not suppress warnings about unmitigated hyperthreading vulnerabilities.
- esx-9.shell-warning -- The ESX host must not suppress warnings that the local or remote shell is enabled.

### Control 03.16.02.a

> Replace system components when support for the components is no longer available from the developer, vendor, or manufacturer.

**Bridging SCF Controls:** TDA-17

**Relevant SCG Controls:**

- esx-9.supported -- The ESX host must run a build of ESX that has not reached End of General Support.
- vcenter-9.supported -- vCenter must run a version that has not reached End of General Support.

### Control 03.16.03.a

> Require the providers of external system services used for the processing, storage, or transmission of CUI to comply with the following security requirements: [Assignment: organization-defined security requirements].

**Bridging SCF Controls:** TPM-04

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control 03.16.03.c

> Implement processes, methods, and techniques to monitor security requirement compliance by external service providers on an ongoing basis.

**Bridging SCF Controls:** TPM-04

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control 03.17.01.a

> Develop a plan for managing supply chain risks associated with the research and development, design, manufacturing, acquisition, delivery, integration, operations, maintenance, and disposal of the system, system components, or system services.

**Bridging SCF Controls:** TPM-03

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control 03.17.02

> Acquisition Strategies, Tools, and Methods: Develop and implement acquisition strategies, contract tools, and procurement methods to identify, protect against, and mitigate supply chain risks.

**Bridging SCF Controls:** TPM-04

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control 03.17.03.a

> Establish a process for identifying and addressing weaknesses or deficiencies in the supply chain elements and processes.

**Bridging SCF Controls:** TPM-03, TPM-04

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.

### Control 03.17.03.b

> Enforce the following security requirements to protect against supply chain risks to the system, system components, or system services and to limit the harm or consequences from supply chain-related events: [Assignment: organization-defined security requirements].

**Bridging SCF Controls:** TPM-03, TPM-04

**Relevant SCG Controls:**

- vcenter-9.administration-client-plugins -- Reduce or eliminate third-party vCenter plugins.
