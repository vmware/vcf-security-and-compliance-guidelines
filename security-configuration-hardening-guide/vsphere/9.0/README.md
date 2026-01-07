# VMware vSphere Security Configuration and Hardening Guide

The VMware vSphere Security Configuration and Hardening Guide (SCG) is the baseline for hardening and auditing guidance for VMware Cloud Foundation and the components within. It has long served as guidance for virtualization administrators looking to protect their infrastructure.

Security is always a tradeoff, and turning on all security features, to their highest levels of security, often impedes day-to-day administration efforts. The goal of this guide is to be a core set of security best practices that inform administrators. It is not a catalogue of all available security controls, but instead a reasonable baseline on which to build.

This guide was developed with VMware Cloud Foundation 9.0.1 and supersedes all earlier versions and guidance.

## VMware ESXi versus VMware ESX

With the release of VMware Cloud Foundation 9.0 the name of the VMware Hypervisor was changed from ESXi back to ESX. Documents such as this, which use information that span a range of release versions, may use the names ESXi and ESX interchangeably, or refer to the hypervisor solely as ESX for simplicity. Unless you are running VMware vSphere 4.1, please consider both ESXi and ESX to be the same, and use the product version to determine applicability to your environment.

## Disclaimer

This kit is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.

This material is provided as is and any express or implied warranties, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose are disclaimed. In no event shall the copyright holder or contributors be liable for any direct, indirect, incidental, special, exemplary, or consequential damages (including, but not limited to, procurement of substitute goods or services; loss of use, data, or profits; or business interruption) however caused and on any theory of liability, whether in contract, strict liability, or tort (including negligence or otherwise) arising in any way out of the use of this software, even if advised of the possibility of such damage. The provider makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of this sample. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations. You acknowledge that there may be performance or other considerations, and that these examples may make assumptions which may not be valid in your environment or organization.

## License

Copyright (c) CA, Inc. All rights reserved.

You are hereby granted a non-exclusive, worldwide, royalty-free license under CA, Inc.'s copyrights to use, copy, modify, and distribute this software in source code or binary form for use in connection with CA, Inc. products.

This copyright notice shall be included in all copies or substantial portions of the software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## What is Included?

The Security Configuration and Hardening Guide is a kit that includes several artifacts:

