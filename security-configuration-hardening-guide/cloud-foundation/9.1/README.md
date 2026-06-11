# VMware Cloud Foundation Security Configuration & Hardening Guide

The VMware Cloud Foundation (VCF) Security Configuration & Hardening Guide (SCG) is the baseline for hardening and auditing guidance for VCF and the components within. It has long served as guidance for virtualization administrators looking to protect their infrastructure.

Security is always a tradeoff, and turning on all security features, to their highest levels of security, often impedes day-to-day administration efforts. The goal of this guide is to be a core set of security best practices that inform administrators. It is not a catalogue of all available security controls, but instead a reasonable baseline on which to build. It is also not a design guide.

## Disclaimer

This kit is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.

This material is provided as is and any express or implied warranties, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose are disclaimed. In no event shall the copyright holder or contributors be liable for any direct, indirect, incidental, special, exemplary, or consequential damages (including, but not limited to, procurement of substitute goods or services; loss of use, data, or profits; or business interruption) however caused and on any theory of liability, whether in contract, strict liability, or tort (including negligence or otherwise) arising in any way out of the use of this software, even if advised of the possibility of such damage. The provider makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of this sample. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations. You acknowledge that there may be performance or other considerations, and that these examples may make assumptions which may not be valid in your environment or organization.

## License

Copyright (c) CA, Inc. All rights reserved.

You are hereby granted a non-exclusive, worldwide, royalty-free license under CA, Inc.'s copyrights to use, copy, modify, and distribute this software in source code or binary form for use in connection with CA, Inc. products.

This copyright notice shall be included in all copies or substantial portions of the software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Third Party Identifiers & Mappings

This document includes regulatory compliance and security control identifiers from external sources as a convenience to end users. This does not constitute endorsement, in either direction.

There is not a one-to-one mapping of product capabilities to third-party controls. A product capability, or set of capabilities, may be applicable to multiple controls. Conversely, a control may be satisfied with the use of multiple capabilities.

