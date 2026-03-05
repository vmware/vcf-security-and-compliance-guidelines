# BRICKSTORM Detection: Audit Events Reference

*Last updated: March 5, 2026*

What to watch for in your VMware logs to detect BRICKSTORM attacks.

*This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This repository is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.*

---

## Log Locations

**VMware ESX Host Logs**:
- Audit log: `/var/log/audit/` (structured audit events)
- General hostd log: `/var/log/hostd.log`
- VMkernel log: `/var/log/vmkernel.log`
- Shell history: `/var/log/shell.log`
- SSH logs: Events logged via syslog facility

**vCenter Logs**:
- vpxd log: `/var/log/vmware/vpxd/vpxd.log`
- Events database: Accessible via vSphere API (`EventManager`)

Forward all logs to a SIEM via syslog for centralized monitoring and retention.

---

## 1. VM Lifecycle Events (CRITICAL)

These events are essential for detecting BRICKSTORM's credential extraction technique (clone VM, extract credentials, delete VM).

### VM Operations (VMware ESX Audit Log)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `vm.create` | ESX | ⚠️ HIGH | VM creation attempted | New staging VM creation |
| `vm.delete` | ESX | ⛔ CRITICAL | VM deletion attempted | Covering tracks after credential extraction |
| `vm.reconfigure` | ESX | ⛔ CRITICAL | VM reconfiguration attempted | **Disk swap attack**: attaching DC disks to staging VM |
| `vm.register` | ESX | 🔵 MEDIUM | VM registered | Rogue VM registration |
| `vm.kill` | ESX | ⚠️ HIGH | VM forcefully terminated | Abnormal VM termination |
| `vm.power.on` | ESX | 🔵 MEDIUM | VM power on attempted | Staging VM activation |
| `vm.power.off` | ESX | 🔵 MEDIUM | VM power off attempted | Pre-deletion activity |
| `vm.snapshot.create` | ESX | ⚠️ HIGH | Snapshot creation attempted | Data capture technique |
| `vm.snapshot.remove` | ESX | 🔵 MEDIUM | Snapshot removal attempted | Cleanup activity |
| `vm.snapshot.revert` | ESX | 🔵 MEDIUM | Snapshot revert attempted | May indicate testing/evasion |

### VM Storage Events - Disk Swap Detection (VMware ESX Audit Log)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `vm.storage.add` | ESX | ⛔ CRITICAL | Disk attached to VM | **Key indicator**: DC/vault disk attached to different VM |
| `vm.storage.edit` | ESX | ⚠️ HIGH | VM storage configuration changed | Disk reconfiguration |
| `vm.storage.remove` | ESX | ⚠️ HIGH | Disk removed from VM | Cleanup after extraction |

**Disk Swap Alert Criteria for `vm.storage.add`**:

Alert when a Domain Controller or credential store disk is attached to any non-DC virtual machine:

```bash
# In vm.storage.add event, check the vmdk parameter
# Alert if vmdk path contains a Critical VM name AND target VM is not the disk owner

# Example suspicious event:
#   Event: vm.storage.add
#   Target VM: "staging-vm-temp"
#   vmdk: "[datastore1] DC01/DC01.vmdk"   <-- DC disk attached to non-DC VM
```

