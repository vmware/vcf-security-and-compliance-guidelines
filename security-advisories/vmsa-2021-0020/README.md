# VMSA-2021-0020: Questions & Answers
Questions & Answers
-------------------

### Who is affected?

The VMware Security Advisory will always list the specific supported products and versions that are affected. In this case it is vCenter Server 6.5, 6.7, and 7.0.

### When do I need to act?

Immediately, the ramifications of this vulnerability are serious.

With the threat of ransomware looming nowadays the safest stance is to assume that an attacker may already have control of a desktop and a user account through the use of techniques like phishing or spearphishing, and act accordingly. This means the attacker may already be able to reach vCenter Server from inside a corporate firewall, and time is of the essence.

Organizations that practice change management using the ITIL definitions of change types would consider this an “emergency change.” All environments are different, have different tolerance for risk, and have different security controls & defense-in-depth to mitigate risk, so the decision on how to proceed is up to you. However, given the severity, we strongly recommend that you act.

### Why do I need to act?

The VMSA outlines several issues that are resolved in this patch release. The most urgent addresses CVE-2021-22005, a file upload vulnerability that can be used to execute commands and software on the vCenter Server Appliance. This vulnerability can be used by anyone who can reach vCenter Server over the network to gain access, regardless of the configuration settings of vCenter Server.

The other issues have lower CVSS scores but still may be usable to an attacker that is already inside your organization’s network. One of the biggest problems facing IT today is that attackers often compromise a desktop and/or user account on the corporate network, and then patiently & quietly use that to break into other systems over long periods of time. They steal confidential data, intellectual property, and at the end install ransomware and extort payments from their victims. Less urgent security vulnerabilities can still be potential tools in the hands of attackers, so VMware always recommends patching to remove them.

Most organizations employ good security strategies, such as defense-in-depth, zero trust and isolation, good password & account hygiene, etc. and these tactics help immensely when a security vulnerability is disclosed.

A remote code execution (RCE) vulnerability is where an attacker who can reach the affected software over the network (in this case vCenter Server) can execute commands on it and bypass the security controls in place. This leaves perimeter firewall controls, and vCenter Server VAMI firewall controls, as the last line of defense against this issue until it is remediated.

Organizations who have placed their vCenter Servers on networks that are directly accessible from the Internet may not have that line of defense and should audit their systems for compromise. They should also take steps to implement more perimeter security controls (firewalls, ACLs, etc.) on the management interfaces of their infrastructure.

Organizations who do have perimeter security controls on their virtualization infrastructure management interfaces may still be in jeopardy. Ransomware gangs have repeatedly demonstrated to the world that they are able to compromise corporate networks while remaining extremely patient, waiting for a new vulnerability in order to attack from inside a network. This is not unique to VMware products, but it does inform our suggestions here. Organizations may want to consider additional security controls and isolation between their IT infrastructure and other corporate networks as part of an effort to implement modern zero-trust security strategies.

### What should I do to protect myself?

First, check the VMSA to ensure you are running an affected version of vCenter Server. Organizations that updated to vCenter Server 7.0 Update 2c, for instance, may not be vulnerable to the critical vulnerability.

If you can patch vCenter Server, do it. In general, this is the fastest way to resolve this problem, doesn’t involve editing files on the vCenter Server Appliance (VCSA), and removes the vulnerabilities completely. Patching also carries less technical debt and less risk than using a workaround.

If you can’t patch right away there are workarounds linked from the VMSA for the critical vulnerability, but only the critical vulnerability. This involves editing a text file on the VCSA and restarting services and is documented as part of the VMSA link above.

You may have other security controls in your environment that can help protect you until you are able to patch. Using network perimeter access controls or the vCenter Server Appliance firewall to curtail access to the vCenter Server management interfaces, for example. We always strongly suggest limiting access to vCenter Server, ESXi, and vSphere management interfaces to only vSphere Admins. Drive all other workload management activity through the VM network connections. This simplifies access control and makes the RDP or ssh management traffic subject to other security controls, such as IDS/IPS and monitoring.

In this era of ransomware it is safest to assume that an attacker is already inside your network somewhere, on a desktop and perhaps even in control of a user account, which is why we strongly recommend declaring an emergency change and patching as soon as possible.