Control identifier numbers have been included from the [Secure Controls Framework](https://securecontrolsframework.com/), version 2026.1.1, under the terms of the [Creative Commons Attribution-NoDerivatives 4.0 International Public License](https://creativecommons.org/licenses/by-nd/4.0/). No modifications have been made to the control identifier numbers under the terms of the license.

## What is Included?

The Security Configuration & Hardening Guide includes several artifacts:

- [**vcf-security-configuration-guide-91-guidance.pdf**](vcf-security-configuration-guide-91-guidance.pdf?raw=true) - Main guidance document
- [**vcf-security-configuration-guide-91-controls.xlsx**](vcf-security-configuration-guide-91-controls.xlsx?raw=true) - Spreadsheet with the security hardening baseline controls, discussion, and PowerCLI automation examples
- [**vcf-security-configuration-guide-91-controls.csv**](vcf-security-configuration-guide-91-controls.csv?raw=true) - A version which is more conducive to GitHub's change tracking, in the hopes of solving the perpetual question of "what changed?"
- [**tools/**](tools/) - Directory with sample auditing and remediation scripts, based in VMware PowerCLI (PowerShell)

Spaces have been removed from filenames to ease downloading from GitHub. File names will no longer contain patch or update-level version numbers so that URLs remain stable.

## Intended Audience

The audience for the VCF Security Configuration Guide is VMware Cloud Foundation and VMware vSphere Foundation customers who have implemented this software directly. There are many engineered data center & hybrid cloud infrastructure products that implement VMware infrastructure products as part of their solutions. If this describes you, please check with those products' support before implementing these ideas.

This guidance evolves and will continue to expand to cover all VMware Cloud Foundation components, as well as to include compliance-oriented guidance aimed at assisting auditors. Additional guidance for US Department of Defense and related users can be found in our DISA STIG and DISA STIG Readiness Guides.

## Downloading the Latest Version

This guide was developed with VMware Cloud Foundation 9.1.0 and supersedes all earlier versions and guidance. We strongly encourage readers to stay current with patches and updates as a major part of a good security posture. The most up-to-date version of this document can be found at:

<https://github.com/vmware/vcf-security-and-compliance-guidelines>

A shortened version of that URL exists as:

<https://brcm.tech/vcf-scg>

These links also contain numerous additional resources to help your security and compliance efforts.

This guidance evolves; please check for the latest version before commencing security efforts.

### Using Git to Download the Guide

The VCF Security and Compliance Guidelines GitHub repository is a monolithic repository that contains multiple distinct projects and components related to infrastructure security and regulatory compliance. While that's helpful as a single place to visit to find materials, it can be overwhelming if you just need one particular thing, or even a group of files like what comprise the SCG. Complicating things further, with our use of GitHub we have stopped producing single Zip files to download, as binary files such as those are not compatible with how Git is meant to be used.

However, you can use the "sparse-checkout" function of Git to download just the directories you would like. For example, to check out only the VMware Cloud Foundation 9.1 hardening guidance you might use:

```
git clone --filter=blob:none --sparse https://github.com/vmware/vcf-security-and-compliance-guidelines.git
cd vcf-security-and-compliance-guidelines
git sparse-checkout set security-configuration-hardening-guide/cloud-foundation/9.1
```

In the future, to retrieve the latest versions from the main repository, issue the command:

```
git pull
```

To add more directories from the repository, issue a command like:

```
git sparse-checkout add security-advisories
```

To see what is included in your copy of the repository you can issue the command:

```
git sparse-checkout list
```

## Product Naming Changes

With the release of VMware Cloud Foundation 9 the name of the VMware Hypervisor was changed from ESXi back to ESX. Documents such as this, which use information that span a range of release versions, may use the names ESXi and ESX interchangeably, or refer to the hypervisor solely as ESX for simplicity. Unless you are running VMware vSphere 4.1, please consider both ESXi and ESX to be the same, and use the product version to determine applicability to your environment.

If you are running VMware ESX 4.1, or any version which has passed the End of General Support deadline, please know that Broadcom has resources available to assist you in migrating smoothly to the latest version. The upgrade process has become quite smooth in recent years, and where there is not a direct path from one version to another, Cross-vCenter vMotion may be able to help.

Beyond ESX there are additional naming changes you will likely note, such as all names prefaced with VMware Aria changing to VCF Operations. VCF Operations for Logs has also become simply "VCF Log Management."

## VMware Appliances and Management Services

VMware appliances, such as the vCenter Appliance (VCSA), are tested and qualified in known configurations. Altering the configuration of appliances may affect support. Avoid upgrading the appliance virtual hardware versions except under the guidance of VMware Global Support Services. That said, the upgrade process to VMware Cloud Foundation 9.1 will update the VCSA to VM hardware version 17 (and if not, you can do it, too).

The VMware Cloud Foundation Management Services (VCFMS) virtual machines and containers are a new structure in VCF 9.1, and pre-hardened. They are not meant to be altered, as they are deployed and managed automatically by VCF itself. Components deployed into the VCFMS do not have traditional configurable management surfaces (VAMI) and are largely meant to be invisible, configured through the VCF Operations Global Settings.

## Use Your Head!

This guide will be updated as necessary to improve clarity, correct problems, and reflect new and changed functionality. While many of the general information security principles are timeless, the technical guidance in this guide should not be applied to versions other than the version it was qualified on. Even within the products, security-related changes can have consequences for performance, functionality, and usability and should be implemented carefully, with thorough testing, and staged rollouts.

## Power Off

All guidance in the Security Configuration Guide is meant to be applied to virtual machines in a powered off state, or hosts which have been placed in maintenance mode and are able to restart. Changes to ESX have made it so that most advanced parameters cannot be set with virtual machines powered on. This helps ensure that the running configuration of a virtual machine matches the reported configuration, but in practice may require organizational process changes. We encourage organizations to take advantage of product defaults to reduce the scope of work.

## VM Hardware Versions

There are varying opinions within the greater VMware community about upgrading virtual machine hardware versions. Newer virtual machine hardware versions introduce new feature and guest OS support, better compatibility and performance with CPU vulnerability mitigations, better support for modern CPU security features, better security defaults, and so on.

Upgrading virtual machine hardware changes the virtual hardware presented to the guest operating system, just as if a boot device in a physical server was placed in a newer physical server. Changes like this can vary in risk, may require more than one reboot, and may require human interaction to complete.

Note that a virtual machine snapshot will capture the virtual hardware version. This means that reverting a snapshot taken before the upgrade will also revert the virtual hardware version. This makes virtual hardware version upgrades less risky and enables easier testing.

In general, Broadcom guidance is to:

- Run the latest version you are able, ideally the latest version available in the version of VCF you run.
- Use VM Hardware 17 (vmx-17) or newer. Version 13 introduced important performance and security improvements for CPU vulnerability mitigations, and version 14 introduced support for vTPM.
- Take snapshots of virtual machines prior to upgrading, but do not forget to remove the snapshot later. Note that VMware Cloud Foundation allows you to schedule automatic snapshot deletions.
- When scheduling virtual hardware compatibility upgrades use the "Only upgrade after normal guest OS shutdown" to help ensure that a compatibility update does not complicate an unplanned incident or HA event.

## Code Examples & Tools

This Guide contains PowerCLI examples that standardize on formatting, such as:

- `$VM` is a string containing the virtual machine name
- `$ESX` is a string containing the ESX host name
- `$VC` is a string containing the vCenter name
- `$Cluster` is a string containing the vSphere cluster name
- `$VDS` is a string containing the Distributed Virtual Switch name
- `$VDPG` is a string containing the Distributed Virtual Switch port group name
- `$PG` is a string containing the standard switch port group name
- `$VMK` is a string containing the VMkernel adapter name (for example, `vmk0`)

These code snippets can make changes that deeply affect operations and the responsibility for the impact of these changes is yours. Test these changes in a controlled, non-production environment first, and apply them to production environments using staged rollout techniques. One easy way to build a test environment is to run ESX inside a VM for non-production testing purposes, just as the [VMware Hands-on Labs](https://labs.hol.vmware.com/) do.

This guide includes sample automation scripts for auditing & remediating certain components. Please see Appendix A in the [guidance document](vcf-security-configuration-guide-91-guidance.pdf?raw=true), or the [`tools/`](tools/) directory.

We regret that while we are happy to accept constructive feedback about the code examples, we cannot supply scripting support. There are options for scripting and automation support through VMware Professional Services. Please contact your Account Executive for more information. You might also check out the thriving community at [developer.broadcom.com](https://developer.broadcom.com/).

Alternatively, the "Code Capture" and "API Explorer" features inside the vSphere Client's Developer Center can be used to discover APIs, help script, and automate tasks. It isn't perfect, but, in general, if you can do it inside the client, it will give you an example script to automate.

## Feedback & Support

Please use the issue tracker in our GitHub repository to submit feedback pertaining to this Guide:

<https://github.com/vmware/vcf-security-and-compliance-guidelines/issues>

For support, review the policy found at:

<https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/SUPPORT.md>

Thank you.
