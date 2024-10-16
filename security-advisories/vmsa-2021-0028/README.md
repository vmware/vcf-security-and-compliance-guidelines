# VMSA-2021-0028: Questions & Answers about Log4j | VMware
Introduction
------------

VMware has published & updated a security advisory, [VMSA-2021-0028](https://www.vmware.com/security/advisories/VMSA-2021-0028.html), in response to the open-source Java component Log4j vulnerabilities known as CVE-2021-44228, CVE-2021-45046, and CVE-2021-45105. The VMSA will always be the source of truth for what products & versions are affected, the workarounds, and appropriate patches. This document is a corollary to that advisory and contains regular updates, resources, and numerous questions that have been asked regarding this issue in an effort to communicate new information, reduce the need for support calls, and help keep organizations secure.

Because of the ubiquity of the log4j component, the suddenness of these disclosures, and the trend to find more issues once one is discovered, the situation is still developing. Please subscribe to our Security Advisories mailing list (found on the right side of [the VMSA page](https://www.vmware.com/security/advisories/VMSA-2021-0028.html)), subscribe to workaround Knowledge Base articles, and revisit this site for more information. New updates will be made on regular intervals as denoted below.

We also strongly recommend that organizations review the guidance in the context of all workloads and other systems. This issue affects billions of systems, software packages, and devices globally, and attackers are weaponizing these vulnerabilities to spread ransomware, cryptominers, and all manner of malware.

Many questions are answered in the Q&A below. New questions are answered at the end, so please read through or scan the index on the left of the page. Thank you!

Current Update
--------------

**April 4, 2022:** Minor revisions and the inclusion of additional resources.

Next Expected Update
--------------------

Regularly scheduled updates have ended. Future updates will be done as there is new information.

Please subscribe to the VMSA mailing list and the relevant workaround Knowledge Base articles for notification of updates.

Resources
---------

Links to the different resources available:

*   [VMware Security Advisory VMSA-2021-0028](https://www.vmware.com/security/advisories/VMSA-2021-0028.html) (descriptions of the issues and workarounds)
*   [VMSA-2021-0028 Questions & Answers](https://via.vmw.com/vmsa-2021-0028-faq) (common questions & answers)
*   [Guidance to VMware Horizon customers regarding Log4j](https://blogs.vmware.com/euc/2022/01/guidance-to-vmware-horizon-customers-regarding-log4j.html?utm_source=rss&utm_medium=rss&utm_campaign=guidance-to-vmware-horizon-customers-regarding-log4j) (helpful for folks running VMware Horizon & Workspace ONE environments)
    
*   [Virtually Speaking Podcast: What you need to know about Log4J](https://core.vmware.com/blog/virtually-speaking-podcast-what-you-need-know-about-log4j) (a video of the podcast that covers Log4j)
    
*   [VMSA-2021-0028 & Log4j: What You Need to Know](https://via.vmw.com/vmsa-2021-0028-blog) (a blog post with similar content)
*   [Demo: Mitigating Log4Shell (CVE-2021-44228) with NSX](https://blogs.vmware.com/security/2021/12/demo-mitigating-log4shell-cve-2021-44228-with-nsx.html) (using VMware tools to stop these types of attacks)
*   [Log4Shell - Log4j Remote Code Execution (CVE-2021-44228)](https://community.carbonblack.com/t5/Documentation-Downloads/Log4Shell-Log4j-Remote-Code-Execution-CVE-2021-44228/ta-p/109134) (description of this vulnerability from our TAU)
*   [Log in the Shell: An Analysis of Log4Shell Exploitation](https://blogs.vmware.com/security/2021/12/log-in-the-shell-an-analysis-of-log4shell-exploitation.html) (continuing the analysis of these attacks)
*   [VMware Communities Thread On CVE-2021-44228](https://communities.vmware.com/t5/New-Security-Advisory-VMSA-2021/bd-p/2014) (A great place to ask questions)
*   [Investigating CVE-2021-44228 Log4Shell Vulnerability](https://blogs.vmware.com/security/2021/12/investigating-cve-2021-44228-log4shell-vulnerability.html) (information on detecting this issue with VMware Security tools)
*   [CISA.gov Apache Log4j Vulnerability Guidance](https://www.cisa.gov/uscert/apache-log4j-vulnerability-guidance) (a growing collection of resources)
*   [Apache Logging Services Security Vulnerabilities](https://logging.apache.org/log4j/2.x/security.html) (the source for log4j security information)
*   [Tips for Patching VMware vSphere](https://core.vmware.com/tips-patching-vmware-vsphere) (practical advice for ensuring patching success)
*   [VMware vSphere Security Configuration Guide](https://core.vmware.com/security-configuration-guide) (baseline security best practices for vSphere)
*   [VMware Ransomware Resource Center](https://core.vmware.com/ransomware) (discussion around tactics to help prevent, deter, and recover from attacks)
*   [VMware Ports & Protocols Firewalling Guidance](https://ports.vmware.com/) (ports.vmware.com)
*   [Detecting & Preventing CVE-2021-44228 (Log4Shell) with the NSX Distributed IDS/IPS](https://kb.vmware.com/s/article/87156) (using VMware tools to stop these types of attacks)
    
*   [Protect Your Kubernetes Clusters Against Log4Shell](https://blogs.vmware.com/security/2021/12/protect-your-kubernetes-clusters-against-log4shell.html) (using VMware tools to stop these types of attacks)
    

Questions & Answers
-------------------

**This issue is a large one, and there are many questions. We are adding new questions and answers to the end of this document to preserve links into the subsections here. Please use the index on the left side to scan the questions -- the question you have might be near the end!**

### Who is affected?

A VMware Security Advisory will always list the specific supported products and versions that are affected. This situation is developing, and the VMSA will be updated with more information.

Cloud-based VMware services are protected [and operational](https://status.vmware-services.io/). Customers of VMware Cloud on AWS are protected as well. Some customers with overly permissive management gateway firewall rules have had action taken to reduce their exposure from scanning and exploit activity occurring across the Internet. Those affected have seen direct communications from VMware.

### When do I need to act?

Immediately. The ramifications of this vulnerability are serious for any system, especially ones that accept traffic from the open Internet. Because of the suddenness of this “zero-day” disclosure, affected software is still being updated. This gives attackers the advantage.

Organizations that practice change management using the ITIL definitions of change types would consider this an “emergency change.” All environments are different, have different tolerance for risk, and have different security controls and defense-in-depth to mitigate risk, so the decision on how to proceed is up to you. However, given the severity, we strongly recommend that you act.

### Why do I need to act?

CVE-2021-44228 is in an Apache Software Foundation component called "log4j" that is used to log information from Java-based software. It has industry-wide impact. The vulnerability is critical, rated 10 out of 10 on the CVSS 3.1 scoring scale, because it is an unauthenticated remote code execution (RCE) vulnerability. It allows attackers to run commands on affected systems and workloads by simply getting them to log a specific string. The library that does the logging interprets that string as a command, instead of just writing it to the log. For example, an attacker might be able to use a login page, placing the attack string in the username field where they know it will be logged.

Every piece of software that has ever used log4j is potentially vulnerable. VMware uses log4j as well, which is why we have issued [VMSA-2021-0028](http://www.vmware.com/security/advisories/VMSA-2021-0028.html). However, this vulnerability also affects customer workloads. Customers need to assess their entire environment for use of log4j, in both infrastructure and workloads, and remediate it as soon as possible either through patches or workarounds.

The vulnerability was announced suddenly, as a "zero-day" vulnerability, taking the industry by surprise. Normally a vulnerability is reported privately to the software maintainers, who then have time to repair the issue and release an update, so attackers don't gain a temporary advantage. With a zero-day disclosure like this one, attackers have an advantage while software maintainers scramble to develop the fix.

Regardless of the timing, the ubiquitous use of log4j guaranteed the vulnerability would have enormous impact, no matter when it surfaced.

A remote code execution (RCE) vulnerability is where an attacker who can reach the affected software over the network can execute commands on it and bypass the security controls in place. This leaves perimeter and microsegmented firewall controls as the last line of defense until the vulnerability is remediated. Beyond firewalling, most organizations employ good security strategies, such as defense-in-depth, zero trust and isolation, good password and account hygiene, etc. and usually these tactics help immensely when a security vulnerability is disclosed. Every vulnerability disclosure is different, though, and organizations should take steps to proactively & positively confirm that there are no open attack vectors that make them vulnerable.

Knowing that even a failed login to an impacted system or workload can be used as an attack vector, organizations who have placed affected systems and workloads on networks that are directly accessible from the Internet, or even from a wide audience inside their own organization, may not have these lines of defense and should audit their systems for compromise. They should also take steps to implement additional security controls to limit the scope of traffic until a workaround or patch is implemented. Ransomware groups have repeatedly demonstrated to the world that they are able to compromise corporate networks while remaining extremely patient, waiting for a new vulnerability in order to attack from inside a network. This is universally observed behavior throughout the industry and informs our suggestions here. Organizations may want to consider additional security controls and isolation between their IT infrastructure and other corporate networks as part of an effort to implement modern zero-trust security strategies.

### What should I do to protect myself?

First, check [VMSA-2021-0028](http://www.vmware.com/security/advisories/VMSA-2021-0028.html) to ensure you are running an affected version of VMware software. If a workaround or patch is listed, apply it. If not, be sure to check back regularly as new information is being added regularly. Like other software vendors who use log4j in their products, VMware found out about this in a zero-day scenario and is now working nonstop to help protect customers and test updates.

Check your other workloads, too. Log4j is an incredibly popular logging library. It is especially important to protect anything that accepts traffic from the Internet.

You may have other security controls in your environment that can help protect you until you are able to patch. Use network perimeter access controls or NSX IDS/IPS and NDR technologies to detect and contain attacks against your workloads. For Cloud Infrastructure products like VMware vSphere, VMware Cloud Foundation, and VMware Cloud, as well as cloud add-on components like the HCX, Site Recovery Manager, NSX-T, and Cloud Gateway Appliances, we strongly suggest limiting access to management interfaces to only Virtualization Admins. Drive any direct workload management activity through the VM network connections instead of the VM console. This simplifies access control and makes the RDP or ssh management traffic subject to other security controls, such as IDS/IPS and monitoring.

Please ensure that network perimeter access controls are as restrictive as they can be. “Any/any” rules that make system access easy for you also make access easy for attackers and should be avoided.

If you are a VMware Carbon Black customer there is [new intelligence posted to the Community](https://community.carbonblack.com/t5/Threat-Research-Docs/Log4Shell-Log4j-Remote-Code-Execution-CVE-2021-44228/ta-p/109134) with analytics to detect vulnerable libraries on systems.

### Is this being exploited "in the wild?"

Yes, attackers are actively probing for log4j vulnerabilities. Please take immediate action.

### Are there potential solutions or workarounds to this that aren't listed in the VMSA or in this FAQ?

Patching is the only way to remove a vulnerability from an environment, and we strongly recommend that you patch when a patch is available. In the interim it is important to apply the workarounds that are listed in the VMSA. Other workarounds and defenses may be available, depending on the environment, and depending on additional security controls available as part of an organization’s defense-in-depth strategy.

### I have implemented the workaround. After I patch, do I need to roll back the workaround settings?

Specific instructions will be in the workaround Knowledge Base articles, but in general the answer is no. Patching will roll the product forward and accommodate the workaround.

### Can I just firewall the affected products instead of patching or using the workaround?

All organizations have different environments and needs. We recommend perimeter firewalls as part of our baseline security guidance, allowing only Virtualization Admins into the environment. Whether that workaround is appropriate for this situation is for you and your information security staff to assess. In this particular case, perimeter egress firewall rules may help block the malicious LDAP queries that are part of this attack, and if logged could help serve as a warning that a breach is occurring.

Many appliances, such as the vCenter Server Appliance (VCSA), also have firewalling capabilities accessible through the Virtual Appliance Management Interface (VAMI). This firewall can be used to help restrict access and potentially help mitigate vulnerabilities.

An important thing to keep in mind is that curtailing access to vSphere management interfaces will prevent the use of VM consoles. However, just as most organizations wouldn't let everybody in their organization access the physical consoles of servers in the data center, we don't recommend that customers allow everyone access to core infrastructure management. Instead, drive VM and workload management activity towards RDP and SSH direct to the workloads themselves. Done in this way, those management connections are easier to secure (especially with distributed firewalling via NSX-T), monitored more thoroughly (vRealize Log Insight and vRealize Network Insight), and can be directly scrutinized by workload network security controls like IDS and IPS systems.

### I am using a third-party solution, like Dell EMC VxRail, HPE SimpliVity, and so on. Is it safe for me to apply either the workarounds or the patch?

VMware is proud of the robust partner ecosystem and community built around our products, but we cannot speak to our partners’ solutions. Nor would they want us to.

Engineered and integrated solutions like Dell EMC VxRail, HPE SimpliVity, and even VMware Cloud Foundation control their patch levels and configurations as part of their qualification and testing processes. Using security guidance that is not explicitly for that product and product version is never a good idea. While we cover VMware Cloud Foundation in our own VMSA materials, if you also have other solutions in play you should contact those vendors directly for guidance.

### Will there be a patch to VMware Cloud Foundation?

There will be workarounds and patches for all affected products. Please monitor the VMSA and follow the guidance in the linked Knowledge Base articles.

### I have feedback about the products and/or processes, how should I give it to you?

VMware appreciates any and all feedback on our products and processes. You have two great options for feedback. First, if you are using vSphere 7 the vSphere Client provides a feedback mechanism in the upper-right corner (the smiley face, though we realize you may not share that emotion at the moment, and we understand). Click that to submit direct product feedback into a ticketing system that allows us to track and prioritize your suggestions.

Alternately, contact your Account Executive, Solutions Engineer, or Technical Account Manager. They have processes to submit feedback on your behalf into those same systems.

Please help us help you – many features and improvements have been realized because of suggestions made by customers. If we can make life better for you please tell us how.

### Is VMware doing anything about these security issues?

Our product teams always investigate the full impact of a vulnerability on both our products and our environment in order to protect our customers, partners and stakeholders.

### What are the CVE numbers involved in VMSA-2021-0028?

CVE-2021-44228 & CVE-2021-45046

VMware has investigated and has found that the CVE-2021-45105 and CVE-2021-44832 vulnerabilities are not exploitable in VMware products.

### I have external Platform Services Controllers (PSCs). Do they need to be patched or have the workaround applied?

If the VMSA lists vCenter Server as affected then Platform Services Controllers (PSCs), which are based on vCenter Server, will need to be updated. If the PSCs are external (not embedded) they will need to have the patching or workaround processes run on them.

In general, VMware recommends patching Platform Services Controllers first, then vCenter Server.

Embedded Platform Services Controllers are part of the vCenter Server appliance, and those functions will be updated as you update vCenter Server.

### I use vCenter Server HA. Do I need to update the witness node and secondary vCenter Server?

If the VMSA lists vCenter Server as affected then additional HA nodes, which are based on vCenter Server, will need to be updated, either directly or through additional steps. In this case the workaround Knowledge Base article indicates that vCenter Server HA will need to be removed before the workaround steps are applied. The Knowledge Base articles are the source of truth for workarounds, please follow the instructions closely.

### If I patch VMware vCenter Server will that affect running workloads in my cluster?

No. vCenter Server is the management interface to a vSphere cluster. You will lose the ability to manage vSphere briefly during the update, and lose the ability to connect to VM consoles, but the workloads will stay up and running.

Please communicate this to change managers and approval boards, who may not be familiar with vSphere and may believe a patch to be disruptive to workloads.

Patching and restarting other components may have different impacts and should be assessed independently.

### I am running a specific build of a hot-patch for an affected product. Will I be able to get a new hot patch with the fixes?

VMware strongly recommends patching to the release listed in the VMSA, and continue to check for newer releases because full patch releases are cumulative. If you are running a hot-patch and cannot update, it is recommended that you follow the workaround instructions in the VMSA.

### Do I have to patch ESXi hosts?

ESXi is not affected.

### My environment is firewalled and only allows traffic through on port 443/tcp. Am I safe?

Any service, software component, or system that accepts user input that is logged is susceptible to this CVE if it uses log4j to log the interaction. The most likely place is login pages, where the username can be set to the attack string by an attacker, and log4j would record the login attempt. For VMware products, check the VMSA to determine if the product is affected and then mitigate the issue with a workaround or patch. The VMSA is updated regularly as investigations continue.

### It looks like VMware did maintenance on cloud services. How can I see the status of those services and upcoming maintenance activities?

[https://status.vmware-services.io/](https://status.vmware-services.io/) is the status dashboard for VMware Cloud on AWS, which also encompasses many other cloud-based services.

[https://status.workspaceone.com/](https://status.workspaceone.com/) is the status dashboard for VMware Workspace ONE.

[https://status.carbonblack.com/](https://status.carbonblack.com/) is the status dashboard for VMware Carbon Black tools & services.

### I am at vSphere 7 Update 3 or later, can I use the workaround? Will there be a patch?

Yes, the workaround specifies vSphere 7 Update 3 and its variants, which are supported. All affected products that are currently supported will be patched in accordance with our support and lifecycle policies. We are working hard to ensure your next experience with Update 3 is a great one.

### I have extended support on an affected product. How can I get a patch for this?

Please follow the extended support process to request patches and other information.

### Can you tell me when a patch for a specific affected product will be released? We need this to decide if we should use the workaround or wait.

In general, if a patch is available we recommend applying the patch to remove the vulnerability. However, this is an internet-wide critical situation, and time is of the essence. Attackers are working actively to exploit the vulnerability, both across the internet and through access they may have gained inside your organization through a phishing campaign or malware on a compromised desktop. Unless you know with certainty that your environment is not accessible by threat actors, we strongly recommend you use the workarounds right now, both for affected VMware products and for other products in your environments. VMware is not able to comment on future product versions or release dates. We have engineering and support staff working around the clock on these issues.

### Is it possible to use NSX or Carbon Black to detect and block attempts to use this exploit in my environment?

Yes! Please check the [VMware Security Blog](https://blogs.vmware.com/security/2021/12/investigating-cve-2021-44228-log4shell-vulnerability.html) for more information.

### Is there a workaround or patch for vSphere 6.0?

VMware vSphere 6.0 is past the end of general support, and we strongly encourage customers to upgrade to a supported version. If you have an extended support contract please follow that process to request patches and other information. The workaround Knowledge Base article, linked from the VMSA-2021-0028 itself, does include information about vCenter Server 6.0.

### Is there a functional impact to using the workaround on an affected product?

The Knowledge Base articles will indicate if there is a functional impact. In all cases so far the answer is no, but this situation is developing please read each workaround process carefully to ensure that remains true.

### Is VMware vSAN impacted?

VMware vSAN is deeply integrated in VMware vSphere, so recommendations for remediating vCenter Server and ESXi will also remediate vSAN. In this case ESXi is not impacted, but vCenter Server is. Please refer to the Knowledge Base article linked from the VMSA-2021-0028 advisory for information on protecting vCenter Server.

### What does the workaround do? What functionality will be deactivated when I apply the workaround?

The workaround suppresses the LDAP lookup functionality in the log4j logging software built into the product. VMware products do not use this feature and you will not see a change in product functionality as a result this change.

### Why does my vulnerability scanner says that the products are still vulnerable to these exploits?

Many vulnerability scanners look for files matching certain versions, or file hash computations, to determine if the software is vulnerable or not. The workarounds do not replace files, so a file-based scanner may still detect the vulnerability. Future patches and product releases will replace the files with known-good versions.

### Where can I find a list of all uses of log4j in VMware products, including file paths, file hashes, and versions?

If you are assembling an inventory of affected systems for your organization the easiest way to inventory VMware components that are affected is by cross-referencing your asset inventory with the VMSA. Since most VMware software is delivered as an appliance it can be time-consuming to do a direct inventory of file versions yourself, especially since best practices are to leave SSH and other support interfaces disabled. Since time is of the essence you should consider using the VMSA as your reference.

### Are signatures for Log4j attacks part of Carbon Black and NSX suites of tools?

Yes. Customers with NSX IDS/IPS, NTA, NDR, Carbon Black suite of tools, or the NSX Advanced Firewall addon in VMware Cloud are seeing regular signature updates to detect and block attacks coming into their infrastructure and workloads. If you use these products ensure you are updating your signatures. There is also a new KB article on [Detecting & Preventing CVE-2021-44228 (Log4Shell) with the NSX Distributed IDS/IPS](https://kb.vmware.com/s/article/87156).

### Can I manually replace log4j JAR files on product appliances?

We urge folks to use the documented workarounds linked from the VMSA which are tested and supported. Testing and support are important, but the other big benefit is that if you use the workaround, the upcoming patch will know how to undo/fix the workaround so that you don't have any additional work to do.

### Is VMSA-2021-0029 related to Log4j?

No, that advisory is on VMware Workspace ONE UEM consoles and is not related.

### Do I need to remediate on-premises appliances for cloud-based services like HCX, vRealize products, and so on?

Yes. Customers of VMware Cloud and cloud-based services are seeing maintenance notices as we revise the workarounds and protections in the hosted environments. Please make sure that you are auditing and mitigating any on-premises components that you have deployed.

### Is VMSA-2021-0030 related to Log4j?

The patches that were released for products listed in [VMSA-2021-0030](https://www.vmware.com/security/advisories/VMSA-2021-0030.html) include the remediations for Log4j, as noted in the advisory, but address other vulnerabilities as well.

### What is VMware doing about CVE-2021-45105?

A vulnerability identified by CVE-2021-45105 [has been disclosed by the Apache Software Foundation](https://logging.apache.org/log4j/2.x/security.html) that impacts log4j releases prior to 2.17 in non-default configurations. Shortly after this announcement VMware began investigating the potential impact of this vulnerability. At the time of this update, we have not found a valid attack vector to exploit CVE-2021-45105 in any VMware products, but investigations will continue. VMware will update log4j to 2.17 in future releases of our products.

### Will VMSA-2021-0028 be updated for CVE-2021-45105?

VMware has investigated and has found that the CVE-2021-45105 and CVE-2021-44832 vulnerabilities are not exploitable in VMware products.

There is a [note in VMSA-2021-0028](https://www.vmware.com/security/advisories/VMSA-2021-0028.html) that indicates the status of the CVE-2021-45105 investigation. VMware Security Advisories only provide guidance for vulnerabilities that directly impact VMware products and their use.

### Will VMSA-2021-0028 be updated for CVE-2021-44832?

VMware has investigated and has found that the CVE-2021-45105 and CVE-2021-44832 vulnerabilities are not exploitable in VMware products.

There is a [note in VMSA-2021-0028](https://www.vmware.com/security/advisories/VMSA-2021-0028.html) that indicates the status of the CVE-2021-44832 investigation. VMware Security Advisories only provide guidance for vulnerabilities that directly impact VMware products and their use.

Previous Updates
----------------

This is an archive of previous update messages. It may not reflect current guidance. Please use the information in the "Current Update" above, as well as the information in the VMSA itself, for the best & most current view of this situation. Thank you.

### December 17, 2021 - 1830 PST

VMSA-2021-0028.4 was published. Subscribers to the email notifications saw that it had revisions concerning:

VMware Unified Access Gateway  
VMware Carbon Black Workload Appliance  
VMware Site Recovery Manager, vSphere Replication  
VMware Tanzu GemFire  
VMware Tanzu GemFire for VMs  
VMware Tanzu Operations Manager  
VMware Tanzu Application Service for VMs  
VMware Horizon Agents Installer

We've had numerous questions about acknowledging CVE-2021-45046 and the new CVSS score, and the VMSA has both of those listed directly since this morning. Nothing changes about our strategy at this time. We continue pursuing the remediations for these vulnerabilities both as a workaround and as part of product patch releases, and continue urging customers to apply the workarounds everywhere. The work continues at VMware through the weekend.

A continued reminder that Knowledge Base articles can & should be subscribed to, and that you can submit feedback to the Knowledge Base articles as well if you discover something is amiss. This is also true of product documentation, too!

The blog posts had minor updates to the top section, redirecting visitors to this Q&A. We are honored to be linked to from [the CISA.gov Apache Log4j Vulnerability Guidance page](https://www.cisa.gov/uscert/apache-log4j-vulnerability-guidance), which was updated today with new guidance.

We've been asked by some of the community to archive these status updates so people can catch up if they miss an update. So far anything substantial from previous updates has been moved into Q&A format below. The last update from this morning has information about ransomware preparedness, patching tactics, and more of the context behind these vulnerabilities, and we'll leave that posted below for now until we create an archive section.

Over the weekend we are planning to move to one update a day.

That's all for now. Thank you. Please have a safe, secure, and largely uneventful weekend. :)

### December 17, 2021 - 0900 PST

There were overnight changes to the Apache Log4j security advisories. In short, CVE-2021-45046 changed from a CVSS 3.7 denial-of-service attack to a CVSS 9.0 remote code execution, and the VMSA has been updated to reflect that.

The good thing here is that the Apache Software Foundation got ahead of it on Tuesday, December 14 when they revised their workaround guidance. VMware is abiding the December 14 guidance, both with workarounds and in patches being developed and released.

Among other updated workarounds, the [vCenter Server workaround Knowledge Base article has been updated](https://kb.vmware.com/s/article/87081), and there are new Python scripts that automate the workarounds. Please read the instructions. Right now you'll need to have run both scripts on all your vCenter Server instances. Work is going on to unify them, but don't wait. Run the first one, then the second one. Make sure you take a snapshot of vCenter Server, use DRS "should" rules to pin it to a particular ESXi host so you know where to find it to revert the snapshot, and ensure you can log into that ESXi host (root password isn't expired, etc.). We have some [tips on patching vSphere that include these ideas and more](https://core.vmware.com/tips-patching-vmware-vsphere).

This has, and continues to be, a chaotic and evolving situation, for a couple of reasons. In most cases software vendors follow a process called "coordinated disclosure" (sometimes also known as "responsible disclosure") wherein they learn of a vulnerability, work with the security researcher or reporter to understand it, fix it, and release patches and a vulnerability disclosure at the same time the security researcher announces their work. This process can be fast, or it can take a few months, depending on a lot of things. It's nice because, in most cases, it is win/win for everyone. The vulnerability and the resolution appear simultaneously, organizations patch, and the researcher gets credit for their work.

That isn't the case here. Log4j has so successfully scratched an itch in Java software development that it is in use everywhere. This is praise for Log4j, by the way; we at VMware have a deep respect for open-source software and the work needed to maintain it, especially when it’s a piece of software that’s quietly powering so much other software in the world. There wasn't going to be a good & controlled way to tell other software vendors about a vulnerability like this. As such, on December 9 we all learned about this, together. Similarly, on December 14, when the workaround guidance changed, we all learned together, too.

It's good that their December 14 guidance got ahead of the current situation so that most organizations and vendors do not have to change their workaround strategies. However, the short timeframes do speak to some of the chaos that we have been getting feedback about. We understand completely and are working to standardize our guidance, and we appreciate your patience with it. Our priority was to get something out to help customers protect themselves, and with that done our product teams are working to build, test, and ship new updates that close these holes.

Second, when an issue like this arises suddenly there are a lot of eyes on that piece of software. It's normal, and a good thing overall. There's a saying in open source that "many eyes make all bugs shallow." It's true and appears to be happening with Log4j right now. VMware doesn't have any insight into Log4j development, but it's reasonable to think there might be more developments in the future. VMware is working around the clock to watch these things, so we'll react whenever new information or versions appear. You should keep an eye on things over the weekend, too, because this isn't just a VMware situation, it's an "everything everywhere" situation. Please [subscribe to the VMSA mailing list](https://www.vmware.com/security/advisories/VMSA-2021-0028.html) (security-announce@lists.vmware.com) for updates, and set an alarm on your mobile devices to alert you when it sees email from that mailing list.

Last, there are increasing concerns in the information security space about ransomware attacks now and in the coming weeks. A vulnerability like this supplies “cover” for the attackers, as victims will blame Log4j and not dig deeper to find the real source of the breach. Ransomware is the end state of a breach that usually also steals data and secrets. These breaches tend to be hundreds of days long because the attackers need time to exfiltrate data, and to ensure that you’ll pay the ransom by corrupting backups and disabling disaster recovery failover sites. As such, ransomware attacks happening now are the most likely the result of breaches months ago, and your incident response team or consultants need to be thorough in their work to find the entry point. Use of log4j in a ransomware attack now is likely just opportunistic, preying on unpatched & unmitigated systems in an environment to move laterally. This is why every organization needs to apply workarounds to all log4j instances immediately, both in vSphere and in workloads and other systems.

The upcoming holiday weeks will provide an opportunity for attackers to operate without being detected. The most common method of attack against infrastructure systems is through compromised credentials. The most common method of compromising infrastructure admin credentials is by compromising a centralized directory, like Active Directory, which is used by systems for both authentication AND authorization. Using groups to authorize people to log into infrastructure means that a rogue Domain Admin can simply add themselves to that group and log in, at which point they have dangerous levels of access to core infrastructure systems. What is especially tricky is that attackers who are using compromised credentials do not generate failed login messages, so to detect them you need to audit login successes, too.

Your organization should be thinking about this and taking action to make the holiday season a secure one. Do this by auditing access to your systems, seriously restricting access to management interfaces, ensuring that systems like Active Directory are fully patched, and making sure backups are fully isolated and protected. You should also be preparing people and processes for the upcoming time off, so that if something bad happens you know who to call, what your business continuity processes are, and who your incident response team or provider is. We discuss many of these topics and offer practical steps you can take right now our “[Practical Ideas for Ransomware Resilience](https://core.vmware.com/practical-ideas-ransomware-resilience)” paper which is freely available on this site.

That is all for now. Key takeaways here: the change in CVSS score doesn’t change the mitigation strategies, we continue to work on workarounds to ensure they are clear and helpful, we continue to work on releasing product updates, and we urge you to be thinking about preparations for the holiday season.

The Q&A was updated below with new information from previous updates here. The VMSA was updated for the change in CVSS score. Workarounds have been updated and are too numerous to note, please subscribe to the individual articles so you are notified when there is an update. Also note that you can leave feedback on Knowledge Base articles if there is something that concerns you or is unclear!

If you have feedback or questions we ask that you please direct them to your Technical Account Managers and/or account team first if they are not break/fix issues. We appreciate you and are working hard around the clock to help keep you and your environments safe and secure. Thank you.

### December 18, 2021 - 1230 PST

Overnight the Apache Software Foundation [released a third update to their security advisories on Log4j](https://logging.apache.org/log4j/2.x/security.html). This round adds a new vulnerability, CVE-2021-45105, which is a denial-of-service attack under some conditions, and introduces Log4j version 2.17 which resolves these issues. VMware is amidst evaluating this new vulnerability and will update VMSA-2021-0028 with new information as it is available.

We have had questions along the lines of "Will VMware update to Log4j 2.17?" VMware regularly updates open-source components inside our products as new versions ship. As we've noted in previous updates here (which are starting to be archived below), this is a complicated situation. Unlike CVE-2021-44228 and CVE-2021-45046, there are specific configuration conditions to this new vulnerability that keep it from being applicable to all implementations. It is also a denial-of-service, which is serious, but not a critical remote code execution like the first two CVEs. As in all things, context matters, and VMware security engineers are working with our product teams right now to examine each implementation's configuration, examine where each team is in their release cycle, and then determine the best way forward that protects customers fastest and most comprehensively. More to come.

Security processes didn't stop because of VMSA-2021-0028, and there have been two VMSAs released now that address other issues. [VMSA-2021-0029](https://www.vmware.com/security/advisories/VMSA-2021-0029.html) is for the Workspace ONE UEM, and [VMSA-2021-0030](https://www.vmware.com/security/advisories/VMSA-2021-0030.html) is for several products that are or ship the Workspace ONE Access or Identity Manager components. Workspace ONE UEM was not affected by Log4j, but some of the products listed in VMSA-2021-0030 were affected, and the updates contain Log4j 2.16 as noted in the VMSA.

Will those products be re-released with 2.17? As discussed above, the answer to that will depend on if & how they're affected by CVE-2021-45105. Stay tuned.

Should you wait to patch? Only you know the state of your security, whether you've applied workarounds, and whether you have adequate defense-in-depth. However, if the answer to any of these things is "no" or "I don't know" then **do not wait**. If you're asking us then we'll always tell you to patch, because it's a good idea. The first two Log4j CVEs are critical and being actively exploited by cybercriminals to further their attacks on organizations. We don't want that to be you!

VMware Cloud on AWS, Workspace ONE, Carbon Black, and other VMware Cloud services customers are being actively protected with mitigations and patches, installed as part of the VMware commitment to security in the cloud shared responsibility model. Customers will continue to see maintenance notifications where appropriate and can check service status at any time using **[https://status.vmware-services.io/](https://status.vmware-services.io/)** and **[https://status.workspaceone.com/](https://status.workspaceone.com/)** and **[https://status.carbonblack.com/](https://status.carbonblack.com/)**. Some VMware Cloud on AWS customers with overly permissive management gateway firewall rules have had action taken to reduce their exposure from scanning and exploit activity occurring across the Internet. Customers with on-premises components for VMware Cloud & hosted services should review the VMSA to determine if workarounds need to be implemented on those appliances. This includes appliances for hybrid cloud tools like HCX, Cloud Gateway, Workspace ONE Access, and so on.

There are other types of controls that you can place on your networks that can assist in detecting and preventing these types of attacks. Check out the resources section below, especially the links for the NSX IDS/IPS, NDR, NTA and Carbon Black guidance. The [CISA.gov Apache Log4j Vulnerability Guidance](https://www.cisa.gov/uscert/apache-log4j-vulnerability-guidance) page has some terrific analysis, too, and a flowchart for evaluating this situation.

Remember that while VMSA-2021-0028 is a VMware vulnerability, the source of this lies outside VMware products, and that many workloads and other systems need updates and remediations as well. Even at home -- some home networking routers and equipment have updates to address this situation, for example.

The Q&A was updated to add the service status page for VMware Carbon Black services and tools: [https://status.carbonblack.com/](https://status.carbonblack.com/), as well as to reflect that the order in which Platform Services Controllers and vCenter Servers are patched does not matter (beyond availability concerns within your own system design).

No updates to blog posts. A section was added at the bottom of this page for archived updates. In particular, the December 17, 2021, 0900 PST update has some lengthier thoughts on preparing for the upcoming holidays, patching tips, and more which, if you missed it, is worth a few minutes to read.

That is all for now. Thank you. The next update is scheduled for tomorrow but if there is breaking news this page will be updated. Remember to subscribe to the VMSA mailing list for the fastest notification of changes to the VMSA.

I may have cursed us all by wishing everyone an uneventful weekend in the last update, so I'm just signing off with: good luck & stay safe. :) 

### December 19, 2021 - 1230 PST

On Saturday morning the Apache Software Foundation [released a third update to their security advisories on Log4j](https://logging.apache.org/log4j/2.x/security.html) documenting a denial-of-service attack against Log4j as CVE-2021-45105. While it's listed as "high severity" by Apache it is worth noting that CVSS scores are based on worst-case scenarios, and this vulnerability only applies to a "non-default Pattern Layout with a Context Lookup" which limits its applicability in most situations. It [gets its CVSS 7.5 score](https://nvd.nist.gov/vuln-metrics/cvss/v3-calculator?vector=AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) from the fact that it has a high impact on availability, but no impact on confidentiality and integrity, as you would expect from a denial-of-service. Right now from VMware's perspective the outlook is positive, which meshes with the greater information security community's assessment that -45105 appears to be difficult to trigger in real world conditions and has limited effects if it is exploited. That doesn't mean it isn't serious, but adds context when there are multiple issues in play.

There will be more guidance on Monday, December 20th. VMware regularly updates open-source components inside our products as new versions ship, so there will be a path to Log4j 2.17, but we cannot speak to timeframes. VMware security engineers are working with our product teams to examine each implementation's configuration, examine where each team is in their release cycle, and then determine the best way forward that protects customers in supportable ways. More to come.

Focus for everyone with computers in their lives should remain on mitigating & remediating CVE-2021-44228 across all systems and devices, as it is being actively exploited by cybercriminals to further their attacks on organizations.

No Q&A or blog updates this cycle. Stay safe and enjoy the rest of your weekend.

### December 20, 2021 - 1230 PST

A new update has been made to [VMSA-2021-0028](https://www.vmware.com/security/advisories/VMSA-2021-0028.html) to acknowledge CVE-2021-45105, the latest disclosure from the Apache Software Foundation regarding Log4j releases prior to 2.17 in non-default configurations:

"Shortly after this announcement VMware began investigating the potential impact of this vulnerability. At the time of this update, we have not found a valid attack vector to exploit CVE-2021-45105 in any VMware products, but investigations will continue. VMware will update log4j to 2.17 in future releases of our products."

As answered below in the Q&A, VMware does not publish ETAs for future product releases.

Apache's statement that this vulnerability only applies to a "non-default Pattern Layout with a Context Lookup" limits its applicability in most situations. Focus should remain on mitigating & remediating CVE-2021-44228 across all systems and devices, as it is being actively exploited by cybercriminals to further their attacks on organizations. Please implement workarounds for CVE-2021-44228 and CVE-2021-45046, as listed in the VMSA, on all affected systems.

The US Cybersecurity & Infrastructure Security Agency, CISA, [has released a new public service announcement](https://www.cisa.gov/news/2021/12/20/cisa-and-fbi-launch-holiday-cyber-safety-psa) that aligns well with [guidance of ours from last week](https://core.vmware.com/vmsa-2021-0028-questions-answers-faq#sec19214-sub2). Thinking about the upcoming holiday season is important, as attackers will take advantage of opportunities like holidays to work without being discovered. Remember that breaches involving compromised credentials (the most common type of attack against infrastructure) will often not trigger "failed login" alarms, so during the holiday season it will be important to monitor for unusual activity.

No Q&A or blog updates this cycle. As always, please subscribe to the VMSA mailing list and to the relevant KB articles to be notified of updates. Thank you!

### December 21, 2021 - 1230 PST

We continue to get questions about the response to CVE-2021-45105.  Updates to the advisory, including the recently-issued [VMSA-2021-0028.6](https://www.vmware.com/security/advisories/VMSA-2021-0028.html), acknowledge it and provide guidance:

"Shortly after this announcement VMware began investigating the potential impact of this vulnerability. At the time of this update, we have not found a valid attack vector to exploit CVE-2021-45105 in any VMware products, but investigations will continue. VMware will update log4j to 2.17 in future releases of our products."

Apache's statement that this vulnerability only applies to a "non-default Pattern Layout with a Context Lookup" limits its applicability in most situations. VMware doesn't issue security advisories for vulnerabilities that do not affect our products, so -45105 remains as a note in the advisory and not listed at the top. This does not mean we are ignoring it. Quite the opposite, in fact. We examined it and are not vulnerable.

The other big question is "when will a patch be available?" As answered below in the Q&A, VMware does not publish ETAs for future product releases. We are committed to full testing & QA processes for all new releases, and do not want to fix one issue rapidly to cause others. We are aware that some customers have stringent policies around applying patches for critical vulnerabilities. Those types of policies tend to assume that a patch is released at the same time as the vulnerability disclosure, which is true for most situations under the coordinated disclosure model. Unfortunately this is a different situation and more akin to a zero-day (0-day) vulnerability where the vulnerability is disclosed suddenly. In fact, the vulnerability was disclosed suddenly on December 9th, and then five days later on December 14th was suddenly revised, forcing everyone across the IT landscape to start again.

The workarounds that VMware has published conform directly to the Apache Software Foundation guidance for closing these vulnerabilities so they cannot be used by attackers. In regulatory compliance parlance they would be considered a "compensating control." The three fundamental tenets of information security are the CIA Triad: Confidentiality, Integrity, and Availability. Decisions about security should always take all three into account. For example, a decision to shut vCenter Server down may mean better confidentiality, but the loss of monitoring and management may also lead to integrity and availability issues, as well as an inability to respond to a larger system problem. As such, we continue to stress that the workarounds are our recommended path forward for now to restore confidentiality without a loss to other system capabilities.

The Q&A was updated with two new questions about CVE-2021-45105, both to help answer questions and help people doing web searches find something helpful right away. No updates to the blog postings. VMSA-2021-0028.6 updated guidance around vRealize Operations and vRealize Log Insight. As always, please subscribe to the VMSA mailing list and to the relevant KB articles to be notified of updates via email.

As the holidays approach in the US we will continue maintaining these regular updates daily through December 23, and then will likely skip to December 27th. If the VMSA is updated during that time we will update this document as well.

Thank you!

### December 22, 2021 - 1230 PST

VMSA-2021-0028.7 has been published, with updates to a number of products:

VMware HCX  
VMware Telco Cloud Operations  
VMware Smart Assurance M&R  
VMware Harbor Container Registry for TKGI  
VMware vRealize Operations Tenant App for VMware Cloud Director

The email to the VMSA mailing list, security-announce@lists.vmware.com, contains this information. Please subscribe from the VMSA page itself (link is below in the links).

The URL does not change for point updates to the VMSA. The URL for VMSA-2021-0028.7 is the same as the original.

The Q&A below had the question about external Platform Services Controllers (PSCs) clarified. External PSCs are built on the same appliance as vCenter Server, and considered part of the same product, so when a patch or workaround is available for vCenter Server it needs to be applied to the PSCs as well. Embedded PSCs are part of vCenter Server itself and will be patched when you patch those appliances. VMware also recommends patching external PSCs first, so the Q&A was updated to reflect that. It previously stated that for these workarounds the order didn't matter, which is correct, but when patches become available we'd like people to follow the usual guidance.

If you are wondering about CVE-2021-45105 we continue to have statements in the VMSA about them. To date we have not found a vulnerable product, so it is not officially listed in the VMSA except as a note. For more information about this see the December 21 update text below.

The other big question is "when will a patch be available?" As answered below in the Q&A, VMware does not publish ETAs for future product releases. We are committed to full testing & QA processes for all new releases, and do not want to fix one issue rapidly to cause others. We are aware that some customers have stringent policies around applying patches for critical vulnerabilities. Those types of policies tend to assume that a patch is released at the same time as the vulnerability disclosure, which is true for most situations under the coordinated disclosure model. Unfortunately this is a different situation and more akin to a zero-day (0-day) vulnerability where the vulnerability is disclosed suddenly. In fact, the vulnerability was disclosed suddenly on December 9th, and then five days later on December 14th was suddenly revised, forcing everyone across the IT landscape to start again.

The workarounds that VMware has published conform directly to the Apache Software Foundation guidance for closing these vulnerabilities so they cannot be used by attackers. In regulatory compliance parlance they would be considered a "compensating control." The three fundamental tenets of information security are the CIA Triad: Confidentiality, Integrity, and Availability. Decisions about security should always take all three into account. For example, a decision to shut vCenter Server down may mean better confidentiality, but the loss of monitoring and management may also lead to integrity and availability issues, as well as an inability to respond to a larger system problem. As such, we continue to stress that the workarounds are our recommended path forward for now to restore confidentiality without a loss to other system capabilities.

No updates to the blog postings, which are largely static at this point as we update this document. As always, please subscribe to the VMSA mailing list and to the relevant KB articles to be notified of updates via email.

As the holidays approach in the US we will continue maintaining these regular updates daily through December 23, and then will likely skip to December 27th. If the VMSA is updated during that time we will update this document as well.

Thank you!

### December 23, 2021 - 1330 PST

No major updates between the last update and this one, to the VMSA, blog posts, or the Q&A. Over the holidays please subscribe to the VMSA mailing list, security-announce@lists.vmware.com, from the VMSA page itself (link is below in the links), and to the KB articles for products you run.

Barring any breaking news the next update here will be Monday, December 27th. If the VMSA is updated during that time we will update this document as well.

Thank you! We appreciate you and hope you are safe and healthy no matter what you're up to.

### December 27, 2021 - 1230 PST

VMSA-2021-0028.8 was published on December 24th, indicating updates to:

VMware NSX-T Data Center  
VMware Tanzu Greenplum Platform Extension Framework Greenplum Text VMware Tanzu Kubernetes Grid Integrated Edition

No updates to the blog posts or the Q&A. Please subscribe to the VMSA mailing list, security-announce@lists.vmware.com, from the VMSA page itself (link is below in the Links section), and to the KB articles for products you run.

The next update here will be Wednesday, December 29th.

Thank you! We appreciate you and hope you are safe and healthy no matter what you're up to.

### December 28, 2021 - 1330 PST

Unscheduled update: we are receiving questions about the new Apache Software Foundation (ASF) Log4j vulnerability disclosure, CVE-2021-44832, which the ASF lists as CVSS 6.6 with a moderate severity. As with all other disclosures, it is being evaluated by security engineers for applicability and impact on VMware products. If it is found to impact a product then VMware will issue guidance.

Similar to other CVEs disclosed recently by the Apache Software Foundation, this one requires a specific non-default configuration, so it is not generally applicable to all uses of Log4j. Unlike other recent CVEs, this one requires that the attacker modify the Log4j configuration file in order to configure it in a way that allows a remote code execution. Keep in mind that an attacker that has privileged access to a web application's configuration files is already a serious threat.

More to come. Every environment is different so evaluate these disclosures in the context of your own workloads and infrastructure. In general, please continue to focus on the remediations & mitigations for CVE-2021-44228. And, as always, please subscribe to the VMSA mailing list, security-announce@lists.vmware.com, from the VMSA page itself (link is below in the Links section), and to the KB articles for products you run so you receive email when those documents are updated with new information.

### December 29, 2021 - 1230 PST

At this time the newest Log4j vulnerability disclosure from the Apache Software Foundation, CVE-2021-44832, does not appear to impact VMware products directly. Keep in mind that this vulnerability requires a specific non-default configuration which limits its applicability. It also requires that the attacker modify the Log4j configuration file in order to configure it in a way that allows a remote code execution. An attacker that has privileged access to a web application's configuration files is already a serious threat.

Due to the upcoming holidays and rate of change this week the next update will be January 3, 2022. If there are new developments we will update this page. The VMSA itself is always the definitive guide to what is and isn't affected, and the patches & workarounds. Please subscribe to the VMSA mailing list, security-announce@lists.vmware.com, from the VMSA page itself (link is below in the Links section), and to the KB articles for products you run so you receive email when those documents are updated.

### December 31, 2021 - 1230 PST

An unscheduled update, to remind everyone to ensure that the workarounds you've implemented are the current ones. A few days after CVE-2021-44228 was first disclosed the Apache Software Foundation changed their mitigation guidance for CVE-2021-44228 when they disclosed CVE-2021-45046. VMware followed by updating the workarounds with additional guidance that addresses CVE-2021-45046 in addition to CVE-2021-44228. Products which have not been patched or had the **_complete_** current workaround applied may continue to be at risk of compromise by malicious actors. Please double-check to ensure that the procedures you used for mitigation are the current ones. Attackers are actively exploiting CVE-2021-44228 so it is important.

The VMSA itself is always the definitive guide to what is and isn't affected, and the patches & workarounds. Please subscribe to the VMSA mailing list, security-announce@lists.vmware.com, from the VMSA page itself (link is below in the Links section), and to the KB articles for products you run so you receive email when those documents are updated.

For those of you already in 2022, we hope it is going well, and for those still in 2021 please have a great holiday.

### January 3, 2022 - 1400 PST

No updates at this time. Two reminders:

First, please subscribe to the VMSA mailing list, security-announce@lists.vmware.com, from the VMSA page itself (link is below in the Links section), and to the KB articles for products you run so you receive email when those documents are updated. As patches for products are released that will become the preferred way to resolve these issues.

Second,  please ensure that the workarounds you've implemented are the current ones. A few days after CVE-2021-44228 was first disclosed the Apache Software Foundation changed their mitigation guidance for CVE-2021-44228 when they disclosed CVE-2021-45046. VMware followed by updating the workarounds with additional guidance that addresses CVE-2021-45046 in addition to CVE-2021-44228. Products which have not been patched or had the **_complete_** current workaround applied may continue to be at risk of compromise by malicious actors. Please double-check to ensure that the procedures you used for mitigation are the current ones. Attackers are actively exploiting CVE-2021-44228 so it is important.

Thank you.

### January 10, 2022 - 0900 PST

VMware has investigated and has found that the newest two Log4j disclosures, CVE-2021-45105 and CVE-2021-44832, are not exploitable in VMware products. Going forward, new log4j vulnerabilities will continue to be evaluated to determine severity and applicability to VMware products, but will not be referenced in this advisory. VMware products will update open source components (including log4j) to the latest available versions in future releases.

Please ensure that the workarounds you've implemented are the current ones. A few days after CVE-2021-44228 was first disclosed the Apache Software Foundation changed their mitigation guidance for CVE-2021-44228 when they disclosed CVE-2021-45046. VMware followed by updating the workarounds with additional guidance that addresses CVE-2021-45046 in addition to CVE-2021-44228. Products which have not been patched or had the **_complete_** current workaround applied may continue to be at risk of compromise by malicious actors. Please double-check to ensure that the procedures you used for mitigation are the current ones. Attackers are actively exploiting CVE-2021-44228 so it is important.

Updates were made to the VMSA and to the Q&A section here to reflect this news. Updates were made to the Resources section here to reflect new postings on the VMware Security blog and the Virtually Speaking podcast.

### February 10, 2022 - 0900 PST

Updates to the VMSA-2021-0028 were made to reflect the release of product updates that directly address the Log4j vulnerabilities. VMware recommends upgrading to the latest versions of the major release you are on in order to ensure that the Log4j issues are fully resolved.

Not all product releases contain Log4j 2.17.1 or newer at the time of this update. Because VMware has found that our products are not susceptible to the lesser CVE-2021-45105 and CVE-2021-44832 issues we did not postpone the release cycles to include the newer Log4j binaries. The releases that are listed close the critical CVE-2021-44228 and CVE-2021-45046 vulnerabilities. Future releases of VMware products will bring Log4j binaries up to 2.17.1 or newer.

Vulnerability scanners may misidentify VMware products as vulnerable to Log4j when they scan based on file name or binary version number. Results from the scanners should be interpreted and compared against the workarounds in place, or the patch levels listed in the VMSA, to determine actual vulnerable status.

Generally-available VMware product releases are cumulative when it comes to security. Newer releases of supported product versions will contain these updates in addition to whatever is resolved in those releases, too.