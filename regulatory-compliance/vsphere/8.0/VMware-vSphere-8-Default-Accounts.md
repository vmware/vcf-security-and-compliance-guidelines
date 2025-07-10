# Default Accounts in VMware vSphere 8

Efforts in security and regulatory compliance frequently aim to compare the default settings of VMware vSphere components with the active configurations in a given environment. This document outlines the standard accounts present in a fresh installation of VMware ESXi and VMware vCenter Server.

Isolating services on the same operating system using distinct user accounts is a longstanding security practice. VMware employs this approach for its appliance services where feasible.

Although we strive to update this document for major and update versions, other product updates might alter the findings. If discrepancies arise between this document and your environment, compare with the version from the Broadcom Support Portal. We also appreciate feedback on discrepancies via the feedback mechanism at the top of this page.

Engineered solutions, including but not limited to HPE GreenLake and Dell VxRail, might introduce or modify local accounts in supported and acceptable ways. Details about these solutions are beyond the scope of this document and should be sought directly from the respective partners.

This document focuses on local and default accounts. While it's possible to configure the products for external authentication, like Microsoft Active Directory, accounts accessed in this way are not covered here.

Disclaimer
----------

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This  repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.

Intended Audience
-----------------

This document is based on hyperconverged on-premises deployments of VMware vSphere 8.0.3, commonly referred herein to as vSphere 8. We urge readers to consistently apply patches and updates, as they are integral to maintaining a robust security stance.

Numerous engineered data center and hybrid cloud infrastructure products incorporate VMware vSphere in their solutions. If you use vSphere in this manner, consult the product's support if discrepancies arise.

