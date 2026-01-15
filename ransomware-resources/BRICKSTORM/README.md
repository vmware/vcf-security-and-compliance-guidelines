# BRICKSTORM Resources and Defense

*This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This repository is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.*

## Background

BRICKSTORM is a modular malware family attributed to PRC state-sponsored actors, tracked as UNC5221 by Mandiant and WARP PANDA by CrowdStrike. The family includes multiple components: the BRICKSTORM backdoor itself, the Junction hypervisor implant, the GuestConduit VM tunneling tool, and the BRICKSTEAL credential harvester. These components work together to provide persistent access across the virtualization stack. Unlike traditional malware that typically targets user endpoints, BRICKSTORM is specifically engineered to compromise critical network infrastructure, including edge devices and the virtualization management plane. This strategic focus allows the threat actors to "live off the infrastructure," maintaining persistent, stealthy access for an average of over a year (393 days).

Technically, the malware is highly adaptable, with variants observed in both Go and Rust, and is capable of running on Linux, Windows, and BSD-based systems. It employs advanced tradecraft to ensure resilience and conceal its communications; this includes a "self-watching" process architecture that automatically respawns the malware if it is terminated. For command and control (C2), BRICKSTORM blends into legitimate network traffic by using DNS-over-HTTPS (DoH) with public resolvers, and by encapsulating communication within encrypted WebSockets and nested TLS tunnels.

The primary objective of the BRICKSTORM campaign is long-term cyber espionage, heavily targeting sectors such as government, defense, technology, and legal services. Once inside, actors leverage the malware to move laterally and harvest credentials, often using specialized tools like BRICKSTEAL to intercept vCenter logins or by cloning virtual machines to extract Active Directory databases offline without triggering alerts. This campaign represents a significant shift in the threat landscape, where the management layer itself has become a primary vector for persistent, state-sponsored intrusion.

### Why BRICKSTORM is Different from Ransomware

Most VMware security guides focus on ransomware. BRICKSTORM is a different kind of threat, though defending against it uses similar techniques and design principles:

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

### How Attackers Reach vCenter

Attackers don't break directly into VMware infrastructure. They first compromise other systems (websites, VPNs, or steal passwords), then work their way toward vCenter.

```
Step 1: Break In                     Step 2: Move Inward           Step 3: Target
┌─────────────────────────┐         ┌──────────────┐         ┌─────────────────┐
│ • Public website        │         │              │         │                 │
│ • VPN appliance         │────────►│  Internal    │────────►│  VMware vCenter │
│ • Stolen passwords      │         │  Network     │         │  (Stay hidden + │
│ • Compromised partner   │         │              │         │   steal creds)  │
└─────────────────────────┘         └──────────────┘         └─────────────────┘
```

### How to Defend Against This

- **Protect the path to vSphere.** Attackers usually get in through VPNs, websites, or stolen passwords before reaching VMware systems.
- **Harden systems AND watch them.** Good security needs both: lock things down and monitor for suspicious activity.
- **Keep logs for 2+ years.** If attackers hide for 393 days, 90-day log retention means you'll have no evidence from when they first broke in.
- **Connect your logs together.** Combine logs from VPNs, login systems, and vCenter to see the full picture.

## What's in This Guide

| File | What It Contains |
|------|------------------|
| [CHECKLIST.md](CHECKLIST.md) | Quick checklist of things to do |
| [DEFENSE-GUIDE.md](DEFENSE-GUIDE.md) | Detailed how-to instructions |
| [AUDIT-EVENTS.md](AUDIT-EVENTS.md) | What to watch for in your logs |
| [IOCs.md](IOCs.md) | Signs of infection (file names, hashes, network indicators) |

## Where to Start

1. Use the [Checklist](CHECKLIST.md) to see what to do first
2. Follow the [Defense Guide](DEFENSE-GUIDE.md) for step-by-step instructions
3. Set up monitoring using the [Audit Events](AUDIT-EVENTS.md) guide

## How the Attack Works

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│  1. Break In    │───►│  2. Spread       │───►│  3. Stay Hidden │
│ (VPN, website)  │    │  (steal creds)   │    │  (boot scripts) │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                                                       │
                       ┌──────────────────┐            │
                       │ 4. Steal Data    │◄───────────┘
                       │ - Copy VMs       │
                       │ - Grab passwords │
                       │ - Bypass firewalls│
                       │ - Steal keys     │
                       └──────────────────┘
```

## Resources

### Government Advisories

- [CISA AR25-338A - BRICKSTORM Backdoor Analysis](https://www.cisa.gov/news-events/analysis-reports/ar25-338a) (IOCs, YARA rules, STIX)
- [CISA BRICKSTORM Alert](https://www.cisa.gov/news-events/alerts/2025/12/04/prc-state-sponsored-actors-use-brickstorm-malware-across-public-sector-and-information-technology)
- [Canadian Centre for Cyber Security - BRICKSTORM Joint Report](https://www.cyber.gc.ca/en/news-events/joint-malware-analysis-report-brickstorm-backdoor)

### VMware Documentation

- [VMware Cloud Foundation Security Configuration Guide](https://brcm.tech/vcf-scg)
- [VMware ESX 9.0 Audit Events Reference](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/features-capabilities/logging/vmware-esx-90-audit-log-event-reference.md)
- [VMware ESX 8.0.3 Audit Events Reference](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/features-capabilities/logging/vmware-esx-803-audit-log-event-reference.md)
- [VMware vCenter 9.0 Event Reference](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/features-capabilities/logging/vmware-vcenter-90-audit-events.md)
- [VMware vCenter 8.0.3 Event Reference](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/features-capabilities/logging/vmware-vcenter-803-audit-events.md)

### MITRE ATT&CK

- [T1497 - Virtualization/Sandbox Evasion](https://attack.mitre.org/techniques/T1497/)
- [T1037.004 - Boot Initialization Scripts](https://attack.mitre.org/techniques/T1037/004/)

## If You Find an Infection

- **U.S. Organizations**: Contact CISA at contact@cisa.dhs.gov or 1-844-Say-CISA
- **Canadian Organizations**: Report at https://cyber.gc.ca
