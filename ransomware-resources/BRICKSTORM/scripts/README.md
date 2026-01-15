# BRICKSTORM Detection Scripts

Scripts for scanning VMware environments for BRICKSTORM indicators of compromise.

## Quick Start

### Bash Scripts (VMware ESX Host Scanning)

```bash
# Single host
ssh root@esxi-host 'sh -s' < scan-brickstorm-hashes.sh

# Multiple hosts
./scan-hosts.sh hosts.txt results.tsv
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
| `scan-hosts.sh` | Wrapper to run the scanner across multiple hosts via SSH |
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
MATCH     esxi-01         /etc/sysconfig/vmsrc        aaf55...  BRICKSTORM IOC DETECTED
CLEAN     esxi-02         -                           -         No matches
ERROR     esxi-03         /opt/vmware/sbin/test       -         Permission denied
```

**Status values:**
- `MATCH`: File hash matches known BRICKSTORM sample (investigate immediately)
- `SUSPECT`: File has a known malicious filename but unknown hash (investigate)
- `ERROR`: Could not scan file (permission denied, hash failed)
- `CONNECTION_ERROR`: SSH connection failed
- `SCAN_ERROR`: Scanner script error

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
| 2 | Script error (missing files, bad arguments) |

## Updating Hashes

To add new hashes, edit `brickstorm-hashes.sha256` and update the `KNOWN_HASHES` variable in `scan-brickstorm-hashes.sh`.

Get the latest IOCs from [CISA AR25-338A](https://www.cisa.gov/news-events/analysis-reports/ar25-338a).

## Limitations

- Scans file hashes only; does not detect memory-resident malware
- Attackers may use unknown variants with different hashes
- Combine with behavioral detection (see [AUDIT-EVENTS.md](../AUDIT-EVENTS.md))
