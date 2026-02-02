# BRICKSTORM Defense Guide

*This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This repository is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.*

## Table of Contents

- [BRICKSTORM Defense Guide](#brickstorm-defense-guide)
  - [Table of Contents](#table-of-contents)
  - [Threat Overview](#threat-overview)
    - [The BRICKSTORM Malware Family](#the-brickstorm-malware-family)
      - [How It Stays Running](#how-it-stays-running)
      - [How It Tracks Itself](#how-it-tracks-itself)
    - [Understanding Dwell Time](#understanding-dwell-time)
    - [How BRICKSTORM Differs from Ransomware](#how-brickstorm-differs-from-ransomware)
    - [How Attackers Reach vCenter](#how-attackers-reach-vcenter)
      - [The Attack Path to VMware](#the-attack-path-to-vmware)
    - [VMware Cloud Foundation (VCF): Protect the Management Domain First](#vmware-cloud-foundation-vcf-protect-the-management-domain-first)
    - [MITRE ATT\&CK Mapping](#mitre-attck-mapping)
    - [Advanced Attack Techniques](#advanced-attack-techniques)
      - [VSOCK Bypass (Junction and GuestConduit)](#vsock-bypass-junction-and-guestconduit)
      - [vpxuser Lateral Movement](#vpxuser-lateral-movement)
      - [BRICKSTEAL Credential Harvesting](#bricksteal-credential-harvesting)
      - [Golden SAML Attack](#golden-saml-attack)
      - [Anti-Forensic Techniques](#anti-forensic-techniques)
      - [Rogue and Ghost VMs](#rogue-and-ghost-vms)
  - [Detection Procedures](#detection-procedures)
    - [1. IOC-Based Detection](#1-ioc-based-detection)
      - [Behavioral Detection (Higher Confidence)](#behavioral-detection-higher-confidence)
      - [File Hash and YARA Scanning](#file-hash-and-yara-scanning)
      - [Suspicious File Search](#suspicious-file-search)
    - [2. Boot Script Integrity Check](#2-boot-script-integrity-check)
    - [3. Network Traffic Analysis](#3-network-traffic-analysis)
      - [DNS-over-HTTPS Detection](#dns-over-https-detection)
      - [WebSocket Communication](#websocket-communication)
    - [4. vCenter Activity Audit](#4-vcenter-activity-audit)
      - [VM Cloning Operations](#vm-cloning-operations)
      - [Account Audit](#account-audit)
      - [SSH Access Changes](#ssh-access-changes)
      - [vpxuser SSH Monitoring](#vpxuser-ssh-monitoring)
    - [5. Hypervisor-Level Detection](#5-hypervisor-level-detection)
      - [Junction Implant Detection](#junction-implant-detection)
      - [Ghost VM Detection](#ghost-vm-detection)
    - [6. Rogue VM Detection](#6-rogue-vm-detection)
    - [7. Guest-Level Detection](#7-guest-level-detection)
      - [GuestConduit Detection](#guestconduit-detection)
  - [Prevention \& Hardening](#prevention--hardening)
    - [1. Access Control Implementation](#1-access-control-implementation)
      - [Service Account Least Privilege](#service-account-least-privilege)
      - [Identity Federation and Authentication](#identity-federation-and-authentication)
      - [Access Restrictions](#access-restrictions)
      - [Credential Management](#credential-management)
    - [2. Network Segmentation](#2-network-segmentation)
      - [Management Network Isolation](#management-network-isolation)
      - [Separated Management and Workload Clusters](#separated-management-and-workload-clusters)
      - [Out-of-Band Management (BMC/IPMI/iDRAC/iLO)](#out-of-band-management-bmcipmiidracilo)
    - [3. vSphere Security Configuration](#3-vsphere-security-configuration)
      - [VMware ESX Hardening](#vmware-esx-hardening)
      - [vCenter Hardening](#vcenter-hardening)
      - [VCF-Wide Controls](#vcf-wide-controls)
    - [4. Patch Management](#4-patch-management)
      - [Edge Device Inventory](#edge-device-inventory)
      - [Zero-Day Interim Mitigations](#zero-day-interim-mitigations)
    - [5. Virtual Machine Hardening](#5-virtual-machine-hardening)
      - [Protecting Critical Infrastructure VMs (Domain Controllers, Vaults)](#protecting-critical-infrastructure-vms-domain-controllers-vaults)
        - [BRICKSTORM Credential Extraction Attack:](#brickstorm-credential-extraction-attack)
        - [Defense](#defense)
        - [VMware Tools Guest Operations](#vmware-tools-guest-operations)
  - [Monitoring \& Alerting](#monitoring--alerting)
    - [1. Log Collection Configuration](#1-log-collection-configuration)
      - [Immutable Log Storage](#immutable-log-storage)
    - [2. Detection Rules](#2-detection-rules)
      - [Detection Queries for VCF Operations for Logs](#detection-queries-for-vcf-operations-for-logs)
      - [Sigma Rules](#sigma-rules)
      - [Audit Events Reference](#audit-events-reference)
    - [3. File Integrity Monitoring](#3-file-integrity-monitoring)
    - [4. Egress Monitoring](#4-egress-monitoring)
    - [5. NTP Monitoring](#5-ntp-monitoring)
  - [Incident Response](#incident-response)
    - [1. Initial Detection Response](#1-initial-detection-response)
    - [2. Containment Procedures](#2-containment-procedures)
    - [3. Evidence Collection](#3-evidence-collection)
    - [4. Eradication](#4-eradication)
  - [Recovery Procedures](#recovery-procedures)
    - [1. Backup Strategy](#1-backup-strategy)
    - [2. Recovery Planning](#2-recovery-planning)
    - [3. Validation Before Restoration](#3-validation-before-restoration)
    - [4. Post-Recovery](#4-post-recovery)
  - [References](#references)



## Threat Overview

BRICKSTORM is a sophisticated, modular backdoor attributed to PRC state-sponsored actors, tracked as UNC5221 by Mandiant and WARP PANDA by CrowdStrike. Unlike traditional malware that typically targets user endpoints, BRICKSTORM is specifically engineered to compromise critical network infrastructure, including edge devices and the virtualization management plane. This strategic focus allows the threat actors to "live off the infrastructure," maintaining persistent, stealthy access for an average of over a year (393 days).

Technically, the malware is highly adaptable, with variants observed in both Go and Rust, and is capable of running on Linux, Windows, and BSD-based systems. It employs advanced tradecraft to ensure resilience and conceal its communications; this includes a "self-watching" process architecture that automatically respawns the malware if it is terminated. For command and control (C2), BRICKSTORM blends into legitimate network traffic by using DNS-over-HTTPS (DoH) with public resolvers, and by encapsulating communication within encrypted WebSockets and nested TLS tunnels.

The primary objective of the BRICKSTORM campaign is long-term cyber espionage, heavily targeting sectors such as government, defense, technology, and legal services. Once inside, actors leverage the malware to move laterally and harvest credentials, often using specialized tools like BRICKSTEAL to intercept vCenter logins or by cloning virtual machines to extract Active Directory databases offline without triggering alerts. This campaign represents a significant shift in the threat landscape, where the management layer itself has become a primary vector for persistent, state-sponsored intrusion.

### The BRICKSTORM Malware Family

BRICKSTORM is actually several tools that work together:

| Tool | Where It Runs | What It Does |
|------|---------------|--------------|
| **BRICKSTORM** | vCenter, VMware ESX | Main backdoor; gives attackers remote access and file control |
| **Junction** | VMware ESX host | Hides on the hypervisor; lets attackers bypass firewalls |
| **GuestConduit** | Inside VMs | Creates hidden tunnels between VMs that bypass network security |
| **BRICKSTEAL** | vCenter server | Steals administrator passwords when people log in |

#### How It Stays Running

BRICKSTORM watches itself. When it runs, it creates a second copy that monitors the first. If you kill one copy, the other brings it back. This makes it hard to remove.

#### How It Tracks Itself

The malware uses special markers (called environment variables) to know if it's already installed. It looks for names like `VMware`, `VREG`, or `FIOON`. If these markers are missing, it reinstalls itself.

### Understanding Dwell Time

**Dwell time** is how long attackers stay hidden before you find them. For BRICKSTORM, this averages **393 days**: over a year of secret access.

```
What Happens During a BRICKSTORM Attack:

Day 0:       Attackers break in (through VPN, website, or stolen password)
             └─ You have NO idea anything is wrong

Days 1-7:    Attackers explore and steal passwords
             └─ They're learning how your systems work

Days 7-30:   Attackers reach vCenter and set up ways to stay
             └─ Now they have control of your virtual infrastructure

Days 30-90:  Attackers copy your VMs to steal data
             └─ They clone your domain controller and password vaults and crack passwords offline

Days 90-393: Attackers quietly collect information
             └─ They know your backup schedule, your habits, your weaknesses

Day 393:     You finally discover the breach
             └─ Usually by accident, or someone else tells you
```

### How BRICKSTORM Differs from Ransomware

Many VMware security guides focus on ransomware. BRICKSTORM is a different kind of threat:

| | Ransomware | BRICKSTORM |
|--------|-------------------|------------------------------|
| **Goal** | Make money through extortion | Spy and steal secrets |
| **Time Hidden** | Hours to days | **Over a year on average** |
| **Detection** | They want you to know (ransom note) | **They never want you to know** |
| **Main Objective** | Lock your files, demand payment | Stay hidden, steal passwords |
| **Who They Target** | Anyone who might pay | Government, critical infrastructure |
| **After Success** | Get paid, move on | **Stay for years** |
| **Data** | Encrypt it, maybe steal it | Quietly copy it without you knowing |
| **Work Hours** | Any time | **01:00-10:00 UTC** |

This matters because **you need different defenses**, though most defenses against threats like BRICKSTORM are also good defenses against ransomware, too.

### How Attackers Reach vCenter

Attackers don't usually break directly into vCenter. They first get into other systems (VPNs, websites, or steal passwords), then work their way toward vCenter. Common entry points include VPN appliances, load balancers, public-facing web sites, and partners/vendors with access.

**These attackers sometimes exploit vulnerabilities before patches are available.** Apply security updates to VPNs and vCenter within hours of release. There have been some ESX and vCenter vulnerabilities cited as being exploited by BRICKSTORM, but these have had patches available for years. In general, attackers will use whatever exploits are available to them.

#### The Attack Path to VMware

```
┌────────────────────────────────────────────────────────────────────────────┐
│  STEP 1: BREAK IN                                                          │
│  Attackers compromise something public: website, VPN, email                │
└────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────────┐
│  STEP 2: STEAL PASSWORDS                                                   │
│  Use attack tools to grab admin passwords                                  │
│  Goal: Get vCenter admin access                                            │
└────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────────┐
│  STEP 3: MOVE DEEPER                                                       │
│  Use stolen passwords to reach management systems                          │
│  Network segmentation can slow this down                                   │
└────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────────┐
│  STEP 4: TAKE OVER VCENTER                                                 │
│  Log in with stolen credentials                                            │
│  Install BRICKSTORM to stay hidden                                         │
│  Copy VMs to steal more data                                               │
└────────────────────────────────────────────────────────────────────────────┘
```

### VMware Cloud Foundation (VCF): Protect the Management Domain First

In VCF, the **management domain** controls everything else. If attackers get in there, they own your entire environment.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│           MANAGEMENT DOMAIN (Most Important - Protect This First)           │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  ┌───────────────┐    │
│  │   ESX Mgmt   │  │   vCenter    │  │    Logs      │  │   Networks    │    │
│  └──────────────┘  └──────────────┘  └──────────────┘  └───────────────┘    │
│                                                                             │
│              If attackers get in here, they control EVERYTHING              │
└─────────────────────────────────────────────────────────────────────────────┘
                                      │
                    ┌─────────────────┼─────────────────┐
                    ▼                 ▼                 ▼
┌───────────────────────┐ ┌───────────────────────┐ ┌───────────────────────┐
│   WORKLOAD DOMAIN A   │ │   WORKLOAD DOMAIN B   │ │   WORKLOAD DOMAIN C   │
│  (Your customer VMs)  │ │  (Your customer VMs)  │ │  (Your customer VMs)  │
└───────────────────────┘ └───────────────────────┘ └───────────────────────┘
                   If attackers get in here, they only get one domain
```

These VCF management components are Tier 0 infrastructure:
- SDDC Manager
- Management vCenter
- VCF Operations
- NSX Manager

The protection strategy for these components is network isolation, identity and access control isolation, and monitoring.

### MITRE ATT&CK Mapping

| Tactic | Technique | BRICKSTORM Implementation |
|--------|-----------|---------------------------|
| Initial Access | [T1190](https://attack.mitre.org/techniques/T1190/) | Exploit public-facing application |
| Credential Access | [T1078](https://attack.mitre.org/techniques/T1078/) | Valid Accounts: Using stolen vpxuser, Administrator@vsphere.local, and domain credentials |
| Lateral Movement | [T1021.001](https://attack.mitre.org/techniques/T1021/001/) | RDP with stolen credentials |
| Lateral Movement | [T1021.004](https://attack.mitre.org/techniques/T1021/004/) | SSH via vpxuser account |
| Persistence | [T1037.004](https://attack.mitre.org/techniques/T1037/004/) | Boot initialization script modification |
| Defense Evasion | [T1036.005](https://attack.mitre.org/techniques/T1036/005/) | Masquerading as VMware binaries |
| Defense Evasion | [T1027](https://attack.mitre.org/techniques/T1027/) | Multi-layer encryption for C2 |
| Defense Evasion | [T1562.001](https://attack.mitre.org/techniques/T1562/001/) | Disable execInstalledOnly to allow unsigned binary execution |
| Defense Evasion | [T1070.006](https://attack.mitre.org/techniques/T1070/006/) | Timestomping file metadata |
| Defense Evasion | [T1564.006](https://attack.mitre.org/techniques/T1564/006/) | Rogue VM deployment for staging and exfiltration |
| Command & Control | [T1572](https://attack.mitre.org/techniques/T1572/) | DNS-over-HTTPS tunneling |
| Command & Control | [T1095](https://attack.mitre.org/techniques/T1095/) | VSOCK non-application layer protocol |
| Credential Access | [T1003.003](https://attack.mitre.org/techniques/T1003/003/) | NTDS extraction via VM cloning (offline credential dumping) |
| Credential Access | [T1556.001](https://attack.mitre.org/techniques/T1556/001/) | BRICKSTEAL servlet filter credential interception |
| Collection | [T1578.002](https://attack.mitre.org/techniques/T1578/002/) | VM cloning/snapshot for offline data extraction (adapted from cloud technique) |

### Advanced Attack Techniques

#### VSOCK Bypass (Junction and GuestConduit)

Normally, firewalls see all network traffic between VMs. VSOCK lets VMs talk directly through the physical server's memory, bypassing the network entirely.

The **Junction** implant runs on VMware ESX hosts and binds to port 8090, mimicking the legitimate `vvold` service. The **GuestConduit** implant runs inside victim VMs to accept tunnel connections from the hypervisor, typically listening on TCP port 5555.

#### vpxuser Lateral Movement

vCenter creates an account called `vpxuser` on every VMware ESX host with full administrative rights. If attackers compromise vCenter, they can extract this password and use it to access every host in the cluster via SSH.

#### BRICKSTEAL Credential Harvesting

BRICKSTEAL is a Java servlet filter that hides inside vCenter's web server. When administrators log in, it intercepts and records their credentials. It persists by modifying vCenter's web.xml configuration.

#### Golden SAML Attack

If your organization uses ADFS (Active Directory Federation Services) for single sign-on, attackers can steal the token-signing certificate to create fake login tickets. With this certificate, they can authenticate as any user to any federated service, and multi-factor authentication cannot stop them because the forged token bypasses the authentication flow entirely.

#### Anti-Forensic Techniques

| Technique | Description |
|-----------|-------------|
| **Timestomping** | Modifying file timestamps to match legitimate system files |
| **Log Clearing** | Wiping or selectively editing system logs |
| **Delay Timers** | Hard-coded sleep periods (weeks/months) to outlast incident response |

#### Rogue and Ghost VMs

BRICKSTORM provides attackers with persistent vCenter access, enabling them to deploy hidden VMs for staging, data exfiltration, or backup persistence.

| Type | Description | Detection Difficulty |
|------|-------------|---------------------|
| **Rogue VMs** | Registered in vCenter but hidden in obscure folders or named to blend in (e.g., `template-backup`, `test-server-01`) | Easier: Visible in vCenter inventory with PowerCLI queries |
| **Ghost VMs** | Running on VMware ESX hosts but deleted from vCenter inventory (completely invisible to vCenter management) | Harder: Requires comparing VMware ESX running processes against vCenter inventory |
| **vCLS Masquerading** | Rogue VMs named `vCLS-*` to blend with legitimate vSphere Cluster Services agents | Harder: Requires checking for network adapters (legitimate vCLS VMs have none) |

## Detection Procedures

### 1. IOC-Based Detection

> **Important**: BRICKSTORM samples are compiled uniquely per victim, so file hash matching has limited effectiveness. Prioritize behavioral detection (network connections, listening ports, boot script modifications) over static hash scanning.

#### Behavioral Detection (Higher Confidence)

These checks help detect BRICKSTORM activity regardless of file hash:

```bash
# Check for Junction implant (port 8090 listener)
esxcli network ip connection list | grep -E ":8090.*LISTEN"

# Check for unexpected listeners on management ports
esxcli network ip connection list | grep LISTEN

# Check for suspicious environment variables in running processes
for pid in $(ps -c | awk '{print $1}' | grep -v PID); do
    cat /proc/$pid/environ 2>/dev/null | tr '\0' '\n' | \
    grep -E "^(VMware|VREG|FIOON|DIGNN|rcMJVF|VARGS|WORKER)=" && \
    echo "^^^ FOUND IN PID: $pid"
done

# Check boot scripts for persistence
grep -v "^#" /etc/rc.local.d/local.sh | grep -v "^$" | grep -v "exit 0"
```

See [Hypervisor-Level Detection](#5-hypervisor-level-detection) for Junction and GuestConduit detection procedures.

#### File Hash and YARA Scanning

For attempts at hash-based detection, use the official YARA rules and IOC lists from [CISA AR25-338A](https://www.cisa.gov/news-events/analysis-reports/ar25-338a). CISA provides regularly updated detection signatures in STIX and YARA formats. Similarly, the Mandiant scanner scripts, which contain adaptations of the YARA rules, can be run against vCenter appliances. This is a third-party tool which is not covered by VMware support; evaluate according to your organization's security policies.

See [IOCs.md](IOCs.md) for the full list of known hashes, filenames, and detection commands.

#### Suspicious File Search

Search for files with known malicious names in VMware system directories:

**On VMware ESX hosts via SSH:**
```bash
# Search for known BRICKSTORM filenames
find / -name "vmsrc" -o -name "vnetd" -o -name "viocli" -o -name "vts" \
       -o -name "vmckd" -o -name "bkmgr" -o -name "updatemgr" -o -name "vami" \
       -o -name "if-up" 2>/dev/null

# Search for Rust variant filenames
find /usr/sbin -name "*vsm-*monitor*" 2>/dev/null

# Check suspicious directories
ls -la /etc/sysconfig/
ls -la /opt/vmware/sbin/
ls -la /usr/java/jre-vmware/bin/
```

### 2. Boot Script Integrity Check

BRICKSTORM modifies boot initialization scripts for persistence. Verify integrity:

**On VMware ESX hosts:**
```bash
# Check init files for unexpected entries
cat /etc/rc.local.d/local.sh
cat /etc/sysconfig/init

# Compare against baseline (see note below)
md5sum /etc/rc.local.d/local.sh
md5sum /etc/sysconfig/init

# Look for unexpected PATH modifications
grep -r "PATH=" /etc/sysconfig/
```

**Establishing Your Baseline:**

VMware baseline hashes vary by version and patch level, so no universal "known-good" hash exists. Instead:

1. **Capture baseline from clean installation**: After initial VMware ESX deployment (before production use), record hashes of critical files:
   ```bash
   # Run on each clean ESX host and store results securely
   sha256sum /etc/rc.local.d/local.sh >> /path/to/secure/baseline-$(hostname)-$(date +%Y%m%d).txt
   sha256sum /etc/sysconfig/init >> /path/to/secure/baseline-$(hostname)-$(date +%Y%m%d).txt
   ```

2. **Version-specific baseline process**:
   | ESX Version | Baseline Source |
   |-------------|-----------------|
   | ESX 8.0.3 | Fresh install from VMware ISO, pre-production |
   | ESX 9.0 | Fresh install from VMware ISO, pre-production |
   | After patching | Re-capture baseline after each VIB/patch installation |

3. **AIDE on vCenter appliances**: The AIDE (Advanced Intrusion Detection Environment) file integrity scanner is installed on VMware vCenter appliances. After initial deployment (before production use), run AIDE to create a baseline database. Periodically compare the current system state against this baseline to detect unauthorized modifications.

4. **Expected content for `/etc/rc.local.d/local.sh`**: A clean file typically contains only comments and `exit 0`:
   ```bash
   #!/bin/sh
   # local configuration options
   # ... (comments) ...
   exit 0
   ```

   **Factory default characteristics:**
   - File size: Typically < 1KB
   - No executable commands (only comments and `exit 0`)
   - No PATH modifications
   - No references to non-standard directories

5. **Suspicious indicators** (content-based detection):
   - Any PATH modifications (e.g., `PATH=/opt/vmware/sbin:$PATH`)
   - Binary execution commands
   - References to `/etc/sysconfig/`, `/usr/java/jre-vmware/bin/`, or `/opt/vmware/sbin/`
   - Lines added after the `exit 0` statement
   - File size significantly larger than baseline

**Expected vs. Suspicious:**
- **Expected**: Standard VMware service initialization, comments, and `exit 0`
- **Suspicious**: References to binaries in `/opt/vmware/sbin/` or `/usr/java/jre-vmware/bin/` that weren't part of original installation

**Cron Job Persistence:**

BRICKSTORM may also use cron jobs for persistence. Check for unexpected scheduled tasks:

```bash
# Check root crontab
cat /var/spool/cron/crontabs/root

# Look for suspicious entries invoking scripts or binaries
```

### 3. Network Traffic Analysis

#### DNS-over-HTTPS Detection

BRICKSTORM uses DoH for covert C2 resolution. Block outbound DoH from infrastructure systems using a layered approach:

**Layer 7 (Application-Layer) Blocking (Preferred):**

IP-based blocking only catches known public resolvers. Attackers can easily deploy DoH resolvers on arbitrary cloud IPs. If your firewall supports application-layer inspection, configure it to:

- Block requests with content type `application/dns-message`
- Block TLS connections with SNI matching known DoH hostnames: `dns.google`, `cloudflare-dns.com`, `dns.quad9.net`, `doh.opendns.com`
- Alert on any HTTPS traffic from management infrastructure to unexpected destinations

**Layer 3/4 (IP-Based) Blocking:**

Egress traffic from infrastructure management subnets should always be blocked unless it is to a known service. Blocking specific DNS resolvers is not sufficient, as attackers can deploy DoH resolvers on any cloud IP.

#### WebSocket Communication

Monitor for HTTP-to-WebSocket upgrade patterns from vCenter/VMware ESX:

```
# Suspicious pattern in logs
GET / HTTP/1.1
Upgrade: websocket
Connection: Upgrade
```

### 4. vCenter Activity Audit

#### VM Cloning Operations

BRICKSTORM operators clone VMs (especially DCs and password vaults) and delete them shortly after. Use the [Get-VMCloneEvents.ps1](scripts/Get-VMCloneEvents.ps1) script to detect suspicious cloning activity:

```powershell
# Scan for clone events with risk scoring
.\scripts\Get-VMCloneEvents.ps1

# Check last 30 days
.\scripts\Get-VMCloneEvents.ps1 -Hours 720

# Export for analysis
.\scripts\Get-VMCloneEvents.ps1 | Export-Csv -Path clone-events.csv -NoTypeInformation
```

The script flags:
- **SUSPICIOUS-HOURS**: Cloning during 01:00-10:00 UTC (attacker operational hours)
- **SENSITIVE-TARGET**: Clones of DCs, vaults, CAs, or credential stores
- **CLONE-AND-BURN**: Clone deleted within 24 hours (credential extraction signature)
- **BUILTIN-ADMIN**: `VSPHERE.LOCAL\Administrator` account usage

**SIEM Detection Query (Clone & Burn Pattern):**

```
# SIEM pseudocode
source="vmware:vcenter"
(Event="VmClonedEvent" OR Event="VmRemovedEvent")
| transaction VM_Name maxspan=15m startsWith="VmClonedEvent" endsWith="VmRemovedEvent"
| table _time, User, VM_Name, Source_Host
```

#### Account Audit

```powershell
# Check for recently created local accounts in vCenter
# Via vSphere Client: Administration > VCF SSO > Users and Groups

# Via API/PowerCLI - check local accounts
Get-SsoPersonUser -Domain "vsphere.local"
```

#### SSH Access Changes

Use the [Get-SSHServiceStatus.ps1](scripts/Get-SSHServiceStatus.ps1) script to audit SSH across all hosts:

```powershell
# Audit all hosts
.\scripts\Get-SSHServiceStatus.ps1

# Audit specific cluster
Get-Cluster "Production" | Get-VMHost | .\scripts\Get-SSHServiceStatus.ps1
```

The script flags hosts with SSH enabled, auto-start policies, and ESX Shell access.

#### vpxuser SSH Monitoring

The `vpxuser` account should not initiate interactive SSH sessions. Alert on this event:

```
# Alert when you see: ssh.session.begin where user = vpxuser
```

### 5. Hypervisor-Level Detection

These checks require SSH access to VMware ESX hosts.

#### Junction Implant Detection

The legitimate `vvold` service listens on port 8090 on healthy VMware ESX hosts. The Junction implant also binds to this port to blend in. Detection requires verifying the process on port 8090 is the legitimate binary, not just checking if something is listening.

> **STOP: Do not kill processes based solely on port 8090.** The legitimate VVOL daemon (`vvold`) listens on this port. Killing it disrupts vVols storage operations. You **must** verify the binary path before taking action.

```bash
# Check what's listening on port 8090
esxcli network ip connection list | grep 8090

# Analysis:
# 1. Note the World ID (process ID) from the output above.
# 2. Check the process name and path for that World ID:
esxcli vm process list | grep [World ID]
# OR
ps -c | grep [World ID]

# MALICIOUS IF:
# - The binary path is NOT /bin/vvold or /usr/lib/vmware/bin/vvold
# - The binary is running from /tmp/ or /vmfs/volumes/
```

**Validation Required**: The grep command above will return results on healthy hosts. Before any remediation action, confirm the binary path is **not** `/bin/vvold` or `/usr/lib/vmware/bin/vvold`.

#### Ghost VM Detection

Ghost VMs are running on VMware ESX but deleted from vCenter inventory. vCenter cannot see them; detection requires direct VMware ESX host inspection. The technique is to compare two lists: VMs registered to the host versus VM world processes actually running.

**Manual Check (single host via SSH):**

```bash
# Step 1: Get registered VMs (what vCenter knows about)
vim-cmd vmsvc/getallvms | awk '{print $1, $2}'

# Step 2: Get running VM processes (what is actually consuming resources)
esxcli vm process list | grep -E "World ID|DisplayName"

# GHOST VM IF: A DisplayName appears in Step 2 but has no corresponding Vmid in Step 1
```

**Automated Check (all clusters via PowerCLI):**

Use the [Get-GhostVMs.ps1](scripts/Get-GhostVMs.ps1) script to scan all hosts:

```powershell
# Scan all hosts in connected vCenter
.\scripts\Get-GhostVMs.ps1

# Scan specific host
Get-VMHost -Name "esxi-01" | .\scripts\Get-GhostVMs.ps1

# Export results
.\scripts\Get-GhostVMs.ps1 | Export-Csv -Path ghost-vms.csv -NoTypeInformation
```

The script detects:
- **GHOST VM**: Process running on host but not registered in vCenter
- **FAKE vCLS**: VM named vCLS-* but has network adapters (legitimate vCLS has none)

If after running this scan it returns results, do not power them off immediately. Instead, use the command line on the ESX host to suspend the process to capture memory (the .vmem file) for forensics before terminating the world ID.

> **Hardened Check for High-Risk Investigations**: If you suspect the attacker has root access on VMware ESX, they may have tampered with management agents (hostd/vpxa) to hide VMs from API queries. For critical investigations, SSH directly to each VMware ESX host (or use DCUI console) and run `esxcli vm process list` manually, then compare results against vCenter inventory. Do not rely solely on PowerCLI queries through vCenter.

### 6. Rogue VM Detection

Rogue VMs are registered in vCenter but hidden in obscure locations. Use the [Get-RogueVMs.ps1](scripts/Get-RogueVMs.ps1) script to identify suspicious VMs:

```powershell
# Scan for rogue VMs with default settings
.\scripts\Get-RogueVMs.ps1

# Check VMs created in last 30 days
.\scripts\Get-RogueVMs.ps1 -DaysBack 30

# Custom standard folders for your environment
.\scripts\Get-RogueVMs.ps1 -StandardFolders @('Prod', 'Dev', 'QA', 'Templates')
```

The script flags:
- **RECENT**: VMs created within the lookback period
- **NON-STD-FOLDER**: VMs outside standard folder locations
- **SUSPICIOUS-NAME**: VMs matching attacker naming patterns (template-backup, test-server, staging, etc.)

Cross-reference flagged VMs against change management records.

> **Third-Party Tool**: CrowdStrike provides a [VirtualGHOST scanner](https://github.com/CrowdStrike/VirtualGHOST) that can detect rogue VMs and other anomalies. This may help identify VMs deployed by attackers with vCenter access. This is a third-party tool; evaluate according to your organization's security policies.

### 7. Guest-Level Detection

#### GuestConduit Detection

The GuestConduit implant runs inside victim VMs to accept tunnel connections from the hypervisor. It typically listens on TCP port 5555.

**Windows:**
```powershell
Get-NetTCPConnection -LocalPort 5555
```

**Linux:**
```bash
ss -tulnp | grep 5555
```


## Prevention & Hardening

### 1. Access Control Implementation

#### Service Account Least Privilege

Use the [Get-VSpherePermissions.ps1](scripts/Get-VSpherePermissions.ps1) script to audit permissions:

```powershell
# Full permission audit
.\scripts\Get-VSpherePermissions.ps1

# Export to CSV
.\scripts\Get-VSpherePermissions.ps1 -ExportPath "permissions.csv"

# Show only administrator accounts
.\scripts\Get-VSpherePermissions.ps1 -ShowAdminOnly
```

The script flags:
- **ADMIN**: Accounts with Administrator role
- **CRYPTO**: Accounts with Cryptographer privileges (can access encrypted VMs)
- **ROOT-LEVEL**: Permissions granted at root level (propagate everywhere)
- **SERVICE-ACCT**: Service account patterns that may have excessive permissions

**Recommended Actions:**
1. Create role-based access with minimum required permissions
2. Remove Administrator role from accounts that don't need it
3. Use dedicated accounts for automation (not shared admin accounts)
4. Implement break-glass procedures for emergency admin access

#### Identity Federation and Authentication

1. Federate VCF SSO to a modern identity provider that is completely separate from the organization's primary corporate or enterprise identity systems. Use a dedicated tenant or instance, not the same system or tenant used by the rest of the organization. Limit the administration of that tenant as much as possible to the VCF administration team itself, which is already in scope. Do not connect that instance or tenant to other organizational tools.
2. Use VMware SSO to introduce multi-factor authentication.
3. Enable advanced identity provider features including conditional access policies, geographic location restrictions, phishing-resistant MFA with number matching, and device hygiene requirements. A separate infrastructure IdP makes this easier to do globally, reducing policy complexity that allows attackers to hide.
4. Lower authentication token lifetimes to reduce the window of opportunity if tokens are stolen.
5. Retain identity provider access logs for as long as possible. A separate cloud IdP tenant makes this easier if cost is an issue, as the infrastructure IdP tenant would likely have lower traffic.
6. Organizations using Microsoft Entra ID should disable Seamless SSO and disable self-service password reset (SSPR) for administrator accounts. **Tenant administrator accounts do not follow the tenant policies for these settings and must be checked individually.**

#### Access Restrictions

7. Restrict access to VMware vCenter and VCF Operations interfaces to only those personnel who require it for their job function. Drive absolutely all workload interactions through SSH or RDP to the workload itself.
8. Restrict direct access to VMware ESX hosts; drive administrative access through VMware vCenter and the role-based access control model.
9. Restrict access to management interfaces for storage arrays, backup systems, and network equipment.
10. Reduce permissions for service accounts to the absolute minimum required for their function.
11. Do not connect systems that can alter accounts, passwords, or authentication configurations to infrastructure components or identity providers (user provisioning systems, HR systems, automated password reset systems, configuration management tools).
12. Do not connect monitoring systems to infrastructure components in a manner that allows them to execute remotely-defined commands or push data.

#### Credential Management

13. Staff outside the VMware Cloud Foundation administration team should not have the ability to reset infrastructure administrator credentials. This includes the Help Desk.
14. For privileged accounts, authenticator resets must be performed in-person, not through help desk tickets or phone calls. If your team is fully remote you may need to make accomodations, but note that "deep fake" interactive video calls exist and have been used to defraud organizations. You will need a high-confidence way of verifying staff, and no action should be performed unless that high-confidence method is successful.
15. Carefully consider where break-glass authentication information is stored; this material must be protected from both unauthorized access and loss.

### 2. Network Segmentation

#### Management Network Isolation

**Architecture Recommendations:**

```
┌─────────────────────────────────────────────────────────────┐
│                        Internet                             │
└─────────────────────────────────────────────────────────────┘
                              │
                    ┌─────────▼─────────┐
                    │   DMZ vDefend     │
                    └─────────┬─────────┘
                              │
┌─────────────────────────────▼─────────────────────────────────┐
│                         DMZ VLAN                              │
│  ┌─────────────┐                                              │
│  │  Web Server │ ◄── No direct path to vCenter                │
│  └─────────────┘                                              │
└───────────────────────────────────────────────────────────────┘
                              │
                    ┌─────────▼─────────┐
                    │ Internal vDefend  │ ◄── Block RDP/SMB
                    └─────────┬─────────┘     from DMZ
                              │
┌─────────────────────────────▼─────────────────────────────────┐
│                    Management VLAN                            │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐        │
│  │   vCenter   │    │  ESX Mgmt   │    │  Jump Host  │        │
│  └─────────────┘    └─────────────┘    └─────────────┘        │
└───────────────────────────────────────────────────────────────┘
```

#### Separated Management and Workload Clusters

For environments with sufficient resources, separate management infrastructure from workloads:

```
┌─────────────────────────────────────────────────────────────────────┐
│                     MANAGEMENT CLUSTER                              │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────────────┐     │
│  │ vCenter  │  │   AD/IdP │  │  Backup  │  │ Monitoring/SIEM  │     │
│  └──────────┘  └──────────┘  └──────────┘  └──────────────────┘     │
│                    Isolated Storage Fabric                          │
└─────────────────────────────────────────────────────────────────────┘
                              │
                    ┌─────────▼─────────┐
                    │  VMware vDefend   │ ◄── Microsegmentation
                    └─────────┬─────────┘
                              │
┌─────────────────────────────▼─────────────────────────────────────────┐
│                      WORKLOAD CLUSTER(S)                              │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐  ┌───────────┐           │
│  │  Web Tier │  │  App Tier │  │  DB Tier  │  │  Dev/Test │           │
│  └───────────┘  └───────────┘  └───────────┘  └───────────┘           │
│                    Separate Storage Fabric                            │
└───────────────────────────────────────────────────────────────────────┘
```

**Benefits:**
- Management compromise doesn't directly expose workload storage
- Different security policies per cluster
- Easier compliance boundary enforcement
- Reduced blast radius from ransomware

**Firewall Rules:**
```
# Block DMZ to internal management
DENY DMZ_NET -> MGMT_NET : TCP/3389 (RDP)
DENY DMZ_NET -> MGMT_NET : TCP/445,139 (SMB)
DENY DMZ_NET -> MGMT_NET : TCP/443 (vCenter)
DENY DMZ_NET -> MGMT_NET : TCP/22 (SSH)

# Allow only jump host to vCenter
ALLOW JUMP_HOST -> vCenter : TCP/443
DENY ANY -> vCenter : TCP/443
```

#### Out-of-Band Management (BMC/IPMI/iDRAC/iLO)

Attackers with VMware ESX root access can often bridge to the server's Baseboard Management Controller (BMC). BMC compromise provides persistent, OS-independent access to physical hardware.

The following [VMware Cloud Foundation Security Configuration Guide](https://brcm.tech/vcf-scg) controls address hardware management security:

| Control ID | Description | BRICKSTORM Relevance |
|------------|-------------|---------------------|
| `esx-9.hardware-management-security` | Secure hardware management controllers | Disable unused features, change default passwords, secure displays/buttons |
| `esx-9.hardware-management-authentication` | Configure BMC authentication carefully | Avoid AD dependency loops; consider local accounts via API |
| `esx-9.hardware-management-log-forwarding` | Forward BMC logs to SIEM | Enables detection of unauthorized BMC access |
| `esx-9.hardware-management-time` | Synchronize BMC time | Accurate timestamps for forensic correlation |
| `esx-9.hardware-virtual-nic` | Disable BMC virtual NICs | Prevents BMC-to-host network backdoors |
| `esx-9.hardware-ports` | Disable unused external ports | Limits physical attack vectors (USB, etc.) |

**Additional Requirements:**
- Place BMC interfaces on a **physically separate network**, not just a VLAN on the same switches
- Use dedicated management NICs for BMC traffic
- Restrict BMC access to specific jump hosts with MFA
- Monitor BMC authentication logs for anomalies
- Disable unused BMC features (virtual media, remote console) when not needed
- Keep BMC firmware updated (often overlooked in patching cycles)

### 3. vSphere Security Configuration

#### VMware ESX Hardening

The following [VMware Cloud Foundation Security Configuration Guide](https://brcm.tech/vcf-scg) controls are particularly relevant to BRICKSTORM defense:

**Secure Boot and Binary Execution Controls:**
| Control ID | Description | BRICKSTORM Relevance |
|------------|-------------|---------------------|
| `esx-9.hardware-secureboot` | Enable UEFI Secure Boot in firmware | Prevents unsigned bootloaders and rootkits |
| `esx-9.secureboot` | Enable Secure Boot enforcement in ESX | Validates ESX kernel modules and drivers |
| `esx-9.secureboot-enforcement` | Enable TPM-based Secure Boot enforcement | Hardware-backed verification of boot chain |
| `esx-9.vib-trusted-binaries` | Enable `execInstalledOnly` | Restricts execution to signed VIB binaries |
| `esx-9.tpm-trusted-binaries` | Enable TPM enforcement for `execInstalledOnly` | Prevents offline attacks to disable the setting |
| `esx-9.tpm-configuration` | Require TPM-based configuration encryption | Protects host configuration from offline tampering |
| `esx-9.hardware-tpm` | Require TPM 2.0 hardware | Enables hardware-backed security features |

These controls work together: `execInstalledOnly` restricts execution to VMware-signed binaries, while Secure Boot and TPM enforcement prevent attackers from disabling these restrictions. BRICKSTORM binaries are unsigned and cannot execute when these controls are properly configured.

**SSH and Shell Access Controls:**
| Control ID | Description | BRICKSTORM Relevance |
|------------|-------------|---------------------|
| `esx-9.ssh` | Disable SSH service | BRICKSTORM operators require shell access to install persistence |
| `esx-9.deactivate-shell` | Disable ESX Shell service | Limits interactive access vectors |
| `esx-9.shell-timeout` | Set shell service timeout | Auto-disables shell after inactivity |
| `esx-9.shell-interactive-timeout` | Set interactive session timeout | Terminates idle sessions |
| `esx-9.shell-warning` | Do not suppress shell warnings | Alerts administrators when shell is enabled |
| `esx-9.lockdown-mode` | Enable lockdown mode | Forces all access through vCenter |
| `esx-9.lockdown-dcui-access` | Restrict DCUI access list | Limits direct console access |
| `esx-9.lockdown-exception-users` | Minimize exception users | Reduces bypass opportunities |

**Logging Controls:**
| Control ID | Description | BRICKSTORM Relevance |
|------------|-------------|---------------------|
| `esx-9.log-forwarding` | Forward logs to remote collector | Enables centralized detection and prevents tampering |
| `esx-9.log-audit-forwarding` | Forward audit records remotely | Captures security-relevant events off-host |
| `esx-9.log-audit-local` | Enable local audit logging | Records authentication and authorization events |
| `esx-9.log-audit-local-capacity` | Configure adequate audit storage | Supports extended retention |
| `esx-9.log-audit-persistent` | Use persistent audit storage | Survives reboots for forensics |
| `esx-9.log-persistent` | Use persistent log storage | Maintains evidence across restarts |
| `esx-9.log-level` | Set appropriate log level | Captures sufficient detail for detection |
| `esx-9.log-filter` | Disable log filtering | Prevents attackers from hiding activity |

Given BRICKSTORM's 393-day average dwell time, standard 30-90 day log retention will not capture early attack activity. Forward logs to a SIEM with extended retention.

**Firewall and Time Controls:**
| Control ID | Description | BRICKSTORM Relevance |
|------------|-------------|---------------------|
| `esx-9.firewall-incoming-default` | Set default deny firewall policy | Reduces attack surface |
| `esx-9.firewall-restrict-access` | Restrict firewall to authorized networks | Limits access to management interfaces |
| `esx-9.time` | Configure NTP synchronization | Enables accurate forensic timelines |

#### vCenter Hardening

The following [VMware Cloud Foundation Security Configuration Guide](https://brcm.tech/vcf-scg) controls are particularly relevant to BRICKSTORM defense:

**Shell and Access Controls:**
| Control ID | Description | BRICKSTORM Relevance |
|------------|-------------|---------------------|
| `vcenter-9.ssh` | Disable SSH access | BRICKSTORM persists via boot script modifications requiring shell access |
| `vcenter-9.bashshelladministrators` | Limit BashShellAdministrators group | Restricts who can access appliance shell |
| `vcenter-9.vami-firewall-restrict-access` | Configure appliance firewall | Limits access to authorized management networks |

**Credential and Account Controls:**
| Control ID | Description | BRICKSTORM Relevance |
|------------|-------------|---------------------|
| `vcenter-9.disable-accounts` | Disable unused accounts | Reduces attack surface; dormant accounts are often targeted |
| `vcenter-9.vpxuser-rotation` | Configure vpxuser password rotation | Limits exposure window if vpxuser is compromised |
| `vcenter-9.vpxuser-length` | Ensure vpxuser password length | Strengthens auto-generated host credentials |
| `vcenter-9.account-alert` | Enable SSO account action alerts | Detects unauthorized account creation/modification |
| `vcenter-9.account-lockout-max-attempts` | Configure failed login lockout | Limits brute-force attacks |
| `vcenter-9.account-lockout-duration` | Configure lockout duration | Requires admin intervention after lockout |
| `vcenter-9.account-lockout-reset` | Configure lockout reset interval | Controls failed attempt counting window |

**Logging Controls:**
| Control ID | Description | BRICKSTORM Relevance |
|------------|-------------|---------------------|
| `vcenter-9.log-forwarding` | Forward logs to remote collector | Enables centralized detection and prevents tampering |
| `vcenter-9.events-remote-logging` | Enable remote event logging | Captures vCenter events for SIEM analysis |
| `vcenter-9.logs-level-global` | Set appropriate log level | Captures sufficient detail for forensics |
| `vcenter-9.events-database-retention` | Configure event retention | Supports extended audit trails |

**Additional Controls:**
| Control ID | Description | BRICKSTORM Relevance |
|------------|-------------|---------------------|
| `vcenter-9.time` | Configure NTP synchronization | Enables accurate forensic timelines |
| `vcenter-9.administration-sso-groups` | Separate authentication/authorization | Reduces IdP compromise impact |
| `vcenter-9.native-key-provider-backup` | Secure Native Key Provider backup | Protects encryption keys from extraction |

#### VCF-Wide Controls

These controls apply across the entire VMware Cloud Foundation deployment:

| Control ID | Description | BRICKSTORM Relevance |
|------------|-------------|---------------------|
| `vcf-9.mfa` | Integrate with MFA-enabled identity provider | BRICKSTORM actors have valid credentials; MFA limits their utility |
| `vcf-9.perimeter-firewall` | Isolate VCF from other networks and internet | Limits lateral movement and C2 communication |
| `vcf-9.disable-accounts` | Disable unused accounts across VCF | Dormant accounts are often targeted for persistence |
| `vcf-9.log-forwarding` | Forward logs from all VCF components | Enables detection across the entire management plane |
| `vcf-9.time` | Synchronize time across all VCF components | Enables accurate forensic correlation across 393-day dwell time |

### 4. Patch Management

BRICKSTORM actors gain initial access through vulnerable edge devices and public-facing applications. Aggressive patching of these systems is critical, within hours of the release of a patch.

Keep VMware vCenter, VMware ESX hosts, and VMware Tools updated to the latest versions. Subscribe to [VMware Security Advisories](https://www.broadcom.com/support/vmware-security-advisories) to receive notifications of security updates.

#### Edge Device Inventory

You cannot patch what you do not know exists. Use external scanning services to identify internet-exposed management interfaces, VPNs, and appliances that may have been forgotten or deployed outside change control. Investigate any device found externally that is not in your CMDB, and establish ongoing external monitoring to detect new exposures.

#### Zero-Day Interim Mitigations

UNC5221 has exploited vulnerabilities before patches were available. When a critical vulnerability is disclosed but no patch exists:

- Disable affected features if possible (consult vendor advisory)
- Increase monitoring on affected systems
- Restrict network access to affected services (allowlist authorized sources only)
- Consider air-gapping critical systems until patch is available
- Enable verbose logging on affected components

### 5. Virtual Machine Hardening

The following [VMware Cloud Foundation Security Configuration Guide](https://brcm.tech/vcf-scg) controls are particularly relevant to BRICKSTORM defense:

**VM Security Controls:**
| Control ID | Description | BRICKSTORM Relevance |
|------------|-------------|---------------------|
| `vm-9.secure-boot` | Enable guest Secure Boot | Validates guest OS boot chain |
| `vm-9.log-enable` | Enable VM diagnostic logging | Supports forensic investigation |
| `vm-9.log-retention` | Configure log retention | Maintains audit trail |
| `vm-9.log-rotation-size` | Configure log rotation | Prevents log loss |

**VMware Tools Controls (Host-to-Guest Attack Vectors):**

With vCenter access, attackers can use VMware Tools to push commands, files, and configurations into guest VMs without network connectivity. These controls limit that attack surface:

| Control ID | Description | BRICKSTORM Relevance |
|------------|-------------|---------------------|
| `guest-9.tools-deactivate-guestoperations` | Disable Guest Operations | Blocks file transfers, process execution, registry access from vCenter |
| `guest-9.tools-prevent-recustomization` | Prevent recustomization on deployed VMs | Blocks customization script attacks on cloned VMs |
| `guest-9.tools-globalconf` | Disable GlobalConf | Prevents pushing tools.conf configurations to VMs |
| `guest-9.tools-deactivate-gueststoreupgrade` | Disable GuestStore upgrades | Prevents pushing content via GuestStore repository |
| `guest-9.tools-add-feature` | Limit adding Tools features | Prevents altering security profile from vSphere |
| `guest-9.tools-remove-feature` | Limit removing Tools features | Prevents weakening security from vSphere |
| `guest-9.tools-allow-transforms` | Limit MSI transforms (Windows) | Prevents altering installation database remotely |
| `guest-9.tools-logs` | Enable VMware Tools logging | Supports detection of Tools abuse |
| `guest-9.tools-log-forwarding` | Forward Tools logs to syslog | Centralizes guest-level events for SIEM |

#### Protecting Critical Infrastructure VMs (Domain Controllers, Vaults)

Active Directory Domain Controllers are the primary target for BRICKSTORM credential extraction attacks. Attackers clone DC VMs to crack passwords offline, leaving no authentication failures in logs. Similar risks apply to password vaults, certificate authorities, and other credential stores.


##### BRICKSTORM Credential Extraction Attack:

1. Clone Domain Controller VM (or attach its disk to staging VM)
2. Power on clone in isolated environment
3. Extract NTDS.dit database and SYSTEM hive
4. Crack passwords offline using hashcat/john
5. Delete clone/detach disk (no evidence remains)

Result: Attackers have ALL domain credentials
        You see ZERO failed login attempts

##### Defense

For **Windows/Linux VMs you control** (Domain Controllers, CAs, vaults), VM Encryption with vTPM helps protect against cloning attacks. Note the distinction between encryption types:

- **vSAN Encryption (Data at Rest)**: Protects against physical theft of drives but does not protect against VM cloning. The hypervisor decrypts I/O transparently, so a rogue administrator can clone the VM and access its contents normally.
- **VM Encryption (with vTPM)**: Seals encryption keys to the VM's boot state. When a VM is cloned, the vTPM state does not transfer, preventing the clone from decrypting its contents. This is the appropriate protection against the credential extraction attack.

BitLocker with a boot PIN provides an additional layer; even if the VM is cloned, the attacker cannot boot it without the PIN.

**VM encryption does NOT prevent cloning**: Administrators with Cryptographer privileges can clone encrypted VMs. The clone remains encrypted but accessible to those with privileges. BRICKSTORM implies Administrator@vsphere.local compromise, and Administrators have Cryptographer privileges by default. **Encryption provides no protection unless Cryptographer privileges are revoked from standard administrator roles.**

**VMware appliances cannot be protected this way**: vCenter, SDDC Manager, NSX Manager, and VCF Operations appliances do not support vTPM or VM encryption.

- **Remove Cryptographer privileges from standard administrator roles** (required for encryption to be effective)
- Alert on any clone, reconfigure, or migrate operation
- Network isolation in dedicated management VLAN
- Separate identity federation (isolated IdP)
- Aggressive monitoring of clone/snapshot/reconfigure events
- Strict access controls to consoles and APIs

Consult the [VMware Cloud Foundation Security Configuration Guide](https://brcm.tech/vcf-scg) for implementation details, particularly `vcf-9.permissions-roles` for permission auditing.

##### VMware Tools Guest Operations

VMware Tools enables guest operations (file transfers, process execution, registry access) from vCenter without network connectivity to the VM. These operations require authentication to the guest OS. However, if attackers have already extracted credentials via VM cloning, guest operations become another attack vector that network-level controls cannot block.

This reinforces the importance of:
- **Separate identity infrastructure** for vSphere (prevents using same credentials)
- **Monitoring guest operations** via `com.vmware.vc.guestOperations.GuestOperation` events
- **VMware Tools hardening** to prevent recustomization, wherein scripted commands such as "net user" can be run.

## Monitoring & Alerting

### 1. Log Collection Configuration

Forward VMware ESX and vCenter logs to a SIEM with extended retention. Given BRICKSTORM's 393-day average dwell time, consider retaining logs for at least two years to support detection and forensic investigation.

#### Immutable Log Storage

With a 393-day average dwell time, attackers have administrative access for over a year before discovery. Standard log retention (30-90 days) means you will have no evidence from the initial 300+ days of compromise. Attackers with vCenter credentials can also delete logs stored on infrastructure they control.

**Requirements:**
- Forward logs to a SIEM that vCenter administrators cannot access or modify, using a separate authentication domain and network segment
- Enable log immutability using WORM (Write-Once-Read-Many) storage or platform immutability features
- Implement real-time forwarding rather than batching on source systems
- Monitor log forwarding health and alert on disruptions (attackers may attempt to stop logging before sensitive operations)
- Protect SIEM credentials separately from vSphere credentials

**Tiered Retention for Cost-Constrained Environments:**
- 2 years: Authentication/authorization and security events
- 1 year: Administrative operations
- 90 days: Verbose/debug logs

Prioritize full retention for identity and access logs, and periodically test that you can actually query and retrieve logs from 12+ months ago.

**Storage Optimization**: VMware ESX logs are verbose; storing everything for two years is cost-prohibitive for many organizations. Filter at the source or collector:

**High-Value Logs (retain 2 years minimum):**
- VMware ESX Audit Logs (`/var/log/audit/`)
- `vmkernel` (kernel-level events, driver issues)
- `hostd` (host daemon, VM operations)
- `vpxa` (vCenter agent communication)
- `shell` and `auth` (SSH sessions, authentication)
- vCenter task and event database

**Lower-Value Logs (shorter retention acceptable if storage-constrained):**
- Verbose performance counters
- Routine health check logs
- Debug-level output

**Recommended Configuration**: Enable VMware ESX audit logging (`esx-9.log-audit-local`, `esx-9.log-audit-forwarding`) and set general syslog level to `error` (`esx-9.log-level-global`) to reduce volume while preserving security-relevant events. For vCenter, enable remote event logging (`vcenter-9.events-remote-logging`) and log forwarding (`vcenter-9.log-forwarding`). Consult the [VMware Cloud Foundation Security Configuration Guide](https://brcm.tech/vcf-scg) for detailed implementation.

### 2. Detection Rules

#### Detection Queries for VCF Operations for Logs

**VM Clone and Delete Pattern:**
```
EventTypeId:VmClonedEvent OR EventTypeId:VmRemovedEvent
```
Group results by VM name and look for VMs that were both cloned and deleted within 24 hours.

**Off-Hours vCenter Activity (01:00-10:00 UTC):**
```
EventTypeId:(VmClonedEvent OR UserLoginSessionEvent OR RoleAddedEvent OR PermissionAddedEvent)
```
Filter results to show only events occurring between 01:00-10:00 UTC.

**SSH Service Changes:**
```
EventTypeId:HostServiceEnabled OR EventTypeId:HostServiceDisabled
```
Filter for messages containing "SSH" or "TSM-SSH".

**Key Event Types to Monitor:**
| Event Type | Significance |
|------------|--------------|
| `VmClonedEvent` | VM cloning (credential extraction technique) |
| `VmRemovedEvent` | VM deletion (covering tracks) |
| `VmReconfiguredEvent` | Disk attachment changes (disk swap attack) |
| `UserLoginSessionEvent` | Authentication events |
| `PermissionAddedEvent` | Privilege escalation |
| `RoleAddedEvent` | New role creation |
| `AccountCreatedEvent` | New account creation |
| `HostServiceEnabled` | Service state changes (SSH) |

#### Sigma Rules

See [IOCs.md](IOCs.md) for Sigma rules that can be adapted to your log management platform.

#### Audit Events Reference

For VMware ESX and vCenter audit events relevant to BRICKSTORM detection, including correlation rules and detection patterns, see [AUDIT-EVENTS.md](AUDIT-EVENTS.md).

### 3. File Integrity Monitoring

BRICKSTORM persists by modifying boot initialization scripts. Monitor the following paths for unauthorized changes:

```
/etc/sysconfig/
/etc/sysconfig/network/
/etc/rc.local.d/
/opt/vmware/sbin/
/usr/java/jre-vmware/bin/
```

Alert on new files in these directories or modifications to existing files. See [Boot Script Integrity Check](#2-boot-script-integrity-check) for baseline establishment procedures, including AIDE on vCenter appliances.

### 4. Egress Monitoring

Denied egress traffic is an early indicator of C2 attempts. When malware cannot reach its command and control infrastructure, firewall denies generate alerts before damage occurs.

**Key Patterns to Alert:**
- vCenter/VMware ESX attempting to reach public DNS resolvers (DoH indicators: 1.1.1.1, 8.8.8.8, 9.9.9.9)
- Any outbound connection from management network to unknown external IPs
- High volume of denied connections (C2 retry attempts)

### 5. NTP Monitoring

Attackers manipulate time to evade time-based detection rules, hide in log gaps, and invalidate forensic timelines. Alert on NTP configuration changes (`HostNtpConfigEvent`, `HostDateTimeConfigEvent`) and investigate the user and reason for the change.

## Incident Response

### 1. Initial Detection Response

**DO:**
- Document everything with timestamps
- Preserve all logs immediately
- Capture volatile data before any changes (see Evidence Collection below)
- Isolate affected systems at network level
- Contact your Incident Response team for instructions

**DO NOT:**
- Shut down systems (destroys volatile evidence)
- Delete malicious files (forensic evidence)
- Alert potential attackers by changing passwords immediately
- Remediate before evidence collection

### 2. Containment Procedures

**Critical: Do NOT Power Off VMs.** If a VM is powered on, its files (VMDKs) are locked by the hypervisor. Shutting down the VM releases these locks, potentially allowing ransomware to encrypt the files. Memory-resident malware is also lost on reboot.

**Isolate at Network Level.** Block affected systems' outbound connectivity and known C2 infrastructure. For storage, isolate the SAN/iSCSI network rather than unmounting datastores.

> **Caution**: Do not unmount active datastores. Unmounting a datastore from VMware ESX hosts with running VMs causes All Paths Down (APD) or Permanent Device Loss (PDL) states, crashing all VMs on that datastore (not just compromised ones) and risking data corruption. Storage unmounting is a last resort only when active encryption is confirmed.

**Freeze Credentials.** Disable compromised accounts without resetting passwords (preserve evidence). Monitor for authentication attempts with disabled accounts.

### 3. Evidence Collection

**Capture Volatile Data First.** Some malware is memory-resident. If you reboot before capturing volatile data, this evidence is lost.

**For Guest VMs:**
- Take a VM snapshot with "Snapshot the virtual machine's memory" checked. This creates a `.vmem` file and delta disk while keeping the VM running (brief stun), preserving RAM state without taking the service offline.
- For offline analysis, suspend the VM after the snapshot to write the full memory state to disk. Note that suspending large VMs (Domain Controllers, Exchange servers) can take several minutes and may fail if the datastore is under load.
- Do not power off until memory is captured (powering off loses memory-resident malware evidence and releases VMDK file locks, potentially allowing ransomware to encrypt the disk).

**For VMware ESX Hosts:**
- Full physical memory acquisition from bare-metal VMware ESX is difficult and can destabilize the host (standard forensic tools do not run on VMkernel)
- Focus on **live response**: collect volatile data via script (running processes, network connections, open files, loaded modules) before any changes
- If the host crashed or can be forced to crash safely, prioritize capturing the **VMware ESX core dump partition** (`/var/core/`)
- Consider specialized hardware acquisition only if you have the equipment and expertise

**Collect Logs.** Create vCenter support bundles and preserve VMware ESX logs before any remediation.

**Document Timeline.** Record first known indicator, anomalous events, account activities, VM operations (especially clones), and network connections.

### 4. Eradication

Only after evidence collection is complete:

- Remove BRICKSTORM binaries from affected hosts
- Restore init scripts from backup or known-good baselines
- Rebuild affected systems from trusted media if warranted
- Reset all potentially compromised credentials (vCenter, VMware ESX, service accounts, domain accounts)
- **Rotate vCenter STS signing certificates**: If attackers extracted the Security Token Service (STS) signing certificate, they can forge authentication tokens indefinitely, bypassing passwords and MFA. Credential resets alone do not mitigate this. If rebuilding vCenter from backup, do not restore the old certificate.

  > **Warning**: Rotate STS certificates only after verifying you have a working, offline file-based backup of the vCenter Appliance. Incorrect STS certificate rotation breaks the entire SSO trust chain, affecting backups and connected solutions (NSX, VCF Operations). Failure to maintain a valid backup before rotation can render vCenter irretrievable. Use the official VMware STS certificate rotation scripts from [Broadcom Support](https://knowledge.broadcom.com/) (search "STS signing certificate rotation"). Test in non-production first.

- **Rotate ADFS token-signing certificates** (if ADFS is used): UNC5221 has been observed targeting ADFS to export token-signing keys. If your vCenter federates to ADFS for identity, rotating vCenter STS alone is insufficient: attackers with ADFS keys can forge SAML tokens for any federated service, including vCenter. Rotate both the ADFS token-signing and token-decrypting certificates, then update all relying party trusts.

## Recovery Procedures

### 1. Backup Strategy

**Immutable Backups.** Use Write-Once-Read-Many (WORM) storage, immutability features, or air-gapped backups. If ransomware can reach your backup, it can encrypt it.

**Replication is NOT a Backup Strategy.** Replication mirrors corruption immediately, including ransomware encryption. Maintain separate backups with multiple recovery points.

**Isolate Backup Infrastructure.** Do not join backup servers to the corporate domain. Use separate credentials for backup infrastructure.

**Content Library.** Maintain clean OS ISOs, hardened VM templates, and recovery tools in a library for rapid rebuild. This library should be offline or extremely isolated. Also consider including exported information from your CMDB as a map for restoring services, as well as staff contact information.

### 2. Recovery Planning

**Document Dependencies.** Use VCF Operations for Networks or manual documentation to understand VM relationships and determine recovery order.

**Isolated Recovery Environment.** Build and test recovery in isolation before reconnecting to production. Scan for IOCs before reconnection.

**Rotate vpxuser Passwords.** Disconnect and reconnect each VMware ESX host (Host > Disconnect > Reconnect) to force vCenter to generate new vpxuser passwords. If the vCenter backup contained compromised vpxuser credentials, attackers retain SSH access to all hosts until this rotation is performed.

> **Caution**: Disconnecting a host can trigger vSphere HA isolation responses. Before disconnecting, either place the host into Maintenance Mode (if cluster capacity allows), or verify that the cluster's Host Isolation Response is set to "Leave Powered On." If HA is configured to "Shut Down and Restart VMs" or "Power Off and Restart VMs," disconnecting a host may cause all VMs on that host to power off unexpectedly.

> **Critical**: Rebuild vCenter from clean installation media before rotating vpxuser passwords. Do not rotate using a potentially compromised vCenter instance. Attackers with access to vCenter memory can capture the new randomly-generated passwords the moment they are created. The correct sequence is: (1) rebuild vCenter from clean media, (2) verify the new instance against IOCs, (3) then reconnect hosts to trigger password rotation.

### 3. Validation Before Restoration

Before reconnecting to production:
- Scan all systems with updated IOCs
- Verify boot scripts match known-good baselines
- Confirm no unexpected network connections
- Review all accounts and permissions

### 4. Post-Recovery

Implement enhanced monitoring for 90+ days after recovery. Document lessons learned: initial access vector, security gaps, detection gaps, and process improvements.

## References

See [README.md: Resources](README.md#resources) for consolidated links to government advisories, VMware documentation, and MITRE ATT&CK references.
