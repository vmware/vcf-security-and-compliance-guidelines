## Overview
VMware software is used worldwide to securely host hundreds of millions of virtual machines. This repository contains technical security guidance, code samples, and other information designed to ease system design, system hardening, and regulatory compliance efforts. This guidance focuses on VMware Cloud Foundation and VMware vSphere Foundation.

## Resources & Links
The permanent link https://bit.ly/vcf-security is being maintained as VMware documentation is assimilated into Broadcom. We understand that some organizations treat particular redirectors as security risks and block them. Please see [LINKS.md](LINKS.md) for more information and links to additional resources.

## Structure
This repository is structured to accommodate different types of content, and will be listed under the product and version it was developed for or with. Product versions may be up to three digits as needed. Use the most specific guidance available (for example, if you are using vSphere 8.0.2 you would choose 8.0.2 if it's present, or 8.0 if not).

* features-capabilities: information on specific features, functions, and capabilities in the products.
* ransomware-resources: information on defending against ransomware.
* regulatory-compliance: guidance on meeting regulatory compliance requirements using VMware products.
* security-advisories: information pertaining specifically to an individual VMware Security Advisory (VMSA).
* security-configuration-hardening-guide: security configuration and hardening guides for VMware products.

## Support
Support for security hardening changes to products is covered under the same guidance as the DISA STIGs, found in [Broadcom KB 313142](https://knowledge.broadcom.com/external/article?legacyId=94398)

Support for scripting and automation tools and examples is community-based and best effort.

If an issue is encountered please check the [open](https://github.com/vmware/cloud-infrastructure-security-and-compliance-guidelines/issues) and [closed](https://github.com/vmware/cloud-infrastructure-security-and-compliance-guidelines/issues?q=is%3Aissue+is%3Aclosed) issues in the issue tracker for the details of your issue. If you can't find it, or if you're not sure, open a new issue.

Always use guidance designated for the specific product and version you are running.

Always test changes in a dedicated test environment first.

## Contact
The primary maintainer of this repository is Bob Plankers, reachable at bob.plankers@broadcom.com.

## License
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Disclaimer
This repository is intended to provide general guidance for organizations that
are considering Broadcom solutions. The information contained in this document
is for educational and informational purposes only. This repository is not
intended to provide advice and is provided “AS IS.” Broadcom makes no claims,
promises, or guarantees about the accuracy, completeness, or adequacy of the
information contained herein. Organizations should engage appropriate legal,
business, technical, and audit expertise within their specific organization
for review of requirements and effectiveness of implementations.

This material is provided as is and any express or implied warranties,
including, but not limited to, the implied warranties of merchantability and
fitness for a particular purpose are disclaimed. In no event shall the
copyright holder or contributors be liable for any direct, indirect,
incidental, special, exemplary, or consequential damages (including, but not
limited to, procurement of substitute goods or services; loss of use, data,
or profits; or business interruption) however caused and on any theory of
liability, whether in contract, strict liability, or tort (including
negligence or otherwise) arising in any way out of the use of this software,
even if advised of the possibility of such damage. The provider makes no
claims, promises, or guarantees about the accuracy, completeness, or adequacy
of this sample. Organizations should engage appropriate legal, business,
technical, and audit expertise within their specific organization for review
of requirements and effectiveness of implementations. You acknowledge that
there may be performance or other considerations, and that these examples may
make assumptions which may not be valid in your environment or organization.
