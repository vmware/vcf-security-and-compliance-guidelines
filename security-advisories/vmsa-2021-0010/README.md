# VMSA-2021-0010: Questions & Answers | VMware
_If you are arriving here from another site you might really want [VMSA-2021-0020](https://core.vmware.com/vmsa-2021-0020-questions-answers-faq) instead!_

* * *

_This is information about an older security vulnerability and is not current. It is kept online for reference. Please review the [VMware Security Advisories web page](https://www.vmware.com/security/advisories.html) for the latest information to protect yourself and your organizations. Thank you._

* * *

Who is affected by VMSA-2021-0010 (CVE-2021-21985 &  CVE-2021-21986)?
---------------------------------------------------------------------

The VMware Security Advisory will always list the specific supported products and versions that are affected. In this case it is vCenter Server 6.5, 6.7, and 7.0.

When do I need to act?
----------------------

Immediately, the ramifications of this vulnerability are serious.

With the threat of ransomware looming nowadays the safest stance is to assume that an attacker may already have control of a desktop and a user account through the use of techniques like phishing or spearphishing, and act accordingly. This means the attacker may already be able to reach vCenter Server from inside a corporate firewall, and time is of the essence.

Why do I need to act?
---------------------

Most organizations employ good security strategies, such as defense-in-depth, zero trust and isolation, good password & account hygiene, etc. and these tactics help immensely when a security vulnerability is disclosed.

A remote code execution (RCE) vulnerability is where an attacker who can reach the affected software over the network (in this case vCenter Server) can execute commands on it and bypass the security controls in place. This leaves perimeter firewall controls, and vCenter Server VAMI firewall controls, as the last line of defense against this issue until it is remediated.

Organizations who have placed their vCenter Servers on networks that are directly accessible from the Internet may not have that line of defense and should audit their systems for compromise. They should also take steps to implement more perimeter security controls (firewalls, ACLs, etc.) on the management interfaces of their infrastructure.

Customers who do have perimeter security controls on their virtualization infrastructure management interfaces may still be in jeopardy. Ransomware gangs have repeatedly demonstrated to the world that they are able to compromise corporate networks while remaining extremely patient, waiting for a new vulnerability in order to attack from inside a network. This is not unique to VMware products, but it does inform our suggestions here. Organizations may want to consider additional security controls and isolation between their IT infrastructure and other corporate networks as part of an effort to implement modern zero-trust security strategies.

If I don't use VMware vSAN am I still affected?
-----------------------------------------------

Yes, the vSAN plugin ships with and is enabled by default on vCenter Server.

What happens if I shut the vSAN plugin off?
-------------------------------------------

While vSAN will continue operating, manageability and monitoring are not possible while the plugin is disabled. A customer who is using vSAN should only consider disabling the plugin for short periods of time, if at all.

What happens if I shut the Site Recovery plugin off?
----------------------------------------------------

Site Recovery will continue operating, and management can be done through the Site Recovery UI (https://srm\_fqdn/dr) until the plugin is re-enabled.

What happens if I shut the vSphere Lifecycle Manager plugin off?
----------------------------------------------------------------

vSphere Admins will be unable to patch, update, and upgrade hosts and other parts of the product ecosystem on vSphere 7 until the plugin is re-enabled.

What happens if I shut the vCloud Availability plugin off?
----------------------------------------------------------

Management and configuration of vCloud Director replication must be done through the vCloud UI itself until the plugin is re-enabled.

Do I have to patch ESXi hosts as well?
--------------------------------------

While we recommend staying current on updates for all products, this vulnerability only affects vCenter Server.

Are there potential solutions or workarounds to this that aren't listed in the VMSA or in this FAQ?
---------------------------------------------------------------------------------------------------

Patching is the only way to remove a vulnerability from an environment, and we strongly recommend that patching of vCenter Server happen. The VMSA outlines workarounds that are supported by VMware. Other, temporary workarounds may be available, depending on the environment, and any additional security controls available as part of an organization’s defense-in-depth strategy.

We are amidst an upgrade to vSphere 7, and these updates cause a "back in time" release restriction issue for their upgrade. What can I do?
-------------------------------------------------------------------------------------------------------------------------------------------

The course forward will depend on many things, including where you are in the upgrade process, if you use vSAN, and if you have other security controls in place to help mitigate this issue.

This issue does only affect vCenter Server, and not ESXi hosts, which may be a positive consideration.

"Back in Time" release restrictions are caused by the different products being on different release cycles which are interrupted because of the urgency of some security advisories. As has been the case, future releases of vSphere will reestablish the upgrade compatibility. VMware cannot speak publicly about future releases and timelines, but we absolutely understand the issue and how disruptive it is.

More information about these issues can be found in [KB 67077.](https://kb.vmware.com/s/article/67077)

I have a third-party plugin installed and after the update it does not function anymore. What should I do?
----------------------------------------------------------------------------------------------------------

As part of the patches, changes were made to further secure the vCenter Server plugin architecture. This may have a negative effect on some third-party plugins that were not authenticating correctly. Please check with the vendor that supplied the plugin for an update.

Plugins serve important purposes but can also complicate an environment by adding steps to the patching & upgrade processes, since they require additional qualification and testing. Tying systems together also complicates authorization & permission models across products and systems made by different vendors. In an era of growing ransomware, isolation and separation between different infrastructure systems may be a better choice than the elusive “single pane of glass.”

Where possible, we suggest organizations practice the concept of "loose coupling" between systems and use the native management interfaces of each system. Loosely coupled systems are easier to patch & upgrade, have fewer negative side effects if one is down (for patching or otherwise), and are easier to secure because their access control, authentication, and authorization models can be separated.

I am attempting to implement the workaround on vCenter Server 6.5 but I don't see the vSAN plugin.
--------------------------------------------------------------------------------------------------

The vSAN plugin first appeared as part of vCenter Server 6.5 U3k in mid-2020. If your version of vCenter Server is older than that you may not have the plugin, but we strongly recommend patching to resolve other security & operational issues that were present in those older versions of vCenter Server.

I have implemented the workaround. After I patch do I need to roll back the workaround settings?
------------------------------------------------------------------------------------------------

Organizations who use vSAN should absolutely re-enable the vSAN plugin to regain the ability to manage their storage environment. Likewise with the vSphere Lifecycle Manager plugin on vSphere 7.

Will the patch re-enable the plugins?
-------------------------------------

The patch process will not re-enable the disabled plugins, leaving them as configured.

Is there a method to deactivate the affected plugins using the vCenter Server APIs?
-----------------------------------------------------------------------------------

The method for disabling the plugins through the UI & API does not mitigate this vulnerability. Please use the workaround linked from the VMSA.

Can I use the vSphere Client UI to deactivate the affected plugins?
-------------------------------------------------------------------

The method for disabling the plugins through the UI & API does not mitigate this vulnerability. Please use the workaround linked from the VMSA.

Can I just firewall the vCenter Server instead of patching or using the workaround?
-----------------------------------------------------------------------------------

All customers have different environments and needs. We recommend perimeter firewalls as part of our baseline security guidance, allowing only vSphere Admins into the environment. Whether that is an appropriate workaround for this situation is for vSphere Admins to assess with their information security personnel.

VMware strongly recommends patching vCenter Server to remove the vulnerability itself.

I am using an engineered solution, such as Dell EMC VxRail, HPE SimpliVity, and so on. Is it safe for me to apply either the workarounds or the patch?
------------------------------------------------------------------------------------------------------------------------------------------------------

VMware is proud of the large ecosystem and community our products have, and we feel it is truly an asset to us and to our customers. Unfortunately, we cannot speak to our partners’ solutions, nor would they want us to! We are experts on our own products, not necessarily theirs.

Engineered & integrated solutions like Dell EMC VxRail, HPE SimpliVity, and even VMware Cloud Foundation control their patch levels and configurations as part of their qualification & testing processes. Using security guidance that is not explicitly for that product and product version is never a good idea. While we cover VMware Cloud Foundation in our own VMSA materials, where there are other solutions in play it is essential that you contact those vendors directly for guidance.

My customer is running a specific build of a hot-patch for vSphere. Will they be able to get a new hot patch with the fixes?
----------------------------------------------------------------------------------------------------------------------------

VMware strongly recommends patching to the release listed in the VMSA, or a newer release as full patch releases are cumulative. If you are running a vCenter Server hot-patch and cannot update it is recommended that you follow the workaround instructions in the VMSA.

This advisory and update release is specific to vCenter Server. ESXi is not affected.

How can I give VMware feedback about all of this?
-------------------------------------------------

We like feedback! You telling us that you don't like something, wish something were different, or wish something were added has a powerful impact on the product direction. There are multiple ways to do it. Your Solutions Engineer and/or Account Executive will be able to submit it to the product teams through their suggestions portal. If you are running vSphere 7 you can use the vSphere Client’s feedback feature, found in the upper right corner (the smile emoji), to submit feedback directly to the same portal the account team uses.

Will there be changes to vSphere because of these issues?
---------------------------------------------------------

Absolutely yes, but we cannot comment on product futures publicly. Small improvements can be made as part of patch and update releases. Major changes must be done with a major version release, in order to preserve compatibility with our large product ecosystem and partners.

Is the workaround for VMSA-2021-0010 the same as for the vRealize Operations Manager plugin issue from February?
----------------------------------------------------------------------------------------------------------------

The workaround KB is the same for both security advisories.

Is vSphere Update Manager in vSphere 6.5 and 6.7 affected?
----------------------------------------------------------

No, just vSphere Lifecycle Manager in vSphere 7 (which adopted the VUM name in the plugin name).

Do the patches released for VMSA-2021-0010 contain the fixes for previous VMSAs?
--------------------------------------------------------------------------------

Yes, unless it's specifically noted (such as with a hot-patch) all patches and updates to VMware products are cumulative for security updates.

Some patch releases are designated with an 's' in their version, indicating that they carry only the latest security updates. These security-only patches trail the full patches by one release. For example, the 7.0cs release is 7.0b + current security fixes. 7.0ds is 7.0c + security fixes, etc.

Where possible we encourage customers to apply the full patch, as that patch contains other fixes that improve their environments. Security isn't just confidentiality, it is also integrity and availability.

Can I apply the vSphere patches to a VMware Cloud Foundation deployment without upgrading Cloud Foundation?
-----------------------------------------------------------------------------------------------------------

Please upgrade to the correct Cloud Foundation version using the official bundles and processes outlined in the guidance in the VMSA itself. If that isn't possible please consider using the workaround or other security controls as appropriate.

What vCenter Server builds have these fixes?
--------------------------------------------

Please note that security patches are cumulative (see the question above), so if you are at or above these build numbers the release will contain the fixes for this vulnerability. We strongly urge customers to use the latest updates to all VMware products.

vCenter Server 7.0 Update 2b, vSphere Client build number will say 17958471.

vCenter Server Appliance 6.7 Update 3n, vSphere Client build number will say 18010599.

vCenter Server Windows 6.7 Update 3n, vSphere Client build number will say 18010560.

vCenter Server 6.5 Update 3p, build number 17994927

What other resources are there on this and other security topics?
-----------------------------------------------------------------

*   [VMware Security Advisory VMSA-2021-0010](https://www.vmware.com/security/advisories/VMSA-2021-0010.html) (includes descriptions of the issues and links to the workarounds)
*   [VMware Communities Forum Thread on VMSA-2021-0010](https://via.vmw.com/vmsa-2021-0010-communities) (a great place to ask questions)
*   [VMSA-2021-0010 Questions & Answers](https://via.vmw.com/vmsa-2021-0010-faq) (this document)
*   [VMSA-2021-0010: What You Need to Know](https://via.vmw.com/vmsa-2021-0010-blog) (blogs.vmware.com)
*   [VMware vSphere Security Configuration Guide](https://via.vmw.com/scg) (baseline security best practices for vSphere)
*   [VMware Ports & Protocols Firewalling Guidance](https://ports.vmware.com/home/vSphere-7) (ports.vmware.com)
*   [vSphere, vSAN, and Cloud Foundation Security Content & Links](https://core.vmware.com/security) (core.vmware.com)