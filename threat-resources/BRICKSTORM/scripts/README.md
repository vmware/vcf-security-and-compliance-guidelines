# BRICKSTORM Detection Scripts

*Last updated: March 5, 2026*

Scripts for scanning VMware environments for BRICKSTORM indicators of compromise.

## Quick Start

### Bash Scripts (VMware ESX Host Scanning)

```bash
# Single host
ssh root@esxi-host 'sh -s' < scan-brickstorm-hashes.sh

# Multiple hosts (one hostname per line in hosts.txt)
while read host; do
    ssh "root@$host" 'sh -s' < scan-brickstorm-hashes.sh
done < hosts.txt | tee results.tsv
```

### PowerCLI Scripts (vCenter Scanning)

```powershell
# Connect to vCenter first
Connect-VIServer -Server vcenter.example.com

# Run detection scripts
.\Get-GhostVMs.ps1          # Find hidden/unregistered VMs
.\Get-RogueVMs.ps1          # Find suspicious VM deployments
.\Get-VMCloneEvents.ps1     # Detect credential extraction attacks
.\Get-SSHServiceStatus.ps1  # Audit SSH across hosts
.\Get-VSpherePermissions.ps1 # Audit permissions
.\Get-StaleSnapshots.ps1    # Find old snapshots
```

## Scripts

### Bash Scripts (Run on VMware ESX)

| Script | Purpose |
|--------|---------|
| `scan-brickstorm-hashes.sh` | Scans a VMware ESX host for BRICKSTORM indicators (hashes, filenames, Junction implant) |
| `brickstorm-hashes.sha256` | SHA256 hashes of known BRICKSTORM samples |

### PowerCLI Scripts (Run against vCenter)

| Script | Purpose |
|--------|---------|
| `Get-GhostVMs.ps1` | Detects Ghost VMs (running but unregistered) and fake vCLS VMs |
| `Get-RogueVMs.ps1` | Finds recently created VMs, VMs in non-standard folders, suspicious names |
| `Get-VMCloneEvents.ps1` | Detects VM cloning with risk scoring (suspicious hours, sensitive targets, clone-and-burn) |
| `Get-SSHServiceStatus.ps1` | Audits SSH and ESX Shell service status across all hosts |
| `Get-VSpherePermissions.ps1` | Audits permissions, flags Administrator/Cryptographer access |
| `Get-StaleSnapshots.ps1` | Finds old/large snapshots that may pose security risks |

## Requirements

**Bash scripts:**
- SSH key authentication configured for root access to VMware ESX hosts
- VMware ESX hosts must have SSH enabled (TSM-SSH service)

**PowerCLI scripts:**
- VMware PowerCLI module installed
- Connection to vCenter (`Connect-VIServer`)

## Output Format

Results are tab-separated for easy parsing:

```
STATUS    HOSTNAME         FILEPATH                    SHA256    DETAILS
MATCH     esxi-01         /etc/sysconfig/vmsrc        aaf55...  BRICKSTORM HASH DETECTED
SUSPECT   esxi-02         /usr/sbin/sqiud             3c9f1...  Suspicious filename (unknown hash)
ERROR     esxi-03         /opt/vmware/sbin/test       -         Permission denied
```

A host with no findings produces only the `#`-prefixed header and summary lines.

**Status values:**
- `MATCH`: File hash matches known BRICKSTORM sample (investigate immediately)
- `SUSPECT`: File has a known malicious filename but unknown hash (investigate)
- `ERROR`: Could not scan file (permission denied, hash failed)

## What Gets Scanned

**File-based checks** in BRICKSTORM persistence locations:
```
/etc/sysconfig/
/etc/sysconfig/network/
/etc/rc.local.d/
/opt/vmware/sbin/
/usr/java/jre-vmware/bin/
/etc/applmgmt/appliance/
/home/vsphere-ui/
/usr/sbin/
/tmp/
```

**Junction implant check:**
- Verifies process on port 8090 is legitimate `vvold`
- Flags if `vvold` is running from unexpected path (e.g., `/tmp/`, `/vmfs/volumes/`)

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | No BRICKSTORM indicators found |
| 1 | BRICKSTORM indicators detected |
| Other | Script aborted on an unexpected error (`set -e`) |

## Updating Hashes

To add new hashes, edit `brickstorm-hashes.sha256` and update the `KNOWN_HASHES` variable in `scan-brickstorm-hashes.sh`.

Get the latest IOCs from [CISA AR25-338A](https://www.cisa.gov/news-events/analysis-reports/ar25-338a) (12 samples, last updated Feb 11, 2026).

The [Mandiant BRICKSTORM scanner](https://github.com/mandiant/brickstorm-scanner) is an alternative bash-based scanner that replicates YARA rule logic using common system utilities, without requiring YARA to be installed. The Mandiant scanner detects Go-based variants only; supplement with CISA and GTIG YARA rules for Rust, .NET AOT, and GRIMBOLT coverage.

## Limitations

- Scans file hashes only; does not detect memory-resident malware
- Attackers compile uniquely per victim; however, the first observed C2 infrastructure reuse was documented in February 2026
- The .NET AOT variant (Feb 2026) will not match Go or Rust hashes
- Combine with behavioral detection (see [AUDIT-EVENTS.md](../AUDIT-EVENTS.md))
