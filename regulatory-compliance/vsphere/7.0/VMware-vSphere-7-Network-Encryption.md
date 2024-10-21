# Network Encryption in VMware vSphere 7

VMware is often asked if all network communications from vSphere, vSAN, Cloud Foundation, and Cloud are encrypted. VMware intends that vSphere, vSAN, Cloud Foundation, and Cloud all are secure by default, as deployed initially. This includes network security. However, most implementation decisions are done by customers and their partners, and it is possible, and sometimes even desirable, to configure products to communicate using unencrypted protocols. This short document is intended to help customers understand the issue and supply a response to questions like those found on compliance and security questionnaires.

Default Configuration
---------------------

In its default configuration, VMware vSphere 7 encrypts all internal cluster management network traffic using TLS 1.2. This includes communications between the administrators and the vSphere Client, the vSphere Client and vCenter Server, communications between vCenter Server and ESXi hosts, and default communications between ESXi hosts for vSphere HA, DRS, Content Library, vSphere Replication, vSphere Trust Authority, and Lifecycle Manager. Customers cannot disable these types of secure communications without altering the product in unsupported ways.

Unencrypted Protocols
---------------------

vSphere can be configured to use communications protocols that are unencrypted, though not recommended unless needed. Examples of this include, but are not limited to:

*   Use of LDAP, but not LDAPS, to communicate with an authentication source,
*   Use of SNMP version 1 or 2 for monitoring ESXi,
*   Use of Fibre Channel, iSCSI, or NFS to connect to storage resources,
*   Use of SMTP to send email alerts,
*   Use of vSAN without enabling vSAN data-in-transit encryption,

and so on. The use of these protocols is a design decision, and secure alternatives and compensating controls are available in all cases.

Virtual Machines and Workloads
------------------------------

For unencrypted virtual machines, VMware vMotion and VMware vSphere Fault Tolerance are configured by default on a per-VM basis for “opportunistic” encryption. This means that on computing hardware that supports AES-NI it will be encrypted, and on hardware that does not support AES-NI it will fall back to unencrypted. Practically speaking, all computing hardware supported by vSphere 7 includes AES-NI CPU instructions, but to guarantee encrypted communications customers should configure those settings to “required.”

Virtual machines configured with VM Encryption and/or vTPM virtual devices will always require vMotion encryption.

The security of network communications to and from guest operating systems and workloads are the responsibility of the customer, and outside the scope of this document.

Considerations
--------------

Use of secure protocols and product security features may change the performance of a vSphere implementation. The specifics of the performance of a system will depend on workload characteristics and implementation details, and should be evaluated by the customer, as they are beyond the scope of this document. VMware Professional Services is always available to aid customers directly with implementations and system changes to improve security.

Disclaimer
----------

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This  repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.