For the latest version of this document, visit: [https://brcm.tech/vcf-security](https://brcm.tech/vcf-security)

Feedback
--------

Please use the issue tracker in our GitHub repository to submit feedback:

[https://github.com/vmware/vcf-security-and-compliance-guidelines/issues](https://github.com/vmware/vcf-security-and-compliance-guidelines/issues)

Thank you.

ESXi Shell Access
-----------------

Beginning in ESXi 8.0.0, local accounts can have their shell access disabled. This has two primary effects:

*   That account cannot log in via SSH or the ESXi console.
*   That account, no matter what privilege level it has, cannot alter the shell access parameters of other local accounts. 

While the broader VMware ecosystem is familiar with most security controls in vSphere, newer controls can have unintended consequences. For instance, one might inadvertently lock out all administrative shell access and find traditional recovery methods ineffective due to Configuration Encryption and other security measures introduced since ESXi 7.0.2. Exercise caution when using these controls.

For more information consult the [vSphere 8 Security Configuration & Hardening Guide](https://brcm.tech/vcf-scg) before enabling.

ESXi Default Local Accounts
---------------------------

The VMware Hypervisor (VMware ESXi) ships with two built-in accounts, root and dcui, and when managed with VMware vCenter Server is commonly enabled with a third account, vpxuser.

### root

The root account is created at installation. It is required for administration and is not removable.

The password can be changed both manually and programmatically through product UIs and APIs, as well as using the ‘passwd’ command at an ESXi shell. There is not a provision to automatically change or rotate the password.

The password is not a “default” as it is specified by the administrator at installation.

The password is subject to the ESXi password complexity and history parameters, such as Security.PasswordQualityControl. More information can be found in the [vSphere Security Configuration & Hardening Guide](https://brcm.tech/vcf-scg).

The password is stored as a salted SHA512 hash, consistent with UNIX and UNIX-like operating systems.

Equivalent administrative access can be granted to alternate accounts added post-install for day-to-day use by vSphere administrators, so that log monitoring alerts (Log Insight et al) can be created for direct use of this account. It is not recommended to disable shell access for this account on ESXi 8.0.0 or newer.

### dcui

The dcui account is created at installation. It is required for direct console service isolation and is not removable.

The password can be changed both manually and programmatically through product UIs and APIs, as well as using the ‘passwd’ command at an ESXi shell, though it is recommended to leave it locked. There is not a provision to automatically change or rotate the password.

There is no default password. The account is locked through the UNIX standard method of replacing the password in /etc/shadow with a value incompatible with a SHA512 hash (such as ‘x’ or ‘!’ or ‘\*’).

The account should not have a password configured, but if one was, it would be subject to the ESXi password complexity and history parameters, such as Security.PasswordQualityControl. More information can be found in the [vSphere Security Configuration & Hardening Guide](https://brcm.tech/vcf-scg).

The password, if set, would be stored as a salted SHA512 hash, consistent with UNIX and UNIX-like operating systems.

There are no reasons for vSphere administrators to log into ESXi in this manner. As such, this account may have its shell access removed in ESXi 8.0.0 and newer. More information can be found in the [vSphere Security Configuration & Hardening Guide](https://brcm.tech/vcf-scg). Additionally, log monitoring alerts (Log Insight et al) can be set to alarm if this account is accessed.

### vpxuser

The vpxuser account is created when ESXi is first attached to vCenter Server. It is required for administration by vCenter Server. To attach ESXi to vCenter Server the vSphere Administrator provides root or equivalent credentials. vCenter Server uses those credentials to create and secure the ‘vpxuser’ account. All subsequent access by vCenter Server is through vpxuser.

The password can, but should not, be changed manually via API, CLI, or UI, as vCenter Server will then need to be reconnected. vCenter Server will automatically rotate the password on an interval governed by the VirtualCenter.VimPasswordExpirationInDays advanced vCenter Server parameter, measured in days, with a minimum of 1 and default of 30 days.

The randomly generated password is 32 characters using four character classes (numbers, special characters, upper, and lower case). This password is randomly generated for each ESXi host.

The password is subject to the ESXi password complexity and history parameters, such as Security.PasswordQualityControl. More information can be found in the [vSphere Security Configuration & Hardening Guide](https://brcm.tech/vcf-scg).

The password is stored as a salted SHA512 hash on ESXi, consistent with UNIX and UNIX-like operating systems. To enable management, vCenter Server stores the vpxuser password in an encrypted format inside the vCenter Server database on the vCenter Server Appliance.

This account is not removable and an alternate cannot be substituted. Shell access may be removed on ESXi 8.0.0 and newer but will impact management capabilities from vCenter Server. More discussion of this can be found above and in the [vSphere Security Configuration & Hardening Guides](https://brcm.tech/vcf-scg). There are no reasons for vSphere administrators to log into ESXi with this account, so log monitoring alerts (Log Insight et al) can be set to alarm if this account is accessed from anywhere but vCenter Server.

vCenter Server Appliance Default Local Accounts
-----------------------------------------------

The VMware vCenter Server Appliance (VCSA) has numerous service accounts in order to isolate services. These accounts are required by the product and not removable.

Of these accounts, only root has a password set. The password is not a “default” as it is specified by the administrator at installation.

Local account passwords can be changed both manually and programmatically through product UIs and APIs, though it is recommended to leave the accounts locked. There are no provisions to automatically change or rotate passwords. It is possible to manage these passwords using standard Linux commands outside of the product UIs and APIs.

Accounts that are locked are locked through the UNIX standard method of replacing the password in /etc/shadow with a value incompatible with a SHA512 hash (such as ‘x’ or ‘!’ or ‘\*’).

The passwords set on accounts are subject to the VCSA password quality settings which are visible in the VCSA Virtual Appliance Management Interface (VAMI). They are stored as salted SHA512 hashes, consistent with UNIX and UNIX-like operating systems.

### vCenter Server 8

Accounts present on a “stock” installation of VMware vCenter Server 8 are as follows. Descriptions of the accounts and their purposes can be found in the GECOS field (field 5) in /etc/passwd.

Isolating services on the same operating system using distinct user accounts is a longstanding security practice on Linux- and UNIX-based systems. Broadcom employs this approach for its appliance services where feasible. As per Broadcom support policies on [VMware Virtual Appliances and Customizations](https://knowledge.broadcom.com/external/article?articleNumber=367354), changes to internal accounts on the appliances are not supported.

```
alarms_script (isolation of vSphere alarm script execution) (locked via /sbin/nologin)
analytics (isolation of vSphere Analytics service) (locked via /sbin/nologin)
apache (stock Linux apache service account) (locked via /bin/false)
bin (stock Linux account) (locked via /bin/false)
certauth (isolation of vCenter Certificate Authority service) (locked via /sbin/nologin)
certmgr (isolation of certificate lifecycle support processes) (locked via /sbin/nologin)
cis-license (isolation of Cloud Infrastructure Services license management) (locked via /sbin/nologin)
content-library (isolation of vSphere Content Library service) (locked via /sbin/nologin)
daemon (stock Linux account) (locked via /bin/false)
deploy (isolation of vSphere Deployment services) (locked via /sbin/nologin)
dnsmasq (stock Linux dnsmasq service account) (locked via /sbin/nologin)
eam (isolation of vSphere ESX Agent Manager services) (locked via /sbin/nologin)
envoy (reverse proxy & TLS endpoint) (locked via /sbin/nologin)
envoy-hgw (isolation of Envoy API gateway) (locked via /sbin/nologin)
envoy-sidecar (isolation of Envoy sidecar proxy) (locked via /sbin/nologin)
hvc (isolation of Hybrid vCenter services) (locked via /sbin/nologin)
idmservice (isolation of Identity Management services) (locked via /sbin/nologin)
imagebuilder (isolation of vSphere Image Builder service) (locked via /sbin/nologin)
infraprofile (isolation of vSphere Infrastructure Profile service) (locked via /sbin/nologin)
lighttpd (stock Linux lighttpd web server account) (locked via /sbin/nologin)
lookupsvc (isolation of vSphere Lookup Service, part of SSO) (locked via /sbin/nologin)
messagebus (stock Linux D-Bus service account) (locked via /bin/false)
named (stock Linux DNS service account) (locked via /bin/false)
netdumper (isolation of vSphere Network Dumper service) (locked via /sbin/nologin)
nobody (stock Linux account) (locked via /bin/false)
ntp (stock Linux NTP service account) (locked via /bin/false)
observability (isolation of vSphere Observability services) (locked via /sbin/nologin)
perfcharts (isolation of vSphere Performance Charts service) (locked via /sbin/nologin)
pod (isolation of vSphere Pod services, part of VMware Kubernetes Service) (locked via /sbin/nologin)
postgres (stock Linux PostgreSQL database service account) (locked via unset password)
pschealth (isolation of vSphere Platform Services Controller services) (locked via /sbin/nologin)
rhttpproxy (isolation of reverse HTTP proxy) (locked via /sbin/nologin)
root (stock Linux account) (unlocked - shell: /bin/appliancesh)
rpc (stock Linux RPC service account) (locked via /bin/false)
sca (isolation of Service Control Agent) (locked via /sbin/nologin)
smmsp (stock Linux sendmail service account) (locked via /bin/false)
sps (isolation of the vSphere Storage Policy Service) (locked via /sbin/nologin)
sshd (stock Linux SSH service account) (locked via /bin/false)
sso-user (isolation of vSphere SSO services) (locked via unset password)
sts (isolation of Security Token Service) (locked via /sbin/nologin)
systemd-bus-proxy (stock Linux systemd service account) (locked via /bin/false)
systemd-journal-gateway (stock Linux systemd service account) (locked via /bin/false)
systemd-journal-remote (stock Linux systemd service account) (locked via /bin/false)
systemd-journal-upload (stock Linux systemd service account) (locked via /bin/false)
systemd-network (stock Linux systemd service account) (locked via /bin/false)
systemd-resolve (stock Linux systemd service account) (locked via /bin/false)
systemd-timesync (stock Linux systemd service account) (locked via /bin/false)
tftp (stock Linux TFTP service account) (locked via /bin/false)
topologysvc (isolation of vSphere Topology Service) (locked via /sbin/nologin)
trustmanagement (isolation of vSphere Trust Authority services) (locked via /sbin/nologin)
updatemgr (isolation of vSphere Update Manager & Lifecycle Manager services) (locked via /sbin/nologin)
vapiEndpoint (isolation of API endpoint services) (locked via /sbin/nologin)
vdtc (isolation of vSphere Distributed Trace Collection service) (locked via /sbin/nologin)
vlcm (isolation of vSphere Lifecycle Manager services) (locked via /sbin/nologin)
vmafdd-user (isolation of VMware Authentication Framework services) (locked via /sbin/nologin)
vmcad-user (isolation of VMware Certificate Authority services) (locked via /sbin/nologin)
vmcam (isolation of VMware Authentication Proxy services) (locked via /sbin/nologin)
vmdird (isolation of VMware Directory services) (locked via /sbin/nologin)
vmonapi (isolation of VMware Monitoring service API endpoint) (locked via /sbin/nologin)
vpgmonusr (isolation of PostgreSQL services monitoring) (locked via /sbin/nologin)
vpostgres (isolation of PostgreSQL services) (locked via /sbin/nologin)
vpxd (isolation of VMware vCenter Server services) (locked via /sbin/nologin)
vpxd-svcs (isolation of VMware vCenter Server services) (locked via /sbin/nologin)
vsan-health (isolation of vSphere vSAN Health services) (locked via /bin/nologin)
vsm (isolation of VMware Storage Manager services) (locked via /sbin/nologin)
vsphere-ui (isolation of VMware vSphere Client services) (locked via /sbin/nologin)
vstatsuser (isolation of vSphere Statistics services) (locked via /sbin/nologin)
vtsdbmonusr (isolation of the vSphere Time Series Database monitoring services) (locked via /sbin/nologin)
vtsdbuser (isolation of the vSphere Time Series Database services) (locked via /sbin/nologin)
wcp (isolation of VMware Workload Control Plane/VKS services) (locked via /sbin/nologin)
```

By default only the root account is able to be accessed, as all other accounts are locked, either through /sbin/nologin, /bin/false, or "!" in /etc/shadow, all of which prevent login.

vSphere Single Sign-On Default Accounts
---------------------------------------

VMware vSphere Single Sign-On components have four accounts present in a “stock” implementation: administrator, waiter-<UUID>, krbtgt, and K/M.

### administrator

The administrator account is created at installation. It is required for administration and not removable.

The password can be changed both manually and programmatically through product UIs and APIs. There is not a provision to automatically change or rotate the password, nor manage it outside of the product UIs and APIs.

The password is not a “default” as it is specified by the administrator at installation.

The password is subject to the vSphere SSO password complexity and history settings, except for lockout, as the administrator account cannot be locked out. More information can be found in the [vSphere Security Configuration & Hardening Guides](https://brcm.tech/vcf-scg).

The password is stored as a SHA512 hash in the SSO LDAP subsystem.

### waiter-<UUID>

The waiter account is created at installation. It is required for administration and not removable. Its name contains a UUID which, by definition, varies between installations.

The password can be changed both manually and programmatically through product UIs and APIs, though it is not recommended. In lieu of changing the password, the account can be disabled if the environment does not use the vSphere Auto Deploy feature.

The password is not a “default” but is a randomly generated 20 character password set at installation.

The password, when changed, is subject to the vSphere SSO password complexity and history settings. More information can be found in the [vSphere Security Configuration & Hardening Guides](https://brcm.tech/vcf-scg).

The password is stored as a SHA512 hash in the SSO LDAP subsystem.

### krbtgt

The krbtgt/VSPHERE.LOCAL (or your chosen SSO domain) account is created at installation. It is required for administration and not removable.

The password can be changed both manually and programmatically through product UIs and APIs, though it is not recommended. In lieu of changing the password, the account can be disabled if the environment does not use SASL/Kerberos authentication such as through Integrated Windows Authentication.

The password is not a “default” but is a randomly generated 20 character password set at installation.

The password, when changed, is subject to the vSphere SSO password complexity and history settings. More information can be found in the [vSphere Security Configuration & Hardening Guides](https://brcm.tech/vcf-scg).

The password is stored as a SHA512 hash in the SSO LDAP subsystem.

### K/M

The K/M account is created at installation. It is required for administration and not removable.

The password can be changed both manually and programmatically through product UIs and APIs, though it is not recommended. In lieu of changing the password, the account can be disabled if the environment does not use SASL/Kerberos authentication such as through Integrated Windows Authentication.

The password is not a “default” but is a randomly generated 20 character password set at installation.

The password, when changed, is subject to the vSphere SSO password complexity and history settings. More information can be found in the [vSphere Security Configuration & Hardening Guides](https://brcm.tech/vcf-scg).

The password is stored as a SHA512 hash in the SSO LDAP subsystem.