# Network Encryption in VMware vSphere 8
Introduction
------------

VMware is often asked if all network communications from vSphere, vSAN, Cloud Foundation, and Cloud are encrypted. VMware intends that vSphere, vSAN, Cloud Foundation, and Cloud all are secure by default, as deployed initially. This includes network security. However, customers and their partners make most implementation decisions, and some designs legitimately use unencrypted protocols. Use this document to answer questions about network encryption in vSphere, like those found on compliance and security questionnaires.

Default Configuration
---------------------

In its default configuration, VMware vSphere 8 encrypts all internal cluster management network traffic using TLS (TLS 1.3 with TLS 1.2 fallback as of vSphere 8.0.3). This includes communications between the administrators and the vSphere Client, the vSphere Client and vCenter Server, communications between vCenter Server and ESXi hosts, and default communications between ESXi hosts for vSphere HA, DRS, Content Library, vSphere Replication, vSphere Trust Authority, and Lifecycle Manager. Customers cannot disable these types of secure communications without altering the product in unsupported ways.

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

For unencrypted virtual machines, VMware vMotion and VMware vSphere Fault Tolerance are configured by default on a per-VM basis for “opportunistic” encryption. With opportunistic encryption, ESXi encrypts vMotion and Fault Tolerance traffic when the hardware supports AES-NI and sends it unencrypted when the hardware does not. Practically speaking, all computing hardware supported by vSphere 8 includes AES-NI CPU instructions. To require encryption for this traffic regardless of hardware, set those options to “required.”

Virtual machines configured with VM Encryption and/or vTPM virtual devices will always require vMotion encryption.

Network communications to and from guest operating systems and workloads are the customer’s responsibility and are outside the scope of this document.

Considerations
--------------

Secure protocols and security features can reduce performance. Measure the effect in your own environment; it depends on your workloads and implementation. VMware Professional Services can assist with these changes.

Disclaimer
----------

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.