### Is this being exploited "in the wild?"

VMware has confirmed reports that CVE-2021-22005 is being exploited in the wild.

### Can I deactivate CEIP to resolve these issues?

Deactivating CEIP will not be effective in preventing exploitation of vulnerabilities in the CEIP (analytics) service. Customers should be advised to review KB85717 to implement an effective (but temporary) workaround to prevent exploitation of known vulnerabilities in the CEIP service without functionality impact.

This workaround is only meant to be a short-term protection to prevent exploitation of the most severe vulnerability in VMSA-2021-0020 while upgrades to fixed releases are performed. Upgrades need to be performed as quickly as possible, the workaround should NOT be relied upon as a long-term remediation strategy.

### Can I use the vSphere Client UI to deactivate the affected services?

Deactivating CEIP through the UI & API does not mitigate these vulnerabilities. Please patch vCenter Server or use the workaround until you can patch. We strongly suggest applying the patch as soon as possible.

### If I don't use CEIP am I still affected?

Yes.

### Are all the issues in VMSA-2021-0020 mitigated by the workaround?

No, only the critical vulnerability (CVE-2021-22005) is mitigated. Customers should assess the other issues and determine if applying the workaround is sufficient or if they need to patch. When in doubt we urge customers to apply the patch and close the vulnerabilities as soon as possible.

### If the workaround does not resolve the other issues am I still vulnerable?

All vulnerabilities, even ones with lower CVSS scores, are tools in the hands of attackers. We urge customers to patch vCenter Server immediately.

### Why don't you have a workaround for the other vulnerabilities?

VMware issues workarounds only for critical vulnerabilities, when possible.

At best, workarounds are temporary solutions to buy a short amount of time until patching can commence. They rely on editing files and changing vSphere in ways that are not intended and might cause serious issues if errors are made. Workarounds also tend to be more challenging for vSphere Admins who do not have deep UNIX experience. Just using UNIX text editors can be a challenge.

Patching vCenter Server is much more straightforward, can be done via API or UI, does not introduce human error, does not create other operational concerns, and should already be an established process in an organization.

### If I use the workaround does it need to be applied to Platform Services Controllers (PSCs)?

Yes, the Platform Services Controllers (PSCs) are considered part of vCenter Server and need the workaround applied as well.

### Does vSphere 7 Update 3 contain these security fixes?

Yes, all update and patch releases to vSphere are cumulative when it comes to security. When you apply a newer patch you get all the older security updates, too.