- [**vmware-cloud-foundation-security-configuration-guide-90-guidance.pdf**](vmware-cloud-foundation-security-configuration-guide-90-guidance.pdf?raw=true) - Main guidance document
- [**vmware-cloud-foundation-security-configuration-guide-90-controls.xlsx**](vmware-cloud-foundation-security-configuration-guide-90-controls.xlsx?raw=true) - Spreadsheet with the security hardening baseline controls, discussion, and PowerCLI automation examples for auditing and remediating vSphere objects
- [**vmware-cloud-foundation-security-configuration-guide-90-controls.csv**](vmware-cloud-foundation-security-configuration-guide-90-controls.csv?raw=true) - CSV version of the hardening controls
- [**tools/**](tools/) - Directory with sample vSphere auditing and remediation scripts based on VMware PowerCLI (PowerShell), and separate documentation

## Download the Latest Version

We strongly encourage readers to stay current with patches and updates as a major part of a good security posture. The most up-to-date version of this document can be found at:

<https://github.com/vmware/vcf-security-and-compliance-guidelines>

A shortened version of that URL exists as:

<https://brcm.tech/vcf-scg>

These links also contain numerous additional resources to help your security and compliance efforts.

## Intended Audience

The audience for the Security Configuration and Hardening Guide is VMware Cloud Foundation and vSphere Foundation customers who have implemented VMware Cloud Foundation 9.0.1 or VMware vSphere Foundation 9.0.1 directly. There are many engineered data center and hybrid cloud infrastructure products that implement VMware vSphere as part of their solutions. If this is how you consume vSphere you should check with those products' support before implementing these ideas.

## Third Party Identifiers & Mappings

This document includes regulatory compliance and security control identifiers from external sources as a convenience to end users. This does not constitute endorsement, in either direction.

There is not a one-to-one mapping of product capabilities to third-party controls. A product capability, or set of capabilities, may be applicable to multiple controls. Conversely, a control may be satisfied with the use of multiple capabilities.

Control identifier numbers have been included from the [Secure Controls Framework](https://securecontrolsframework.com/), version 2025.4, under the terms of the [Creative Commons Attribution-NoDerivatives 4.0 International Public License](https://creativecommons.org/licenses/by-nd/4.0/). No modifications have been made to the control identifier numbers under the terms of the license.

## VMware Appliances

VMware appliances, such as the vCenter Server Appliance (VCSA), are tested and qualified in known configurations. Altering the configuration of appliances may affect support. Avoid upgrading the appliance virtual hardware versions except under the guidance of VMware Global Support Services. If you do decide to upgrade an appliance, ensure that you have a backup and/or a snapshot.

The VMware vSphere Cluster Services VMs have been hardened with guidance present here and take advantage of vSphere default settings. If your security scanner identifies missing parameters check to ensure that they need to be set.

## VM Hardware Versions

There are varying opinions within the greater VMware community about upgrading virtual machine hardware versions. Newer virtual machine hardware versions introduce new feature and guest OS support, better compatibility and performance with CPU vulnerability mitigations, better support for modern CPU security features, better security defaults, and so on.

Upgrading virtual machine hardware changes the virtual hardware presented to the guest operating system, just as if a boot device in a physical server was placed in a newer physical server. Changes like this can vary in risk, may require more than one reboot, and may require human interaction to complete.

Note that a virtual machine snapshot will capture the virtual hardware version. This means that reverting a snapshot taken before the upgrade will also revert the virtual hardware version. This makes virtual hardware version upgrades less risky and enables easier testing.

In general, Broadcom guidance is to:

- Run the latest version you are able, ideally the latest version available in the major vSphere version you run.
- Use VM Hardware 14 (vmx-14) or newer. Version 13 introduces important performance and security improvements for CPU vulnerability mitigations, and version 14 introduces support for vTPM.
- Take snapshots of virtual machines prior to upgrading, but do not forget to remove the snapshot later.
- When scheduling virtual hardware compatibility upgrades use the "Only upgrade after normal guest OS shutdown" to help ensure that a compatibility update does not complicate an unplanned incident or HA event.

## Use Your Head!

This guide may be updated as necessary to improve clarity, correct problems, and reflect new and changed functionality within the major version of VMware Cloud Foundation 9. While many of the general information security principles are timeless, the technical guidance in this guide should not be applied to versions other than the version it was qualified on. **Even within VMware Cloud Foundation 9, many security-related changes have serious consequences for performance, functionality, and usability and should be implemented carefully, with thorough testing, and staged rollouts.**

## Power Off

All guidance in the Security Configuration Guide is meant to be applied to virtual machines in a powered off state, or hosts which have been placed in maintenance mode and are able to restart. **Changes to vSphere have made it so that most advanced parameters cannot be set with virtual machines powered on.** This ensures that the running configuration of a virtual machine matches the reported configuration, but in practice may require organizational process changes. We encourage organizations to take advantage of product defaults to reduce the scope of work.

## Code Examples & Tools

This Guide contains PowerCLI examples that standardize on formatting, such as:

- `$VM` is a string containing the virtual machine name
- `$ESX` is a string containing the ESX host name
- `$VDS` is a string containing the Distributed Virtual Switch name
- `$VDPG` is a string containing the Distributed Virtual Switch port group name

**These code snippets can make changes that deeply affect operations and the responsibility for the impact of these changes is yours.** Test these changes in a controlled, non-production environment first, and apply them to production environments using staged rollout techniques. One easy way to build a test environment is to run ESX inside a VM for non-production testing purposes, just as the [VMware Hands-on Labs](https://labs.hol.vmware.com/) do.

This guide includes sample automation scripts for auditing and remediating environments. Please see Appendix B in the [guidance document](vmware-cloud-foundation-security-configuration-guide-90-guidance.pdf?raw=true), or the [`tools/`](tools/) directory.

We regret that while we are happy to accept constructive feedback about the code examples, we cannot supply scripting support. There are options for scripting and automation support through VMware Professional Services. Please contact your Account Executive for more information. You might also check out the thriving community at [developer.broadcom.com](https://developer.broadcom.com/).

Alternatively, the "Code Capture" and "API Explorer" features inside the vSphere Client's Developer Center can be used to discover APIs, help script, and automate tasks. It isn't perfect, but, in general, if you can do it inside the client, it will give you an example script to automate.

## Feedback & Support

Please use the issue tracker in our GitHub repository to submit feedback:

<https://github.com/vmware/vcf-security-and-compliance-guidelines/issues>

For support, review the policy found at:

<https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/SUPPORT.md>

Thank you.
