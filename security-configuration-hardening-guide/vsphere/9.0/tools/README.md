# VMware vSphere Security Configuration Guide - Sample Audit and Remediation Scripts

Starting with vSphere 8.0.2, the SCG introduced sample scripts to automate auditing. These scripts have been updated for VMware Cloud Foundation 9.0.1 and serve three main purposes:

- **Ease of Use for Beginners**: These scripts act as a stepping stone for those new to scripting, while also having an important purpose. Using the readily available VMware PowerCLI cmdlets with PowerShell makes vSphere automation straightforward. The scripts prioritize readability over programmatic elegance to ensure they align closely with SCG examples and can be easily modified by administrators as needed.

- **Simplicity & Integration**: Adhering to the UNIX philosophy of doing one thing and doing it well, these scripts each have a single purpose, and can be used in conjunction with inherent features of PowerShell. For instance, use of the `Select-String` command for pattern matching, such as for finding audit lines containing the labels [PASS] and [FAIL].

- **Generating Audit Records**: The output is structured to provide audit details like dates, times, hostnames, and current configurations. This allows the scripts to capture a snapshot of an environment, aiding regulatory compliance, and also allowing administrators to demonstrate progress.

While these tools offer significant advantages, they aren't a one-size-fits-all solution. They can't assess design nuances, firewall configurations, patch levels, and more. There are also a number of controls that do not have programmatic methods of assessment, either. Nevertheless, these samples might decrease the manual effort tied to the SCG's controls.

## Nested Test Environments