See [Rule 8: Disk Swap Attack](#rule-8-disk-swap-attack-vcenter) for detailed detection logic and SIEM query examples.

### VM Migration Events - Pre-Clone Staging (VMware ESX Audit Log)

Attackers may use vMotion or Storage vMotion to move a Domain Controller to a compromised host or less-monitored datastore before cloning, avoiding detection on the primary production cluster.

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `vm.migrate` | ESX | ⚠️ HIGH | VM vMotion initiated | DC moved to compromised host |
| `vm.storage.migrate` | ESX | ⚠️ HIGH | Storage vMotion initiated | DC moved to attacker-controlled storage |
| `vm.relocate` | ESX | ⚠️ HIGH | VM relocated (compute + storage) | Full VM relocation |

**Detection Rule**: Alert when ANY migration event targets a Critical VM (Domain Controller, CA, vault) and the destination is:
- A non-production cluster
- A datastore not in the approved list for that VM class
- A host outside the secured management cluster

```
# VCF Operations for Logs query
eventTypeId:(vm.migrate OR vm.storage.migrate OR vm.relocate) AND vm.name:(*DC* OR *domain* OR *vault* OR *CA*)
```

### Detection Pattern: Clone-Extract-Delete

Alert when these events occur in sequence within 24 hours for the same VM:
1. `vm.create` or `vm.register`
2. `vm.storage.add` (especially if attaching disk from critical VM)
3. `vm.power.on`
4. `vm.power.off`
5. `vm.delete`

---

## 2. Authentication and Session Events (HIGH)

### SSH Events (VMware ESX)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `ssh.connect` | ESX | ⚠️ HIGH | SSH connection attempt | Direct host access |
| `ssh.disconnect` | ESX | ⬜ LOW | SSH connection ended | Session tracking |
| `ssh.session.begin` | ESX | ⚠️ HIGH | SSH session started | Interactive access established |
| `ssh.session.end` | ESX | ⬜ LOW | SSH session ended | Session tracking |
| `ssh.cmd` | ESX | ⛔ CRITICAL | Shell command executed via SSH | **Command execution monitoring** |

#### vpxuser SSH Monitoring

The `vpxuser` account is created by vCenter to manage VMware ESX hosts and has root-equivalent privileges. UNC5221 extracts vpxuser credentials from compromised vCenter and uses them to SSH into VMware ESX hosts.

**Distinguishing Legitimate from Malicious vpxuser Activity**:
- **Legitimate**: vCenter uses vpxuser for non-interactive, automated host management (API calls, configuration pushes). These operations do not generate `ssh.session.begin` events.
- **Malicious**: Interactive SSH sessions by vpxuser (generates `ssh.session.begin`) indicate an attacker has extracted credentials and is manually accessing hosts.

**Critical Alert**: Any `ssh.session.begin` event where the user is `vpxuser` warrants immediate investigation. This pattern indicates credential extraction and lateral movement, not normal vCenter operations.

```
# Alert criteria
Event: ssh.session.begin
User: vpxuser
Priority: ⛔ CRITICAL
```

### DCUI Events (VMware ESX)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `dcui.login` | ESX | ⚠️ HIGH | DCUI login attempted | Physical/console access |
| `dcui.logout` | ESX | ⬜ LOW | DCUI session ended | Session tracking |
| `esx.audit.dcui.login.failed` | ESX | ⚠️ HIGH | DCUI login failed | Brute force attempts |
| `esx.audit.dcui.login.passwd.changed` | ESX | ⛔ CRITICAL | DCUI password changed | Credential manipulation |

### VIM API Sessions (VMware ESX)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `vim.connect` | ESX | 🔵 MEDIUM | VIM API connection established | API access |
| `vim.disconnect` | ESX | ⬜ LOW | VIM API connection ended | Session tracking |
| `vim.terminate` | ESX | 🔵 MEDIUM | VIM session terminated | Forced disconnection |
| `vim.access.denied` | ESX | ⚠️ HIGH | VIM API access denied | Unauthorized access attempts |

### Login Failure Events (VMware ESX)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `esx.audit.account.locked` | ESX | ⚠️ HIGH | Account locked due to failed logins | Brute force detection |
| `esx.audit.account.loginfailures` | ESX | ⚠️ HIGH | Multiple login failures detected | Credential guessing |
| `esx.audit.ssh.session.failed` | ESX | ⚠️ HIGH | SSH login failed | SSH brute force |

---

## 3. Account Management Events (CRITICAL)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `account.create` | ESX | ⛔ CRITICAL | User account creation attempted | Persistence mechanism |
| `account.delete` | ESX | ⚠️ HIGH | User account deletion attempted | Covering tracks |
| `account.edit` | ESX | ⚠️ HIGH | User account modification attempted | Privilege escalation |
| `account.changePassword` | ESX | ⚠️ HIGH | Password change attempted | Credential manipulation |
| `account.locked` | ESX | 🔵 MEDIUM | Account locked (failed logins) | Attack detection |

### Detection Pattern: Temporary Account

Alert when `account.create` is followed by `account.delete` within short timeframe (hours to days).

---

## 4. Service Management Events (HIGH)

### Service State Changes (VMware ESX)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `service.start` | ESX | ⚠️ HIGH | Service start attempted | SSH/Shell enablement |
| `service.stop` | ESX | 🔵 MEDIUM | Service stop attempted | Security service disabled |
| `service.restart` | ESX | 🔵 MEDIUM | Service restart attempted | Service manipulation |
| `service.updatepolicy` | ESX | ⚠️ HIGH | Service startup policy changed | Persistence (auto-start SSH) |
| `service.uninstall` | ESX | ⚠️ HIGH | Service uninstall attempted | Security software removal |
| `service.access.denied` | ESX | 🔵 MEDIUM | Service access denied | Unauthorized service access |

### Key Services to Monitor

| Service ID | Service Name | Alert Priority |
|------------|--------------|----------------|
| `TSM-SSH` | SSH | ⛔ CRITICAL when enabled |
| `TSM` | ESX Shell | ⛔ CRITICAL when enabled |
| `DCUI` | Direct Console UI | HIGH if disabled |
| `vpxa` | vCenter Agent | HIGH if stopped |
| `hostd` | Host Agent | HIGH if stopped |

---

## 5. Security Configuration Events (CRITICAL)

### execInstalledOnly Configuration (VMware ESX)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `configenc.reqeio.enable` | ESX | ⬜ LOW | execInstalledOnly requirement enabled | Security hardening |
| `configenc.reqeio.disable` | ESX | ⛔ CRITICAL | execInstalledOnly requirement disabled | **Security bypass attempt** |
| `configenc.reqsb.enable` | ESX | ⬜ LOW | Secure Boot requirement enabled | Security hardening |
| `configenc.reqsb.disable` | ESX | ⛔ CRITICAL | Secure Boot requirement disabled | **Security bypass attempt** |
| `configenc.tpm.enable` | ESX | ⬜ LOW | TPM mode enabled | Security hardening |

### Firewall Events (VMware ESX)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `firewall.disable` | ESX | ⛔ CRITICAL | Firewall disabled | Network security bypass |
| `firewall.enable` | ESX | ⬜ LOW | Firewall enabled | Normal operation |
| `firewall.ruleset.enable` | ESX | ⚠️ HIGH | Firewall ruleset enabled | Rule change |
| `firewall.ruleset.disable` | ESX | ⚠️ HIGH | Firewall ruleset disabled | Rule weakening |
| `firewall.ruleset.update` | ESX | 🔵 MEDIUM | Firewall ruleset updated | Configuration change |
| `firewall.update` | ESX | 🔵 MEDIUM | Firewall default policy updated | Policy change |

---

## 6. Time Configuration Events (HIGH)

Attackers manipulate time to evade detection and corrupt forensic timelines.

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `time.ntp.disable` | ESX | ⚠️ HIGH | NTP disabled | Time manipulation setup |
| `time.ntp.enable` | ESX | ⬜ LOW | NTP enabled | Normal operation |
| `time.ntp.set.servers` | ESX | 🔵 MEDIUM | NTP servers changed | Potential redirection |
| `time.set.systemclock` | ESX | ⛔ CRITICAL | System clock manually set | **Timestomping indicator** |
| `time.monitoring.disable` | ESX | ⚠️ HIGH | Time monitoring disabled | Evasion technique |
| `time.monitoring.enable` | ESX | ⬜ LOW | Time monitoring enabled | Normal operation |
| `esx.problem.clock.skew` | ESX | ⚠️ HIGH | Clock skew detected | Time drift/manipulation |
| `esx.problem.clock.parameter.set.maxPosPhaseCorrection` | ESX | ⛔ CRITICAL | NTP correction parameter changed | **Timestomping setup**: Allows large time jumps without detection |

**Why Time Manipulation Matters**: Attackers modify `maxPosPhaseCorrection` to allow large time adjustments that would normally be rejected by NTP. This enables backdating malicious activity to appear as if it occurred during a different timeframe, corrupting forensic timelines and potentially placing attacker activity outside your log retention window.

**VMkernel log detection**: In addition to the structured audit events above, monitor `/var/log/vmkernel.log` for NTPClock warnings that indicate large clock steps. The entry `WARNING: NTPClock: system clock stepped to [...], but delta [...] > 172800 seconds` (or similar large delta values) is a high-confidence indicator of the timestomping technique used by UNC5221. Forward vmkernel logs to your SIEM and alert on any `NTPClock` warning where the delta exceeds your expected drift threshold.

---

## 7. VIB/Software Events (CRITICAL)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `vib.install` | ESX | ⛔ CRITICAL | VIB installation attempted | **Malware/backdoor installation** |
| `vib.remove` | ESX | ⚠️ HIGH | VIB removal attempted | Security software removal |

### Detection Pattern

Any `vib.install` event outside of scheduled maintenance windows should trigger immediate investigation.

**esxupdate.log monitoring**: The `/var/log/esxupdate.log` file records details of VIB and image profile operations that the structured audit events do not capture. Forward this log to your SIEM and alert on the following strings, which indicate that VMware ESX cryptographic integrity checks have been intentionally bypassed:

- `acceptance level checking disabled`
- `Attempting to install an image profile bypassing signing and acceptance level verification`

These strings correspond to the use of `--no-sig-check` or a changed software acceptance level (e.g., `CommunitySupported`). Either condition means an operator with root privileges has deliberately overridden signature validation, which is the method UNC5221 uses to install malicious VIBs for persistence.

---

## 8. Shell Command Execution (CRITICAL)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `shell.cmd` | ESX | ⛔ CRITICAL | Shell command completed | **Command execution audit** |
| `ssh.cmd` | ESX | ⛔ CRITICAL | SSH command executed | **Remote command execution** |

### Forensic Limitations

**What these events capture:**
- Command string executed (e.g., `cat /etc/shadow`)
- Timestamp and user context
- Success/failure status

**What these events do NOT capture:**
- Command output (results of the command)
- Interactive session content (vi/vim editing, interactive prompts)
- Piped data or heredoc content
- File contents read or written

**Mitigating the Gap:**

| Approach | Implementation |
|----------|----------------|
| **Restricted shell access** | Minimize SSH/Shell enablement windows; disable when not in active use |
| **Correlate with file events** | Cross-reference `shell.cmd` with file integrity monitoring to infer what was modified |

This limitation means attackers can execute commands to view sensitive data (e.g., `cat /etc/shadow`) and the audit log will show the command was run, but not what data was extracted.

### High-Risk Command Patterns

Monitor `shell.cmd` and `ssh.cmd` events for these patterns:

| Pattern | Risk | Description |
|---------|------|-------------|
| `esxcli system settings kernel set` | ⛔ CRITICAL | Kernel parameter changes (execInstalledOnly) |
| `vim-cmd vmsvc/` | ⚠️ HIGH | VM operations via command line |
| `esxcli network firewall` | ⚠️ HIGH | Firewall manipulation |
| `esxcli software vib` | ⛔ CRITICAL | Software installation |
| `chmod`, `chown` | 🔵 MEDIUM | Permission changes |
| `cp`, `mv` to `/etc/` paths | ⚠️ HIGH | System file modification |
| `curl`, `wget` | ⛔ CRITICAL | External file download |

---

## 9. Syslog Configuration Events (HIGH)

Attackers may attempt to disable or redirect logging.

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `syslog.reload` | ESX | 🔵 MEDIUM | Syslog configuration reloaded | Config change |
| `syslog.net.close` | ESX | ⚠️ HIGH | Remote syslog connection closed | Log forwarding disruption |
| `syslog.net.open` | ESX | ⬜ LOW | Remote syslog connection opened | Normal operation |
| `syslog.net.link.down` | ESX | ⚠️ HIGH | Remote syslog link down | Log forwarding failure |
| `syslog.net.link.up` | ESX | ⬜ LOW | Remote syslog link up | Connection restored |

---

## 10. Certificate Events (MEDIUM)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `certificate.ca.add` | ESX | 🔵 MEDIUM | CA certificate added | Trust store modification |
| `certificate.ca.remove` | ESX | ⚠️ HIGH | CA certificate removed | Trust manipulation |
| `certificate.client.install` | ESX | 🔵 MEDIUM | Client certificate installed | Authentication change |
| `certificate.server.install` | ESX | 🔵 MEDIUM | Server certificate installed | Service identity change |

---

## 11. Advanced Settings Events (HIGH)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `settings.advanced.add` | ESX | ⚠️ HIGH | Advanced setting added | Configuration manipulation |
| `settings.advanced.delete` | ESX | ⚠️ HIGH | Advanced setting deleted | Configuration manipulation |
| `settings.advanced.reset` | ESX | 🔵 MEDIUM | Advanced setting reset | Configuration change |

---

## 12. Domain Events (MEDIUM)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `ad.event.JoinDomainEvent` | vCenter | 🔵 MEDIUM | Domain join succeeded | Identity integration |
| `ad.event.JoinDomainFailedEvent` | vCenter | ⚠️ HIGH | Domain join failed | Configuration issue |
| `ad.event.LeaveDomainEvent` | vCenter | ⚠️ HIGH | Domain leave succeeded | Identity isolation |
| `ad.event.ImportCertEvent` | vCenter | 🔵 MEDIUM | Certificate import succeeded | Trust store modification |
| `ad.event.ImportCertFailedEvent` | vCenter | ⚠️ HIGH | Certificate import failed | Configuration issue |

---

## 13. vCenter Task and Event System (CRITICAL)

vCenter maintains a task and event database accessible via the vSphere API and vSphere Client. These events provide visibility into VM lifecycle operations used in BRICKSTORM attacks.

### VM Lifecycle Events (vCenter Task Database)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `VmClonedEvent` | vCenter | ⛔ CRITICAL | VM clone completed | **Primary attack vector**: Clone DC/vault VM for offline credential extraction |
| `VmCreatedEvent` | vCenter | ⚠️ HIGH | VM created | New staging VM creation |
| `VmRemovedEvent` | vCenter | ⛔ CRITICAL | VM removed/deleted | Covering tracks after credential extraction |
| `VmReconfiguredEvent` | vCenter | ⛔ CRITICAL | VM reconfiguration completed | **Disk swap attack**: Attaching disks from other VMs |
| `VmRegisteredEvent` | vCenter | ⚠️ HIGH | VM registered to inventory | Rogue VM registration |
| `VmDeployedEvent` | vCenter | ⚠️ HIGH | VM deployed from template/OVF | New VM from template |
| `VmMigratedEvent` | vCenter | 🔵 MEDIUM | VM migrated (vMotion) | VM movement tracking |
| `VmRelocatedEvent` | vCenter | 🔵 MEDIUM | VM storage relocated | Storage migration |

### VM Snapshot Events (vCenter)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `VmSnapshotCreatedEvent` | vCenter | ⚠️ HIGH | Snapshot created | Data capture for extraction |
| `VmSnapshotRemovedEvent` | vCenter | 🔵 MEDIUM | Snapshot removed | Cleanup activity |
| `VmSnapshotRevertedEvent` | vCenter | 🔵 MEDIUM | VM reverted to snapshot | May indicate testing/evasion |

### VM Power Events (vCenter)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `VmPoweredOnEvent` | vCenter | 🔵 MEDIUM | VM powered on | Staging VM activation |
| `VmPoweredOffEvent` | vCenter | 🔵 MEDIUM | VM powered off | Pre-deletion activity |
| `VmSuspendedEvent` | vCenter | ⬜ LOW | VM suspended | State preservation |
| `VmResettingEvent` | vCenter | 🔵 MEDIUM | VM reset | Abnormal operation |

### Guest Operations Events (vCenter)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `com.vmware.vc.guestOperations.GuestOperation` | vCenter | ⚠️ HIGH | Guest operation performed | File/process operations inside VM |
| `com.vmware.vc.guestOperations.GuestOperationAuthFailure` | vCenter | ⚠️ HIGH | Guest operation auth failed | Unauthorized guest access attempt |

**Critical Alert: Guest Operations on Domain Controllers**

VMware Tools guest operations allow file transfers, process execution, and registry access from vCenter directly into VMs, bypassing network-level controls. Guest operations require authentication to the guest OS, though if attackers have extracted credentials via VM cloning, they can use guest operations to:
- Execute commands inside Domain Controllers
- Extract additional credentials (NTDS.dit, registry hives)
- Deploy persistence mechanisms inside critical VMs
- Exfiltrate data without network visibility

**Detection Rule**: Alert on ANY `com.vmware.vc.guestOperations.GuestOperation` event where the target VM is:
- A Domain Controller
- A Certificate Authority
- A password vault or credential store
- Any VM in your Critical VM list

```
# VCF Operations for Logs query
eventTypeId:com.vmware.vc.guestOperations.GuestOperation AND vm.name:(*DC* OR *domain* OR *vault* OR *CA*)
```

### Permission and Role Events (vCenter)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `PermissionAddedEvent` | vCenter | ⚠️ HIGH | Permission added | Privilege escalation |
| `PermissionRemovedEvent` | vCenter | 🔵 MEDIUM | Permission removed | Access revocation |
| `PermissionUpdatedEvent` | vCenter | ⚠️ HIGH | Permission modified | Privilege change |
| `RoleAddedEvent` | vCenter | ⚠️ HIGH | New role created | Custom privilege creation |
| `RoleRemovedEvent` | vCenter | 🔵 MEDIUM | Role deleted | Role cleanup |
| `RoleUpdatedEvent` | vCenter | ⚠️ HIGH | Role modified | Privilege modification |

### Session Events (vCenter)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `UserLoginSessionEvent` | vCenter | 🔵 MEDIUM | User logged in | Session tracking |
| `UserLogoutSessionEvent` | vCenter | ⬜ LOW | User logged out | Session tracking |
| `SessionTerminatedEvent` | vCenter | 🔵 MEDIUM | Session terminated | Forced disconnection |
| `BadUsernameSessionEvent` | vCenter | ⚠️ HIGH | Login with invalid username | Credential guessing |
| `NoPermissionSessionEvent` | vCenter | ⚠️ HIGH | Access denied | Unauthorized access attempt |
| `AlreadyAuthenticatedSessionEvent` | vCenter | ⬜ LOW | Already authenticated | Session reuse |

### Host Events (vCenter)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `HostAddedEvent` | vCenter | 🔵 MEDIUM | Host added to vCenter | Infrastructure change |
| `HostRemovedEvent` | vCenter | ⚠️ HIGH | Host removed from vCenter | Infrastructure manipulation |
| `HostConnectionLostEvent` | vCenter | ⚠️ HIGH | Lost connection to host | Potential attack indicator |
| `EnteredMaintenanceModeEvent` | vCenter | 🔵 MEDIUM | Host entered maintenance | Maintenance tracking |
| `ExitMaintenanceModeEvent` | vCenter | ⬜ LOW | Host exited maintenance | Normal operation |

### Datastore Events (vCenter)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `DatastoreFileMovedEvent` | vCenter | ⚠️ HIGH | File moved on datastore | VMDK movement |
| `DatastoreFileCopiedEvent` | vCenter | ⚠️ HIGH | File copied on datastore | VMDK duplication |
| `DatastoreFileDeletedEvent` | vCenter | ⚠️ HIGH | File deleted from datastore | Evidence destruction |

### Alarm Events (vCenter)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `AlarmCreatedEvent` | vCenter | 🔵 MEDIUM | Alarm created | Monitoring change |
| `AlarmRemovedEvent` | vCenter | ⚠️ HIGH | Alarm removed | Detection evasion |
| `AlarmReconfiguredEvent` | vCenter | ⚠️ HIGH | Alarm modified | Detection bypass |
| `AlarmStatusChangedEvent` | vCenter | 🔵 MEDIUM | Alarm status changed | Alert tracking |

---

## 14. vCenter-Relayed ESX Events

These ESX events are visible through vCenter and provide centralized monitoring of host-level security events.

### execInstalledOnly Events (via vCenter)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `esx.audit.uw.security.User.ExecInstalledOnly.disabled` | ESX | ⛔ CRITICAL | execInstalledOnly disabled | **Security bypass**: Allows unsigned binary execution |
| `esx.audit.uw.security.User.ExecInstalledOnly.enabled` | ESX | ⬜ LOW | execInstalledOnly enabled | Security hardening |
| `esx.audit.uw.security.execInstalledOnly.violation` | ESX | ⛔ CRITICAL | Non-installed binary execution blocked | **Active attack indicator** |

### SSH and Shell Events (via vCenter)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `esx.audit.ssh.enabled` | ESX | ⛔ CRITICAL | SSH access enabled | Remote access enabled |
| `esx.audit.ssh.disabled` | ESX | ⬜ LOW | SSH access disabled | Security hardening |
| `esx.audit.ssh.session.opened` | ESX | ⚠️ HIGH | SSH session opened | Remote access established |
| `esx.audit.ssh.session.closed` | ESX | ⬜ LOW | SSH session closed | Session ended |
| `esx.audit.ssh.session.failed` | ESX | ⚠️ HIGH | SSH login failed | Brute force attempt |
| `esx.audit.shell.enabled` | ESX | ⛔ CRITICAL | ESX Shell enabled | Local shell access enabled |
| `esx.audit.shell.disabled` | ESX | ⬜ LOW | ESX Shell disabled | Security hardening |

### Lockdown Mode Events (via vCenter)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `esx.audit.lockdownmode.enabled` | ESX | ⬜ LOW | Lockdown mode enabled | Security hardening |
| `esx.audit.lockdownmode.disabled` | ESX | ⛔ CRITICAL | Lockdown mode disabled | **Security bypass** |
| `esx.audit.lockdownmode.exceptions.changed` | ESX | ⚠️ HIGH | Lockdown exceptions changed | Access control modification |

### Firewall Events (via vCenter)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `esx.audit.net.firewall.disabled` | ESX | ⛔ CRITICAL | Firewall disabled | Network security bypass |
| `esx.audit.net.firewall.config.changed` | ESX | ⚠️ HIGH | Firewall configuration changed | Junction implant: attackers may open port 8090 externally if VSOCK tunneling unavailable |

### Host Power Events (via vCenter)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `esx.audit.host.boot` | ESX | 🔵 MEDIUM | Host booted | System restart |
| `esx.audit.hostd.host.reboot.reason` | ESX | ⚠️ HIGH | Host reboot with reason | Forced reboot tracking |
| `esx.audit.dcui.host.reboot` | ESX | ⚠️ HIGH | Host rebooted via DCUI | Console reboot |

### Software Installation Events (via vCenter)

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `esx.audit.esximage.vib.install.successful` | ESX | ⛔ CRITICAL | VIB installation succeeded | **Backdoor installation** |
| `esx.audit.esximage.vib.remove.successful` | ESX | ⚠️ HIGH | VIB removal succeeded | Software removal |
| `esx.audit.esximage.install.securityalert` | ESX | ⛔ CRITICAL | Security alert during install | Unsigned software installation |
| `esx.audit.esximage.install.nosigcheck` | ESX | ⛔ CRITICAL | Signature check bypassed | **Security bypass** |

---

## 15. Hypervisor Implant Detection (CRITICAL)

UNC5221 deploys specialized implants (Junction, GuestConduit) that use VSOCK to bypass network security. These events help detect this activity.

### VSOCK and Network Connection Events

| Event | Source | Priority | Description | BRICKSTORM Relevance |
|-------|--------|----------|-------------|---------------------|
| `network.listen.start` | ESX | ⚠️ HIGH | Process starts listening on port | Junction listens on port 8090 |
| `network.connect` | ESX | 🔵 MEDIUM | Outbound connection initiated | C2 communication |

### Detection Commands for Junction/GuestConduit

These implants may not generate standard audit events. Use active detection:

```bash
# On VMware ESX: Check for Junction (port 8090)
esxcli network ip connection list | grep -E ":8090.*LISTEN"

# On VMware ESX: Check for suspicious processes masquerading as vvold
ps -c | grep vvold

# On VMware ESX: Check all listeners for unexpected ports
esxcli network ip connection list | grep LISTEN

# On Guest VMs: Check for GuestConduit (VSOCK port 5555)
ss -x -l | grep -i vsock
```

### Process Monitoring

| Indicator | Description | Detection |
|-----------|-------------|-----------|
| **vvold masquerade** | Junction disguises itself as vvold | Compare process binary hash against known-good |
| **Port 8090 listener** | Junction default listening port | Monitor `esxcli network ip connection list` |
| **VSOCK port 5555** | GuestConduit default port | Check guest VMs for VSOCK listeners |

---

## 16. BRICKSTEAL Detection (CRITICAL)

BRICKSTEAL is an in-memory Java servlet filter that captures vCenter administrator credentials.

### vCenter Configuration Events

| Indicator | Location | Detection Method |
|-----------|----------|------------------|
| **Servlet filter addition** | `web.xml` | File integrity monitoring |
| **Tomcat restart** | vCenter service | Service restart events outside maintenance |
| **URI monitoring** | `/websso/SAML2/SSO/*` | BRICKSTEAL hooks these authentication URIs |

### Detection Procedure

```bash
# On vCenter: Check for unexpected servlet filters
grep -r "filter-class" /usr/lib/vmware-sso/vmware-sts/webapps/

# Compare web.xml against known baseline
sha256sum /usr/lib/vmware-sso/vmware-sts/webapps/ROOT/WEB-INF/web.xml

# Check for recently modified Java classes
find /usr/lib/vmware-sso/ -name "*.class" -mtime -30
```

### Correlation Rule: BRICKSTEAL Deployment

**Trigger**: Sequence within 24 hours:
1. vCenter SSH access enabled
2. SSH session to vCenter
3. Tomcat/STS service restart
4. No corresponding patch or maintenance ticket

**Priority**: ⛔ CRITICAL

---

## VCF Operations for Logs Queries

> **Timezone Note**: The attacker operational window (01:00-10:00 UTC) must be converted to your SIEM's log ingestion timezone. Many SIEMs index logs in local time or a configured timezone, not UTC. Verify how your logs are timestamped before deploying time-based detection rules.

### ESX Audit Log Queries

#### Critical Event Detection

```
object:(vm OR account OR service OR vib OR firewall OR time OR shell OR ssh) AND result:success
```

#### VM Clone-Delete Pattern

```
object:vm AND (action:create OR action:delete OR action:reconfigure)
```
Filter by time range and correlate events for same VM path.

#### SSH Activity Monitoring

```
object:ssh AND (action:connect OR action:cmd)
```

#### Security Configuration Changes

```
object:(configenc OR firewall) AND result:success
```

#### Account Changes

```
object:account AND (action:create OR action:delete OR action:edit)
```

#### Service Changes (SSH/Shell)

```
object:service AND (action:start OR action:updatepolicy)
```
Filter for services containing "SSH" or "TSM".

#### execInstalledOnly Events

```
esx.audit.uw.security
```
Monitor for disabled/enabled and violation events.

#### Lockdown Mode Changes

```
esx.audit.lockdownmode
```

### vCenter Event Queries

#### VM Clone Operations (CRITICAL for BRICKSTORM)

```
eventTypeId:(VmClonedEvent OR VmCloneFailedEvent)
```
Correlate with VM deletion events within 24 hours.

#### VM Lifecycle (Clone-Delete Pattern)

```
eventTypeId:(VmClonedEvent OR VmCreatedEvent OR VmRemovedEvent OR VmReconfiguredEvent)
```

#### VM Power State Changes

```
eventTypeId:(VmPoweredOnEvent OR VmPoweredOffEvent)
```
Correlate with clone/delete events.

#### Permission Changes

```
eventTypeId:(PermissionAddedEvent OR PermissionUpdatedEvent OR RoleAddedEvent OR RoleUpdatedEvent)
```

#### Session and Authentication

```
eventTypeId:(UserLoginSessionEvent OR BadUsernameSessionEvent OR NoPermissionSessionEvent)
```

#### Datastore File Operations

```
eventTypeId:(DatastoreFileMovedEvent OR DatastoreFileCopiedEvent OR DatastoreFileDeletedEvent)
```
Monitor for VMDK file operations.

#### Guest Operations

```
eventTypeId:(com.vmware.vc.guestOperations.GuestOperation OR com.vmware.vc.guestOperations.GuestOperationAuthFailure)
```

#### Alarm Modifications (Detection Evasion)

```
eventTypeId:(AlarmRemovedEvent OR AlarmReconfiguredEvent)
```

---

## Correlation Rules

### Rule 1: VM Credential Extraction Pattern (T1003.003)

**Trigger**: The following sequence within 24 hours:
1. `vm.create` or `vm.storage.add`
2. `vm.power.on`
3. `vm.power.off`
4. `vm.delete` or `vm.storage.remove`

**Priority**: ⛔ CRITICAL

### Rule 2: SSH Enabled + Command Execution (T1021.004)

**Trigger**:
1. `service.start` where object contains "SSH"
2. Followed by `ssh.cmd` events

**Priority**: ⛔ CRITICAL

### Rule 3: Security Bypass Attempt (T1562.001)

**Trigger**: Any of:
- `configenc.reqeio.disable`
- `configenc.reqsb.disable`
- `firewall.disable`

**Priority**: ⛔ CRITICAL

### Rule 4: Time Manipulation (T1070.006)

**Trigger**:
- `time.set.systemclock`
- `time.ntp.disable` followed by `time.ntp.set.servers`

**Priority**: ⚠️ HIGH

### Rule 5: Off-Hours Administrative Activity

**Trigger**: Any CRITICAL or HIGH priority event occurring between 01:00-10:00 UTC

**Why This Window Matters**: BRICKSTORM operators have been observed conducting interactive operations during 01:00-10:00 UTC, which corresponds to Beijing business hours (09:00-18:00 CST). While your organization may have legitimate after-hours maintenance, VM cloning, account creation, or privilege changes during this specific window warrant elevated scrutiny.

> **Caveat**: This time window is based on observed operational patterns and is not universal. Threat actors adapt their schedules and may operate outside these hours to evade detection or accommodate different operators. Use this as one signal among many, not as a definitive indicator.

**Timezone Conversion** (convert to your local timezone for SIEM rules):

| UTC | Beijing (CST) | U.S. Eastern | U.S. Pacific | London (GMT) | Sydney (AEDT) |
|-----|---------------|--------------|--------------|--------------|---------------|
| 01:00 | 09:00 | 20:00 (prev day) | 17:00 (prev day) | 01:00 | 12:00 |
| 10:00 | 18:00 | 05:00 | 02:00 | 10:00 | 21:00 |

> **Note for Tier 1 Analysts**: This time window is based on observed threat actor operational patterns. Convert 01:00-10:00 UTC to your local timezone when configuring alerts. Events during this window are not automatically malicious, but warrant additional investigation, especially for VM cloning, account changes, or privilege escalation.

**Priority**: ⚠️ HIGH (elevated from base priority)

### Rule 6: Temporary Account Creation (T1136)

**Trigger**: `account.create` followed by `account.delete` for same account within 7 days

**Priority**: ⛔ CRITICAL

### Rule 7: VM Clone-Delete Pattern (vCenter, T1003.003)

**Trigger**: The following vCenter events in sequence within 24 hours:
1. `VmClonedEvent` where source VM is in Critical VM list
2. `VmPoweredOnEvent` for cloned VM
3. `VmPoweredOffEvent` for cloned VM
4. `VmRemovedEvent` for cloned VM

**Detection Logic**:

```
Alert when ALL conditions are true:
  1. VmClonedEvent where source VM is in Critical VM list
  2. User is NOT in Backup Service Accounts list
  3. Clone followed by deletion within 24 hours
```

**Tuning Note**: Backup solutions clone VMs for backup operations. Whitelist backup service accounts (e.g., `svc-backup@vsphere.local`) by username, not just by target VM. This prevents false positives while still detecting attackers who compromise vCenter but use their own accounts.

**Priority**: ⛔ CRITICAL

### Rule 8: Disk Swap and Snapshot Attack (vCenter, T1003.003)

**Attack Description**: Attackers extract NTDS.dit without cloning the entire VM using two techniques:

1. **Disk Swap**: Attach a Domain Controller's virtual disk to a staging VM
2. **Snapshot Mount**: Snapshot the DC, mount the snapshot disk (avoids file locks on the running VM), copy data, then delete the snapshot to cover tracks

**Trigger**: Any of:
- `VmReconfiguredEvent` or `vm.storage.add` where a Domain Controller disk is attached to a non-DC virtual machine
- `VmSnapshotCreatedEvent` followed by `VmReconfiguredEvent` (disk add) followed by `VmSnapshotRemovedEvent` within 24 hours for a critical VM

**Detection Logic**:

```
Alert when ALL conditions are true:
  1. Event type is VmReconfiguredEvent (vCenter) or vm.storage.add (ESX)
  2. Device change operation = "add" for virtual disk
  3. Disk path (vmdk) belongs to a VM in your Critical VM list (see below)
  4. Target VM is NOT the same VM that owns the disk
  5. Target VM is NOT in your Critical VM list
  6. Target VM is NOT in your Backup Proxy whitelist (see tuning note)
  7. User is NOT in Backup Service Accounts list
```

**Hot-Add Detection (Higher Confidence)**:

Attaching a disk to a running VM is rarer and more suspicious than attaching during maintenance. Add an elevated priority rule:

```
Alert (CRITICAL) when ALL conditions are true:
  1. VmReconfiguredEvent with device change operation = "add"
  2. Disk path belongs to Critical VM list
  3. Target VM runtime.powerState = "poweredOn"
```

Hot-add to a running VM bypasses the normal workflow of powering off before reconfiguration, indicating either urgency or an attempt to avoid triggering power-state monitoring.

**Tuning Note**: Backup solutions often attach disks to proxy VMs for backup operations. Without whitelisting, this rule generates false positives during backup windows.

- **Whitelist by MoRef ID, not VM name**: Use the VM's Managed Object Reference ID (e.g., `vm-1234`) rather than display name. Attackers can rename a staging VM to `Veeam-Proxy-99`, but the MoRef ID of a legitimate proxy is assigned by vCenter and not under attacker control.
- **Time-bound exceptions**: Alert on backup proxy activity outside scheduled backup windows
- **Target validation**: Alert if backup proxies attach disks from VMs they don't normally back up

**Critical VM List** (maintain this list in your SIEM):
- All Domain Controllers
- Certificate Authorities
- Password vaults / secret stores
- Backup servers
- VMs with names matching: `*DC*`, `*domain*`, `*vault*`, `*password*`, `*cred*`, `*backup*`, `*CA*`

**Key Fields to Extract**:

| Field | Location | Purpose |
|-------|----------|---------|
| `vm` | Event root | Target VM receiving the disk |
| `configSpec.deviceChange[].device.backing.fileName` | VmReconfiguredEvent | VMDK path being attached |
| `configSpec.deviceChange[].operation` | VmReconfiguredEvent | Should be "add" |
| `vmdk` | vm.storage.add | Disk path on ESX |

**Example SIEM Query (Pseudocode)**:

```
-- IMPORTANT: Replace the LIKE pattern with an exact list of your Tier 0 VMs
-- Using LIKE '%DC%' causes false positives on VMs with "DC" in the name (e.g., "WebDC", "MYDC-TEST")
--
-- TIMEZONE: Convert 01:00-10:00 UTC to your SIEM's ingestion timezone.
-- Many SIEMs index logs in local time. Verify your log timestamps before deploying.

SELECT * FROM vcenter_events
WHERE EventType = 'VmReconfiguredEvent'
  AND configSpec.deviceChange.operation = 'add'
  AND configSpec.deviceChange.device.backing.fileName IN (
    '[datastore1] DC01/DC01.vmdk',
    '[datastore1] DC02/DC02.vmdk',
    '[datastore1] CA01/CA01.vmdk',
    '[datastore1] VAULT01/VAULT01.vmdk'
    -- Add all your Tier 0 VM disk paths here
  )
  AND vm.name NOT IN (SELECT name FROM critical_vms)
  AND timestamp BETWEEN '01:00:00' AND '10:00:00' -- UTC; convert to your SIEM timezone
```

**Priority**: ⛔ CRITICAL

**Response**: Immediately investigate the target VM, the user who performed the operation, and capture memory/disk before any remediation.

### Rule 9: Permission Escalation (T1078)

**Trigger**: Any of:
- `PermissionAddedEvent` granting Administrator role
- `RoleUpdatedEvent` adding sensitive privileges
- Multiple `PermissionAddedEvent` in short timeframe

**Priority**: ⚠️ HIGH

### Rule 10: Security Feature Disabled (vCenter-Relayed, T1562.001)

**Trigger**: Any of:
- `esx.audit.lockdownmode.disabled`
- `esx.audit.uw.security.User.ExecInstalledOnly.disabled`
- `esx.audit.net.firewall.disabled`

**Priority**: ⛔ CRITICAL

### Rule 11: execInstalledOnly Violation (T1036.005)

**Trigger**: `esx.audit.uw.security.execInstalledOnly.violation`

**Priority**: ⛔ CRITICAL (indicates active attack blocked by security control)

### Rule 12: Alarm Tampering (T1562)

**Trigger**: `AlarmRemovedEvent` or `AlarmReconfiguredEvent` for security-related alarms

**Priority**: ⚠️ HIGH (possible detection evasion)

### Rule 13: vpxuser SSH Lateral Movement (T1021.004)

**Trigger**: `ssh.session.begin` where user is `vpxuser`

**Context**: The vpxuser account is used by vCenter for host management automation. Interactive SSH sessions by this account indicate an attacker has compromised vCenter and is moving laterally to VMware ESX hosts.

**Priority**: ⛔ CRITICAL

### Rule 14: Junction/GuestConduit Activity (T1095, T1572)

**Trigger**: Any of:
- Process listening on port 8090
- Process named `vvold` with unexpected binary hash
- VSOCK listeners on port 5555 inside guest VMs

**Priority**: ⛔ CRITICAL

### Rule 15: BRICKSTEAL Deployment Indicators (T1556.001)

**Trigger**: Sequence within 24 hours:
1. vCenter SSH enabled (`esx.audit.ssh.enabled` or equivalent on VCSA)
2. SSH session to vCenter
3. Tomcat or vmware-stsd service restart
4. web.xml file modification detected

**Priority**: ⛔ CRITICAL

### Rule 16: Rogue VM Deployment (T1564.006)

**Attack Description**: BRICKSTORM provides attackers with persistent vCenter access, enabling them to deploy hidden VMs for staging, data exfiltration, or backup persistence. These rogue VMs may survive BRICKSTORM removal if not detected, providing attackers a way back into the environment.

**Trigger**: Any of:
- `VmCreatedEvent` where VM name does not match naming convention
- `VmCreatedEvent` where target folder is not in approved folder list
- `VmRegisteredEvent` outside change management window
- `VmCreatedEvent` followed by VM remaining powered off for extended period

**Detection Logic**:

```
Alert when ANY condition is true:
  1. VmCreatedEvent with VM name not in approved naming pattern
  2. VmCreatedEvent with folder not in approved folder list
  3. VmCreatedEvent during 01:00-10:00 UTC (operational hours)
  4. VmRegisteredEvent for VM not previously in inventory
  5. Multiple VmCreatedEvents in short timeframe (bulk deployment)
```

**VCF Operations for Logs Query**:

```
eventTypeId:(VmCreatedEvent OR VmRegisteredEvent)
```

Filter results against your approved VM naming patterns and folder structure.

**Priority**: ⚠️ HIGH (CRITICAL if during operational hours 01:00-10:00 UTC)

### Rule 17: Ghost NIC Lateral Movement (T1021)

**Attack Description**: UNC6201 has been observed creating temporary virtual network adapters ("Ghost NICs") on VMs running on VMware ESX hosts. These adapters are connected to target port groups for lateral movement, then deleted to minimize forensic artifacts. Because the adapters exist only briefly, they evade periodic inventory checks.

**Trigger**: `VmReconfiguredEvent` where `configSpec.deviceChange` involves a `VirtualEthernetCard` with:
- `operation = "add"` followed by `operation = "remove"` for the same VM within a short timeframe (hours)
- OR any vNIC add/remove during 01:00-10:00 UTC

**Detection Logic**:

```
Alert when ANY condition is true:
  1. VmReconfiguredEvent with deviceChange adding a VirtualEthernetCard
     followed by VmReconfiguredEvent removing a VirtualEthernetCard
     for the same VM within 4 hours
  2. VmReconfiguredEvent adding a VirtualEthernetCard to a VM
     that normally has a fixed NIC count (e.g., production servers)
  3. VmReconfiguredEvent adding a VirtualEthernetCard to a port group
     the VM is not normally assigned to
```

**VCF Operations for Logs Query**:

```
eventTypeId:VmReconfiguredEvent AND configSpec.deviceChange.device.type:VirtualEthernetCard
```

**Tuning Note**: Legitimate NIC changes occur during VM provisioning, migration, and maintenance. Baseline the typical NIC change frequency for your environment. Ghost NIC activity is characterized by add-then-remove sequences that are unrelated to change management records.

**Priority**: ⚠️ HIGH (CRITICAL if combined with other BRICKSTORM indicators)

---

## Log Retention Recommendations

**Dwell time** is the period between initial compromise and detection. BRICKSTORM's average dwell time of **393 days** means attackers typically operate undetected for over a year. Standard 30-90 day log retention results in loss of evidence from the initial compromise by the time an intrusion is discovered.

| Log Type | Minimum Retention | Recommended Retention | Rationale |
|----------|-------------------|----------------------|-----------|
| VMware ESX Audit Logs | 1 year | 2 years | Capture initial persistence setup |
| vCenter Task/Event Database | 1 year | 2 years | Track VM cloning operations |
| Authentication Logs | 1 year | 2 years | Correlate access patterns over time |
| Shell Command Logs | 1 year | 2 years | Evidence of attacker commands |
| Firewall Logs | 1 year | 2 years | Network behavior patterns |

**Critical considerations:**

- With 393-day average dwell time, 90-day retention means you will have **no logs** from the initial 300+ days of compromise
- When an intrusion is discovered, the question "how did they get in?" often cannot be answered because those logs are gone
- Consider **immutable log storage** to prevent attackers from deleting evidence during their extended access period
- Forward logs to a **separate, isolated SIEM** that is not accessible with vCenter administrative credentials

---

## References

See [README.md: Resources](README.md#resources) for consolidated links to government advisories, VMware documentation, threat intelligence reports, and MITRE ATT&CK references. Key references for this document:

- [CISA AR25-338A](https://www.cisa.gov/news-events/analysis-reports/ar25-338a) - 12 samples, 7 YARA rules (last updated Feb 11, 2026)
- [VMware ESX 9.0 Audit Events Reference](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/features-capabilities/logging/vmware-esx-90-audit-log-event-reference.md)
- [VMware vCenter 9.0 Event Reference](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/features-capabilities/logging/vmware-vcenter-90-audit-events.md)
