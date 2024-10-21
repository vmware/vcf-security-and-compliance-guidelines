# Security & Compliance in VMware Cloud Foundation+ Subscription | VMware
Overview
--------

VMware Cloud Foundation+ Subscription brings the functionality of VMware Cloud to on-premises infrastructure deployments, reducing infrastructure maintenance costs, optimizing operations, and speeding up security response. To enable VMware Cloud Foundation+ Subscription there are communications and permissions changes necessary to support these operations. This document is intended to clarify and document security & compliance differences between traditional deployments and Cloud-enabled environments, document product goals, and answer questions.

Disclaimer
----------

This set of documents is intended to provide guidance for organizations that are considering VMware solutions to help them address compliance requirements. The information contained in this document is for educational and informational purposes only. This document is not intended to provide regulatory advice and is provided “AS IS.” VMware makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of security and regulatory compliance requirements.

Intended Audience
-----------------

This document is intended only for customers deploying and operating VMware Cloud Foundation+ Subscriptions. Security and compliance recommendations are nuanced and may differ between products and releases. Please only use security guidance intended for the specific product and version you are running.

Download the Latest Version
---------------------------

This document will evolve. The most up-to-date version can be found at:

https://core.vmware.com/security-compliance-vmware-cloud-foundation-plus

Goals
-----

VMware Cloud Foundation+ Subscription creates a shared responsibility and security model for on-premises managed Cloud Foundation components. This model intends to:

*   **Minimize friction**. Initial setup will require some opt-in configuration and permissions adjustments but will be kept to a minimum. Users should be able to easily set up, monitor, and revoke permissions when needed.
*   **Limit access**. VMware Support Team will only have access and ability to perform the following operations:
    *   vCenter Server monitoring
    *   SDDC Manager monitoring
    *   VMware will not have access to customer workloads
    *   Only VMware Support teams will have access to specific monitoring data
    *   This data will not be used for any marketing purposes
*   **Promote transparency**. Customers will have visibility into which actions are planned, currently being executed, and have been executed in the past.

Definitions
-----------



* Term: Site Reliability Engineer (SRE)
  * Definition: VMware staff that use software engineering practices while solving IT infrastructure and operations problems. At VMware, these people conduct the day-to-day operations for VMware Cloud and vSphere Cloud.
* Term: VMware vCenter Server (vC)
  * Definition: VMware vCenter Server is the centralized server management console for controlling vSphere environments. It is delivered as a virtual appliance.
* Term: VMware vCenter	Cloud Gateway
  * Definition: The vCenter Cloud Gateway is a virtual appliance enables hybrid cloud use cases where on-premises resources are connected to cloud resources.
* Term: VMware Hypervisor	(ESXi)
  * Definition: The VMware Hypervisor, ESXi, enables virtualization of servers to consolidate applications and workloads while increasing their manageability. ESXi runs on bare metal.
* Term: VMware vSphere
  * Definition: VMware vSphere is the combination of ESXi and vCenter Server that enables advanced functionality and manageability in the software-defined data center.
* Term: VMware vSphere+	Subscription
  * Definition: VMware VMware vSphere+ Subscription is the version of vSphere that also includes the vCenter Cloud Gateway, allowing hybrid manageability of on-premises deployments.
* Term: VAMI
  * Definition: Virtual Appliance Management Interface (VAMI) is the web interface for vSphere Administrators to configure and maintain VMware products that are delivered as appliances.
* Term: VMware Cloud Foundation
  * Definition: VMware Cloud Foundation is a combination of the following products integrated to provide customers with a simple way to create, operate and run private clouds in customer datacenters. The components include:SDDC ManagervSpherevSANNSXOptional vRealize components
* Term: VMware Cloud Foundation+ Subscription
  * Definition: VMware VMware Cloud Foundation+ Subscription is the version of Cloud Foundation that also includes the vCenter Cloud Gateway, allowing hybrid manageability of on-premises deployments.


Product Changes to Support VMware Cloud Foundation+ Subscription
----------------------------------------------------------------

Users and organizations will continue to access SDDC Manager, vCenter Server, and ESXi hosts with no change. All current integrations such as plugins into vCenter, APIs, CLIs will continue to perform as they would in a typical on-premises configuration.

There are two aspects to Cloud Foundation+ Subscription: Subscribing Cloud Foundation deployments to Cloud Foundation+ and enabling SDDC Manager for lifecycle management.

### Subscribing Cloud Foundation Deployments to Cloud Foundation+

In order to subscribe a Cloud Foundation deployment to Cloud Foundation+ customers must:

1.  Download, install, and configure a vCenter Cloud Gateway.
2.  Connect and authenticate to VMware Cloud using HTTPS (443/tcp).
3.  Register SDDC Manager and vCenter Server with the Cloud Gateway. vCenter Server credentials are never sent to the VMware Cloud.
4.  Click on "Subscribe" in the VMware Cloud portal for the vCenter Server, which then activates vSphere+ services for that Cloud Foundation deployment.