Note that vSphere 7 Update 3 has been announced, but is not yet generally available. You can read more about what is in it at: [https://core.vmware.com/blog/vsphere-7-update-3-whats-new](https://core.vmware.com/blog/vsphere-7-update-3-whats-new)

### Does the patch and/or the workaround apply to Windows-based vCenter Server installs?

Yes, Windows-based vCenter Servers are affected by this as well.

### Does the workaround impact vSAN Health or Skyline Health for vSphere?

No, the workaround allows those services to continue providing proactive advice to customers.

### Do I have to patch ESXi hosts?

While we recommend staying current on updates for all products, this vulnerability only affects vCenter Server.

There is a corresponding update to ESXi as part of this release that contains the latest bug fixes. In keeping with traditional vSphere patching guidelines always patch vCenter Server (and Platform Services Controllers) first. In this case that will mitigate the immediate threats.

### Are there potential solutions or workarounds to this that aren't listed in the VMSA or in this FAQ?

Patching is the only way to remove a vulnerability from an environment, and we strongly recommend that patching of vCenter Server happen. The VMSA & Knowledge Base article outline workarounds that are supported by VMware. Other, temporary workarounds may be available, depending on the environment, and any additional security controls available as part of an organization’s defense-in-depth strategy.

### I have implemented the workaround. After I patch, do I need to roll back the workaround settings?

No – the patch will update what the workaround changes.

### Will the patch re-enable the services?

Yes, those services are intended to be operational in the product and will be re-enabled.

### Can I just firewall the vCenter Server instead of patching or using the workaround?

All organizations have different environments and needs. We recommend perimeter firewalls as part of our baseline security guidance, allowing only vSphere Admins into the environment. Whether that is a proper workaround for this situation is for you and your information security staff to assess.

The vCenter Server Appliance (VCSA) has firewalling capabilities, accessible through the Virtual Appliance Management Interface (VAMI). This firewall can be used to help restrict access to vCenter Server and potentially help mitigate vulnerabilities such as these.

The biggest issue most environments have when curtailing access to vSphere management interfaces is that this prevents use of VM consoles. However, just as most organizations wouldn't let everybody in their organization access the physical consoles of servers in the data center, we don't recommend that customers allow everyone access to core infrastructure management. Instead, drive VM & workload management activity towards RDP & SSH direct to the workloads themselves. Done in this way, those management connections are easier to secure (especially with distributed firewalling via NSX-T), monitored more thoroughly (vRealize Log Insight & vRealize Network Insight), and can be directly scrutinized by workload network security controls like IDS & IPS systems.

### I am using a third-party solution, like Dell EMC VxRail, HPE SimpliVity, and so on. Is it safe for me to apply either the workarounds or the patch?

VMware is proud of the large ecosystem and community our products have, and we feel it is truly an asset to us and to our customers. Unfortunately, we cannot speak to our partners’ solutions, nor would they want us to! We are experts on our own products, not necessarily theirs.

Engineered & integrated solutions like Dell EMC VxRail, HPE SimpliVity, and even VMware Cloud Foundation control their patch levels and configurations as part of their qualification & testing processes. Using security guidance that is not explicitly for that product and product version is never a good idea. While we cover VMware Cloud Foundation in our own VMSA materials, where there are other solutions in play it is essential that you contact those vendors directly for guidance.

### Will there be a patch to VMware Cloud Foundation?

Yes, please follow the guidance in the VMSA and KBs.

### The VMSA says that the critical vulnerability was fixed for vSphere 7 in 7.0 U2c, which was released earlier. If I'm running that am I safe?

If you are running the fixed version, or a newer version, of the affected components you would be safe from that specific vulnerability.

This VMSA has multiple vulnerabilities in it so we urge customers to carefully examine the list to determine their exposure and need for patching.

### Does vCenter Server 7.0.2 U2d contain all the fixes that are in 7.0.2 U2c?

Yes, unless it's specifically noted (such as with a hot-patch) all patches and updates to VMware products are cumulative for security updates.

Some patch releases are designated with an 's' in their version, indicating that they carry only the latest security updates. These security-only patches trail the full patches by one release. For example, the 7.0cs release is 7.0b + current security fixes. 7.0ds is 7.0c + security fixes, etc.

Where possible we encourage customers to apply the full patch, as that patch contains other fixes that improve their environments. Security isn't just confidentiality, it is also integrity and availability (the CIA Triad!).

### There are gaps between when the fixes for these issues shipped and when the vulnerability was disclosed. Why don’t you tell customers immediately?

There is a process & model among security professionals and technology vendors called “responsible disclosure.” In this model, security researchers and vendors agree that the vendor needs a reasonable amount of time to repair the issue. Once the fix is publicly available everyone can talk about it.

When a security researcher discloses an issue publicly then attackers will start using it. This model lets the forces of good have a chance to do something about it first, while still ensuring that the researcher gets credit for their work and that there is balance maintained by ensuring that the entire community has access to this information (not just threat actors).

VMware is just one of many companies that participate in this disclosure model, and you can see evidence of it throughout the industry.

 The process to resolve a vulnerability can be short or long and depends on many different factors. The severity of the issue, the complexity of a fix, whether there is a known exploit “in the wild,” and where we stand in a product release cycle are just some of the factors that influence timing of this. Vulnerabilities are disclosed by VMware when all of the supported product release versions have shipped a fix.

### I have feedback about the products and/or processes, how should I give it to you?

VMware appreciates any and all feedback on our products and processes. You have two great options for feedback. First, if you are using vSphere 7 the vSphere Client has a feedback mechanism in the upper-right corner (the smiley face, though we realize you may not share that emotion at the moment, and we understand). Click that and it allows you to submit direct product feedback into a ticketing system that allows us to track and prioritize your suggestions.

Alternately, contact your Account Executive, Solutions Engineer, or Technical Account Manager. They have processes to submit feedback on your behalf into those same systems.

Please help us help you – many features and improvements have happened because of suggestions made by customers. If we can make life better for you please tell us how.

### Is VMware doing anything about these security issues?

Our product teams always look at the situation surrounding a vulnerability to see why the issue wasn’t caught as part of our secure development processes. We make improvements to our own processes that help future releases.

VMware has typically been focused on product security capabilities, and generally avoided prescriptive or opinionated statements on how folks should run their businesses. Security is a very process-driven field, though, and by not explicitly showing best practices we have left a gap for many customers who are not as security-knowledgeable as they might need to be nowadays. We are working to fix that with more prescriptive guidance, which is already apparent in the updates to the [vSphere Security Configuration Guide](https://bit.ly/vcf-scg).

### Will there be changes to vSphere because of these issues?

Absolutely yes, but we cannot comment on product futures publicly. Smaller improvements can be made as part of patch and update releases. Major changes must be done with a major version release, in order to preserve compatibility with our large product ecosystem and partners.

### I am running a specific build of a hot-patch for vSphere. Will I be able to get a new hot patch with the fixes?

VMware strongly recommends patching to the release listed in the VMSA, or a newer release as full patch releases are cumulative. If you are running a vCenter Server hot-patch and cannot update it is recommended that you follow the workaround instructions in the VMSA.

This advisory and update release is specific to vCenter Server. ESXi is not affected.

### Do the patches released for VMSA-2021-0020 contain the fixes for previous VMSAs?

Yes, unless it's specifically noted (such as with a hot-patch) all patches and updates to VMware products are cumulative for security updates.

Some patch releases are designated with an 's' in their version, indicating that they carry only the latest security updates. These security-only patches trail the full patches by one release. For example, the 7.0cs release is 7.0b + current security fixes. 7.0ds is 7.0c + security fixes, etc.

Where possible we encourage customers to apply the full patch, as that patch contains other fixes that improve their environments. Security isn't just confidentiality, it is also integrity and availability.

### If I patch VMware vCenter Server will that affect running workloads in my cluster?

No. vCenter Server is the management interface to a vSphere cluster. You will lose the ability to manage vSphere briefly during the update, and lose the ability to connect to VM consoles, but the workloads will stay up and running.

This is an important thing to note to change managers and approval boards, who may not understand vSphere and may believe a patch to be disruptive to workloads.

### Can I apply the vSphere patches to my VMware Cloud Foundation deployment without upgrading Cloud Foundation?

Customers need to upgrade to the correct VCF version using the official VCF bundles and processes. If that isn't possible please consider using the workaround or other security controls as appropriate. Please use the process outlined in the VMSA and KB articles.

### What builds have these fixes?

Please use the VMSA to determine the product versions you need.

### I am amidst an upgrade to vSphere 7. Will these updates cause a "back in time" release restriction issue for the upgrade?

This particular update does not cause a "Back in Time" upgrade issue.

More information about "back in time" issues and the compatibility matrix can be found at [https://kb.vmware.com/s/article/67077](https://kb.vmware.com/s/article/67077).

### What are the CVE numbers involved in VMSA-2021-0020?

The VMSA is the definitive guide to the CVEs and CVSSv3 severity scores.

CVE-2021-21991, CVE-2021-21992, CVE-2021-21993, CVE-2021-22005, CVE-2021-22006, CVE-2021-22007, CVE-2021-22008, CVE-2021-22009, CVE-2021-22010, CVE-2021-22011, CVE-2021-22012, CVE-2021-22013, CVE-2021-22014, CVE-2021-22015, CVE-2021-22016, CVE-2021-22017, CVE-2021-22018, CVE-2021-22019, CVE-2021-22020

### I have external Platform Services Controllers (PSCs). Do they need to be patched?

Yes, Platform Services Controllers (PSCs) are considered part of vCenter Server and must be updated before vCenter Server.

### I use vCenter Server HA. Do I need to update the witness node and secondary vCenter Server?

Yes, those are all considered part of vCenter Server and should be updated any time a vCenter Server patch is applied.