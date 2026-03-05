# BRICKSTORM Indicators of Compromise (IOCs)

*Last updated: March 5, 2026*

Signs that your systems may be infected with BRICKSTORM. Use these to scan your environment.

*This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This repository is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.*

---

## File Hashes

BRICKSTORM hashes are maintained by CISA as part of the [AR25-338A](https://www.cisa.gov/news-events/analysis-reports/ar25-338a) analysis report, which has been updated multiple times (Dec 5, Dec 19, 2025, Jan 20, and Feb 11, 2026) and now covers 12 samples across Go, Rust, and .NET Native AOT variants, with 7 YARA rules. UNC5221 is noted to recompile the malware on a per-victim basis, and CISA originally reported no reuse of C2 domains or malware samples across investigations, so file hash matching has limited effectiveness. However, Mandiant's February 17, 2026 report documented the first observed reuse of C2 infrastructure (at 149.248.11.71), suggesting the operators may be consolidating infrastructure or sharing it across related campaigns. The [Mandiant BRICKSTORM scanner](https://github.com/mandiant/brickstorm-scanner) is a bash script that runs on appliances without requiring YARA to be installed, using common utilities (grep, xxd, head, sed, find) to replicate specific YARA rule logic. The scanner detects Go-based variants only; it does not detect Rust, .NET AOT, or GRIMBOLT variants. Supplement with [CISA YARA rules](https://www.cisa.gov/news-events/analysis-reports/ar25-338a) (which cover .NET AOT) and the three GTIG YARA rules for GRIMBOLT/SLAYSTYLE from the [February 17, 2026 Mandiant report](https://cloud.google.com/blog/topics/threat-intelligence/unc6201-exploiting-dell-recoverpoint-zero-day). There have been reports that the scanner works on the vCenter appliance. This is a third-party tool; evaluate according to your organization's security policies.

---

## Malicious Filenames

Search for these filenames in VMware system directories:

**Go Variant:**
- `vmsrc`
- `vnetd`
- `viocli`
- `vts`
- `vmckd`
- `bkmgr`
- `updatemgr`
- `vami`
- `if-up`

**Rust Variant:**
- `vsm-boot-monitordvcenter`
- `vsm-monitordvcenter`
- Files matching pattern `vsm-*monitor*`

**.NET Native AOT Variant (added Feb 2026):**
- `sqiud` (intentional misspelling of "squid"; installed to `/usr/sbin/`)

**Copied/Installed Names:**
- `vmware-sphere`
- `updatemgr`
- `vami`
- `bkmgr`

**Additional Masquerading Names:**
- `vami-http`
- `vami-httpd`
- `httpd`
- `tmpd`
- `sqiud`

**Hypervisor Implants:**

| Implant | Filename/Process | Location |
|---------|------------------|----------|
| **Junction** | Masquerades as `vvold` | VMware ESX host |
| **GuestConduit** | Various | Guest VMs |

**vCenter Implants:**

| Implant | Type | Location |
|---------|------|----------|
| **BRICKSTEAL** | Java servlet filter | vCenter Tomcat (`web.xml` modification) |

---

## Persistence Locations

### Initial Deployment Directories

BRICKSTORM samples are initially deployed to these directories:

```
/etc/sysconfig/
/etc/sysconfig/network/
```

### Installation Directories

After execution, samples copy themselves to variant-specific locations:

**Go Variant Installation Paths:**
```
/opt/vmware/sbin/
/usr/java/jre-vmware/bin/
/etc/applmgmt/appliance/
/home/vsphere-ui/vcli
/opt/vmware/etc/init.d/vami-lighttp
```

**Rust Variant Installation Paths:**
```
/usr/sbin/
```

| Variant | Typical Filenames | Installation Path |
|---------|-------------------|-------------------|
| Go | `vmware-sphere`, `updatemgr`, `vami`, `bkmgr` | `/opt/vmware/sbin/`, `/usr/java/jre-vmware/bin/` |
| Rust | `vsm-boot-monitordvcenter`, `vsm-monitordvcenter` | `/usr/sbin/` |
| .NET AOT | `sqiud` | `/usr/sbin/` |

### Boot Script Persistence

BRICKSTORM modifies these files for persistence:

```
/etc/rc.local.d/local.sh
/etc/sysconfig/init
```

---

## Network Indicators

> **Prioritize Behavioral Detection**: C2 infrastructure rotates frequently. Static IP/domain blocking will miss new infrastructure. Focus on behavioral patterns that persist across infrastructure changes:
> - **Long-duration, low-volume connections** from management systems (WebSocket C2 pattern)
> - **DoH traffic** from systems that should use internal DNS
> - **Outbound HTTPS** from VMware ESX/vCenter to unexpected destinations
> - **VSOCK communication** between VMs bypassing network controls

### DNS-over-HTTPS (DoH) Endpoints

BRICKSTORM uses DoH to resolve C2 domains, bypassing traditional DNS monitoring:

| IP Address | Provider |
|------------|----------|
| 1.1.1.1 | Cloudflare |
| 1.0.0.1 | Cloudflare |
| 8.8.8.8 | Google |
| 8.8.4.4 | Google |
| 9.9.9.9 | Quad9 |
| 9.9.9.11 | Quad9 |
| 45.90.28.160 | NextDNS |
| 149.112.112.11 | Quad9 |

**Detection Note**: VMware ESX and vCenter should not communicate with public DNS resolvers. Any outbound connection to these IPs on port 443 from management infrastructure is suspicious.

### Known C2 Infrastructure

| IP Address | Notes |
|------------|-------|
| `208.83.233[.]14` | Observed C2 server |
| `149.28.120[.]31` | Observed C2 server |
| `64.176.166[.]79` | Observed C2 server |
| `149.248.11[.]71` | .NET AOT variant (Feb 2026); hardcoded C2, WebSocket endpoint `/rest/apisession`. First observed reuse of C2 infrastructure across campaigns. |

> **Note**: Threat actors rotate C2 infrastructure regularly. These IPs represent point-in-time observations and may no longer be active. Use these for historical correlation and threat hunting, but do not rely solely on IP blocking for detection. Monitor for behavioral patterns (DoH usage, cloud service C2, VSOCK tunneling) rather than specific IPs.

### C2 Domain Patterns

BRICKSTORM samples have been observed using legitimate cloud services for C2 infrastructure, making network-based blocking challenging:

| Pattern | Service | BRICKSTORM Relevance |
|---------|---------|---------------------|
| `*.workers.dev` | Cloudflare Workers | Observed in BRICKSTORM C2 communication |
| `*.herokuapp.com` | Heroku (Salesforce) | Observed in BRICKSTORM C2 communication |
| `sslip.io` | Dynamic DNS service | Used for dynamic C2 resolution |
| `nip.io` | Dynamic DNS service | Used for dynamic C2 resolution |

**Detection Note**: Blocking these services entirely may not be feasible for general users. However, VMware ESX hosts, vCenter, and management infrastructure should have no legitimate reason to communicate with these services. Alert on any connection from management systems to these domains.

**Recommended Approach**: Rather than attempting to block legitimate cloud services, implement allowlisting for management infrastructure. Define explicit permitted destinations for VMware ESX and vCenter outbound traffic (update repositories, NTP servers, syslog destinations) and alert on any traffic outside the allowlist.

### C2 Communication Characteristics

- WebSocket Secure (WSS) connections
- Nested TLS encryption (TLS within TLS)
- HTTP-to-WebSocket upgrade patterns
- VSOCK tunneling (bypasses network firewalls entirely)
- AES-encrypted C2 address resolution (.NET AOT variant)
- Hardcoded C2 IP fallback when DoH resolution is blocked (newer samples)
- Nerdbank.Streams MultiplexingStream library (.NET AOT variant)
- iptables-based Single Packet Authorization (SPA): iptables rules with hex-string pattern matching on port 443 create a 300-second knock-based C2 listener, redirecting matched traffic to a hidden port (e.g., 10443). This technique has been observed on non-VMware appliances but could apply to any compromised Linux-based system, including vCenter. It is invisible to standard port scanning.

**NetFlow/IPFIX Detection (External)**: WebSocket C2 connections exhibit a "long duration, low volume" pattern: persistent connections on port 443 that remain open for hours or days with minimal data transfer (occasional heartbeats). Query NetFlow/IPFIX data for connections from management infrastructure (VMware ESX, vCenter) to external IPs on port 443 with:
- Duration > 1 hour
- Bytes transferred < 10 KB
- Connection state maintained (not idle timeout)

This pattern distinguishes C2 beaconing from normal HTTPS traffic, which is typically short-lived request/response exchanges.

**NetFlow/IPFIX Detection (Internal-to-Internal)**: BRICKSTORM proxies traffic through compromised infrastructure. Query for long-duration TCP connections between edge devices (VPNs, firewalls) and vCenter or VMware ESX management interfaces:
- Source: Edge device IPs (VPN concentrators, firewalls, load balancers)
- Destination: vCenter or VMware ESX management IPs
- Duration > 1 hour (persistent)
- Pattern: Steady low-volume traffic vs. bursty legitimate management traffic

Normal management traffic (API calls, monitoring) is bursty and short-lived. Persistent tunnels from edge devices to management infrastructure are anomalous.

### Hypervisor Implant Network Indicators

| Implant | Protocol | Port | Description |
|---------|----------|------|-------------|
| **Junction** | TCP | 8090 | VMware ESX listener for VSOCK proxy |
| **GuestConduit** | VSOCK | 5555 | Guest VM listener for hypervisor tunneling |

**Detection Note**: VSOCK traffic does not traverse the virtual network switch and is invisible to network firewalls and IDS. Detection requires host-level monitoring.

### Ghost NIC Indicators

UNC6201 has been observed creating temporary virtual network adapters ("Ghost NICs") on VMs running on VMware ESX hosts. These adapters are used to pivot into internal networks, then deleted to minimize forensic artifacts. Detection relies on monitoring `VmReconfiguredEvent` events in VMware vCenter for vNIC add/remove operations, particularly when a vNIC is added and then removed within a short timeframe.

| Indicator | Detection Method |
|-----------|-----------------|
| Rapid vNIC add/remove | `VmReconfiguredEvent` with device change involving `VirtualEthernetCard` |
| vNIC added to unexpected port group | Cross-reference network adapter changes against approved network assignments |
| vNIC changes during attacker operational hours | 01:00-10:00 UTC |

---

## Environment Variables

BRICKSTORM checks for specific environment variables to determine if it has already executed (persistence check). If the variable exists, the malware assumes it is already running and may exit or alter behavior.

**Known Variables:**

| Variable | Sample Association |
|----------|-------------------|
| `VMware` | Multiple variants |
| `CZePMeGj` | Go variant |
| `FIOON` | Go variant |
| `VREG` | Go variant |
| `VARGS` | Rust variant |
| `WRITE_LOG` | Rust variant |
| `Variable Sphere` | Early samples |
| `rcMJVF` | Go variant |
| `DIGNN` | Go variant |
| `Sphere` | Early samples |
| `WORKER` | Rust variant |

**Detection Commands:**

```bash
# Check environment variables of ALL running processes
# (Note: 'env' only shows the current shell - this checks every process)
for pid in $(ps -c | awk '{print $1}' | grep -v PID); do
    # /proc/$pid/environ contains null-separated environment variables
    # tr '\0' '\n' converts nulls to newlines so grep can match
    # 2>/dev/null suppresses errors for processes we can't read
    cat /proc/$pid/environ 2>/dev/null | tr '\0' '\n' | \
    # These are known BRICKSTORM marker variables - any match is suspicious
    grep -E "^(VMware|VREG|FIOON|DIGNN|rcMJVF|VARGS|WORKER)=" && \
    # If grep finds a match, print which process has it
    echo "^^^ FOUND IN PID: $pid"
done
```

> **VMware ESX Note**: VMware ESX uses BusyBox, which has limited command options compared to standard Linux. The commands above work on VMware ESX, but if you encounter issues, verify syntax with `busybox --help`. The `/proc/$pid/environ` approach is compatible with the VMware ESX environment.

> **Note**: Variable names vary across BRICKSTORM samples. The presence of any unusual single-word environment variable on VMware ESX hosts or vCenter appliances warrants investigation. The .NET AOT variant (Sample 12) spawns a child process rather than copying itself, and does not use the self-monitoring persistence mechanism found in Go and Rust variants. See [CISA AR25-338A](https://www.cisa.gov/news-events/analysis-reports/ar25-338a) for the full sample-to-variable mapping.

---

## Exploited Vulnerabilities

UNC5221 has demonstrated capability to exploit vulnerabilities before public disclosure. Edge devices, VMware vCenter, and VCF Automation Orchestrator (formerly VMware Aria Automation Orchestrator) should be patched within hours of security advisory release. CISA has confirmed that all VMware CVEs exploited in BRICKSTORM campaigns have had patches available: CVE-2021-22005, CVE-2023-34048, CVE-2024-37079, CVE-2024-38812, and CVE-2024-38813.

---

## API Endpoints (Rust Variant)

The Rust variant exposes these file management endpoints:

```
/api/file/change-dir
/api/file/delete-dir
/api/file/delete-file
/api/file/mkdir
/api/file/list-dir
/api/file/rename
/api/file/put-file
/api/file/get-file
/api/file/slice-up
/api/file/file-md5
/api/file/up
/api/file/stat
```

**Detection Opportunity**: These endpoints are unauthenticated. Any HTTP requests to these paths on VMware ESX or vCenter systems indicate active BRICKSTORM infection. Monitor web server access logs for requests matching `/api/file/*` patterns. Since legitimate VMware services do not expose these endpoints, any match is a high-confidence indicator.

The .NET AOT variant uses a different WebSocket endpoint for C2 communication: `/rest/apisession`. Monitor for connections to this path from VMware management infrastructure.

---

## BRICKSTEAL Indicators

BRICKSTEAL is an in-memory Java servlet filter deployed on vCenter to harvest administrator credentials.

### URI Patterns Monitored

BRICKSTEAL hooks into vCenter authentication flows at these URIs:

```
/websso/SAML2/SSO/*
/web/saml2/sso/*
```

### Detection Locations

| Location | What to Check |
|----------|---------------|
| `/usr/lib/vmware-sso/vmware-sts/webapps/ROOT/WEB-INF/web.xml` | Unexpected servlet filter definitions |
| `/usr/lib/vmware-sso/vmware-sts/webapps/` | Recently modified `.class` files |
| Tomcat logs | Unusual filter initialization messages |

### Detection Commands

```bash
# Check for unexpected servlet filters
grep -r "filter-class" /usr/lib/vmware-sso/vmware-sts/webapps/

# Baseline comparison
sha256sum /usr/lib/vmware-sso/vmware-sts/webapps/ROOT/WEB-INF/web.xml

# Find recently modified Java classes
find /usr/lib/vmware-sso/ -name "*.class" -mtime -30
```

---

## Detection Commands

### VMware ESX Host Scan

```bash
# Search for known BRICKSTORM filenames (Go variant)
# These names mimic legitimate VMware binaries - any match warrants investigation
# -o means OR; 2>/dev/null hides "permission denied" errors
find / -name "vmsrc" -o -name "vnetd" -o -name "viocli" -o -name "vts" \
       -o -name "vmckd" -o -name "bkmgr" -o -name "updatemgr" -o -name "vami" \
       -o -name "if-up" 2>/dev/null

# Search for Rust variant filenames
# Pattern *vsm-*monitor* catches vsm-boot-monitordvcenter and similar
find /usr/sbin -name "*vsm-*monitor*" 2>/dev/null

# Search for .NET AOT variant (intentional misspelling of "squid")
find /usr/sbin -name "sqiud" 2>/dev/null

# Check directories where BRICKSTORM installs itself
# Look for ELF binaries or recently modified files that don't belong
ls -la /etc/sysconfig/           # Initial deployment location
ls -la /opt/vmware/sbin/         # Go variant installation path
ls -la /usr/java/jre-vmware/bin/ # Go variant installation path

# Check boot scripts for persistence
# BRICKSTORM adds itself to these files to survive reboots
# Look for unexpected PATH additions or binary executions
cat /etc/rc.local.d/local.sh     # Primary persistence location
cat /etc/sysconfig/init          # Alternative persistence location
grep -r "PATH=" /etc/sysconfig/  # PATH manipulation for persistence
```

### Junction Implant Detection (VMware ESX)

> **STOP: Do not kill processes based solely on port 8090.** The legitimate VVOL daemon (`vvold`) listens on this port. Killing it disrupts vVols storage operations. You **must** verify the binary path before taking action.

#### Distinguishing Malicious 'vvold' (Junction) from Legitimate

| Indicator | Legitimate vvold | Malicious Junction |
|-----------|------------------|--------------------|
| **Binary Path** | `/bin/vvold` or `/usr/lib/vmware/bin/vvold` | `/tmp/`, `/vmfs/volumes/`, or other unexpected path |
| **Parent Process** | `hostd` or `init` | Often `sh`, `bash`, or `python` |
| **Open Files** | Standard logs and libraries | Often references `/etc/sysconfig/` or temp directories |

```bash
# Check what's listening on port 8090
esxcli network ip connection list | grep -E ":8090.*LISTEN"

# CRITICAL: Verify the vvold binary path before any action
lsof -p $(pidof vvold) | grep bin
# LEGITIMATE paths: /bin/vvold or /usr/lib/vmware/bin/vvold
# MALICIOUS paths: /tmp/, /vmfs/volumes/, or anything else

# Check parent process
ps -c | grep vvold
# Note the process ID, then check its parent

# List all listening ports
esxcli network ip connection list | grep LISTEN

# Check suspicious environment variables (see Environment Variables section for proper command)
```

### GuestConduit Detection (Guest VMs)

```bash
# Check for VSOCK listeners (Linux guests)
ss -x -l | grep -i vsock

# Check for unusual listening processes
netstat -tlnp | grep -E "555[0-9]"
```

### Hash Verification

```bash
# Calculate SHA256 for suspicious files
sha256sum /path/to/suspicious/file

# Compare against known hashes above
```

---

## Official IOC Sources

Download detection signatures and machine-readable IOCs:

| Source | Description | Formats |
|--------|-------------|---------|
| [CISA AR25-338A](https://www.cisa.gov/news-events/analysis-reports/ar25-338a) | Primary BRICKSTORM analysis (12 samples, 7 YARA rules; last updated Feb 11, 2026) | STIX, YARA, Sigma, PDF |
| [Canadian Centre for Cyber Security](https://www.cyber.gc.ca/en/news-events/joint-malware-analysis-report-brickstorm-backdoor) | Joint malware analysis report | PDF |
| [Mandiant BRICKSTORM Scanner](https://github.com/mandiant/brickstorm-scanner) | Bash-based scanner for appliances without YARA. **Detects Go variants only**; does not detect Rust, .NET AOT, or GRIMBOLT. Supplement with CISA and GTIG YARA rules. | Shell script |
| [Broadcom KB427833](https://knowledge.broadcom.com/external/article/427833/brickstorm-backdoor-to-vsphere.html) | VMware's official BRICKSTORM guidance | KB article |

---

## References

See [README.md: Resources](README.md#resources) for consolidated links to government advisories, VMware documentation, and MITRE ATT&CK references.

> **Note**: External IOC sources should be re-verified periodically. Given BRICKSTORM's 393-day average dwell time, bookmark these links and confirm availability during incident response.

---

## GRIMBOLT and SLAYSTYLE (Non-VMware Platforms)

GRIMBOLT and SLAYSTYLE are malware families deployed by UNC6201 that share C2 infrastructure with BRICKSTORM. Neither has been observed on VMware platforms. They are documented here because their presence on any device in your environment should trigger an immediate audit of VMware infrastructure for BRICKSTORM indicators.

**GRIMBOLT** is a C# backdoor compiled using .NET Native AOT and packed with UPX. Mandiant first observed GRIMBOLT replacing BRICKSTORM binaries on compromised appliances in September 2025. It provides remote shell capability and uses the same C2 infrastructure as BRICKSTORM. Native AOT compilation strips the CIL metadata normally present in C# binaries, complicating static analysis. It is unclear whether the replacement of BRICKSTORM with GRIMBOLT was a planned lifecycle iteration or a reaction to incident response activity.

**SLAYSTYLE** is a JSP web shell deployed via malicious WAR file uploads through Apache Tomcat Manager. It was used as the initial post-exploitation foothold before BRICKSTORM/GRIMBOLT deployment. Because vCenter also runs Apache Tomcat, WAR file deployment is a technique worth monitoring on VMware infrastructure even though SLAYSTYLE itself has not been observed there. Monitor Tomcat deployment logs and the `webapps/` directory for unexpected WAR files.

Three YARA rules for these families were published in the [Mandiant/GTIG February 17, 2026 report](https://cloud.google.com/blog/topics/threat-intelligence/unc6201-exploiting-dell-recoverpoint-zero-day): `G_APT_BackdoorToehold_GRIMBOLT_1`, `G_Hunting_BackdoorToehold_GRIMBOLT_1`, and `G_APT_BackdoorWebshell_SLAYSTYLE_4`.

---

## SPAWN Ecosystem (Edge Device Malware)

SPAWN is a modular malware ecosystem used by UNC5221 to compromise internet-facing edge devices (VPN appliances, firewalls, load balancers). Understanding SPAWN is critical because it represents the typical initial access vector that leads to BRICKSTORM deployment. These devices are high-value targets because they handle authentication, often have access to internal credentials, and are difficult to monitor with traditional endpoint security tools.

### SPAWN Components

| Component | Function |
|-----------|----------|
| **SPAWNANT** | Installer; deploys and updates other SPAWN components |
| **SPAWNMOLE** | Tunneler; creates encrypted connections through edge device |
| **SPAWNSNAIL** | SSH backdoor; provides persistent shell access |
| **SPAWNSLOTH** | Log cleaner; tampers with device logs to hide attacker activity |

### Attack Progression

```
Edge Device Compromise (SPAWN)
        |
        v
Credential Harvesting (from VPN/auth logs)
        |
        v
Lateral Movement (using harvested credentials)
        |
        v
vCenter Access (BRICKSTORM deployment)
        |
        v
Hypervisor Implants (Junction, GuestConduit)
```

**Detection Implication**: If SPAWN is detected on your edge devices, assume credential compromise and immediately audit your VMware environment for BRICKSTORM indicators. Do not wait for confirmed lateral movement.

For SPAWN-specific IOCs, refer to [CISA AR25-338A](https://www.cisa.gov/news-events/analysis-reports/ar25-338a) and vendor-specific security advisories.