To perform these actions Cloud Foundation+ Subscription creates new vCenter Server user accounts:



* Purpose: Licensing
  * User: license-service-admin
  * Group: LicenseService.Administrators
  * Privileges: Read-only role for inventory and licensing operations
* Purpose: Configuration Management
  * User: system-config-admin
  * Group: SystemConfiguration.Administrators
  * Privileges: Read-only role to collect vCenter Server configuration data
* Purpose: Statistics Collection
  * User: vstats-admin
  * Group: vStatsGroup
  * Privileges: Read-only role to collect vCenter Server performance data
* Purpose: Log Collection
  * User: syslog-admin
  * Group: SyslogConfiguration
  * Privileges: Read-only role to collect vCenter Server log data


### Enabling Cloud Foundation+ Simplified Lifecycle Management

Customers that intend to use the optional simplified vCenter Server lifecycle management will have two additional accounts created with the following privileges. These accounts are created in vCenter Server only. There are no changes to SDDC Manager.


|Purpose                   |User        |Group                             |Privileges      |
|--------------------------|------------|----------------------------------|----------------|
|Lifecycle, Backup, Restore|arctic_admin|Administrators                    |Admin Privileges|
|Backup                    |backup-admin|SystemConfiguration.administrators|Admin Privileges|


Connections to VMware Cloud Services
------------------------------------

Initial connections will need to be made between on-premises instances and VMware Cloud services using credentials for VMware Cloud. Customers will need to create an account for VMware Cloud (console.cloud.vmware.com) prior to being able to connect.

A temporary authorization code will be generated on the Cloud Gateway Appliance to identify and verify it to the VMware Cloud services.

Questions & Answers
-------------------

### Does VMware Cloud Foundation+ Subscription use VMware Cloud services?

Yes, the VMware Cloud Foundation+ Subscription offering connects to services that are part of VMware Cloud.

### Do VMware Cloud services have regulatory compliance information available?

The VMware Cloud Trust Center is a collection of information about security, privacy, compliance, and resiliency for the VMware Cloud services. You can find it at:

[https://www.vmware.com/products/trust-center.html](https://www.vmware.com/products/trust-center.html)

### Does VMware Cloud Foundation+ Subscription require a VPN to the public cloud?

No. Data is transmitted over standard TLS-encrypted connections from the vCenter Cloud Gateway to the VMware Cloud, on outbound TCP port 443 only. SDDC Manager and vCenter Servers are connected to vCenter Cloud Gateway and not directly to the Internet. There is no impact to SDDC Manager, vCenter Server, ESXi host, and/or VM connectivity. ESXi hosts continue to be connected only to vCenter Server. There is no need for vCenter Cloud Gateway to connect with ESXi hosts or your virtual machines. All communication is between vCenter Server through vCenter Cloud Gateway to VMware Cloud.

### Do I need to place my vCenter Server or SDDC Manager on the Internet for this service?

No. VMware always recommends practicing defense-in-depth by maintaining layers of independent security controls. To that end, please do not place SDDC Manager, vCenter Server, ESXi, storage, network, or other management interfaces directly on the public Internet.

### Will my workloads continue to run if my Internet connection is offline?

Yes, Cloud Foundation and workloads continue to operate if the Internet connection is offline (providing that those workloads do not require that network connection, of course).

### How much network latency is supported between my environment and the Cloud Foundation+ Subscription Services?

vCenter Cloud Gateway to the VMware Cloud should be 250 ms or less.  
vCenter Cloud Gateway to vCenter Server should be 250 ms or less.

### What connections does VMware Cloud Foundation+ make to VMware Cloud services?

Connections to VMware Cloud services are through the vCenter Cloud Gateway, which is an appliance deployed on-premises that aggregates and centralizes interactions with the Cloud services. The cloud gateway requires the ability to connect to the following URLs via HTTPS (443/tcp):

*   vmc.vmware.com (registration & connection to services)
*   console.cloud.vmware.com (registration & connection to services)
*   docker.vmc.vmware.com (container registry supporting service deployment & updates on the Cloud Gateway)
*   vcgw-updates.vmware.com (updates for the Cloud Gateway appliance)

A more complete inventory of firewall ports can be found at [https://ports.vmware.com/](https://ports.vmware.com/)

### What operating system(s) does the vCenter Cloud Gateway run on?

VMware ESXi, and products deployed as appliances are atomic units, supported in full by VMware, and managed and patched as a single entity. VMware does not support management or changes to the appliances outside of published APIs and user interfaces. This includes changes to the hardware compatibility of the appliance, sizing of the appliance, and changes to the internal configurations of the appliance except when done through supported product management interfaces like the VAMI.

Other interfaces, like SSH and the appliance shell/DCUI, are present for troubleshooting and support purposes. These support interfaces are shipped in a deactivated state and intended only for use as directed by VMware Global Support Services (GSS). When support and troubleshooting is concluded they should be returned to a deactivated state.

This delivery model is akin to that of a network switch, firmware to be updated as a single image, rather than an installed application. We encourage users to list the products as their own operating system in their organizational asset inventories, as they would with a network or SAN switch firmware. For example, the operating system for vCenter Server 7 would be “VMware vCenter Server 7.” This helps prevent misunderstandings about updates, patching, and support boundaries during audits and vulnerability assessment and remediation.

### Do I need to install the VMware vCenter Cloud Gateway?

Yes, the gateway is what connects Cloud Foundation to Cloud Foundation+.

### Does the VMware vCenter Cloud Gateway need to be on the Internet?

No. It should be placed behind your perimeter firewalls.

### Are passwords & sensitive information transmitted to VMware Cloud?

No. VMware Cloud Foundation+ administrators will only need to enter usernames and passwords on the Cloud Gateway appliance to create the connections to the VMware Cloud and to the on-premises SDDC Manager and vCenter Servers. This authentication information is never sent to the cloud.

### How will users be informed of security vulnerabilities and disclosures?

VMware has a robust process for handling security issues, following the industry-standard “responsible disclosure” model. When security vulnerabilities are disclosed to users it will be as a VMware Security Advisory (VMSA) and will be posted at:

[https://www.vmware.com/security/advisories.html](https://www.vmware.com/security/advisories.html)

We strongly urge all VMware customers to subscribe to the VMSA mailing list, found on the link above.

### What types of data are collected and sent to VMware Cloud?

VMware will collect product data required to manage the respective VMware Cloud Foundation+ Subscription deployments.

### How is customer data protected?

VMware has implemented technical, administrative, and organizational safeguards to ensure a least-privilege style of access to the information collected. All VMware employees must receive training and obtain certification for responsible use and handling of collected data.

### Who has access to VMware Cloud Foundation+ Subscription data?

Data is accessible on a need-to-know basis to employees who perform support and management activities on VMware Cloud Foundation+ services inside VMware Cloud. The tools, processes and teams are same as our current Support methods for any VMW products and services. Data can be shared across VMware teams to enable cross-product correlation and analysis. VMware employees must complete product usage data training and receive management approval prior to gaining access to the data.

### Will VMware share data with third parties?

Data is not shared with partners or third parties.

### Does VMware have data retention processes?

Data is kept only if needed for specific, defined uses, and no longer than necessary for these purposes.

### This document does not contain information about security hardening for VMware Cloud Foundation+. Where can I find guidance on that?

VMware publishes the vSphere Security Configuration Guide which serves as the baseline for security hardening. The recommendations apply to VMware Cloud Foundation+ as well. You can find the latest copy at:

[https://via.vmw.com/scg](https://via.vmw.com/scg)

In all cases, whether traditional Cloud Foundation or modern VMware Cloud Foundation+ deployments, we strongly recommend applying the latest product patches, employing strong access control technologies like multifactor authentication (MFA), and practicing least-privilege and zero trust by restricting access to hardware, appliance, and Cloud Foundation management interfaces.

Data Transmitted to VMware Cloud
--------------------------------



* Data Type: vCenter Server & SDDC Manager Inventory
  * Data Fields: Names of all vSphere objects managed by that vCenter Server, including vCenter Server itself, VMs, hosts, clusters, datastores, etc.Events & Alarms pertaining to vSphere objects.IP addresses of vCenter Server and hosts on which vCenter Server is runningVersion information for vSphere objects such as patch levels and virtual hardware version information for workloads.Cloud Foundation instance names, Cloud Foundation management and workload domain inventory information.If vSAN+ is enabled then vSAN datastore inventory information is collected.
  * Frequency Transmitted: 24 hours
* Data Type: Log Data
  * Data Fields: Support bundles from vCenter Server and the vCenter Cloud Gateway.
  * Frequency Transmitted: Continuous
* Data Type: Performance Data
  * Data Fields: Performance and scale data pertaining to vCenter Server and ESXi hosts, such as CPU usage, memory, storage statistics, etc.
  * Frequency Transmitted: 5 minutes
* Data Type: Consumption Data
  * Data Fields: CPU and CPU Core usage and allocation for metering and billing purposes
  * Frequency Transmitted: 15 minutes
* Data Type: Feature Usage
  * Data Fields: Telemetry for feature usage and activation within vSphereMetrics for UI and API activity
  * Frequency Transmitted: 5 minutes
* Data Type: Entitlement
  * Data Fields: At first subscription vCenter Server is entitled, and in turn entitles ESXi hosts
  * Frequency Transmitted: As necessary


Certifications
--------------

The following certifications are present with evidence available through your account team:

*   CSA CAIQ
*   ISO 27001
*   ISO 27017
*   ISO 27018
*   AICPA SOC2

Additional compliance work is in progress for PCI DSS, SOC2 Type 2, SOC3, DoD, and FedRAMP.