One easy way to build a test environment is to run ESX inside a VM for non-production testing purposes, just as the [VMware Hands-on Labs](https://labs.hol.vmware.com/) do.

## License and Disclaimer

Copyright (c) CA, Inc. All rights reserved.

You are hereby granted a non-exclusive, worldwide, royalty-free license under CA, Inc.'s copyrights to use, copy, modify, and distribute this software in source code or binary form for use in connection with CA, Inc. products.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Support

While we are happy to accept constructive feedback about the code examples and tools, we cannot supply direct support for them, through the author or via VMware Global Support Services. There are options for scripting and automation support through VMware Professional Services. Please contact your Account Executive for more information. You might also check out the community at [developer.broadcom.com](https://developer.broadcom.com/).

## Usage Warning

The audit scripts are set up to minimize the number of queries to a vCenter Server, to improve execution speed and to reduce overall load in a large environment.

The sample remediation scripts **will change environments in ways that cause operational issues, require restarts, and might otherwise impact a running environment**. As such, you need to edit the script to remove the "Exit" commands that end the script. If you are not comfortable with this, you should not proceed. You can always remediate manually.

**By changing the scripts you acknowledge and accept all risk associated with these sample tools.**

**Do not use the remediation scripts in production environments without careful consideration and testing.**

## Interaction with DISA STIG and Regulatory Compliance Guidance

These tools implement the controls contained in the Security Configuration and Hardening Guide. This Guide has a different scope than the DISA STIG for VMware Cloud Foundation. While there is overlap between the two, the controls and their parameters are not the same, and should not be used interchangeably. If you desire DISA STIG-compliant configurations please use the automation available from DISA directly.

## Audit & Remediation Coverage

Not all security controls are accessible programmatically. Not all security controls can be safely remediated programmatically, either. Where this is the case, it is denoted in the spreadsheet attached to the Security Configuration Guide itself. These are sample scripts and the authoritative reference is the Security Configuration Guide.

Additionally, these tools cannot audit and remediate design decisions, such as evaluating the trust you may have established between your identity provider and your infrastructure systems.

## Files Included

| File | Description |
|------|-------------|
| [`scg-common.psm1`](scg-common.psm1) | Shared module with common functions used by all scripts |
| [`connect.ps1`](connect.ps1) | Establishes connection to vCenter Server |
| [`audit-all.ps1`](audit-all.ps1) | Recursively audits VMs, hosts, and vCenter |
| [`audit-esx-9.ps1`](audit-esx-9.ps1) | Audits ESX hosts against SCG baseline |
| [`audit-vcenter-9.ps1`](audit-vcenter-9.ps1) | Audits vCenter Server against SCG baseline |
| [`audit-vm-9.ps1`](audit-vm-9.ps1) | Audits virtual machines against SCG baseline |
| [`remediate-esx-9.ps1`](remediate-esx-9.ps1) | Remediates ESX hosts to SCG baseline |
| [`remediate-vcenter-9.ps1`](remediate-vcenter-9.ps1) | Remediates vCenter Server to SCG baseline |
| [`remediate-vm-9.ps1`](remediate-vm-9.ps1) | Remediates virtual machines to SCG baseline |

## How to Use These Tools

### Step 0: Software Requirements

These scripts are built on VMware PowerCLI. They require VMware VCF PowerCLI 9.0.0 or newer. Installation instructions for PowerCLI can be found at <https://developer.broadcom.com/powercli> but it can be as simple as opening a relatively recent version of PowerShell (such as version 5.1 on a default Windows 10 desktop) and typing:

```powershell
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module -Name VCF.PowerCLI -MinimumVersion 9.0.0 -Scope AllUsers
Install-Module -Name VMware.vSphere.SsoAdmin -MinimumVersion 1.4.0 -Scope AllUsers
```

These tools assume, and check for, VMware vCenter Server 9.0.1 and VMware ESX 9.0.1. Using these tools against a different environment will have untested results.

### Step 1: Connection Requirements

These tools are built to connect to a VMware vCenter Server. There are two methods for connecting. First, you can use the following commands to do so:

```powershell
Connect-VIServer -User username@vsphere.local -Server vc-mgmt-a.vcf.lab
Connect-CisServer -User username@vsphere.local -Server vc-mgmt-a.vcf.lab
Connect-SsoAdminServer -User username@vsphere.local -Server vc-mgmt-a.vcf.lab
```

Second, you can use the included [`connect.ps1`](connect.ps1) script:

```powershell
.\connect.ps1 -vCenter vcenter-1.vcf.lab -User username@vsphere.local
```

This script will prompt for a password, collected from the console and masked with asterisks (*).

**Important**: Under no circumstances do we recommend storing account logon information in a script. Doing so is a leading cause of unauthorized access, breaches, and eventual situations like ransomware.

### Step 2: Run The Tools

Change into the directory with the scripts and issue a command like:

```powershell
.\audit-esx-9.ps1 -Name esx-01a.vcf.lab
```

Replacing the value after "-Name" with a valid hostname in your environment. Similarly:

```powershell
.\audit-vm-9.ps1 -Name TESTVM
```

The vCenter auditing script does not require a name:

```powershell
.\audit-vcenter-9.ps1
```

Running the tools individually gives you an idea of what the output will look like and will help expose any issues with their execution.

### Step 3: Troubleshoot & Customize

Each script has additional flags you can use as needed:

- `-NoSafetyChecks` allows the script to run unhindered. Currently the only safety checks are to confirm that you are only attached to one vCenter, and that you have ESX hosts attached to the vCenter.
- `-NoSafetyChecksExceptAppliances` allows [`audit-vm-9.ps1`](audit-vm-9.ps1) to skip all checks except the ones for VMware appliances.
- `-AcceptEULA` will suppress the disclaimer, should you desire that.
- `-OutputFileName` will log to a filename you specify. It will create the file or append to an existing one.

There are other flags to control the remediation scripts as well.

### Step 4: Read the Output

Each line from the script will begin with the name of the object being examined, and then have a label:

| Label | Description |
|-------|-------------|
| `[INFO]` | Informational output, such as date, time, and target of the scan |
| `[WARNING]` | A result that requires additional review |
| `[ERROR]` | The script has an error and exited |
| `[EULA]` | Disclaimer and risk acceptance, can be acknowledged with `-AcceptEULA` |
| `[PASS]` | The control being tested passed the check |
| `[FAIL]` | The control being tested did not pass the check |
| `[UPDATE]` | The remediation script was able to update this parameter |

Each line will have the current configured value in parentheses at the end of the line.

No audit is perfect. Failures may simply indicate that something needs to be checked manually.

### Step 5: Use PowerShell to Search the Results

Run the audit and write to a file, then use `Select-String` on the file:

```powershell
.\audit-esx-9.ps1 -Name esx-01a.vcf.lab -OutputFileName esx-01a.txt -AcceptEULA
Get-Content "esx-01a.txt" | Select-String -Pattern "\[FAIL\]|\[INFO\]"
```

This will return the lines that require further checking, labeled with `[FAIL]`.

### Step 6: Remediate

There are three sample remediation scripts, for VMs, ESX, and vCenter Server. Each has different flags to help control some behavior that may be disruptive.

To reiterate, these sample remediation scripts will change environments in ways that cause operational issues, require restarts, and might otherwise impact the running environment. As such, you need to edit the script to remove the "Exit" commands that end the script.

**By changing the scripts you acknowledge and accept all risk associated with these sample tools. Do not use the remediation scripts in production environments without careful consideration and testing.**

### Step 7: Customize

Every environment has audit findings that are not actionable but continue to appear in reports. These scripts are set up in a way where you should be able to easily find and edit those out if they are truly false positives. Similarly, you could filter them after the fact with `Select-String` commands.

## Sample Script Command Reference

### connect.ps1

An example script for connecting to vCenter Server.

**Parameters:**

| Parameter | Required | Description |
|-----------|----------|-------------|
| `-vCenter` | Yes | Name of the vCenter Server to connect to |
| `-User` | Yes | Username to use when connecting to the named vCenter Server |

### audit-esx-9.ps1

Assesses a particular ESX host for compliance with the VMware Security Configuration Guide.

**Parameters:**

| Parameter | Required | Description |
|-----------|----------|-------------|
| `-Name` | Yes | Name of the host to be audited |
| `-OutputFileName` | No | Name of a file to receive the logged output from the audit |
| `-AcceptEULA` | No | Accepts the disclaimer and the license for this tool |
| `-NoSafetyChecks` | No | Skip safety checks on software versions |

### audit-vcenter-9.ps1

Assesses a particular vCenter Server for compliance with the VMware Security Configuration Guide. If no name is specified, the script uses the currently connected vCenter Server.

**Parameters:**

| Parameter | Required | Description |
|-----------|----------|-------------|
| `-Name` | No | Name of the vCenter Server to be audited (defaults to current connection) |
| `-OutputFileName` | No | Name of a file to receive the logged output from the audit |
| `-AcceptEULA` | No | Accepts the disclaimer and the license for this tool |
| `-NoSafetyChecks` | No | Skip safety checks on software versions |

### audit-vm-9.ps1

Assesses a particular virtual machine for compliance with the VMware Security Configuration Guide.

**Parameters:**

| Parameter | Required | Description |
|-----------|----------|-------------|
| `-Name` | Yes | Name of the virtual machine object to be audited |
| `-OutputFileName` | No | Name of a file to receive the logged output from the audit |
| `-AcceptEULA` | No | Accepts the disclaimer and the license for this tool |
| `-NoSafetyChecks` | No | Skip safety checks on software versions and VMware appliances |
| `-NoSafetyChecksExceptAppliances` | No | Skip software version safety checks but do not audit VMware appliances |

### audit-all.ps1

Recursively assesses VMs, hosts, and vCenter for compliance with the VMware Security Configuration Guide.

**Parameters:**

| Parameter | Required | Description |
|-----------|----------|-------------|
| `-OutputDirName` | Yes | Name of an empty directory to receive the logged output from the audit |
| `-AcceptEULA` | No | Accepts the disclaimer and the license for this tool |
| `-NoSafetyChecks` | No | Skip safety checks on software versions |

### remediate-esx-9.ps1

Remediate an ESX host against the VMware Security Configuration Guide.

**Parameters:**

| Parameter | Required | Description |
|-----------|----------|-------------|
| `-Name` | Yes | Name of the ESX host to be remediated |
| `-OutputFileName` | No | Name of a file to receive the logged output from the script |
| `-AcceptEULA` | No | Accepts the disclaimer and the license for this tool |
| `-NoSafetyChecks` | No | Skip safety checks on software versions |
| `-RemediateStandardSwitches` | No | Update standard virtual switches and their port groups against the recommended settings. This may have negative effects on workload connectivity. |
| `-EnableLockdownMode` | No | Enable ESX lockdown mode. This may have negative effects on the ability to connect directly to the host to manage it. |
| `-RemediateTLSCiphers` | No | Enable TLS 1.3 and the NIST_2024 limited set of ciphers. This will require a host reboot. |

### remediate-vcenter-9.ps1

Remediate a vCenter Server against the VMware Security Configuration Guide. If no name is specified, the script uses the currently connected vCenter Server.

**Parameters:**

| Parameter | Required | Description |
|-----------|----------|-------------|
| `-Name` | No | Name of the vCenter Server to be remediated (defaults to current connection) |
| `-OutputFileName` | No | Name of a file to receive the logged output from the audit |
| `-AcceptEULA` | No | Accepts the disclaimer and the license for this tool |
| `-NoSafetyChecks` | No | Skip safety checks on software versions |
| `-RemediateDistributedSwitches` | No | Update distributed virtual switches and their port groups against the recommended settings. This may have negative effects on workload connectivity. |

### remediate-vm-9.ps1

Remediate a virtual machine against the VMware Security Configuration Guide.

**Parameters:**

| Parameter | Required | Description |
|-----------|----------|-------------|
| `-Name` | Yes | Name of the virtual machine object to be remediated |
| `-OutputFileName` | No | Name of a file to receive the logged output from the script |
| `-AcceptEULA` | No | Accepts the disclaimer and the license for this tool |
| `-NoSafetyChecks` | No | Skip safety checks on software versions and VMware appliances |
| `-NoSafetyChecksExceptAppliances` | No | Skip software version safety checks but do not remediate VMware appliances |
| `-RemoveExtraDevices` | No | Remove virtual CD/DVD, AHCI controller, USB & XHCI, parallel & serial port, floppy drive, and sound card devices. This may negatively impact the function of the VM. |
| `-UpdateHardwareVersion` | No | Updates the virtual machine hardware version to 21. There may be compatibility considerations for your guest operating system. |
| `-TakeSnapshot` | No | Take a snapshot prior to making changes to the virtual machine. The snapshot name will be "Security Configuration Guide Remediation." |

## Feedback & Support

Please use the issue tracker in our GitHub repository to submit feedback:

<https://github.com/vmware/vcf-security-and-compliance-guidelines/issues>

For support, review the policy found at:

<https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/SUPPORT.md>
