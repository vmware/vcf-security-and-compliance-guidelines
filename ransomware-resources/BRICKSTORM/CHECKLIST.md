# BRICKSTORM Defense Checklist

A step-by-step checklist for protecting VMware systems from BRICKSTORM. For detailed guidance, see [DEFENSE-GUIDE.md](DEFENSE-GUIDE.md).

*This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This repository is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.*

---

## Top 10 Quick Wins

| # | Action | Details |
|---|--------|---------|
| 1 | Scan for signs of infection now | [IOC Detection](#11-check-for-known-iocs) |
| 2 | Keep logs for 2+ years | [Log Retention](#31-log-collection--retention) |
| 3 | Put vCenter on a separate network | [Network Segmentation](#21-architecture--network-segmentation) |
| 4 | Use separate logins for VCF admins | [Identity Management](#23-identity--access-management) |
| 5 | Turn on execInstalledOnly + Secure Boot | [ESX Hardening](#25-vmware-esx-host-hardening) |
| 6 | Block encrypted DNS to public servers | [DoH Blocking](#24-dns-over-https-blocking) |
| 7 | Patch VPNs and firewalls fast | [Patch Management](#22-patch-management) |
| 8 | Enable encryption on Domain Controllers | [Tier 0 Protection](#29-critical-infrastructure-vm-protection) |
| 9 | Remove encryption privileges from admins | [Tier 0 Protection](#29-critical-infrastructure-vm-protection) |
| 10 | Alert when someone copies important VMs | [Detection Rules](#33-detection-rules) |

---

## 1. Immediate Detection Actions

### 1.1 Check for Known IOCs

See [DEFENSE-GUIDE.md: IOC-Based Detection](DEFENSE-GUIDE.md#1-ioc-based-detection) for detection procedures.

**Behavioral Detection (Higher Confidence):**
- [ ] Check for [Junction implant](DEFENSE-GUIDE.md#junction-implant-detection): unexpected listeners on port 8090
- [ ] Check for unexpected network listeners on VMware ESX hosts
- [ ] Check for suspicious environment variables in running processes
- [ ] Check guest VMs for [GuestConduit](DEFENSE-GUIDE.md#guestconduit-detection): VSOCK listeners on port 5555

**Hash and YARA Scanning:**
- [ ] Run [CISA YARA rules](https://www.cisa.gov/news-events/analysis-reports/ar25-338a) against VMware ESX hosts
- [ ] Investigate any matches (note: BRICKSTORM is often compiled uniquely per victim)

### 1.2 Review Boot/Init Scripts

See [DEFENSE-GUIDE.md: Boot Script Integrity Check](DEFENSE-GUIDE.md#2-boot-script-integrity-check) for baseline procedures and expected content.

**VMware ESX hosts:**
- [ ] Check [`/etc/rc.local.d/local.sh`](DEFENSE-GUIDE.md#2-boot-script-integrity-check) for unexpected PATH or binary execution
- [ ] Audit `/etc/sysconfig/` for unauthorized files or ELF executables

**vCenter (VCSA):**
- [ ] Audit `/etc/sysconfig/` and `/etc/sysconfig/network/` for unauthorized files
- [ ] Run [AIDE integrity check](DEFENSE-GUIDE.md#2-boot-script-integrity-check) against baseline
- [ ] Check for unexpected [cron jobs](DEFENSE-GUIDE.md#2-boot-script-integrity-check) in `/var/spool/cron/`

### 1.3 Network Traffic Analysis

See [DEFENSE-GUIDE.md: Network Traffic Analysis](DEFENSE-GUIDE.md#3-network-traffic-analysis) for detection patterns.

- [ ] Monitor for [DoH traffic](DEFENSE-GUIDE.md#dns-over-https-detection) to public resolvers
- [ ] Check for [WebSocket connections](DEFENSE-GUIDE.md#websocket-communication) to unknown endpoints
- [ ] Review [outbound connections](DEFENSE-GUIDE.md#4-egress-monitoring) from management infrastructure to the internet

### 1.4 vCenter Activity Audit

See [DEFENSE-GUIDE.md: vCenter Activity Audit](DEFENSE-GUIDE.md#4-vcenter-activity-audit) for PowerCLI queries and SIEM detection patterns.

- [ ] Run [Get-VMCloneEvents.ps1](scripts/Get-VMCloneEvents.ps1) to detect suspicious cloning (especially during 01:00-10:00 UTC)
- [ ] Check for [cloned then deleted VMs](DEFENSE-GUIDE.md#vm-cloning-operations) (credential extraction pattern)
- [ ] Hunt for disk swap: critical VM disks attached to staging VMs
- [ ] Audit [`VSPHERE.LOCAL\Administrator`](DEFENSE-GUIDE.md#account-audit) account usage
- [ ] Review recently created/deleted [local accounts](DEFENSE-GUIDE.md#account-audit)
- [ ] Run [Get-SSHServiceStatus.ps1](scripts/Get-SSHServiceStatus.ps1) to audit SSH across hosts
- [ ] Audit [vpxuser SSH logins](DEFENSE-GUIDE.md#vpxuser-ssh-monitoring) (should not initiate interactive sessions)
- [ ] Check vCenter web.xml for [BRICKSTEAL](DEFENSE-GUIDE.md#bricksteal-credential-harvesting) servlet filters

---

## 2. Prevention & Hardening

### 2.1 Architecture & Network Segmentation

See [DEFENSE-GUIDE.md: Network Segmentation](DEFENSE-GUIDE.md#2-network-segmentation) for architecture diagrams.

- [ ] Isolate vCenter [management network](DEFENSE-GUIDE.md#management-network-isolation) in dedicated VLAN with no inbound internet access
- [ ] Block RDP and SMB between DMZ and internal networks
- [ ] Restrict vCenter to management VLAN only
- [ ] Implement bastion/jump host with EDR and MFA for all administrative access
- [ ] Block VMware ESX management interfaces from general network
- [ ] Isolate edge appliances (VPNs, firewalls): treat as untrusted
- [ ] Restrict vSphere and edge appliance outbound traffic to essential updates only
- [ ] [Separate Management and Workload Clusters](DEFENSE-GUIDE.md#separated-management-and-workload-clusters)
- [ ] Isolate storage fabric: separate management storage from workload storage
- [ ] Implement VMware vDefend Distributed Firewall between VM tiers
- [ ] Monitor [egress traffic](DEFENSE-GUIDE.md#4-egress-monitoring): alert on denied outbound connections
- [ ] Verify and monitor [NTP synchronization](DEFENSE-GUIDE.md#5-ntp-monitoring)

**Out-of-Band Management (BMC/iDRAC/iLO):**

See [DEFENSE-GUIDE.md: Out-of-Band Management](DEFENSE-GUIDE.md#out-of-band-management-bmcipmiidracilo) for BRICKSTORM relevance.

- [ ] Place BMC interfaces on physically separate network (not just a VLAN)
- [ ] Secure hardware management controllers (`esx-9.hardware-management-security`)
- [ ] Configure BMC authentication to avoid AD dependency loops (`esx-9.hardware-management-authentication`)
- [ ] Forward BMC logs to SIEM (`esx-9.hardware-management-log-forwarding`)
- [ ] Synchronize BMC time (`esx-9.hardware-management-time`)
- [ ] Disable BMC virtual NICs (`esx-9.hardware-virtual-nic`)
- [ ] Disable unused external ports (`esx-9.hardware-ports`)
- [ ] Restrict BMC access to specific jump hosts with MFA
- [ ] Keep BMC firmware updated

### 2.2 Patch Management

See [DEFENSE-GUIDE.md: Patch Management](DEFENSE-GUIDE.md#4-patch-management) for [zero-day mitigation](DEFENSE-GUIDE.md#zero-day-interim-mitigations) procedures.

**[Edge Device Inventory](DEFENSE-GUIDE.md#edge-device-inventory):**
- [ ] Scan your public IP space for internet-exposed management interfaces
- [ ] Reconcile findings with asset inventory
- [ ] Establish ongoing external monitoring

**Patching Process:**
- [ ] Subscribe to VMware Security Advisories (VMSA)
- [ ] Subscribe to edge vendor security bulletins
- [ ] Monitor CISA KEV catalog
- [ ] Test patches in non-production before deployment
- [ ] Maintain rollback capability for critical systems
- [ ] Document patching decisions and exceptions

### 2.3 Identity & Access Management

See [DEFENSE-GUIDE.md: Access Control Implementation](DEFENSE-GUIDE.md#1-access-control-implementation) for detailed guidance.

**[Identity Federation](DEFENSE-GUIDE.md#identity-federation-and-authentication):**
- [ ] Federate VCF SSO to separate identity provider (isolated from corporate IdP)
- [ ] Use VCF SSO Identity Broker to introduce MFA
- [ ] Enable conditional access, geographic restrictions, phishing-resistant MFA
- [ ] Lower authentication token lifetimes
- [ ] Perform authorization inside VMware Cloud Foundation rather than in the IdP
- [ ] Retain IdP access logs for extended period
- [ ] If using Microsoft Entra ID: disable Seamless SSO and SSPR for administrators
- [ ] Proactively rotate [ADFS token-signing certificates](DEFENSE-GUIDE.md#golden-saml-attack) (if ADFS is used)
- [ ] Audit infrastructure IdPs against published best practices

**[Access Restrictions](DEFENSE-GUIDE.md#access-restrictions):**
- [ ] Restrict access to VMware vCenter and VCF Operations to only those who need it
- [ ] Restrict direct VMware ESX access: drive access through VMware vCenter and RBAC
- [ ] Restrict access to connected infrastructure management interfaces
- [ ] Run [Get-VSpherePermissions.ps1](scripts/Get-VSpherePermissions.ps1) to audit permissions and reduce to minimum required
- [ ] Do NOT connect provisioning/HR/password reset systems to infrastructure components
- [ ] Do NOT connect monitoring systems in a manner that allows remote command execution
- [ ] Reset authenticators in person for privileged accounts
- [ ] Secure [break-glass credentials](DEFENSE-GUIDE.md#credential-management)

### 2.4 DNS-over-HTTPS Blocking

See [DEFENSE-GUIDE.md: DNS-over-HTTPS Detection](DEFENSE-GUIDE.md#dns-over-https-detection) for resolver IPs and firewall rules.

- [ ] Block outbound DoH to public resolvers from infrastructure (IPv4 and IPv6)
- [ ] Block known DoH endpoints at firewall/proxy
- [ ] Monitor for encrypted DNS traffic anomalies

### 2.5 VMware ESX Host Hardening

See [DEFENSE-GUIDE.md: VMware ESX Hardening](DEFENSE-GUIDE.md#vmware-esx-hardening) for BRICKSTORM-specific considerations.

**Secure Boot and Binary Execution (critical for BRICKSTORM prevention):**
- [ ] Enable UEFI Secure Boot in firmware (`esx-9.hardware-secureboot`)
- [ ] Enable Secure Boot enforcement (`esx-9.secureboot`)
- [ ] Enable TPM-based Secure Boot enforcement (`esx-9.secureboot-enforcement`)
- [ ] Enable `execInstalledOnly` (`esx-9.vib-trusted-binaries`)
- [ ] Enable TPM enforcement for `execInstalledOnly` (`esx-9.tpm-trusted-binaries`)
- [ ] Require TPM-based configuration encryption (`esx-9.tpm-configuration`)

**SSH and Shell Access:**
- [ ] Disable SSH service when not in use (`esx-9.ssh`)
- [ ] Disable ESX Shell service (`esx-9.deactivate-shell`)
- [ ] Configure shell service timeout (`esx-9.shell-timeout`)
- [ ] Configure interactive session timeout (`esx-9.shell-interactive-timeout`)
- [ ] Do not suppress shell warnings (`esx-9.shell-warning`)
- [ ] Enable lockdown mode (`esx-9.lockdown-mode`)

**Logging:**
- [ ] Forward logs to remote collector (`esx-9.log-forwarding`)
- [ ] Forward audit records remotely (`esx-9.log-audit-forwarding`)
- [ ] Enable local audit logging (`esx-9.log-audit-local`)
- [ ] Use persistent log storage (`esx-9.log-persistent`)

**Firewall and Time:**
- [ ] Set default deny firewall policy (`esx-9.firewall-incoming-default`)
- [ ] Restrict firewall to authorized networks (`esx-9.firewall-restrict-access`)
- [ ] Configure NTP synchronization (`esx-9.time`)

### 2.6 VMware vCenter Hardening

See [DEFENSE-GUIDE.md: vCenter Hardening](DEFENSE-GUIDE.md#vcenter-hardening) for BRICKSTORM-specific considerations.

**Shell and Access Controls:**
- [ ] Disable SSH access when not in use (`vcenter-9.ssh`)
- [ ] Limit BashShellAdministrators group membership (`vcenter-9.bashshelladministrators`)
- [ ] Configure appliance firewall (`vcenter-9.vami-firewall-restrict-access`)

**Credential and Account Controls:**
- [ ] Disable unused accounts (`vcenter-9.disable-accounts`)
- [ ] Configure vpxuser password rotation (`vcenter-9.vpxuser-rotation`)
- [ ] Enable SSO account action alerts (`vcenter-9.account-alert`)
- [ ] Configure failed login lockout (`vcenter-9.account-lockout-max-attempts`)

**Logging:**
- [ ] Forward logs to remote collector (`vcenter-9.log-forwarding`)
- [ ] Enable remote event logging (`vcenter-9.events-remote-logging`)
- [ ] Configure NTP synchronization (`vcenter-9.time`)

**VCF-Wide Controls:**
- [ ] Integrate with MFA-enabled identity provider (`vcf-9.mfa`)
- [ ] Isolate VCF from other networks via perimeter firewall (`vcf-9.perimeter-firewall`)
- [ ] Disable unused accounts across VCF components (`vcf-9.disable-accounts`)
- [ ] Forward logs from all VCF components (`vcf-9.log-forwarding`)
- [ ] Synchronize time across all VCF components (`vcf-9.time`)

### 2.7 Credential & Secret Protection

See [DEFENSE-GUIDE.md: Protecting Critical Infrastructure VMs](DEFENSE-GUIDE.md#protecting-critical-infrastructure-vms-domain-controllers-vaults) for attack details.

- [ ] Audit access to password vault VMs
- [ ] Monitor for [cloning of credential storage systems](DEFENSE-GUIDE.md#vm-cloning-operations)

### 2.8 Virtual Machine Hardening

**VM Security:**
- [ ] Enable guest Secure Boot (`vm-9.secure-boot`)
- [ ] Enable VM diagnostic logging (`vm-9.log-enable`)

**VMware Tools (Host-to-Guest Attack Vectors):**

See [DEFENSE-GUIDE.md: VMware Tools Controls](DEFENSE-GUIDE.md#5-virtual-machine-hardening) for details on these attack vectors.

- [ ] Disable Guest Operations on deployed VMs (`guest-9.tools-deactivate-guestoperations`)
- [ ] Prevent recustomization on deployed VMs (`guest-9.tools-prevent-recustomization`)
- [ ] Disable GlobalConf (`guest-9.tools-globalconf`)
- [ ] Disable GuestStore upgrades (`guest-9.tools-deactivate-gueststoreupgrade`)
- [ ] Limit adding Tools features (`guest-9.tools-add-feature`)
- [ ] Limit removing Tools features (`guest-9.tools-remove-feature`)
- [ ] Limit MSI transforms on Windows (`guest-9.tools-allow-transforms`)
- [ ] Enable VMware Tools logging (`guest-9.tools-logs`)
- [ ] Forward Tools logs to syslog (`guest-9.tools-log-forwarding`)

### 2.9 Critical Infrastructure VM Protection

See [DEFENSE-GUIDE.md: Protecting Critical Infrastructure VMs](DEFENSE-GUIDE.md#protecting-critical-infrastructure-vms-domain-controllers-vaults) for attack details and defense rationale.

**For Windows/Linux VMs (DCs, CAs, Vaults):**
- [ ] Add vTPM to gain encrypted VM benefits
- [ ] Revoke Cryptographer permissions from most administrators (required for encryption to be effective)
- [ ] Consider BitLocker with boot PIN for highest-sensitivity VMs only

**For VMware Appliances (vCenter, SDDC Manager, NSX, VCF Operations):**
- [ ] Network isolation in dedicated management VLAN
- [ ] Separate identity federation to isolated IdP
- [ ] Alert on any clone, snapshot, or reconfigure events
- [ ] Limit access to appliance consoles and APIs
- [ ] Maintain immutable backups

**Monitoring:**
- [ ] Alert on VmClonedEvent targeting Tier 0 VMs
- [ ] Alert on VmReconfiguredEvent with disk attachment changes
- [ ] Alert on VmMigratedEvent moving Tier 0 VMs to non-management clusters
- [ ] Monitor VMware Tools guest operations

---

## 3. Detection & Monitoring

### 3.1 Log Collection & Retention

See [DEFENSE-GUIDE.md: Log Collection Configuration](DEFENSE-GUIDE.md#1-log-collection-configuration) for retention tiers and immutability requirements.

> **Prerequisite**: VMware ESX local syslog partitions are small and rotate quickly (often less than 24 hours in busy environments). Real-time remote syslog forwarding is the only way to achieve long-term retention. Before proceeding, verify logs are actually reaching your collector.

- [ ] **Verify syslog is reaching collector**: Check your SIEM for recent VMware ESX events; local logs vanish quickly

**ESX Logging:**
- [ ] Forward logs to remote collector (`esx-9.log-forwarding`)
- [ ] Forward audit records remotely (`esx-9.log-audit-forwarding`)
- [ ] Enable local audit logging (`esx-9.log-audit-local`)
- [ ] Use persistent log storage (`esx-9.log-persistent`, `esx-9.log-audit-persistent`)
- [ ] Disable log filtering (`esx-9.log-filter`)

**vCenter Logging:**
- [ ] Forward logs to remote collector (`vcenter-9.log-forwarding`)
- [ ] Enable remote event logging (`vcenter-9.events-remote-logging`)

**General:**
- [ ] Forward all logs to VCF Operations for Logs and/or SIEM (minimum 2-year retention)
- [ ] Forward bastion host logs to SIEM
- [ ] Forward IdP authentication logs to SIEM

### 3.2 Immutable Log Storage

See [DEFENSE-GUIDE.md: Immutable Log Storage](DEFENSE-GUIDE.md#immutable-log-storage) for requirements and tiered retention.

- [ ] Forward logs to isolated SIEM (separate authentication domain, separate network segment)
- [ ] Enable log immutability (WORM storage or platform immutability features)
- [ ] Implement real-time forwarding (do not batch on source systems)
- [ ] Monitor log forwarding health and alert on disruptions
- [ ] Retain logs for minimum 2 years
- [ ] Test log retrieval from 12+ months ago
- [ ] Protect SIEM credentials separately from vSphere credentials

### 3.3 Detection Rules

See [DEFENSE-GUIDE.md: Detection Rules](DEFENSE-GUIDE.md#2-detection-rules) and [AUDIT-EVENTS.md](AUDIT-EVENTS.md) for complete event reference.

- [ ] Deploy YARA rules for BRICKSTORM detection (see [CISA AR25-338A](https://www.cisa.gov/news-events/analysis-reports/ar25-338a))
- [ ] Implement [Sigma rules](DEFENSE-GUIDE.md#sigma-rules) for vCenter anomalies
- [ ] Alert on [VM cloning followed by rapid deletion](DEFENSE-GUIDE.md#vm-cloning-operations)
- [ ] Alert on disk attachment from critical VMs to other VMs
- [ ] Alert on new [local account creation](DEFENSE-GUIDE.md#account-audit)
- [ ] Alert on [SSH enablement changes](DEFENSE-GUIDE.md#ssh-access-changes)
- [ ] Alert on init script modifications
- [ ] Alert on suspicious file API access patterns
- [ ] Alert on Enterprise App permission grants in Entra ID

### 3.4 Behavioral Monitoring

- [ ] Monitor for after-hours administrative activity (01:00-10:00 UTC)
- [ ] Track service account authentication patterns
- [ ] Monitor for lateral movement from DMZ to internal
- [ ] Alert on unusual credential usage patterns
- [ ] Monitor VMware ESX hosts for unexpected process execution
- [ ] Inventory and monitor Shadow IT edge devices
- [ ] Alert on [vpxuser SSH sessions](DEFENSE-GUIDE.md#vpxuser-ssh-monitoring)
- [ ] Monitor for [VSOCK activity](DEFENSE-GUIDE.md#vsock-bypass-junction-and-guestconduit) on ports 8090 (Junction) and 5555 (GuestConduit)

### 3.5 File Integrity Monitoring

See [DEFENSE-GUIDE.md: File Integrity Monitoring](DEFENSE-GUIDE.md#3-file-integrity-monitoring) for paths to monitor.

- [ ] Monitor `/etc/sysconfig/` for changes
- [ ] Monitor `/etc/sysconfig/network/` for changes
- [ ] Monitor `/etc/rc.local.d/` for changes
- [ ] Monitor VMware binary directories
- [ ] Baseline and monitor boot configuration files
- [ ] Alert on new files in VMware system directories
- [ ] Monitor vCenter web.xml for [BRICKSTEAL](DEFENSE-GUIDE.md#bricksteal-credential-harvesting) servlet filter additions

---

## 4. Incident Response Preparation

### 4.1 Documentation

- [ ] Document vSphere environment architecture
- [ ] Maintain inventory of all VMs and their purpose
- [ ] Document authorized service accounts and their access
- [ ] Create network diagrams showing management traffic flows
- [ ] Document baseline configurations for vCenter/VMware ESX

### 4.2 Response Procedures

See [DEFENSE-GUIDE.md: Incident Response](DEFENSE-GUIDE.md#incident-response) for response procedures.

- [ ] Create vCenter compromise response playbook
- [ ] Create VMware ESX compromise response playbook
- [ ] Document [evidence collection](DEFENSE-GUIDE.md#3-evidence-collection) procedures
- [ ] Establish communication plan with VMware support
- [ ] Pre-position forensic tools for VMware ESX analysis
- [ ] Pre-establish relationship with Incident Response consultancy

### 4.3 Backup & Recovery

See [DEFENSE-GUIDE.md: Recovery Procedures](DEFENSE-GUIDE.md#recovery-procedures) for detailed guidance.

- [ ] Backup vCenter configuration (file-based or image)
- [ ] Backup vCenter database
- [ ] Maintain offline backup of VMware ESX configurations
- [ ] Test restoration procedures regularly
- [ ] Document rebuild procedures for vCenter
- [ ] Isolate backup infrastructure from corporate domain
- [ ] Use separate credentials for backup infrastructure
- [ ] Implement [immutable backups](DEFENSE-GUIDE.md#1-backup-strategy) (WORM storage or immutability features)
- [ ] Maintain replication separate from backups
- [ ] Create [Content Library](DEFENSE-GUIDE.md#1-backup-strategy) for recovery (ISOs, OVAs, recovery tools)
- [ ] Build [isolated recovery environment](DEFENSE-GUIDE.md#2-recovery-planning)
- [ ] Document dependency mapping
- [ ] Define RTO and RPO per workload tier

### 4.4 Infrastructure Hygiene

- [ ] Delete VM disks immediately upon decommissioning (don't just power off)
- [ ] Regular audit for [orphaned/unknown VMs](DEFENSE-GUIDE.md#6-rogue-vm-detection)
- [ ] Regular audit for [unused snapshots](scripts/Get-StaleSnapshots.ps1)

### 4.5 Rogue VM Detection

See [DEFENSE-GUIDE.md: Rogue VM Detection](DEFENSE-GUIDE.md#6-rogue-vm-detection) and [Ghost VM Detection](DEFENSE-GUIDE.md#ghost-vm-detection) for details.

- [ ] Run [Get-GhostVMs.ps1](scripts/Get-GhostVMs.ps1) to detect VMs running but not registered in vCenter
- [ ] Run [Get-RogueVMs.ps1](scripts/Get-RogueVMs.ps1) to find recently created or suspicious VMs
- [ ] Cross-reference findings against change management records
- [ ] Alert on VM creation events (`VmCreatedEvent`, `VmRegisteredEvent`)
- [ ] Restrict VM creation privileges and require change management approval

---

## 5. Active Compromise Response

See [DEFENSE-GUIDE.md: Incident Response](DEFENSE-GUIDE.md#incident-response) for detailed procedures.

### 5.1 Containment (If BRICKSTORM Detected)

See [DEFENSE-GUIDE.md: Containment Procedures](DEFENSE-GUIDE.md#2-containment-procedures) for critical warnings.

- [ ] Contact your incident response team
- [ ] Isolate affected vCenter/VMware ESX from network
- [ ] Do NOT power off or reboot VMs (preserves file locks and memory evidence)
- [ ] Do NOT unmount storage unless active encryption is confirmed (causes APD/PDL)
- [ ] Block C2 communication at network boundary
- [ ] Disable compromised service accounts (don't reset passwords yet)
- [ ] Capture forensic image before any remediation

### 5.2 Evidence Collection

See [DEFENSE-GUIDE.md: Evidence Collection](DEFENSE-GUIDE.md#3-evidence-collection) for detailed procedures.

- [ ] For VMs: take snapshot with "Snapshot the virtual machine's memory" checked (preserves RAM without taking service offline)
- [ ] For VMware ESX hosts: collect live response data (processes, connections, modules)
- [ ] Preserve all logs before any changes
- [ ] Image affected systems if possible
- [ ] Document timeline of compromise indicators
- [ ] Collect network flow data

### 5.3 Eradication

See [DEFENSE-GUIDE.md: Eradication](DEFENSE-GUIDE.md#4-eradication) for critical warnings about certificate rotation.

- [ ] Remove BRICKSTORM binaries from all affected hosts
- [ ] Restore init scripts to known-good state
- [ ] Reset all potentially compromised credentials
- [ ] Rebuild affected systems from trusted media
- [ ] Re-image vCenter from clean backup or fresh install
- [ ] Rotate [vCenter STS signing certificates](DEFENSE-GUIDE.md#4-eradication)
- [ ] Rotate [ADFS token-signing certificates](DEFENSE-GUIDE.md#golden-saml-attack) (if ADFS is used)

### 5.4 Recovery

See [DEFENSE-GUIDE.md: Recovery Planning](DEFENSE-GUIDE.md#2-recovery-planning) for vpxuser rotation and validation procedures.

- [ ] Restore services in [isolated environment](DEFENSE-GUIDE.md#2-recovery-planning) first
- [ ] Rotate [vpxuser passwords](DEFENSE-GUIDE.md#vpxuser-lateral-movement) by disconnecting/reconnecting each VMware ESX host
- [ ] [Validate integrity](DEFENSE-GUIDE.md#3-validation-before-restoration) before reconnecting to network
- [ ] Monitor closely for re-compromise indicators
- [ ] Implement additional controls identified during incident

### 5.5 Reporting

- [ ] Report to CISA (U.S.) or appropriate national CERT
- [ ] Notify organizational leadership
- [ ] Document lessons learned
- [ ] Update detection rules based on findings
