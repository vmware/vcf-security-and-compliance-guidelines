#!/bin/sh
# BRICKSTORM Scanner for VMware ESX
# Scans for BRICKSTORM malware: file hashes, suspicious filenames, and Junction implant
#
# Usage:
#   Local:  ./scan-brickstorm-hashes.sh
#   Remote: ssh root@esxi-host 'sh -s' < scan-brickstorm-hashes.sh
#   Scale:  Loop over a host list, e.g.:
#           while read host; do
#               ssh "root@$host" 'sh -s' < scan-brickstorm-hashes.sh
#           done < hosts.txt
#
# Output format (tab-separated):
#   MATCH|SUSPECT|ERROR<TAB>hostname<TAB>filepath<TAB>hash<TAB>details
#
# Status values:
#   MATCH   = File hash matches known BRICKSTORM sample (critical)
#   SUSPECT = File has suspicious name but unknown hash (investigate)
#   ERROR   = Could not scan file
#
# Exit codes:
#   0     = No matches found
#   1     = BRICKSTORM indicators detected
#   other = Script aborted on an unexpected error (set -e)

set -e

HOSTNAME=$(hostname)
FOUND_MATCH=0

# Known BRICKSTORM SHA256 hashes (embedded for standalone use)
KNOWN_HASHES="
aaf5569c8e349c15028bc3fac09eb982efb06eabac955b705a6d447263658e38
013211c56caaa697914b5b5871e4998d0298902e336e373ebb27b7db30917eaf
57bd98dbb5a00e54f07ffacda1fea91451a0c0b532cd7d570e98ce2ff741c21d
b3b6a992540da96375e4781afd3052118ad97cfe60ccf004d732f76678f6820a
22c15a32b69116a46eb5d0f2b228cc37cd1b5915a91ec8f38df79d3eed1da26b
f7cda90174b806a34381d5043e89b23ba826abcc89f7abd520060a64475ed506
39b3d8a8aedffc1b40820f205f6a4dc041cd37262880e5030b008175c45b0c46
73fe8b8fb4bd7776362fd356fdc189c93cf5d9f6724f6237d829024c10263fe5
77b49c854afd6746fee393711b48979376fb910b34105c0e18a3fdc24ea31d5c
6a67a9769a55ec889a5dd4199b2fc08965d39d737838836853bc13c81c56a800
ed907d39efd5750236b075ca9fbb1f090d7bf578578c38faab24210d298a60ae
88db1d63dbd18469136bf9980858eb5fc0d4e41902bf3e4a8e08d7b6896654ed
40db68331cb52dd3ffa0698144d1e6919779ff432e2e80c058e41f7b93cec042
"

# Directories to scan (BRICKSTORM persistence locations)
SCAN_DIRS="
/etc/sysconfig
/etc/sysconfig/network
/etc/rc.local.d
/opt/vmware/sbin
/usr/java/jre-vmware/bin
/etc/applmgmt/appliance
/home/vsphere-ui
/usr/sbin
/tmp
"

# Malicious filenames to specifically check
MALICIOUS_NAMES="vmsrc vnetd if-up viocli vts vmckd bkmgr updatemgr vami vmware-sphere vsm-boot-monitordvcenter vsm-monitordvcenter sqiud"

log_result() {
    status="$1"
    filepath="$2"
    hash="$3"
    details="$4"
    printf "%s\t%s\t%s\t%s\t%s\n" "$status" "$HOSTNAME" "$filepath" "$hash" "$details"
}

check_file() {
    filepath="$1"
    check_name="$2"  # "yes" to also check filename

    if [ ! -f "$filepath" ]; then
        return
    fi

    if [ ! -r "$filepath" ]; then
        log_result "ERROR" "$filepath" "-" "Permission denied"
        return
    fi

    # Calculate SHA256 (works on ESXi)
    hash=$(sha256sum "$filepath" 2>/dev/null | awk '{print $1}')

    if [ -z "$hash" ]; then
        log_result "ERROR" "$filepath" "-" "Hash calculation failed"
        return
    fi

    # Check against known hashes
    if echo "$KNOWN_HASHES" | grep -q "$hash"; then
        log_result "MATCH" "$filepath" "$hash" "BRICKSTORM HASH DETECTED"
        FOUND_MATCH=1
        return
    fi

    # Check if filename is suspicious (even if hash is unknown)
    if [ "$check_name" = "yes" ]; then
        filename=$(basename "$filepath")
        if echo "$MALICIOUS_NAMES" | grep -qw "$filename"; then
            log_result "SUSPECT" "$filepath" "$hash" "Suspicious filename (unknown hash)"
            FOUND_MATCH=1
        fi
    fi
}

scan_directory() {
    dir="$1"

    if [ ! -d "$dir" ]; then
        return
    fi

    # Scan all files in directory, check both hash and filename
    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            check_file "$file" "yes"
        fi
    done
}

# Header
echo "# BRICKSTORM Hash Scan - $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
echo "# Host: $HOSTNAME"
echo "# STATUS	HOSTNAME	FILEPATH	SHA256	DETAILS"

# Scan known persistence directories
for dir in $SCAN_DIRS; do
    scan_directory "$dir"
done

# Check for Junction implant (masquerades as vvold on port 8090)
check_junction() {
    # Get process listening on 8090. Pipelines end in head/grep -c style
    # commands that exit 0, so set -e does not abort when nothing matches.
    listener=$(esxcli network ip connection list 2>/dev/null | grep -E ":8090.*LISTEN" | head -1)

    if [ -z "$listener" ]; then
        # Nothing listening on 8090 - unusual but not necessarily bad
        return
    fi

    # Find the vvold process. pidof is not available on ESX, so use ps.
    # The bracket in the grep pattern keeps grep from matching itself.
    vvold_line=$(ps -c 2>/dev/null | grep '[v]vold' | head -1)

    if [ -z "$vvold_line" ]; then
        # Something on 8090 but no vvold process - suspicious
        log_result "SUSPECT" "port:8090" "-" "Process on port 8090 but no vvold found"
        FOUND_MATCH=1
        return
    fi

    # Extract the binary path: the first token in the command line
    # that starts with '/'
    vvold_path=$(echo "$vvold_line" | tr ' ' '\n' | grep '^/' | head -1)

    if [ -z "$vvold_path" ]; then
        log_result "SUSPECT" "port:8090" "-" "Could not determine vvold binary path; verify manually with: ps -c | grep vvold"
        FOUND_MATCH=1
        return
    fi

    case "$vvold_path" in
        /bin/vvold|/usr/lib/vmware/vvold/bin/vvold)
            # Legitimate path
            ;;
        *)
            # Suspicious path - possible Junction implant
            log_result "SUSPECT" "$vvold_path" "-" "vvold running from unexpected path (Junction indicator)"
            FOUND_MATCH=1
            ;;
    esac
}

check_junction

# Summary
if [ "$FOUND_MATCH" -eq 1 ]; then
    echo "# RESULT: BRICKSTORM INDICATORS DETECTED - IMMEDIATE INVESTIGATION REQUIRED"
    exit 1
else
    echo "# RESULT: No known BRICKSTORM hashes found"
    exit 0
fi
