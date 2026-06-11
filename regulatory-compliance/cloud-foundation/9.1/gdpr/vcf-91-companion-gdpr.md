# Companion Guide to Regulation (EU) 2016/679 General Data Protection Regulation (GDPR) for VMware Cloud Foundation 9.1

## Version

910-20260612-01

## Introduction

This document describes how VMware Cloud Foundation (VCF) 9.1 and the separately licensed advanced services assessed alongside it, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, and VMware Avi Load Balancer, can support organizations working toward compliance with the General Data Protection Regulation (GDPR), formally Regulation (EU) 2016/679. The GDPR governs the processing of personal data within the European Economic Area, establishing requirements for data protection, privacy rights, lawful processing, and breach notification. Each assessed product is reported separately for every control, with VCF covering the full platform, including its consumption services and Private AI Services capabilities. The responsibility for assessing and achieving compliance with the GDPR remains with the data controller or data processor.

https://gdpr.eu/

This guidance evolves. Please check the current revision at: https://brcm.tech/vcf-compliance

## Disclaimer

This kit is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.

This material is provided as is and any express or implied warranties, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose are disclaimed. In no event shall the copyright holder or contributors be liable for any direct, indirect, incidental, special, exemplary, or consequential damages (including, but not limited to, procurement of substitute goods or services; loss of use, data, or profits; or business interruption) however caused and on any theory of liability, whether in contract, strict liability, or tort (including negligence or otherwise) arising in any way out of the use of this software, even if advised of the possibility of such damage. The provider makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of this sample. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations. You acknowledge that there may be performance or other considerations, and that these examples may make assumptions which may not be valid in your environment or organization.

## Third Party Identifiers and Mappings

This document includes regulatory compliance and security control identifiers from external sources as a convenience to end users. This does not constitute endorsement, in either direction.

There is not a one-to-one mapping of product capabilities to third-party controls. A product capability, or set of capabilities, may be applicable to multiple controls. Conversely, a control may be satisfied with the use of multiple capabilities.

Control identifier numbers have been included from the Secure Controls Framework, version 2026.1, under the terms of the Creative Commons Attribution-NoDerivatives 4.0 International Public License. No modifications have been made to the control identifier numbers under the terms of the license.

https://securecontrolsframework.com/

## Coverage Levels

Each control entry below carries the framework control text, the SCF control or controls it maps to, and an Aggregate Coverage line showing the strongest position any one of the assessed products holds for that control. Products that meet or contribute to the control follow as subsections, each with its own coverage level and response. Products the control does not apply to are listed together at the end of the entry, with a brief explanation. The coverage levels are:

- **Meets** -- the product directly provides the capability described in the control. No additional organizational process, external product, or human activity is needed beyond configuring the product itself.
- **Contributes** -- the product provides technical capabilities that help satisfy the control, but the control also requires something outside the product to be fully met, such as an organizational process, human activity, or an additional tool.
- **Not Applicable** -- the control does not apply to the product. Physical facility controls, staffing decisions, organizational governance processes, and domains the product does not operate in fall here.
- **Not Supported** -- the control is relevant to the product's domain (infrastructure, networking, security), but the product lacks the specific capability the control requires.
- **Not Assessed** -- the control has not yet been evaluated against the product.

## Controls

### Control 3.1

> This Regulation applies to the processing of personal data in the context of the activities of an establishment of a controller or a processor in the Union, regardless of whether the processing takes place in the Union or not.

**SCF Controls:** CPL-01.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 3.2

> This Regulation applies to the processing of personal data of data subjects who are in the Union by a controller or processor not established in the Union, where the processing activities are related to: a. the offering of goods or services, irrespective of whether a payment of the data subject is required, to such data subjects in the Union; or b. the monitoring of their behaviour as far as their behaviour takes place within the Union. 

**SCF Controls:** CPL-01.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 3.2(a)

> This Regulation applies to the processing of personal data of data subjects who are in the Union by a controller or processor not established in the Union, where the processing activities are related to: a. the offering of goods or services, irrespective of whether a payment of the data subject is required, to such data subjects in the Union; or

**SCF Controls:** CPL-01.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 3.2(b)

> This Regulation applies to the processing of personal data of data subjects who are in the Union by a controller or processor not established in the Union, where the processing activities are related to:  b. the monitoring of their behaviour as far as their behaviour takes place within the Union.

**SCF Controls:** CPL-01.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 3.3

> This Regulation applies to the processing of personal data by a controller not established in the Union, but in a place where Member State law applies by virtue of public international law.

**SCF Controls:** CPL-01.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 4

> The objective of this "control" is to ensure the organization uses standardized terminology to identify and categorize data, roles, and actions. This prevents "compliance gaps" where an organization fails to protect data simply because they didn't realize it fell under the GDPR's definition.

**SCF Controls:** SEA-02.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.1(a)

> Personal data shall be: processed lawfully, fairly and in a transparent manner in relation to the data subject (‘lawfulness, fairness and transparency’); 

**SCF Controls:** PRI-01

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.1(b)

> Personal data shall be: collected for specified, explicit and legitimate purposes and not further processed in a manner that is incompatible with those purposes; further processing for archiving purposes in the public interest, scientific or historical research purposes or statistical purposes shall, in accordance with Article 89(1), not be considered to be incompatible with the initial purposes (‘purpose limitation’); 

**SCF Controls:** PRI-04

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.1(c)

> Personal data shall be: adequate, relevant and limited to what is necessary in relation to the purposes for which they are processed (‘data minimisation’);

**SCF Controls:** PRI-04

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.1(d)

> Personal data shall be: accurate and, where necessary, kept up to date; every reasonable step must be taken to ensure that personal data that are inaccurate, having regard to the purposes for which they are processed, are erased or rectified without delay (‘accuracy’);

**SCF Controls:** PRI-05.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.1(e)

> Personal data shall be: kept in a form which permits identification of data subjects for no longer than is necessary for the purposes for which the personal data are processed; personal data may be stored for longer periods insofar as the personal data will be processed solely for archiving purposes in the public interest, scientific or historical research purposes or statistical purposes in accordance with Article 89(1) subject to implementation of the appropriate technical and organisational measures required by this Regulation in order to safeguard the rights and freedoms of the data subject (‘storage limitation’);

**SCF Controls:** PRI-05, PRI-05.8

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.1(f)

> Personal data shall be: processed in a manner that ensures appropriate security of the personal data, including protection against unauthorised or unlawful processing and against accidental loss, destruction or damage, using appropriate technical or organisational measures (‘integrity and confidentiality’). 

**SCF Controls:** PRI-01.6

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides multiple layers of logical security safeguards that contribute to protecting the confidentiality and integrity of data, including personal data, hosted on the platform. These controls span encryption, access management, workload isolation, network security, host hardening, and privacy-aware features, giving organizations a strong technical foundation on which to build privacy-protective deployments.

VCF supports encryption for data at rest and data in transit across several components. Virtual Machine Encryption provides data-at-rest encryption for virtual machine data and disks, with support for different encryption keys for VM home and virtual disk, allowing granular control over which components are encrypted. Individual virtual machines can also be provisioned with a virtual Trusted Platform Module (vTPM), which exposes TPM 2.0 functionality within the VM to support hardware-backed key storage and attestation for workloads that handle sensitive data. vSAN data-at-rest encryption protects data on storage devices in the event that a device is removed from the cluster, while vSAN data-in-transit encryption protects data as it moves between hosts within the cluster. Fault Tolerance log traffic, which replicates protected virtual machine memory state between hosts, can also be encrypted to prevent sensitive VM data from being exposed in transit. The Supervisor component encrypts all secrets stored in its etcd database, adding a layer of protection for sensitive configuration data. Administrators can configure HTTPS for databus transport in VCF Operations on-premises environments so that data is encrypted during transport. For cryptographic operations requiring higher assurance, VCF supports external entropy sources through hardware security modules (HSMs) that are FIPS 140-3 and EAL4 certified.

VCF isolates workloads at multiple levels. Each virtual machine runs in its own execution environment, preventing interference between tenants and enforcing data separation. vSphere Namespaces provide isolated sandboxes with enforced resource limits, storage policies, and per-namespace access controls that scope which users and groups can reach a given namespace. Workloads running in vSphere Pods or VMware Kubernetes Service clusters have default firewall isolation rules that restrict communication. VCF Automation supports app isolation policies through on-demand security group firewall rules that restrict traffic to only internal resources provisioned by a given cloud template.

Access control mechanisms restrict who can reach sensitive data and administrative functions. VCF supports identity provider federation with multi-factor authentication (MFA), strengthening authentication for access to infrastructure management. LDAP integration provides centralized authentication through an external directory service, giving organizations a single point of control for user lifecycle management. Role-based access control (RBAC) in vCenter allows administrators to scope privileges to specific objects and operations, limiting exposure of data to authorized personnel. The platform tracks user authentication events, including successful and failed login attempts, through its audit logging capabilities in VCF Operations.

Network-level controls provide logical isolation for workloads and their data. ESX does not allow guest virtual machines to have direct access to a physical network unless an administrator explicitly configures a virtual switch with a network interface attached to specific physical network interfaces. This default-deny posture restricts lateral movement and limits the pathways through which data can be accessed.

At the host level, the vSphere Security Configuration Guide provides recommendations for hardening ESX hosts, including configuring authentication and authorization settings, disabling unnecessary services, and enabling security features such as Secure Boot and Trusted Platform Module (TPM). TPM modules, when present, should be running the latest 2.0 firmware.

Storage security best practices documented in the platform guidance address securing access to storage devices, implementing storage encryption, and protecting virtual machine data. Administrators should be aware that core files and audit logs can contain sensitive information such as passwords or encryption keys, requiring appropriate access restrictions on those artifacts. Sensitive data such as passwords or private keys should not be stored in plain text in data sets.

VCF Automation includes a privacy-aware feature that controls whether full user names (first and last name) are displayed in the user interface. This toggle allows organizations to manage explicit consent for exposing personal user data, supporting alignment with global privacy regulations that require consent before displaying personally identifiable information. Deactivating the display revokes consent and prevents user names from appearing in the interface.

While VCF provides these technical safeguards, protecting personal data also requires organizational policies, data classification schemes, data loss prevention tooling, and privacy-specific operational procedures that fall outside the platform's scope. Physical security of the underlying infrastructure and the identification, classification, and handling rules for personal data must be defined and enforced by the organization. VCF supplies the infrastructure-level controls that underpin a privacy program, but the organizational governance layer is a separate responsibility.

#### VMware vDefend (Contributes)

VMware vDefend contributes to protecting personal data through network-level security controls applied to workloads that store, process, or transmit personal data. The vDefend distributed firewall (DFW) enforces microsegmentation policies that isolate workloads handling personal data, restricting lateral movement and limiting which systems can communicate with sensitive data flows. Security profiles can be applied to Virtual Private Clouds (VPCs) to define and manage the security posture of personal data environments.

The Security Services Platform (SSP) provides security segmentation assessment capabilities that identify risky application protocols transporting data in cleartext, and generate reports highlighting exposure of critical infrastructure servers such as DNS, DHCP, NTP, and LDAP. Organizations can use these assessments to restrict or block cleartext protocols and enforce secure protocol versions across their environments.

vDefend IDS/IPS provides signature-based threat detection for network attacks targeting systems holding personal data, including detection and prevention of SQL injection attempts against databases. The vDefend Network Detection and Response (NDR) capability anonymizes sensitive customer information when sharing telemetry to cloud services, directly supporting privacy within the analytics pipeline.

Physical safeguards, data classification, encryption at rest for workload data, and content-level data loss prevention remain outside vDefend's scope and require controls at other layers of the stack.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides application-layer logical security mechanisms that help protect traffic carrying personal data. At the transport layer, Avi supports SSL/TLS termination with certificate management, securing connections between clients and the application proxy and helping protect sensitive data from unauthorized interception or modification in transit (CLI Access Settings > Certificates). For Kubernetes workloads, the Avi Kubernetes Operator (AKO) supports PKIProfile configuration, which enables secure communication with backend services through certificate-based authentication and encryption (Designing and Deploying AKO > Setting up Routing Rules using CRDs > PKIProfile).

For application logging, the Avi Analytics Profile supports the creation of a sensitive log profile that governs how sensitive data is handled within client-side logs (Load Balancing > Analytics Profile > Client Log). Administrators can configure which fields are captured in client logs to limit inadvertent recording of personal data transmitted through applications. TLS persistence data, used to maintain session affinity across Service Engines, is stored in an encrypted format that a Service Engine can read if a client reconnects to a different Service Engine, reducing exposure of session-bound data throughout the persistence lifetime (Load Balancing > Persistence > TLS Persistence).

Client access to applications can be controlled through authentication profiles. Avi supports LDAP Authentication Profiles configurable with LDAPS for encrypted directory connections, validating user identities against a directory service before granting access to application resources (User Authentication and Authorization > Authentication Profile > LDAP Authentication Profile). Avi also supports OAuth 2.0 and OpenID Connect (OIDC) for secure delegated client authentication, enabling identity providers to issue tokens to third-party applications without exposing user credentials directly (Security > Client Authentication > OAuth and OIDC).

Multi-tenant data plane isolation depends on context configuration. When Tenant Context is used, Avi provides both control plane and data plane isolation, scoping application traffic to designated tenant resources and supporting multi-tenant deployments where each tenant's traffic remains separated. When Provider Context is used, only control plane isolation is provided; organizations requiring full data plane separation should configure Tenant Context accordingly (Tenant Settings > Tenants Versus SE Group Isolation).

Health monitor probes in secure environments should use encrypted credentials; Avi supports reconfiguring existing health monitors from plaintext credentials to encrypted form when encrypted authentication is required (Load Balancing > Health Monitoring > HTTP Health Monitor). For deployments with stringent cryptographic requirements, Avi supports FIPS 140-3 compliance, which requires stricter handling of keys, authentication data, and random number generation to help protect sensitive security parameters (FIPS Compliance in Avi Load Balancer > FIPS 140-3 Compliance). For Avi Controller deployments automated via Ansible, Ansible Vault can be used to securely store sensitive variables such as passwords and API tokens, reducing the risk of credential exposure during automated provisioning (Automation Tools Overview > Ansible).

Not applicable for this control: VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.2

> The controller shall be responsible for, and be able to demonstrate compliance with, paragraph 1 (‘accountability’).

**SCF Controls:** CPL-01.3

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to an organization's ability to demonstrate conformity with applicable cybersecurity and data protection requirements by providing built-in compliance measurement, scoring, reporting, and audit logging capabilities. The organizational processes for identifying applicable laws, regulations, and contractual obligations, and for managing the overall compliance program, fall outside the product's scope.

VCF Operations includes a Compliance capability that surfaces core aspects of VCF security configuration in a single view. This capability continuously monitors whether objects in the environment meet industrial, governmental, regulatory, or internal standards, and calculates a compliance score as the ratio of compliant objects to the total number of objects assessed by a given benchmark, displayed as a percentage. When all objects are compliant, the score card displays 100. When objects are non-compliant, the number of non-compliant symptoms is shown in red alongside the total symptom count. The compliance score for an individual object is based on the most critical of the violated standards, and the score is calculated for all objects in the environment regardless of whether a given user has visibility into every object. This means the compliance posture reported reflects the true state of the environment, not a filtered view.

The compliance engine detects violations, highlights risk areas, and provides actionable remediation recommendations. Compliance alerts appear as violations to the standard, and the triggered symptoms appear as violated rules, giving administrators clear evidence of where the environment stands against a given benchmark. VCF supports compliance measurement against multiple industry-standard security guidelines and benchmarks, including the DISA STIG. NSX also provides a compliance report that administrators can use to verify that the NSX networking environment adheres to organizational IT policies and industry standards.

On the audit trail side, VCF components generate detailed logs of security-relevant events. Audit logs capture actions from the API, the user interface, and the CLI. Changes to user role assignments are automatically written to syslog and the audit log. VCF supports syslog forwarding to external monitoring systems for centralized log retention and long-term evidence preservation. VCF Log Management includes content packs for VCF components that provide pre-built dashboards, alerts, and queries for common compliance use cases such as failed login tracking, privilege escalation monitoring, and policy violation detection. Together, these logging and reporting capabilities allow organizations to produce and retain the technical evidence needed when demonstrating conformity to auditors or regulatory bodies.

For workloads running within VMware Kubernetes Service (VKS) on the VCF platform, the Consumption layer contributes a set of policy enforcement and access control mechanisms that produce inspectable, auditable artifacts. Pod Security Admission enforces Pod Security Standards at the namespace level with three profiles: Privileged, Baseline, and Restricted. Each namespace can be independently configured with enforce, audit, and warn modes; when a namespace runs in audit mode, the Kubernetes API server records policy violations without blocking workloads, generating per-namespace records of how running pods compare to the configured security profile. This output can be presented as direct evidence that the environment evaluates workload security posture against a defined standard. For high-assurance environments, cryptographic protections can be applied to Kubernetes audit logs to make them tamper-evident and confidential. Kubernetes Role-Based Access Control stores Roles, ClusterRoles, RoleBindings, ClusterRoleBindings, and ServiceAccounts as standard API objects, making the current permission model fully inspectable and exportable at any point; IAM role trust policies can be scoped to specific service accounts and namespaces to enforce least privilege. ValidatingAdmissionPolicy resources define enforcement rules as versioned Kubernetes API objects that can be queried, compared across revisions, and archived as policy compliance snapshots, providing a mechanism for capturing what policy was in effect at a given point in time. Network policies govern ingress and egress traffic at the namespace level as declarative Kubernetes objects, constituting auditable documentation of the implemented network segmentation model. Access to download and manage VKS Cluster Management Security Policy templates requires assignment to the Organization Administrator or Organization Auditor role, maintaining separation between those who define policy and those who audit it. VCF Automation security policies apply constraints at the organization or project level, and those constraints are inherited by all child resources.

To support resilience conformity, VMware vCenter and VCF Operations each support both file-based and image-based backup and restore. The vCenter backup schedule can be configured with backup location, recurrence, and retention parameters, providing administrators with a mechanism to document that scheduled, recoverable backups of the platform management layer are in operation. VKS cluster management supports backup and restore of an entire cluster, selected namespaces, or specific resources identified by a label. These operations are managed through the VCF Automation Tenant Portal under Manage & Govern > VCF Services > Kubernetes Management > Clusters > Data Protection, where backups can also be restored from a source cluster to a target cluster. VKS Supervisor state backup, including cluster node virtual machines, is activated through the vCenter backup feature in the vCenter Management Interface. For workload-level backup, Velero with the vSphere Plugin Snapshot or File System Backup method supports backup and restore of both stateless and stateful VKS cluster workloads; backup repositories support deduplication, compression, and encryption to protect backup integrity, and scheduled backup operations are available to support a regular recovery cadence. Organizations should maintain an etcd backup plan as part of demonstrating that cluster-state resilience capability exists.

Demonstrating conformity with cybersecurity and data protection obligations is fundamentally an organizational responsibility. VCF's compliance scoring, alerting, and reporting capabilities provide a significant portion of the technical evidence needed, but the organization must maintain the broader compliance program, including policy documentation, control mapping to applicable regulations, periodic assessments, and remediation tracking. Additional tools or processes outside VCF are needed to cover areas such as personnel security, physical security, and governance that fall outside the scope of infrastructure platform controls.

VMware Private AI Services (PAIS), formerly Private AI Services, provides several mechanisms that generate evidence relevant to demonstrating security and compliance conformity for AI infrastructure. Organizations can draw on these mechanisms when preparing documentation or responding to audits.

The PAISConfiguration custom resource includes an observability section that activates Prometheus-based metrics collection from PAIS components. Administrators activate metrics collection by uncommenting the spec.observability.prometheusRuntime section of the PAISConfiguration CR. Observability is configured as part of PAIS activation in VCF Automation and must be verified as active in the PAIS instance namespace. Once activated, PAIS controller pod metrics can be sent to VCF Operations through a Telegraf agent running on the Supervisor instance, and metrics can also be visualized in third-party observability platforms such as Grafana. A single Grafana instance can visualize metrics from multiple PAIS instances when they share an OIDC provider, supporting consolidated operational evidence across deployments.

PAIS observability also supports sending LLM traces to an OpenTelemetry Collector, providing a record of model inference activity within the platform. When activated, this trace data together with the Prometheus metrics gives MLOps engineers and auditors operational evidence of AI workload behavior.

PAIS uses Harbor Registry as its model artifact store, with the Model Gallery integrated to Harbor for model storage and retrieval. Harbor project access capabilities restrict access to sensitive training data and model artifacts, and Harbor robot accounts are configured for image pulls when the registry requires authentication. MLOps engineers validate ML models onboarded to PAIS against the security, privacy, and technical requirements of the organization, and PAIS guidance directs users to distribute models validated on deep learning VMs rather than models retrieved directly from the Internet. These workflows produce records of which models entered the gallery and under what governance.

Identity and access management for PAIS is coordinated with an external OIDC provider, including for Grafana integration. Within the platform, PAIS must be activated in organization namespaces by an organization administrator or MLOps engineer after namespace creation, establishing a documented authorization layer over GPU-accelerated workloads. VCF Automation Provider Management also requires trusted certificate import for vCenter certificate validation before integration with PAIS, supporting a documented trust layer. PAIS additionally requires examination and approval of MCP server tools and capabilities before use in agents, creating a review record for specialized data and capability integrations.

Demonstrating conformity with applicable laws and regulations requires more than technical controls alone. The organization must define its compliance scope, identify applicable obligations, map platform capabilities to control requirements, and assemble evidence packages for auditors or regulators. PAIS's observability, model governance, access control, and identity integration mechanisms contribute to that evidence base but do not replace the organizational governance layer that frames and presents the evidence.

#### VMware vDefend (Contributes)

VMware vDefend (VMware vDefend) contributes to demonstrating conformity with cybersecurity obligations by providing auditable records of security policy configuration and enforcement.

The Security Services Platform's Rule Analysis feature detects contradictions and redundancies in firewall policy by comparing effective group memberships and policy paths, allowing organizations to verify that implemented rules align with documented security requirements. Rule Analysis results can be reviewed in the Security Services Platform UI under System > Platform & Features, and the feature produces CSV reports for inclusion in compliance evidence packages. Rule Analysis access is governed by role-based permissions across five defined roles: Enterprise Admin, Auditor, Security Engineer, Security Operator, and Support Bundle Collector.

Security Intelligence policy recommendations can be generated for environments and published as firewall policies applied to environment category pairs. These recommendations include security policies and security groups, creating a documented record of recommended and enforced controls that can be presented during audits.

Role-based access controls include dedicated Auditor, Security Engineer, Security Operator, Enterprise Admin, and Support Bundle Collector roles with differentiated permissions that support segregation of duties during compliance assessments. The Auditor role provides read-only visibility into security configurations and activity, enabling independent review by compliance personnel without modification access. Privileged labels in the Distributed Firewall anchor firewall rules to immutable labels, providing a tamper-proof mechanism that helps administrators demonstrate workloads remain within their designated security groups as intended by policy.

These capabilities help produce demonstrable evidence of security control implementation. Full conformity with legal and contractual obligations also depends on organizational governance, documentation practices, and audit workflows that extend beyond what vDefend provides directly.

#### VCF Protection and Recovery (Contributes)

VCF Protection and Recovery (PNR) generates technical artifacts and supports compliance-oriented subscription tiers that organizations can use as evidence when demonstrating conformity with disaster recovery and data protection requirements. PNR does not include a dedicated compliance management engine, framework mapping capability, or benchmark scoring system.

The Advanced Cyber Compliance subscription, sold as a VCF advanced service, provides on-premises data protection and recovery capabilities designed for regulated environments. Advanced cyber protection and recovery capabilities within PNR require an Advanced Cyber Compliance per-core license in addition to VCF core capabilities, and an Advanced Cyber Compliance subscription is required to configure remote snapshots. The existence of this compliance-tier subscription reflects PNR's intended use in environments subject to regulatory and contractual data protection obligations.

Protection groups and recovery plans constitute documented configurations that must be verified for connection and validity. These configurations identify which workloads are protected and the recovery objectives assigned to each workload. Maintaining verified protection groups and recovery plans produces artifacts that organizations can present to demonstrate that DR procedures are defined and operational.

The Clean Room Orchestrator generates Events representing observations and issues raised by the system, providing information about situations that require attention or action. This event stream contributes to the operational audit record for recovery environment activities.

Identifying which laws and regulations apply, mapping controls to requirements, and managing the overall compliance program are organizational responsibilities outside the scope of PNR.

#### VMware Data Services Manager (Contributes)

VMware Data Services Manager (DSM) contributes to an organization's ability to demonstrate conformity through several mechanisms: enforceable data service policies, per-policy compliance reporting, infrastructure policy guardrails with compliance alerting, configurable backup and retention controls, and audit event logging.

DSM supports the creation and enforcement of data service policies that define organizational standards for database deployments, including PostgreSQL, MySQL, SQL Server, and MinIO databases. Administrators configure these policies and assign them to one or more organizations or tenants, creating a documented, repeatable configuration baseline. When integrated with VCF Automation, these policies can be enforced consistently across tenants to maintain a uniform security and compliance posture. Policy definitions can be tailored to specific organizational requirements, providing an auditable record of the standards applied to each tenant. The Infrastructure Policies view in the DSM dashboard provides visibility into which policies are active and which databases are associated with them.

DSM provides a compliance report for each data service policy that displays policy violations, noncompliant databases, data services, and namespaces, giving administrators a structured view of deviations from defined organizational standards. DSM also generates infrastructure policy compliance alerts that allow administrators to monitor whether clusters are operating in conformance with defined infrastructure policies. Infrastructure policies create guardrails that restrict the quality and quantity of resources DSM users can consume from vSphere clusters, providing a mechanism for documented resource governance that can be presented to auditors as evidence of enforced controls.

For resilience conformity, DSM supports automated database backups with configurable schedules (full and incremental), configurable retention periods, and configurable storage locations using S3-compatible object stores, local storage, or cloud targets. DSM retains automated backups of deleted databases until the configured retention policy is met, and administrators can edit the retention period for retained backups. Backups can be enabled or modified after database creation via the automated-backups setting. Control plane backups are stored in S3 object storage with unique identifiers corresponding to the control plane ID. Backup operations are logged at the error level to both console and file outputs, providing an operational audit trail for backup activity. These capabilities allow an organization to demonstrate that database resilience controls are in place and configured within defined parameters.

Demonstrating conformity to applicable laws, regulations, or contractual obligations requires organizational processes beyond what DSM provides directly. Organizations must map DSM's configuration and operational evidence to the specific requirements of applicable frameworks, collect and maintain that evidence, and manage formal attestation processes. DSM provides technical controls and configuration visibility that form part of the evidentiary foundation, but formal compliance documentation, evidence management, and audit reporting remain organizational responsibilities.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer (Avi) provides configuration export, backup management, and auditable policy artifacts that organizations can use when demonstrating security capability conformity for their application delivery infrastructure.

The Avi Controller CLI includes an export command to capture the full system configuration or an individual virtual service configuration. These exports document the security settings, WAF policies, and access control rules in effect at the time of capture and can be retained as part of a compliance documentation package. In VCF deployments, VCF Operations is used to configure the external backup server and storage path for Avi Load Balancer backups, and backups are stored on the same server as VCF Operations appliance backups by default. For deployments where the Controller runs as a single node, enabling periodic external configuration backups is a mandatory requirement to handle recovery in the case of a complete VM or disk failure.

Configuration backup files can be protected with a passphrase, keeping audit artifacts secure in storage. When a restore is performed, the Controller requires that the passphrase match the one used when creating the backup, validates that all file objects from the backup configuration are present before the restore can proceed, and verifies that the FIPS mode of the backup configuration matches the controller environment. This set of integrity checks supports the reliability of configuration records used as audit documentation.

For application security evidence, Avi's WAF Positive Security model allows administrators to define and document allowed application behavior through explicit policy rules, forming part of the evidence set for application security controls. Avi also provides User-Defined Metrics, which allow administrators to define and extract customized telemetry data required for specific compliance or reporting needs via API calls.

On the administrative access side, Avi supports role-based access control with object-level permissions that can be applied to roles and inherited by user groups. The ability to export certificates and private keys is restricted to the fewest number of administrators possible. The Auth Mapping Profile feature supports LDAP group match rules and attribute-based role assignments, enabling a verifiable access control posture that can be reviewed during an audit.

### Control 7.1

> Where processing is based on consent, the controller shall be able to demonstrate that the data subject has consented to processing of his or her personal data.

**SCF Controls:** PRI-03

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 7.2

> If the data subject’s consent is given in the context of a written declaration which also concerns other matters, the request for consent shall be presented in a manner which is clearly distinguishable from the other matters, in an intelligible and easily accessible form, using clear and plain language. Any part of such a declaration which constitutes an infringement of this Regulation shall not be binding.

**SCF Controls:** PRI-03

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 7.3

> The data subject shall have the right to withdraw his or her consent at any time. The withdrawal of consent shall not affect the lawfulness of processing based on consent before its withdrawal. Prior to giving consent, the data subject shall be informed thereof. It shall be as easy to withdraw as to give consent.

**SCF Controls:** PRI-03.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 8.1

> Where point (a) of Article 6(1) applies, in relation to the offer of information society services directly to a child, the processing of the personal data of a child shall be lawful where the child is at least 16 years old. Where the child is below the age of 16 years, such processing shall be lawful only if and to the extent that consent is given or authorised by the holder of parental responsibility over the child. Member States may provide by law for a lower age for those purposes provided that such lower age is not below 13 years.

**SCF Controls:** PRI-03.6, PRI-04

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 8.2

> The controller shall make reasonable efforts to verify in such cases that consent is given or authorised by the holder of parental responsibility over the child, taking into consideration available technology.

**SCF Controls:** PRI-03.6

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.1

> Processing of personal data revealing racial or ethnic origin, political opinions, religious or philosophical beliefs, or trade union membership, and the processing of genetic data, biometric data for the purpose of uniquely identifying a natural person, data concerning health or data concerning a natural person’s sex life or sexual orientation shall be prohibited.

**SCF Controls:** PRI-01

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.2(a)

> the data subject has given explicit consent to the processing of those personal data for one or more specified purposes, except where Union or Member State law provide that the prohibition referred to in paragraph 1 may not be lifted by the data subject;

**SCF Controls:** PRI-03

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.2(b)

> processing is necessary for the purposes of carrying out the obligations and exercising specific rights of the controller or of the data subject in the field of employment and social security and social protection law in so far as it is authorised by Union or Member State law or a collective agreement pursuant to Member State law providing for appropriate safeguards for the fundamental rights and the interests of the data subject; 

**SCF Controls:** PRI-04.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.2(c)

> processing is necessary to protect the vital interests of the data subject or of another natural person where the data subject is physically or legally incapable of giving consent;

**SCF Controls:** PRI-04.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.2(d)

> processing is carried out in the course of its legitimate activities with appropriate safeguards by a foundation, association or any other not-for-profit body with a political, philosophical, religious or trade union aim and on condition that the processing relates solely to the members or to former members of the body or to persons who have regular contact with it in connection with its purposes and that the personal data are not disclosed outside that body without the consent of the data subjects;

**SCF Controls:** PRI-04.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.2(e)

> processing relates to personal data which are manifestly made public by the data subject;

**SCF Controls:** PRI-04.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.2(f)

> processing is necessary for the establishment, exercise or defence of legal claims or whenever courts are acting in their judicial capacity;

**SCF Controls:** PRI-04.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.2(g)

> processing is necessary for reasons of substantial public interest, on the basis of Union or Member State law which shall be proportionate to the aim pursued, respect the essence of the right to data protection and provide for suitable and specific measures to safeguard the fundamental rights and the interests of the data subject;

**SCF Controls:** PRI-04.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.2(h)

> processing is necessary for the purposes of preventive or occupational medicine, for the assessment of the working capacity of the employee, medical diagnosis, the provision of health or social care or treatment or the management of health or social care systems and services on the basis of Union or Member State law or pursuant to contract with a health professional and subject to the conditions and safeguards referred to in paragraph 3;

**SCF Controls:** PRI-04.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.2(i)

> processing is necessary for reasons of public interest in the area of public health, such as protecting against serious cross-border threats to health or ensuring high standards of quality and safety of health care and of medicinal products or medical devices, on the basis of Union or Member State law which provides for suitable and specific measures to safeguard the rights and freedoms of the data subject, in particular professional secrecy;

**SCF Controls:** PRI-04.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.2(j)

> processing is necessary for archiving purposes in the public interest, scientific or historical research purposes or statistical purposes in accordance with Article 89(1) based on Union or Member State law which shall be proportionate to the aim pursued, respect the essence of the right to data protection and provide for suitable and specific measures to safeguard the fundamental rights and the interests of the data subject.

**SCF Controls:** PRI-04.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.3

> Personal data referred to in paragraph 1 may be processed for the purposes referred to in point (h) of paragraph 2 when those data are processed by or under the responsibility of a professional subject to the obligation of professional secrecy under Union or Member State law or rules established by national competent bodies or by another person also subject to an obligation of secrecy under Union or Member State law or rules established by national competent bodies.

**SCF Controls:** PRI-04.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10

> Processing of personal data relating to criminal convictions and offences or related security measures based on Article 6(1) shall be carried out only under the control of official authority or when the processing is authorised by Union or Member State law providing for appropriate safeguards for the rights and freedoms of data subjects. Any comprehensive register of criminal convictions shall be kept only under the control of official authority.

**SCF Controls:** PRI-04.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 12.1

> The controller shall take appropriate measures to provide any information referred to in Articles 13 and 14 and any communication under Articles 15 to 22 and 34 relating to processing to the data subject in a concise, transparent, intelligible and easily accessible form, using clear and plain language, in particular for any information addressed specifically to a child. The information shall be provided in writing, or by other means, including, where appropriate, by electronic means. When requested by the data subject, the information may be provided orally, provided that the identity of the data subject is proven by other means.

**SCF Controls:** CPL-01.3

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to an organization's ability to demonstrate conformity with applicable cybersecurity and data protection requirements by providing built-in compliance measurement, scoring, reporting, and audit logging capabilities. The organizational processes for identifying applicable laws, regulations, and contractual obligations, and for managing the overall compliance program, fall outside the product's scope.

VCF Operations includes a Compliance capability that surfaces core aspects of VCF security configuration in a single view. This capability continuously monitors whether objects in the environment meet industrial, governmental, regulatory, or internal standards, and calculates a compliance score as the ratio of compliant objects to the total number of objects assessed by a given benchmark, displayed as a percentage. When all objects are compliant, the score card displays 100. When objects are non-compliant, the number of non-compliant symptoms is shown in red alongside the total symptom count. The compliance score for an individual object is based on the most critical of the violated standards, and the score is calculated for all objects in the environment regardless of whether a given user has visibility into every object. This means the compliance posture reported reflects the true state of the environment, not a filtered view.

The compliance engine detects violations, highlights risk areas, and provides actionable remediation recommendations. Compliance alerts appear as violations to the standard, and the triggered symptoms appear as violated rules, giving administrators clear evidence of where the environment stands against a given benchmark. VCF supports compliance measurement against multiple industry-standard security guidelines and benchmarks, including the DISA STIG. NSX also provides a compliance report that administrators can use to verify that the NSX networking environment adheres to organizational IT policies and industry standards.

On the audit trail side, VCF components generate detailed logs of security-relevant events. Audit logs capture actions from the API, the user interface, and the CLI. Changes to user role assignments are automatically written to syslog and the audit log. VCF supports syslog forwarding to external monitoring systems for centralized log retention and long-term evidence preservation. VCF Log Management includes content packs for VCF components that provide pre-built dashboards, alerts, and queries for common compliance use cases such as failed login tracking, privilege escalation monitoring, and policy violation detection. Together, these logging and reporting capabilities allow organizations to produce and retain the technical evidence needed when demonstrating conformity to auditors or regulatory bodies.

For workloads running within VMware Kubernetes Service (VKS) on the VCF platform, the Consumption layer contributes a set of policy enforcement and access control mechanisms that produce inspectable, auditable artifacts. Pod Security Admission enforces Pod Security Standards at the namespace level with three profiles: Privileged, Baseline, and Restricted. Each namespace can be independently configured with enforce, audit, and warn modes; when a namespace runs in audit mode, the Kubernetes API server records policy violations without blocking workloads, generating per-namespace records of how running pods compare to the configured security profile. This output can be presented as direct evidence that the environment evaluates workload security posture against a defined standard. For high-assurance environments, cryptographic protections can be applied to Kubernetes audit logs to make them tamper-evident and confidential. Kubernetes Role-Based Access Control stores Roles, ClusterRoles, RoleBindings, ClusterRoleBindings, and ServiceAccounts as standard API objects, making the current permission model fully inspectable and exportable at any point; IAM role trust policies can be scoped to specific service accounts and namespaces to enforce least privilege. ValidatingAdmissionPolicy resources define enforcement rules as versioned Kubernetes API objects that can be queried, compared across revisions, and archived as policy compliance snapshots, providing a mechanism for capturing what policy was in effect at a given point in time. Network policies govern ingress and egress traffic at the namespace level as declarative Kubernetes objects, constituting auditable documentation of the implemented network segmentation model. Access to download and manage VKS Cluster Management Security Policy templates requires assignment to the Organization Administrator or Organization Auditor role, maintaining separation between those who define policy and those who audit it. VCF Automation security policies apply constraints at the organization or project level, and those constraints are inherited by all child resources.

To support resilience conformity, VMware vCenter and VCF Operations each support both file-based and image-based backup and restore. The vCenter backup schedule can be configured with backup location, recurrence, and retention parameters, providing administrators with a mechanism to document that scheduled, recoverable backups of the platform management layer are in operation. VKS cluster management supports backup and restore of an entire cluster, selected namespaces, or specific resources identified by a label. These operations are managed through the VCF Automation Tenant Portal under Manage & Govern > VCF Services > Kubernetes Management > Clusters > Data Protection, where backups can also be restored from a source cluster to a target cluster. VKS Supervisor state backup, including cluster node virtual machines, is activated through the vCenter backup feature in the vCenter Management Interface. For workload-level backup, Velero with the vSphere Plugin Snapshot or File System Backup method supports backup and restore of both stateless and stateful VKS cluster workloads; backup repositories support deduplication, compression, and encryption to protect backup integrity, and scheduled backup operations are available to support a regular recovery cadence. Organizations should maintain an etcd backup plan as part of demonstrating that cluster-state resilience capability exists.

Demonstrating conformity with cybersecurity and data protection obligations is fundamentally an organizational responsibility. VCF's compliance scoring, alerting, and reporting capabilities provide a significant portion of the technical evidence needed, but the organization must maintain the broader compliance program, including policy documentation, control mapping to applicable regulations, periodic assessments, and remediation tracking. Additional tools or processes outside VCF are needed to cover areas such as personnel security, physical security, and governance that fall outside the scope of infrastructure platform controls.

VMware Private AI Services (PAIS), formerly Private AI Services, provides several mechanisms that generate evidence relevant to demonstrating security and compliance conformity for AI infrastructure. Organizations can draw on these mechanisms when preparing documentation or responding to audits.

The PAISConfiguration custom resource includes an observability section that activates Prometheus-based metrics collection from PAIS components. Administrators activate metrics collection by uncommenting the spec.observability.prometheusRuntime section of the PAISConfiguration CR. Observability is configured as part of PAIS activation in VCF Automation and must be verified as active in the PAIS instance namespace. Once activated, PAIS controller pod metrics can be sent to VCF Operations through a Telegraf agent running on the Supervisor instance, and metrics can also be visualized in third-party observability platforms such as Grafana. A single Grafana instance can visualize metrics from multiple PAIS instances when they share an OIDC provider, supporting consolidated operational evidence across deployments.

PAIS observability also supports sending LLM traces to an OpenTelemetry Collector, providing a record of model inference activity within the platform. When activated, this trace data together with the Prometheus metrics gives MLOps engineers and auditors operational evidence of AI workload behavior.

PAIS uses Harbor Registry as its model artifact store, with the Model Gallery integrated to Harbor for model storage and retrieval. Harbor project access capabilities restrict access to sensitive training data and model artifacts, and Harbor robot accounts are configured for image pulls when the registry requires authentication. MLOps engineers validate ML models onboarded to PAIS against the security, privacy, and technical requirements of the organization, and PAIS guidance directs users to distribute models validated on deep learning VMs rather than models retrieved directly from the Internet. These workflows produce records of which models entered the gallery and under what governance.

Identity and access management for PAIS is coordinated with an external OIDC provider, including for Grafana integration. Within the platform, PAIS must be activated in organization namespaces by an organization administrator or MLOps engineer after namespace creation, establishing a documented authorization layer over GPU-accelerated workloads. VCF Automation Provider Management also requires trusted certificate import for vCenter certificate validation before integration with PAIS, supporting a documented trust layer. PAIS additionally requires examination and approval of MCP server tools and capabilities before use in agents, creating a review record for specialized data and capability integrations.

Demonstrating conformity with applicable laws and regulations requires more than technical controls alone. The organization must define its compliance scope, identify applicable obligations, map platform capabilities to control requirements, and assemble evidence packages for auditors or regulators. PAIS's observability, model governance, access control, and identity integration mechanisms contribute to that evidence base but do not replace the organizational governance layer that frames and presents the evidence.

#### VMware vDefend (Contributes)

VMware vDefend (VMware vDefend) contributes to demonstrating conformity with cybersecurity obligations by providing auditable records of security policy configuration and enforcement.

The Security Services Platform's Rule Analysis feature detects contradictions and redundancies in firewall policy by comparing effective group memberships and policy paths, allowing organizations to verify that implemented rules align with documented security requirements. Rule Analysis results can be reviewed in the Security Services Platform UI under System > Platform & Features, and the feature produces CSV reports for inclusion in compliance evidence packages. Rule Analysis access is governed by role-based permissions across five defined roles: Enterprise Admin, Auditor, Security Engineer, Security Operator, and Support Bundle Collector.

Security Intelligence policy recommendations can be generated for environments and published as firewall policies applied to environment category pairs. These recommendations include security policies and security groups, creating a documented record of recommended and enforced controls that can be presented during audits.

Role-based access controls include dedicated Auditor, Security Engineer, Security Operator, Enterprise Admin, and Support Bundle Collector roles with differentiated permissions that support segregation of duties during compliance assessments. The Auditor role provides read-only visibility into security configurations and activity, enabling independent review by compliance personnel without modification access. Privileged labels in the Distributed Firewall anchor firewall rules to immutable labels, providing a tamper-proof mechanism that helps administrators demonstrate workloads remain within their designated security groups as intended by policy.

These capabilities help produce demonstrable evidence of security control implementation. Full conformity with legal and contractual obligations also depends on organizational governance, documentation practices, and audit workflows that extend beyond what vDefend provides directly.

#### VCF Protection and Recovery (Contributes)

VCF Protection and Recovery (PNR) generates technical artifacts and supports compliance-oriented subscription tiers that organizations can use as evidence when demonstrating conformity with disaster recovery and data protection requirements. PNR does not include a dedicated compliance management engine, framework mapping capability, or benchmark scoring system.

The Advanced Cyber Compliance subscription, sold as a VCF advanced service, provides on-premises data protection and recovery capabilities designed for regulated environments. Advanced cyber protection and recovery capabilities within PNR require an Advanced Cyber Compliance per-core license in addition to VCF core capabilities, and an Advanced Cyber Compliance subscription is required to configure remote snapshots. The existence of this compliance-tier subscription reflects PNR's intended use in environments subject to regulatory and contractual data protection obligations.

Protection groups and recovery plans constitute documented configurations that must be verified for connection and validity. These configurations identify which workloads are protected and the recovery objectives assigned to each workload. Maintaining verified protection groups and recovery plans produces artifacts that organizations can present to demonstrate that DR procedures are defined and operational.

The Clean Room Orchestrator generates Events representing observations and issues raised by the system, providing information about situations that require attention or action. This event stream contributes to the operational audit record for recovery environment activities.

Identifying which laws and regulations apply, mapping controls to requirements, and managing the overall compliance program are organizational responsibilities outside the scope of PNR.

#### VMware Data Services Manager (Contributes)

VMware Data Services Manager (DSM) contributes to an organization's ability to demonstrate conformity through several mechanisms: enforceable data service policies, per-policy compliance reporting, infrastructure policy guardrails with compliance alerting, configurable backup and retention controls, and audit event logging.

DSM supports the creation and enforcement of data service policies that define organizational standards for database deployments, including PostgreSQL, MySQL, SQL Server, and MinIO databases. Administrators configure these policies and assign them to one or more organizations or tenants, creating a documented, repeatable configuration baseline. When integrated with VCF Automation, these policies can be enforced consistently across tenants to maintain a uniform security and compliance posture. Policy definitions can be tailored to specific organizational requirements, providing an auditable record of the standards applied to each tenant. The Infrastructure Policies view in the DSM dashboard provides visibility into which policies are active and which databases are associated with them.

DSM provides a compliance report for each data service policy that displays policy violations, noncompliant databases, data services, and namespaces, giving administrators a structured view of deviations from defined organizational standards. DSM also generates infrastructure policy compliance alerts that allow administrators to monitor whether clusters are operating in conformance with defined infrastructure policies. Infrastructure policies create guardrails that restrict the quality and quantity of resources DSM users can consume from vSphere clusters, providing a mechanism for documented resource governance that can be presented to auditors as evidence of enforced controls.

For resilience conformity, DSM supports automated database backups with configurable schedules (full and incremental), configurable retention periods, and configurable storage locations using S3-compatible object stores, local storage, or cloud targets. DSM retains automated backups of deleted databases until the configured retention policy is met, and administrators can edit the retention period for retained backups. Backups can be enabled or modified after database creation via the automated-backups setting. Control plane backups are stored in S3 object storage with unique identifiers corresponding to the control plane ID. Backup operations are logged at the error level to both console and file outputs, providing an operational audit trail for backup activity. These capabilities allow an organization to demonstrate that database resilience controls are in place and configured within defined parameters.

Demonstrating conformity to applicable laws, regulations, or contractual obligations requires organizational processes beyond what DSM provides directly. Organizations must map DSM's configuration and operational evidence to the specific requirements of applicable frameworks, collect and maintain that evidence, and manage formal attestation processes. DSM provides technical controls and configuration visibility that form part of the evidentiary foundation, but formal compliance documentation, evidence management, and audit reporting remain organizational responsibilities.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer (Avi) provides configuration export, backup management, and auditable policy artifacts that organizations can use when demonstrating security capability conformity for their application delivery infrastructure.

The Avi Controller CLI includes an export command to capture the full system configuration or an individual virtual service configuration. These exports document the security settings, WAF policies, and access control rules in effect at the time of capture and can be retained as part of a compliance documentation package. In VCF deployments, VCF Operations is used to configure the external backup server and storage path for Avi Load Balancer backups, and backups are stored on the same server as VCF Operations appliance backups by default. For deployments where the Controller runs as a single node, enabling periodic external configuration backups is a mandatory requirement to handle recovery in the case of a complete VM or disk failure.

Configuration backup files can be protected with a passphrase, keeping audit artifacts secure in storage. When a restore is performed, the Controller requires that the passphrase match the one used when creating the backup, validates that all file objects from the backup configuration are present before the restore can proceed, and verifies that the FIPS mode of the backup configuration matches the controller environment. This set of integrity checks supports the reliability of configuration records used as audit documentation.

For application security evidence, Avi's WAF Positive Security model allows administrators to define and document allowed application behavior through explicit policy rules, forming part of the evidence set for application security controls. Avi also provides User-Defined Metrics, which allow administrators to define and extract customized telemetry data required for specific compliance or reporting needs via API calls.

On the administrative access side, Avi supports role-based access control with object-level permissions that can be applied to roles and inherited by user groups. The ability to export certificates and private keys is restricted to the fewest number of administrators possible. The Auth Mapping Profile feature supports LDAP group match rules and attribute-based role assignments, enabling a verifiable access control posture that can be reviewed during an audit.

### Control 12.2

> The controller shall facilitate the exercise of data subject rights under Articles 15 to 22. In the cases referred to in Article 11(2), the controller shall not refuse to act on the request of the data subject for exercising his or her rights under Articles 15 to 22, unless the controller demonstrates that it is not in a position to identify the data subject.

**SCF Controls:** PRI-01

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 12.3

> The controller shall provide information on action taken on a request under Articles 15 to 22 to the data subject without undue delay and in any event within one month of receipt of the request. That period may be extended by two further months where necessary, taking into account the complexity and number of the requests. The controller shall inform the data subject of any such extension within one month of receipt of the request, together with the reasons for the delay. Where the data subject makes the request by electronic form means, the information shall be provided by electronic means where possible, unless otherwise requested by the data subject.

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 12.4

> If the controller does not take action on the request of the data subject, the controller shall inform the data subject without delay and at the latest within one month of receipt of the request of the reasons for not taking action and on the possibility of lodging a complaint with a supervisory authority and seeking a judicial remedy.

**SCF Controls:** PRI-06.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 12.5(b)

> Information provided under Articles 13 and 14 and any communication and any actions taken under Articles 15 to 22 and 34 shall be provided free of charge. Where requests from a data subject are manifestly unfounded or excessive, in particular because of their repetitive character, the controller may either: refuse to act on the request. The controller shall bear the burden of demonstrating the manifestly unfounded or excessive character of the request.

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 12.6

> Without prejudice to Article 11, where the controller has reasonable doubts concerning the identity of the natural person making the request referred to in Articles 15 to 21, the controller may request the provision of additional information necessary to confirm the identity of the data subject.

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 12.7

> The information to be provided to data subjects pursuant to Articles 13 and 14 may be provided in combination with standardised icons in order to give in an easily visible, intelligible and clearly legible manner a meaningful overview of the intended processing. Where the icons are presented electronically they shall be machine-readable. 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.1(a)

> Where personal data relating to a data subject are collected from the data subject, the controller shall, at the time when personal data are obtained, provide the data subject with all of the following information:  the identity and the contact details of the controller and, where applicable, of the controller’s representative; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.1(b)

> Where personal data relating to a data subject are collected from the data subject, the controller shall, at the time when personal data are obtained, provide the data subject with all of the following information:   the contact details of the data protection officer, where applicable; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.1(c)

> Where personal data relating to a data subject are collected from the data subject, the controller shall, at the time when personal data are obtained, provide the data subject with all of the following information:   the purposes of the processing for which the personal data are intended as well as the legal basis for the processing; 

**SCF Controls:** PRI-02, PRI-02.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.1(d)

> Where personal data relating to a data subject are collected from the data subject, the controller shall, at the time when personal data are obtained, provide the data subject with all of the following information:   where the processing is based on point (f) of Article 6(1), the legitimate interests pursued by the controller or by a third party; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.1(e)

> Where personal data relating to a data subject are collected from the data subject, the controller shall, at the time when personal data are obtained, provide the data subject with all of the following information:  the recipients or categories of recipients of the personal data, if any;

**SCF Controls:** PRI-02, PRI-05.7

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.2

> In addition to the information referred to in paragraph 1, the controller shall, at the time when personal data are obtained, provide the data subject with the following further information necessary to ensure fair and transparent processing: a. the period for which the personal data will be stored, or if that is not possible, the criteria used to determine that period; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.2(a)

> In addition to the information referred to in paragraph 1, the controller shall, at the time when personal data are obtained, provide the data subject with the following further information necessary to ensure fair and transparent processing: a. the period for which the personal data will be stored, or if that is not possible, the criteria used to determine that period; b. the existence of the right to request from the controller access to and rectification or erasure of personal data or restriction of processing concerning the data subject or to object to processing as well as the right to data portability; c. where the processing is based on point (a) of Article 6(1) or point (a) of Article 9(2), the existence of the right to withdraw consent at any time, without affecting the lawfulness of processing based on consent before its withdrawal; d. the right to lodge a complaint with a supervisory authority; e. whether the provision of personal data is a statutory or contractual requirement, or a requirement necessary to enter into a contract, as well as whether the data subject is obliged to provide the personal data and of the possible consequences of failure to provide such data; f. the existence of automated decision-making, including profiling, referred to in Article 22(1) and (4) and, at least in those cases, meaningful information about the logic involved, as well as the significance and the envisaged consequences of such processing for the data subject.

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.2(b)

> In addition to the information referred to in paragraph 1, the controller shall, at the time when personal data are obtained, provide the data subject with the following further information necessary to ensure fair and transparent processing:  b. the existence of the right to request from the controller access to and rectification or erasure of personal data or restriction of processing concerning the data subject or to object to processing as well as the right to data portability; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.2(c)

> In addition to the information referred to in paragraph 1, the controller shall, at the time when personal data are obtained, provide the data subject with the following further information necessary to ensure fair and transparent processing:  c. where the processing is based on point (a) of Article 6(1) or point (a) of Article 9(2), the existence of the right to withdraw consent at any time, without affecting the lawfulness of processing based on consent before its withdrawal; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.2(d)

> In addition to the information referred to in paragraph 1, the controller shall, at the time when personal data are obtained, provide the data subject with the following further information necessary to ensure fair and transparent processing:  d. the right to lodge a complaint with a supervisory authority; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.2(e)

> In addition to the information referred to in paragraph 1, the controller shall, at the time when personal data are obtained, provide the data subject with the following further information necessary to ensure fair and transparent processing:  e. whether the provision of personal data is a statutory or contractual requirement, or a requirement necessary to enter into a contract, as well as whether the data subject is obliged to provide the personal data and of the possible consequences of failure to provide such data; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.2(f)

> In addition to the information referred to in paragraph 1, the controller shall, at the time when personal data are obtained, provide the data subject with the following further information necessary to ensure fair and transparent processing:  f. the existence of automated decision-making, including profiling, referred to in Article 22(1) and (4) and, at least in those cases, meaningful information about the logic involved, as well as the significance and the envisaged consequences of such processing for the data subject.

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.3

> Where the controller intends to further process the personal data for a purpose other than that for which the personal data were collected, the controller shall provide the data subject prior to that further processing with information on that other purpose and with any relevant further information as referred to in paragraph 2.

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.1(a)

> Where personal data have not been obtained from the data subject, the controller shall provide the data subject with the following information: a. the identity and the contact details of the controller and, where applicable, of the controller’s representative; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.1(b)

> Where personal data have not been obtained from the data subject, the controller shall provide the data subject with the following information:  b. the contact details of the data protection officer, where applicable; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.1(c)

> Where personal data have not been obtained from the data subject, the controller shall provide the data subject with the following information:  c. the purposes of the processing for which the personal data are intended as well as the legal basis for the processing; 

**SCF Controls:** PRI-02, PRI-02.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.1(d)

> Where personal data have not been obtained from the data subject, the controller shall provide the data subject with the following information:  d. the categories of personal data concerned; 

**SCF Controls:** PRI-02, PRI-05.7

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.1(e)

> Where personal data have not been obtained from the data subject, the controller shall provide the data subject with the following information:  e. the recipients or categories of recipients of the personal data, if any; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.1(f)

> Where personal data have not been obtained from the data subject, the controller shall provide the data subject with the following information:  f. where applicable, that the controller intends to transfer personal data to a recipient in a third country or international organisation and the existence or absence of an adequacy decision by the Commission, or in the case of transfers referred to in Article 46 or 47, or the second subparagraph of Article 49(1), reference to the appropriate or suitable safeguards and the means to obtain a copy of them or where they have been made available.

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.2

> In addition to the information referred to in paragraph 1, the controller shall provide the data subject with the following information necessary to ensure fair and transparent processing in respect of the data subject: a. the period for which the personal data will be stored, or if that is not possible, the criteria used to determine that period; b. where the processing is based on point (f) of Article 6(1), the legitimate interests pursued by the controller or by a third party; c. the existence of the right to request from the controller access to and rectification or erasure of personal data or restriction of processing concerning the data subject and to object to processing as well as the right to data portability; d. where processing is based on point (a) of Article 6(1) or point (a) of Article 9(2), the existence of the right to withdraw consent at any time, without affecting the lawfulness of processing based on consent before its withdrawal; e. the right to lodge a complaint with a supervisory authority; f. from which source the personal data originate, and if applicable, whether it came from publicly accessible sources; g. the existence of automated decision-making, including profiling, referred to in Article 22(1) and (4) and, at least in those cases, meaningful information about the logic involved, as well as the significance and the envisaged consequences of such processing for the data subject.

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.2(a)

> In addition to the information referred to in paragraph 1, the controller shall provide the data subject with the following information necessary to ensure fair and transparent processing in respect of the data subject: a. the period for which the personal data will be stored, or if that is not possible, the criteria used to determine that period; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.2(b)

> In addition to the information referred to in paragraph 1, the controller shall provide the data subject with the following information necessary to ensure fair and transparent processing in respect of the data subject:  b. where the processing is based on point (f) of Article 6(1), the legitimate interests pursued by the controller or by a third party; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.2(c)

> In addition to the information referred to in paragraph 1, the controller shall provide the data subject with the following information necessary to ensure fair and transparent processing in respect of the data subject:  c. the existence of the right to request from the controller access to and rectification or erasure of personal data or restriction of processing concerning the data subject and to object to processing as well as the right to data portability; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.2(d)

> In addition to the information referred to in paragraph 1, the controller shall provide the data subject with the following information necessary to ensure fair and transparent processing in respect of the data subject:  d. where processing is based on point (a) of Article 6(1) or point (a) of Article 9(2), the existence of the right to withdraw consent at any time, without affecting the lawfulness of processing based on consent before its withdrawal; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.2(e)

> In addition to the information referred to in paragraph 1, the controller shall provide the data subject with the following information necessary to ensure fair and transparent processing in respect of the data subject:  e. the right to lodge a complaint with a supervisory authority; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.2(f)

> In addition to the information referred to in paragraph 1, the controller shall provide the data subject with the following information necessary to ensure fair and transparent processing in respect of the data subject:  f. from which source the personal data originate, and if applicable, whether it came from publicly accessible sources; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.2(g)

> In addition to the information referred to in paragraph 1, the controller shall provide the data subject with the following information necessary to ensure fair and transparent processing in respect of the data subject:  g. the existence of automated decision-making, including profiling, referred to in Article 22(1) and (4) and, at least in those cases, meaningful information about the logic involved, as well as the significance and the envisaged consequences of such processing for the data subject.

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.3(a)

> The controller shall provide the information referred to in paragraphs 1 and 2: a. within a reasonable period after obtaining the personal data, but at the latest within one month, having regard to the specific circumstances in which the personal data are processed; 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.3(b)

> The controller shall provide the information referred to in paragraphs 1 and 2:  b. if the personal data are to be used for communication with the data subject, at the latest at the time of the first communication to that data subject; or 

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.3(c)

> The controller shall provide the information referred to in paragraphs 1 and 2:  c. if a disclosure to another recipient is envisaged, at the latest when the personal data are first disclosed.

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.4

> Where the controller intends to further process the personal data for a purpose other than that for which the personal data were obtained, the controller shall provide the data subject prior to that further processing with information on that other purpose and with any relevant further information as referred to in paragraph 2.

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.5(a)

> Paragraphs 1 to 4 shall not apply where and insofar as: a. the data subject already has the information;

**SCF Controls:** PRI-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 15.1

> The data subject shall have the right to obtain from the controller confirmation as to whether or not personal data concerning him or her are being processed, and, where that is the case, access to the personal data and the following information: a. the purposes of the processing; b. the categories of personal data concerned; c. the recipients or categories of recipient to whom the personal data have been or will be disclosed, in particular recipients in third countries or international organisations; d. where possible, the envisaged period for which the personal data will be stored, or, if not possible, the criteria used to determine that period; e. the existence of the right to request from the controller rectification or erasure of personal data or restriction of processing of personal data concerning the data subject or to object to such processing; f. the right to lodge a complaint with a supervisory authority; g. where the personal data are not collected from the data subject, any available information as to their source; f. the existence of automated decision-making, including profiling, referred to in Article 22(1) and (4) and, at least in those cases, meaningful information about the logic involved, as well as the significance and the envisaged consequences of such processing for the data subject.

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 15.1(a)

> The data subject shall have the right to obtain from the controller confirmation as to whether or not personal data concerning him or her are being processed, and, where that is the case, access to the personal data and the following information: a. the purposes of the processing; 

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 15.1(b)

> The data subject shall have the right to obtain from the controller confirmation as to whether or not personal data concerning him or her are being processed, and, where that is the case, access to the personal data and the following information:  b. the categories of personal data concerned; 

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 15.1(c)

> The data subject shall have the right to obtain from the controller confirmation as to whether or not personal data concerning him or her are being processed, and, where that is the case, access to the personal data and the following information:  c. the recipients or categories of recipient to whom the personal data have been or will be disclosed, in particular recipients in third countries or international organisations; 

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 15.1(d)

> The data subject shall have the right to obtain from the controller confirmation as to whether or not personal data concerning him or her are being processed, and, where that is the case, access to the personal data and the following information:  d. where possible, the envisaged period for which the personal data will be stored, or, if not possible, the criteria used to determine that period; 

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 15.1(e)

> The data subject shall have the right to obtain from the controller confirmation as to whether or not personal data concerning him or her are being processed, and, where that is the case, access to the personal data and the following information:  e. the existence of the right to request from the controller rectification or erasure of personal data or restriction of processing of personal data concerning the data subject or to object to such processing; 

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 15.1(g)

> The data subject shall have the right to obtain from the controller confirmation as to whether or not personal data concerning him or her are being processed, and, where that is the case, access to the personal data and the following information:  g. where the personal data are not collected from the data subject, any available information as to their source; 

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 15.1(h)

> The data subject shall have the right to obtain from the controller confirmation as to whether or not personal data concerning him or her are being processed, and, where that is the case, access to the personal data and the following information:  h. the existence of automated decision-making, including profiling, referred to in Article 22(1) and (4) and, at least in those cases, meaningful information about the logic involved, as well as the significance and the envisaged consequences of such processing for the data subject.

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 15.2

> Where personal data are transferred to a third country or to an international organisation, the data subject shall have the right to be informed of the appropriate safeguards pursuant to Article 46 relating to the transfer.

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 15.3

> The controller shall provide a copy of the personal data undergoing processing. For any further copies requested by the data subject, the controller may charge a reasonable fee based on administrative costs. Where the data subject makes the request by electronic means, and unless otherwise requested by the data subject, the information shall be provided in a commonly used electronic form.

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 15.4

> The right to obtain a copy referred to in paragraph 3 shall not adversely affect the rights and freedoms of others.

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 16

> The data subject shall have the right to obtain from the controller without undue delay the rectification of inaccurate personal data concerning him or her. Taking into account the purposes of the processing, the data subject shall have the right to have incomplete personal data completed, including by means of providing a supplementary statement. 

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1

> The data subject shall have the right to obtain from the controller the erasure of personal data concerning him or her without undue delay and the controller shall have the obligation to erase personal data without undue delay where one of the following grounds applies: a. the personal data are no longer necessary in relation to the purposes for which they were collected or otherwise processed; b. the data subject withdraws consent on which the processing is based according to point (a) of Article 6(1), or point (a) of Article 9(2), and where there is no other legal ground for the processing; c. the data subject objects to the processing pursuant to Article 21(1) and there are no overriding legitimate grounds for the processing, or the data subject objects to the processing pursuant to Article 21(2); d. the personal data have been unlawfully processed; e. the personal data have to be erased for compliance with a legal obligation in Union or Member State law to which the controller is subject; f. the personal data have been collected in relation to the offer of information society services referred to in Article 8(1).

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1(a)

> The data subject shall have the right to obtain from the controller the erasure of personal data concerning him or her without undue delay and the controller shall have the obligation to erase personal data without undue delay where one of the following grounds applies: a. the personal data are no longer necessary in relation to the purposes for which they were collected or otherwise processed; 

**SCF Controls:** PRI-06.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1(b)

> The data subject shall have the right to obtain from the controller the erasure of personal data concerning him or her without undue delay and the controller shall have the obligation to erase personal data without undue delay where one of the following grounds applies:  b. the data subject withdraws consent on which the processing is based according to point (a) of Article 6(1), or point (a) of Article 9(2), and where there is no other legal ground for the processing; 

**SCF Controls:** PRI-06.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1(c)

> The data subject shall have the right to obtain from the controller the erasure of personal data concerning him or her without undue delay and the controller shall have the obligation to erase personal data without undue delay where one of the following grounds applies: a. the personal data are no longer necessary in relation to the purposes for which they were collected or otherwise processed; b. the data subject withdraws consent on which the processing is based according to point (a) of Article 6(1), or point (a) of Article 9(2), and where there is no other legal ground for the processing; c. the data subject objects to the processing pursuant to Article 21(1) and there are no overriding legitimate grounds for the processing, or the data subject objects to the processing pursuant to Article 21(2); d. the personal data have been unlawfully processed; e. the personal data have to be erased for compliance with a legal obligation in Union or Member State law to which the controller is subject; f. the personal data have been collected in relation to the offer of information society services referred to in Article 8(1).

**SCF Controls:** PRI-06.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1(d)

> The data subject shall have the right to obtain from the controller the erasure of personal data concerning him or her without undue delay and the controller shall have the obligation to erase personal data without undue delay where one of the following grounds applies:  d. the personal data have been unlawfully processed; 

**SCF Controls:** PRI-06.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1(e)

> The data subject shall have the right to obtain from the controller the erasure of personal data concerning him or her without undue delay and the controller shall have the obligation to erase personal data without undue delay where one of the following grounds applies:  e. the personal data have to be erased for compliance with a legal obligation in Union or Member State law to which the controller is subject; 

**SCF Controls:** PRI-06.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1(f)

> The data subject shall have the right to obtain from the controller the erasure of personal data concerning him or her without undue delay and the controller shall have the obligation to erase personal data without undue delay where one of the following grounds applies:  f. the personal data have been collected in relation to the offer of information society services referred to in Article 8(1).

**SCF Controls:** PRI-06.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.2

> Where the controller has made the personal data public and is obliged pursuant to paragraph 1 to erase the personal data, the controller, taking account of available technology and the cost of implementation, shall take reasonable steps, including technical measures, to inform controllers which are processing the personal data that the data subject has requested the erasure by such controllers of any links to, or copy or replication of, those personal data. 

**SCF Controls:** PRI-06.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.3

> Paragraphs 1 and 2 shall not apply to the extent that processing is necessary: a. for exercising the right of freedom of expression and information; b. for compliance with a legal obligation which requires processing by Union or Member State law to which the controller is subject or for the performance of a task carried out in the public interest or in the exercise of official authority vested in the controller; c. for reasons of public interest in the area of public health in accordance with points (h) and (i) of Article 9(2) as well as Article 9(3); d. for archiving purposes in the public interest, scientific or historical research purposes or statistical purposes in accordance with Article 89(1) in so far as the right referred to in paragraph 1 is likely to render impossible or seriously impair the achievement of the objectives of that processing; or e. for the establishment, exercise or defence of legal claims. 

**SCF Controls:** PRI-06.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.3(a)

> Paragraphs 1 and 2 shall not apply to the extent that processing is necessary: a. for exercising the right of freedom of expression and information; r the establishment, exercise or defence of legal claims. 

**SCF Controls:** PRI-06.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.3(b)

> Paragraphs 1 and 2 shall not apply to the extent that processing is necessary:  b. for compliance with a legal obligation which requires processing by Union or Member State law to which the controller is subject or for the performance of a task carried out in the public interest or in the exercise of official authority vested in the controller; 

**SCF Controls:** PRI-06.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.3(c)

> Paragraphs 1 and 2 shall not apply to the extent that processing is necessary:  c. for reasons of public interest in the area of public health in accordance with points (h) and (i) of Article 9(2) as well as Article 9(3); 

**SCF Controls:** PRI-06.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.3(d)

> Paragraphs 1 and 2 shall not apply to the extent that processing is necessary:  d. for archiving purposes in the public interest, scientific or historical research purposes or statistical purposes in accordance with Article 89(1) in so far as the right referred to in paragraph 1 is likely to render impossible or seriously impair the achievement of the objectives of that processing; or  

**SCF Controls:** PRI-06.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.3(e)

> Paragraphs 1 and 2 shall not apply to the extent that processing is necessary:  e. for the establishment, exercise or defence of legal claims. 

**SCF Controls:** PRI-06.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 18.1

> The data subject shall have the right to obtain from the controller restriction of processing where one of the following applies: a. the accuracy of the personal data is contested by the data subject, for a period enabling the controller to verify the accuracy of the personal data; b. the processing is unlawful and the data subject opposes the erasure of the personal data and requests the restriction of their use instead; c. the controller no longer needs the personal data for the purposes of the processing, but they are required by the data subject for the establishment, exercise or defence of legal claims; d. the data subject has objected to processing pursuant to Article 21(1) pending the verification whether the legitimate grounds of the controller override those of the data subject.

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 18.1(a)

> The data subject shall have the right to obtain from the controller restriction of processing where one of the following applies: a. the accuracy of the personal data is contested by the data subject, for a period enabling the controller to verify the accuracy of the personal data; 

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 18.1(b)

> The data subject shall have the right to obtain from the controller restriction of processing where one of the following applies:  b. the processing is unlawful and the data subject opposes the erasure of the personal data and requests the restriction of their use instead; 

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 18.1(c)

> The data subject shall have the right to obtain from the controller restriction of processing where one of the following applies:  c. the controller no longer needs the personal data for the purposes of the processing, but they are required by the data subject for the establishment, exercise or defence of legal claims; 

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 18.1(d)

> The data subject shall have the right to obtain from the controller restriction of processing where one of the following applies:  d. the data subject has objected to processing pursuant to Article 21(1) pending the verification whether the legitimate grounds of the controller override those of the data subject.

**SCF Controls:** PRI-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 18.2

> Where processing has been restricted under paragraph 1, such personal data shall, with the exception of storage, only be processed with the data subject’s consent or for the establishment, exercise or defence of legal claims or for the protection of the rights of another natural or legal person or for reasons of important public interest of the Union or of a Member State.

**SCF Controls:** PRI-03.9

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 18.3

> A data subject who has obtained restriction of processing pursuant to paragraph 1 shall be informed by the controller before the restriction of processing is lifted.

**SCF Controls:** PRI-03.11

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 19

> The controller shall communicate any rectification or erasure of personal data or restriction of processing carried out in accordance with Article 16, Article 17(1) and Article 18 to each recipient to whom the personal data have been disclosed, unless this proves impossible or involves disproportionate effort. The controller shall inform the data subject about those recipients if the data subject requests it.

**SCF Controls:** PRI-03.11

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 20.1

> The data subject shall have the right to receive the personal data concerning him or her, which he or she has provided to a controller, in a structured, commonly used and machine-readable format and have the right to transmit those data to another controller without hindrance from the controller to which the personal data have been provided, where: a. the processing is based on consent pursuant to point (a) of Article 6(1) or point (a) of Article 9(2) or on a contract pursuant to point (b) of Article 6(1); and b. the processing is carried out by automated means.

**SCF Controls:** PRI-06.6, PRI-06.7

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 20.1(b)

> The data subject shall have the right to receive the personal data concerning him or her, which he or she has provided to a controller, in a structured, commonly used and machine-readable format and have the right to transmit those data to another controller without hindrance from the controller to which the personal data have been provided, where:  b. the processing is carried out by automated means.

**SCF Controls:** PRI-06.7

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 21.1

> The data subject shall have the right to object, on grounds relating to his or her particular situation, at any time to processing of personal data concerning him or her which is based on point (e) or (f) of Article 6(1), including profiling based on those provisions. The controller shall no longer process the personal data unless the controller demonstrates compelling legitimate grounds for the processing which override the interests, rights and freedoms of the data subject or for the establishment, exercise or defence of legal claims.

**SCF Controls:** PRI-03

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 21.2

> Where personal data are processed for direct marketing purposes, the data subject shall have the right to object at any time to processing of personal data concerning him or her for such marketing, which includes profiling to the extent that it is related to such direct marketing.

**SCF Controls:** PRI-03

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 21.3

> Where the data subject objects to processing for direct marketing purposes, the personal data shall no longer be processed for such purposes.

**SCF Controls:** PRI-03

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 21.4

> At the latest at the time of the first communication with the data subject, the right referred to in paragraphs 1 and 2 shall be explicitly brought to the attention of the data subject and shall be presented clearly and separately from any other information.

**SCF Controls:** PRI-03

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 21.5

> In the context of the use of information society services, and notwithstanding Directive 2002/58/EC, the data subject may exercise his or her right to object by automated means using technical specifications.

**SCF Controls:** PRI-03

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 21.6

> Where personal data are processed for scientific or historical research purposes or statistical purposes pursuant to Article 89(1), the data subject, on grounds relating to his or her particular situation, shall have the right to object to processing of personal data concerning him or her, unless the processing is necessary for the performance of a task carried out for reasons of public interest.

**SCF Controls:** PRI-03

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 24.1

> Taking into account the nature, scope, context and purposes of processing as well as the risks of varying likelihood and severity for the rights and freedoms of natural persons, the controller shall implement appropriate technical and organisational measures to ensure and to be able to demonstrate that processing is performed in accordance with this Regulation. Those measures shall be reviewed and updated where necessary.

**SCF Controls:** PRI-01.6

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides multiple layers of logical security safeguards that contribute to protecting the confidentiality and integrity of data, including personal data, hosted on the platform. These controls span encryption, access management, workload isolation, network security, host hardening, and privacy-aware features, giving organizations a strong technical foundation on which to build privacy-protective deployments.

VCF supports encryption for data at rest and data in transit across several components. Virtual Machine Encryption provides data-at-rest encryption for virtual machine data and disks, with support for different encryption keys for VM home and virtual disk, allowing granular control over which components are encrypted. Individual virtual machines can also be provisioned with a virtual Trusted Platform Module (vTPM), which exposes TPM 2.0 functionality within the VM to support hardware-backed key storage and attestation for workloads that handle sensitive data. vSAN data-at-rest encryption protects data on storage devices in the event that a device is removed from the cluster, while vSAN data-in-transit encryption protects data as it moves between hosts within the cluster. Fault Tolerance log traffic, which replicates protected virtual machine memory state between hosts, can also be encrypted to prevent sensitive VM data from being exposed in transit. The Supervisor component encrypts all secrets stored in its etcd database, adding a layer of protection for sensitive configuration data. Administrators can configure HTTPS for databus transport in VCF Operations on-premises environments so that data is encrypted during transport. For cryptographic operations requiring higher assurance, VCF supports external entropy sources through hardware security modules (HSMs) that are FIPS 140-3 and EAL4 certified.

VCF isolates workloads at multiple levels. Each virtual machine runs in its own execution environment, preventing interference between tenants and enforcing data separation. vSphere Namespaces provide isolated sandboxes with enforced resource limits, storage policies, and per-namespace access controls that scope which users and groups can reach a given namespace. Workloads running in vSphere Pods or VMware Kubernetes Service clusters have default firewall isolation rules that restrict communication. VCF Automation supports app isolation policies through on-demand security group firewall rules that restrict traffic to only internal resources provisioned by a given cloud template.

Access control mechanisms restrict who can reach sensitive data and administrative functions. VCF supports identity provider federation with multi-factor authentication (MFA), strengthening authentication for access to infrastructure management. LDAP integration provides centralized authentication through an external directory service, giving organizations a single point of control for user lifecycle management. Role-based access control (RBAC) in vCenter allows administrators to scope privileges to specific objects and operations, limiting exposure of data to authorized personnel. The platform tracks user authentication events, including successful and failed login attempts, through its audit logging capabilities in VCF Operations.

Network-level controls provide logical isolation for workloads and their data. ESX does not allow guest virtual machines to have direct access to a physical network unless an administrator explicitly configures a virtual switch with a network interface attached to specific physical network interfaces. This default-deny posture restricts lateral movement and limits the pathways through which data can be accessed.

At the host level, the vSphere Security Configuration Guide provides recommendations for hardening ESX hosts, including configuring authentication and authorization settings, disabling unnecessary services, and enabling security features such as Secure Boot and Trusted Platform Module (TPM). TPM modules, when present, should be running the latest 2.0 firmware.

Storage security best practices documented in the platform guidance address securing access to storage devices, implementing storage encryption, and protecting virtual machine data. Administrators should be aware that core files and audit logs can contain sensitive information such as passwords or encryption keys, requiring appropriate access restrictions on those artifacts. Sensitive data such as passwords or private keys should not be stored in plain text in data sets.

VCF Automation includes a privacy-aware feature that controls whether full user names (first and last name) are displayed in the user interface. This toggle allows organizations to manage explicit consent for exposing personal user data, supporting alignment with global privacy regulations that require consent before displaying personally identifiable information. Deactivating the display revokes consent and prevents user names from appearing in the interface.

While VCF provides these technical safeguards, protecting personal data also requires organizational policies, data classification schemes, data loss prevention tooling, and privacy-specific operational procedures that fall outside the platform's scope. Physical security of the underlying infrastructure and the identification, classification, and handling rules for personal data must be defined and enforced by the organization. VCF supplies the infrastructure-level controls that underpin a privacy program, but the organizational governance layer is a separate responsibility.

#### VMware vDefend (Contributes)

VMware vDefend contributes to protecting personal data through network-level security controls applied to workloads that store, process, or transmit personal data. The vDefend distributed firewall (DFW) enforces microsegmentation policies that isolate workloads handling personal data, restricting lateral movement and limiting which systems can communicate with sensitive data flows. Security profiles can be applied to Virtual Private Clouds (VPCs) to define and manage the security posture of personal data environments.

The Security Services Platform (SSP) provides security segmentation assessment capabilities that identify risky application protocols transporting data in cleartext, and generate reports highlighting exposure of critical infrastructure servers such as DNS, DHCP, NTP, and LDAP. Organizations can use these assessments to restrict or block cleartext protocols and enforce secure protocol versions across their environments.

vDefend IDS/IPS provides signature-based threat detection for network attacks targeting systems holding personal data, including detection and prevention of SQL injection attempts against databases. The vDefend Network Detection and Response (NDR) capability anonymizes sensitive customer information when sharing telemetry to cloud services, directly supporting privacy within the analytics pipeline.

Physical safeguards, data classification, encryption at rest for workload data, and content-level data loss prevention remain outside vDefend's scope and require controls at other layers of the stack.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides application-layer logical security mechanisms that help protect traffic carrying personal data. At the transport layer, Avi supports SSL/TLS termination with certificate management, securing connections between clients and the application proxy and helping protect sensitive data from unauthorized interception or modification in transit (CLI Access Settings > Certificates). For Kubernetes workloads, the Avi Kubernetes Operator (AKO) supports PKIProfile configuration, which enables secure communication with backend services through certificate-based authentication and encryption (Designing and Deploying AKO > Setting up Routing Rules using CRDs > PKIProfile).

For application logging, the Avi Analytics Profile supports the creation of a sensitive log profile that governs how sensitive data is handled within client-side logs (Load Balancing > Analytics Profile > Client Log). Administrators can configure which fields are captured in client logs to limit inadvertent recording of personal data transmitted through applications. TLS persistence data, used to maintain session affinity across Service Engines, is stored in an encrypted format that a Service Engine can read if a client reconnects to a different Service Engine, reducing exposure of session-bound data throughout the persistence lifetime (Load Balancing > Persistence > TLS Persistence).

Client access to applications can be controlled through authentication profiles. Avi supports LDAP Authentication Profiles configurable with LDAPS for encrypted directory connections, validating user identities against a directory service before granting access to application resources (User Authentication and Authorization > Authentication Profile > LDAP Authentication Profile). Avi also supports OAuth 2.0 and OpenID Connect (OIDC) for secure delegated client authentication, enabling identity providers to issue tokens to third-party applications without exposing user credentials directly (Security > Client Authentication > OAuth and OIDC).

Multi-tenant data plane isolation depends on context configuration. When Tenant Context is used, Avi provides both control plane and data plane isolation, scoping application traffic to designated tenant resources and supporting multi-tenant deployments where each tenant's traffic remains separated. When Provider Context is used, only control plane isolation is provided; organizations requiring full data plane separation should configure Tenant Context accordingly (Tenant Settings > Tenants Versus SE Group Isolation).

Health monitor probes in secure environments should use encrypted credentials; Avi supports reconfiguring existing health monitors from plaintext credentials to encrypted form when encrypted authentication is required (Load Balancing > Health Monitoring > HTTP Health Monitor). For deployments with stringent cryptographic requirements, Avi supports FIPS 140-3 compliance, which requires stricter handling of keys, authentication data, and random number generation to help protect sensitive security parameters (FIPS Compliance in Avi Load Balancer > FIPS 140-3 Compliance). For Avi Controller deployments automated via Ansible, Ansible Vault can be used to securely store sensitive variables such as passwords and API tokens, reducing the risk of credential exposure during automated provisioning (Automation Tools Overview > Ansible).

Not applicable for this control: VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 24.2

> Where proportionate in relation to processing activities, the measures referred to in paragraph 1 shall include the implementation of appropriate data protection policies by the controller.

**SCF Controls:** GOV-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 25.1

> Taking into account the state of the art, the cost of implementation and the nature, scope, context and purposes of processing as well as the risks of varying likelihood and severity for rights and freedoms of natural persons posed by the processing, the controller shall, both at the time of the determination of the means for processing and at the time of the processing itself, implement appropriate technical and organisational measures, such as pseudonymisation, which are designed to implement data-protection principles, such as data minimisation, in an effective manner and to integrate the necessary safeguards into the processing in order to meet the requirements of this Regulation and protect the rights of data subjects.

**SCF Controls:** PRI-01.6

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides multiple layers of logical security safeguards that contribute to protecting the confidentiality and integrity of data, including personal data, hosted on the platform. These controls span encryption, access management, workload isolation, network security, host hardening, and privacy-aware features, giving organizations a strong technical foundation on which to build privacy-protective deployments.

VCF supports encryption for data at rest and data in transit across several components. Virtual Machine Encryption provides data-at-rest encryption for virtual machine data and disks, with support for different encryption keys for VM home and virtual disk, allowing granular control over which components are encrypted. Individual virtual machines can also be provisioned with a virtual Trusted Platform Module (vTPM), which exposes TPM 2.0 functionality within the VM to support hardware-backed key storage and attestation for workloads that handle sensitive data. vSAN data-at-rest encryption protects data on storage devices in the event that a device is removed from the cluster, while vSAN data-in-transit encryption protects data as it moves between hosts within the cluster. Fault Tolerance log traffic, which replicates protected virtual machine memory state between hosts, can also be encrypted to prevent sensitive VM data from being exposed in transit. The Supervisor component encrypts all secrets stored in its etcd database, adding a layer of protection for sensitive configuration data. Administrators can configure HTTPS for databus transport in VCF Operations on-premises environments so that data is encrypted during transport. For cryptographic operations requiring higher assurance, VCF supports external entropy sources through hardware security modules (HSMs) that are FIPS 140-3 and EAL4 certified.

VCF isolates workloads at multiple levels. Each virtual machine runs in its own execution environment, preventing interference between tenants and enforcing data separation. vSphere Namespaces provide isolated sandboxes with enforced resource limits, storage policies, and per-namespace access controls that scope which users and groups can reach a given namespace. Workloads running in vSphere Pods or VMware Kubernetes Service clusters have default firewall isolation rules that restrict communication. VCF Automation supports app isolation policies through on-demand security group firewall rules that restrict traffic to only internal resources provisioned by a given cloud template.

Access control mechanisms restrict who can reach sensitive data and administrative functions. VCF supports identity provider federation with multi-factor authentication (MFA), strengthening authentication for access to infrastructure management. LDAP integration provides centralized authentication through an external directory service, giving organizations a single point of control for user lifecycle management. Role-based access control (RBAC) in vCenter allows administrators to scope privileges to specific objects and operations, limiting exposure of data to authorized personnel. The platform tracks user authentication events, including successful and failed login attempts, through its audit logging capabilities in VCF Operations.

Network-level controls provide logical isolation for workloads and their data. ESX does not allow guest virtual machines to have direct access to a physical network unless an administrator explicitly configures a virtual switch with a network interface attached to specific physical network interfaces. This default-deny posture restricts lateral movement and limits the pathways through which data can be accessed.

At the host level, the vSphere Security Configuration Guide provides recommendations for hardening ESX hosts, including configuring authentication and authorization settings, disabling unnecessary services, and enabling security features such as Secure Boot and Trusted Platform Module (TPM). TPM modules, when present, should be running the latest 2.0 firmware.

Storage security best practices documented in the platform guidance address securing access to storage devices, implementing storage encryption, and protecting virtual machine data. Administrators should be aware that core files and audit logs can contain sensitive information such as passwords or encryption keys, requiring appropriate access restrictions on those artifacts. Sensitive data such as passwords or private keys should not be stored in plain text in data sets.

VCF Automation includes a privacy-aware feature that controls whether full user names (first and last name) are displayed in the user interface. This toggle allows organizations to manage explicit consent for exposing personal user data, supporting alignment with global privacy regulations that require consent before displaying personally identifiable information. Deactivating the display revokes consent and prevents user names from appearing in the interface.

While VCF provides these technical safeguards, protecting personal data also requires organizational policies, data classification schemes, data loss prevention tooling, and privacy-specific operational procedures that fall outside the platform's scope. Physical security of the underlying infrastructure and the identification, classification, and handling rules for personal data must be defined and enforced by the organization. VCF supplies the infrastructure-level controls that underpin a privacy program, but the organizational governance layer is a separate responsibility.

#### VMware vDefend (Contributes)

VMware vDefend contributes to protecting personal data through network-level security controls applied to workloads that store, process, or transmit personal data. The vDefend distributed firewall (DFW) enforces microsegmentation policies that isolate workloads handling personal data, restricting lateral movement and limiting which systems can communicate with sensitive data flows. Security profiles can be applied to Virtual Private Clouds (VPCs) to define and manage the security posture of personal data environments.

The Security Services Platform (SSP) provides security segmentation assessment capabilities that identify risky application protocols transporting data in cleartext, and generate reports highlighting exposure of critical infrastructure servers such as DNS, DHCP, NTP, and LDAP. Organizations can use these assessments to restrict or block cleartext protocols and enforce secure protocol versions across their environments.

vDefend IDS/IPS provides signature-based threat detection for network attacks targeting systems holding personal data, including detection and prevention of SQL injection attempts against databases. The vDefend Network Detection and Response (NDR) capability anonymizes sensitive customer information when sharing telemetry to cloud services, directly supporting privacy within the analytics pipeline.

Physical safeguards, data classification, encryption at rest for workload data, and content-level data loss prevention remain outside vDefend's scope and require controls at other layers of the stack.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides application-layer logical security mechanisms that help protect traffic carrying personal data. At the transport layer, Avi supports SSL/TLS termination with certificate management, securing connections between clients and the application proxy and helping protect sensitive data from unauthorized interception or modification in transit (CLI Access Settings > Certificates). For Kubernetes workloads, the Avi Kubernetes Operator (AKO) supports PKIProfile configuration, which enables secure communication with backend services through certificate-based authentication and encryption (Designing and Deploying AKO > Setting up Routing Rules using CRDs > PKIProfile).

For application logging, the Avi Analytics Profile supports the creation of a sensitive log profile that governs how sensitive data is handled within client-side logs (Load Balancing > Analytics Profile > Client Log). Administrators can configure which fields are captured in client logs to limit inadvertent recording of personal data transmitted through applications. TLS persistence data, used to maintain session affinity across Service Engines, is stored in an encrypted format that a Service Engine can read if a client reconnects to a different Service Engine, reducing exposure of session-bound data throughout the persistence lifetime (Load Balancing > Persistence > TLS Persistence).

Client access to applications can be controlled through authentication profiles. Avi supports LDAP Authentication Profiles configurable with LDAPS for encrypted directory connections, validating user identities against a directory service before granting access to application resources (User Authentication and Authorization > Authentication Profile > LDAP Authentication Profile). Avi also supports OAuth 2.0 and OpenID Connect (OIDC) for secure delegated client authentication, enabling identity providers to issue tokens to third-party applications without exposing user credentials directly (Security > Client Authentication > OAuth and OIDC).

Multi-tenant data plane isolation depends on context configuration. When Tenant Context is used, Avi provides both control plane and data plane isolation, scoping application traffic to designated tenant resources and supporting multi-tenant deployments where each tenant's traffic remains separated. When Provider Context is used, only control plane isolation is provided; organizations requiring full data plane separation should configure Tenant Context accordingly (Tenant Settings > Tenants Versus SE Group Isolation).

Health monitor probes in secure environments should use encrypted credentials; Avi supports reconfiguring existing health monitors from plaintext credentials to encrypted form when encrypted authentication is required (Load Balancing > Health Monitoring > HTTP Health Monitor). For deployments with stringent cryptographic requirements, Avi supports FIPS 140-3 compliance, which requires stricter handling of keys, authentication data, and random number generation to help protect sensitive security parameters (FIPS Compliance in Avi Load Balancer > FIPS 140-3 Compliance). For Avi Controller deployments automated via Ansible, Ansible Vault can be used to securely store sensitive variables such as passwords and API tokens, reducing the risk of credential exposure during automated provisioning (Automation Tools Overview > Ansible).

Not applicable for this control: VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 25.2

> The controller shall implement appropriate technical and organisational measures for ensuring that, by default, only personal data which are necessary for each specific purpose of the processing are processed. That obligation applies to the amount of personal data collected, the extent of their processing, the period of their storage and their accessibility. In particular, such measures shall ensure that by default personal data are not made accessible without the individual’s intervention to an indefinite number of natural persons.

**SCF Controls:** PRI-01.6

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides multiple layers of logical security safeguards that contribute to protecting the confidentiality and integrity of data, including personal data, hosted on the platform. These controls span encryption, access management, workload isolation, network security, host hardening, and privacy-aware features, giving organizations a strong technical foundation on which to build privacy-protective deployments.

VCF supports encryption for data at rest and data in transit across several components. Virtual Machine Encryption provides data-at-rest encryption for virtual machine data and disks, with support for different encryption keys for VM home and virtual disk, allowing granular control over which components are encrypted. Individual virtual machines can also be provisioned with a virtual Trusted Platform Module (vTPM), which exposes TPM 2.0 functionality within the VM to support hardware-backed key storage and attestation for workloads that handle sensitive data. vSAN data-at-rest encryption protects data on storage devices in the event that a device is removed from the cluster, while vSAN data-in-transit encryption protects data as it moves between hosts within the cluster. Fault Tolerance log traffic, which replicates protected virtual machine memory state between hosts, can also be encrypted to prevent sensitive VM data from being exposed in transit. The Supervisor component encrypts all secrets stored in its etcd database, adding a layer of protection for sensitive configuration data. Administrators can configure HTTPS for databus transport in VCF Operations on-premises environments so that data is encrypted during transport. For cryptographic operations requiring higher assurance, VCF supports external entropy sources through hardware security modules (HSMs) that are FIPS 140-3 and EAL4 certified.

VCF isolates workloads at multiple levels. Each virtual machine runs in its own execution environment, preventing interference between tenants and enforcing data separation. vSphere Namespaces provide isolated sandboxes with enforced resource limits, storage policies, and per-namespace access controls that scope which users and groups can reach a given namespace. Workloads running in vSphere Pods or VMware Kubernetes Service clusters have default firewall isolation rules that restrict communication. VCF Automation supports app isolation policies through on-demand security group firewall rules that restrict traffic to only internal resources provisioned by a given cloud template.

Access control mechanisms restrict who can reach sensitive data and administrative functions. VCF supports identity provider federation with multi-factor authentication (MFA), strengthening authentication for access to infrastructure management. LDAP integration provides centralized authentication through an external directory service, giving organizations a single point of control for user lifecycle management. Role-based access control (RBAC) in vCenter allows administrators to scope privileges to specific objects and operations, limiting exposure of data to authorized personnel. The platform tracks user authentication events, including successful and failed login attempts, through its audit logging capabilities in VCF Operations.

Network-level controls provide logical isolation for workloads and their data. ESX does not allow guest virtual machines to have direct access to a physical network unless an administrator explicitly configures a virtual switch with a network interface attached to specific physical network interfaces. This default-deny posture restricts lateral movement and limits the pathways through which data can be accessed.

At the host level, the vSphere Security Configuration Guide provides recommendations for hardening ESX hosts, including configuring authentication and authorization settings, disabling unnecessary services, and enabling security features such as Secure Boot and Trusted Platform Module (TPM). TPM modules, when present, should be running the latest 2.0 firmware.

Storage security best practices documented in the platform guidance address securing access to storage devices, implementing storage encryption, and protecting virtual machine data. Administrators should be aware that core files and audit logs can contain sensitive information such as passwords or encryption keys, requiring appropriate access restrictions on those artifacts. Sensitive data such as passwords or private keys should not be stored in plain text in data sets.

VCF Automation includes a privacy-aware feature that controls whether full user names (first and last name) are displayed in the user interface. This toggle allows organizations to manage explicit consent for exposing personal user data, supporting alignment with global privacy regulations that require consent before displaying personally identifiable information. Deactivating the display revokes consent and prevents user names from appearing in the interface.

While VCF provides these technical safeguards, protecting personal data also requires organizational policies, data classification schemes, data loss prevention tooling, and privacy-specific operational procedures that fall outside the platform's scope. Physical security of the underlying infrastructure and the identification, classification, and handling rules for personal data must be defined and enforced by the organization. VCF supplies the infrastructure-level controls that underpin a privacy program, but the organizational governance layer is a separate responsibility.

#### VMware vDefend (Contributes)

VMware vDefend contributes to protecting personal data through network-level security controls applied to workloads that store, process, or transmit personal data. The vDefend distributed firewall (DFW) enforces microsegmentation policies that isolate workloads handling personal data, restricting lateral movement and limiting which systems can communicate with sensitive data flows. Security profiles can be applied to Virtual Private Clouds (VPCs) to define and manage the security posture of personal data environments.

The Security Services Platform (SSP) provides security segmentation assessment capabilities that identify risky application protocols transporting data in cleartext, and generate reports highlighting exposure of critical infrastructure servers such as DNS, DHCP, NTP, and LDAP. Organizations can use these assessments to restrict or block cleartext protocols and enforce secure protocol versions across their environments.

vDefend IDS/IPS provides signature-based threat detection for network attacks targeting systems holding personal data, including detection and prevention of SQL injection attempts against databases. The vDefend Network Detection and Response (NDR) capability anonymizes sensitive customer information when sharing telemetry to cloud services, directly supporting privacy within the analytics pipeline.

Physical safeguards, data classification, encryption at rest for workload data, and content-level data loss prevention remain outside vDefend's scope and require controls at other layers of the stack.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides application-layer logical security mechanisms that help protect traffic carrying personal data. At the transport layer, Avi supports SSL/TLS termination with certificate management, securing connections between clients and the application proxy and helping protect sensitive data from unauthorized interception or modification in transit (CLI Access Settings > Certificates). For Kubernetes workloads, the Avi Kubernetes Operator (AKO) supports PKIProfile configuration, which enables secure communication with backend services through certificate-based authentication and encryption (Designing and Deploying AKO > Setting up Routing Rules using CRDs > PKIProfile).

For application logging, the Avi Analytics Profile supports the creation of a sensitive log profile that governs how sensitive data is handled within client-side logs (Load Balancing > Analytics Profile > Client Log). Administrators can configure which fields are captured in client logs to limit inadvertent recording of personal data transmitted through applications. TLS persistence data, used to maintain session affinity across Service Engines, is stored in an encrypted format that a Service Engine can read if a client reconnects to a different Service Engine, reducing exposure of session-bound data throughout the persistence lifetime (Load Balancing > Persistence > TLS Persistence).

Client access to applications can be controlled through authentication profiles. Avi supports LDAP Authentication Profiles configurable with LDAPS for encrypted directory connections, validating user identities against a directory service before granting access to application resources (User Authentication and Authorization > Authentication Profile > LDAP Authentication Profile). Avi also supports OAuth 2.0 and OpenID Connect (OIDC) for secure delegated client authentication, enabling identity providers to issue tokens to third-party applications without exposing user credentials directly (Security > Client Authentication > OAuth and OIDC).

Multi-tenant data plane isolation depends on context configuration. When Tenant Context is used, Avi provides both control plane and data plane isolation, scoping application traffic to designated tenant resources and supporting multi-tenant deployments where each tenant's traffic remains separated. When Provider Context is used, only control plane isolation is provided; organizations requiring full data plane separation should configure Tenant Context accordingly (Tenant Settings > Tenants Versus SE Group Isolation).

Health monitor probes in secure environments should use encrypted credentials; Avi supports reconfiguring existing health monitors from plaintext credentials to encrypted form when encrypted authentication is required (Load Balancing > Health Monitoring > HTTP Health Monitor). For deployments with stringent cryptographic requirements, Avi supports FIPS 140-3 compliance, which requires stricter handling of keys, authentication data, and random number generation to help protect sensitive security parameters (FIPS Compliance in Avi Load Balancer > FIPS 140-3 Compliance). For Avi Controller deployments automated via Ansible, Ansible Vault can be used to securely store sensitive variables such as passwords and API tokens, reducing the risk of credential exposure during automated provisioning (Automation Tools Overview > Ansible).

Not applicable for this control: VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 27.1

> Where Article 3(2) applies, the controller or the processor shall designate in writing a representative in the Union.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 27.3

> The representative shall be established in one of the Member States where the data subjects, whose personal data are processed in relation to the offering of goods or services to them, or whose behaviour is monitored, are.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 27.4

> The representative shall be mandated by the controller or processor to be addressed in addition to or instead of the controller or the processor by, in particular, supervisory authorities and data subjects, on all issues related to processing, for the purposes of ensuring compliance with this Regulation.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 27.5

> The designation of a representative by the controller or processor shall be without prejudice to legal actions which could be initiated against the controller or the processor themselves.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.1

> Where processing is to be carried out on behalf of a controller, the controller shall use only processors providing sufficient guarantees to implement appropriate technical and organisational measures in such a manner that processing will meet the requirements of this Regulation and ensure the protection of the rights of the data subject. 

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.2

> The processor shall not engage another processor without prior specific or general written authorisation of the controller. In the case of general written authorisation, the processor shall inform the controller of any intended changes concerning the addition or replacement of other processors, thereby giving the controller the opportunity to object to such changes.

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.3

> Processing by a processor shall be governed by a contract or other legal act under Union or Member State law, that is binding on the processor with regard to the controller and that sets out the subject-matter and duration of the processing, the nature and purpose of the processing, the type of personal data and categories of data subjects and the obligations and rights of the controller. That contract or other legal act shall stipulate, in particular, that the processor:  a. processes the personal data only on documented instructions from the controller, including with regard to transfers of personal data to a third country or an international organisation, unless required to do so by Union or Member State law to which the processor is subject; in such a case, the processor shall inform the controller of that legal requirement before processing, unless that law prohibits such information on important grounds of public interest; b. ensures that persons authorised to process the personal data have committed themselves to confidentiality or are under an appropriate statutory obligation of confidentiality; c. takes all measures required pursuant to Article 32; d. respects the conditions referred to in paragraphs 2 and 4 for engaging another processor; e. taking into account the nature of the processing, assists the controller by appropriate technical and organisational measures, insofar as this is possible, for the fulfilment of the controller’s obligation to respond to requests for exercising the data subject’s rights laid down in Chapter III; f. assists the controller in ensuring compliance with the obligations pursuant to Articles 32 to 36 taking into account the nature of processing and the information available to the processor; g. at the choice of the controller, deletes or returns all the personal data to the controller after the end of the provision of services relating to processing, and deletes existing copies unless Union or Member State law requires storage of the personal data; h. makes available to the controller all information necessary to demonstrate compliance with the obligations laid down in this Article and allow for and contribute to audits, including inspections, conducted by the controller or another auditor mandated by the controller.  With regard to point (h) of the first subparagraph, the processor shall immediately inform the controller if, in its opinion, an instruction infringes this Regulation or other Union or Member State data protection provisions.

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.3(a)

> Processing by a processor shall be governed by a contract or other legal act under Union or Member State law, that is binding on the processor with regard to the controller and that sets out the subject-matter and duration of the processing, the nature and purpose of the processing, the type of personal data and categories of data subjects and the obligations and rights of the controller. That contract or other legal act shall stipulate, in particular, that the processor:  a. processes the personal data only on documented instructions from the controller, including with regard to transfers of personal data to a third country or an international organisation, unless required to do so by Union or Member State law to which the processor is subject; in such a case, the processor shall inform the controller of that legal requirement before processing, unless that law prohibits such information on important grounds of public interest; 

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.3(b)

> Processing by a processor shall be governed by a contract or other legal act under Union or Member State law, that is binding on the processor with regard to the controller and that sets out the subject-matter and duration of the processing, the nature and purpose of the processing, the type of personal data and categories of data subjects and the obligations and rights of the controller. That contract or other legal act shall stipulate, in particular, that the processor:   b. ensures that persons authorised to process the personal data have committed themselves to confidentiality or are under an appropriate statutory obligation of confidentiality; 

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.3(c)

> Processing by a processor shall be governed by a contract or other legal act under Union or Member State law, that is binding on the processor with regard to the controller and that sets out the subject-matter and duration of the processing, the nature and purpose of the processing, the type of personal data and categories of data subjects and the obligations and rights of the controller. That contract or other legal act shall stipulate, in particular, that the processor:   c. takes all measures required pursuant to Article 32; 

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.3(d)

> Processing by a processor shall be governed by a contract or other legal act under Union or Member State law, that is binding on the processor with regard to the controller and that sets out the subject-matter and duration of the processing, the nature and purpose of the processing, the type of personal data and categories of data subjects and the obligations and rights of the controller. That contract or other legal act shall stipulate, in particular, that the processor:   d. respects the conditions referred to in paragraphs 2 and 4 for engaging another processor; 

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.3(e)

> Processing by a processor shall be governed by a contract or other legal act under Union or Member State law, that is binding on the processor with regard to the controller and that sets out the subject-matter and duration of the processing, the nature and purpose of the processing, the type of personal data and categories of data subjects and the obligations and rights of the controller. That contract or other legal act shall stipulate, in particular, that the processor:   e. taking into account the nature of the processing, assists the controller by appropriate technical and organisational measures, insofar as this is possible, for the fulfilment of the controller’s obligation to respond to requests for exercising the data subject’s rights laid down in Chapter III; 

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.3(f)

> Processing by a processor shall be governed by a contract or other legal act under Union or Member State law, that is binding on the processor with regard to the controller and that sets out the subject-matter and duration of the processing, the nature and purpose of the processing, the type of personal data and categories of data subjects and the obligations and rights of the controller. That contract or other legal act shall stipulate, in particular, that the processor:   f. assists the controller in ensuring compliance with the obligations pursuant to Articles 32 to 36 taking into account the nature of processing and the information available to the processor; 

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.3(g)

> Processing by a processor shall be governed by a contract or other legal act under Union or Member State law, that is binding on the processor with regard to the controller and that sets out the subject-matter and duration of the processing, the nature and purpose of the processing, the type of personal data and categories of data subjects and the obligations and rights of the controller. That contract or other legal act shall stipulate, in particular, that the processor:  g. at the choice of the controller, deletes or returns all the personal data to the controller after the end of the provision of services relating to processing, and deletes existing copies unless Union or Member State law requires storage of the personal data; 

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.3(h)

> Processing by a processor shall be governed by a contract or other legal act under Union or Member State law, that is binding on the processor with regard to the controller and that sets out the subject-matter and duration of the processing, the nature and purpose of the processing, the type of personal data and categories of data subjects and the obligations and rights of the controller. That contract or other legal act shall stipulate, in particular, that the processor:  h. makes available to the controller all information necessary to demonstrate compliance with the obligations laid down in this Article and allow for and contribute to audits, including inspections, conducted by the controller or another auditor mandated by the controller.  With regard to point (h) of the first subparagraph, the processor shall immediately inform the controller if, in its opinion, an instruction infringes this Regulation or other Union or Member State data protection provisions.

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.4

> Where a processor engages another processor for carrying out specific processing activities on behalf of the controller, the same data protection obligations as set out in the contract or other legal act between the controller and the processor as referred to in paragraph 3 shall be imposed on that other processor by way of a contract or other legal act under Union or Member State law, in particular providing sufficient guarantees to implement appropriate technical and organisational measures in such a manner that the processing will meet the requirements of this Regulation. Where that other processor fails to fulfil its data protection obligations, the initial processor shall remain fully liable to the controller for the performance of that other processor’s obligations.

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.5

> Adherence of a processor to an approved code of conduct as referred to in Article 40 or an approved certification mechanism as referred to in Article 42 may be used as an element by which to demonstrate sufficient guarantees as referred to in paragraphs 1 and 4 of this Article.

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.6

> Without prejudice to an individual contract between the controller and the processor, the contract or the other legal act referred to in paragraphs 3 and 4 of this Article may be based, in whole or in part, on standard contractual clauses referred to in paragraphs 7 and 8 of this Article, including when they are part of a certification granted to the controller or processor pursuant to Articles 42 and 43.

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.7

> The Commission may lay down standard contractual clauses for the matters referred to in paragraph 3 and 4 of this Article and in accordance with the examination procedure referred to in Article 93(2).

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.8

> A supervisory authority may adopt standard contractual clauses for the matters referred to in paragraph 3 and 4 of this Article and in accordance with the consistency mechanism referred to in Article 63.

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.9

> The contract or the other legal act referred to in paragraphs 3 and 4 shall be in writing, including in electronic form.

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 28.10

> Without prejudice to Articles 82, 83 and 84, if a processor infringes this Regulation by determining the purposes and means of processing, the processor shall be considered to be a controller in respect of that processing.

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 29

> The processor and any person acting under the authority of the controller or of the processor, who has access to personal data, shall not process those data except on instructions from the controller, unless required to do so by Union or Member State law.

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 30.1

> Each controller and, where applicable, the controller’s representative, shall maintain a record of processing activities under its responsibility. That record shall contain all of the following information: a. the name and contact details of the controller and, where applicable, the joint controller, the controller’s representative and the data protection officer; 

**SCF Controls:** PRI-14

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 30.1(a)

> Each controller and, where applicable, the controller’s representative, shall maintain a record of processing activities under its responsibility. That record shall contain all of the following information: a. the name and contact details of the controller and, where applicable, the joint controller, the controller’s representative and the data protection officer; b. the purposes of the processing; c. a description of the categories of data subjects and of the categories of personal data; d. the categories of recipients to whom the personal data have been or will be disclosed including recipients in third countries or international organisations; e. where applicable, transfers of personal data to a third country or an international organisation, including the identification of that third country or international organisation and, in the case of transfers referred to in the second subparagraph of Article 49(1), the documentation of suitable safeguards; f. where possible, the envisaged time limits for erasure of the different categories of data; g. where possible, a general description of the technical and organisational security measures referred to in Article 32(1).

**SCF Controls:** PRI-14

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 30.1(b)

> Each controller and, where applicable, the controller’s representative, shall maintain a record of processing activities under its responsibility. That record shall contain all of the following information:  b. the purposes of the processing; 

**SCF Controls:** PRI-14

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 30.1(c)

> Each controller and, where applicable, the controller’s representative, shall maintain a record of processing activities under its responsibility. That record shall contain all of the following information:  c. a description of the categories of data subjects and of the categories of personal data; 

**SCF Controls:** PRI-14

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 30.1(d)

> Each controller and, where applicable, the controller’s representative, shall maintain a record of processing activities under its responsibility. That record shall contain all of the following information:  d. the categories of recipients to whom the personal data have been or will be disclosed including recipients in third countries or international organisations; 

**SCF Controls:** PRI-14

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 30.1(e)

> Each controller and, where applicable, the controller’s representative, shall maintain a record of processing activities under its responsibility. That record shall contain all of the following information:  e. where applicable, transfers of personal data to a third country or an international organisation, including the identification of that third country or international organisation and, in the case of transfers referred to in the second subparagraph of Article 49(1), the documentation of suitable safeguards; 

**SCF Controls:** PRI-14

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 30.1(f)

> Each controller and, where applicable, the controller’s representative, shall maintain a record of processing activities under its responsibility. That record shall contain all of the following information:  f. where possible, the envisaged time limits for erasure of the different categories of data; 

**SCF Controls:** PRI-14

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 30.1(g)

> Each controller and, where applicable, the controller’s representative, shall maintain a record of processing activities under its responsibility. That record shall contain all of the following information:  g. where possible, a general description of the technical and organisational security measures referred to in Article 32(1).

**SCF Controls:** PRI-14

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 30.2

> Each processor and, where applicable, the processor’s representative shall maintain a record of all categories of processing activities carried out on behalf of a controller, containing: a. the name and contact details of the processor or processors and of each controller on behalf of which the processor is acting, and, where applicable, of  the controller’s or the processor’s representative, and the data protection officer; b. the categories of processing carried out on behalf of each controller; c. where applicable, transfers of personal data to a third country or an international organisation, including the identification of that third country or international organisation and, in the case of transfers referred to in the second subparagraph of Article 49(1), the documentation of suitable safeguards; d. where possible, a general description of the technical and organisational security measures referred to in Article 32(1). 

**SCF Controls:** PRI-14

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 30.2(a)

> Each processor and, where applicable, the processor’s representative shall maintain a record of all categories of processing activities carried out on behalf of a controller, containing: a. the name and contact details of the processor or processors and of each controller on behalf of which the processor is acting, and, where applicable, of  the controller’s or the processor’s representative, and the data protection officer; 

**SCF Controls:** PRI-14

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 30.2(b)

> Each processor and, where applicable, the processor’s representative shall maintain a record of all categories of processing activities carried out on behalf of a controller, containing:  b. the categories of processing carried out on behalf of each controller; 

**SCF Controls:** PRI-14

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 30.2(c)

> Each processor and, where applicable, the processor’s representative shall maintain a record of all categories of processing activities carried out on behalf of a controller, containing:  c. where applicable, transfers of personal data to a third country or an international organisation, including the identification of that third country or international organisation and, in the case of transfers referred to in the second subparagraph of Article 49(1), the documentation of suitable safeguards; 

**SCF Controls:** PRI-14

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 30.2(d)

> Each processor and, where applicable, the processor’s representative shall maintain a record of all categories of processing activities carried out on behalf of a controller, containing:  d. where possible, a general description of the technical and organisational security measures referred to in Article 32(1). 

**SCF Controls:** PRI-14

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 30.3

> The records referred to in paragraphs 1 and 2 shall be in writing, including in electronic form.

**SCF Controls:** PRI-14

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 30.4

> The controller or the processor and, where applicable, the controller’s or the processor’s representative, shall make the record available to the supervisory authority on request.

**SCF Controls:** CPL-01.3

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to an organization's ability to demonstrate conformity with applicable cybersecurity and data protection requirements by providing built-in compliance measurement, scoring, reporting, and audit logging capabilities. The organizational processes for identifying applicable laws, regulations, and contractual obligations, and for managing the overall compliance program, fall outside the product's scope.

VCF Operations includes a Compliance capability that surfaces core aspects of VCF security configuration in a single view. This capability continuously monitors whether objects in the environment meet industrial, governmental, regulatory, or internal standards, and calculates a compliance score as the ratio of compliant objects to the total number of objects assessed by a given benchmark, displayed as a percentage. When all objects are compliant, the score card displays 100. When objects are non-compliant, the number of non-compliant symptoms is shown in red alongside the total symptom count. The compliance score for an individual object is based on the most critical of the violated standards, and the score is calculated for all objects in the environment regardless of whether a given user has visibility into every object. This means the compliance posture reported reflects the true state of the environment, not a filtered view.

The compliance engine detects violations, highlights risk areas, and provides actionable remediation recommendations. Compliance alerts appear as violations to the standard, and the triggered symptoms appear as violated rules, giving administrators clear evidence of where the environment stands against a given benchmark. VCF supports compliance measurement against multiple industry-standard security guidelines and benchmarks, including the DISA STIG. NSX also provides a compliance report that administrators can use to verify that the NSX networking environment adheres to organizational IT policies and industry standards.

On the audit trail side, VCF components generate detailed logs of security-relevant events. Audit logs capture actions from the API, the user interface, and the CLI. Changes to user role assignments are automatically written to syslog and the audit log. VCF supports syslog forwarding to external monitoring systems for centralized log retention and long-term evidence preservation. VCF Log Management includes content packs for VCF components that provide pre-built dashboards, alerts, and queries for common compliance use cases such as failed login tracking, privilege escalation monitoring, and policy violation detection. Together, these logging and reporting capabilities allow organizations to produce and retain the technical evidence needed when demonstrating conformity to auditors or regulatory bodies.

For workloads running within VMware Kubernetes Service (VKS) on the VCF platform, the Consumption layer contributes a set of policy enforcement and access control mechanisms that produce inspectable, auditable artifacts. Pod Security Admission enforces Pod Security Standards at the namespace level with three profiles: Privileged, Baseline, and Restricted. Each namespace can be independently configured with enforce, audit, and warn modes; when a namespace runs in audit mode, the Kubernetes API server records policy violations without blocking workloads, generating per-namespace records of how running pods compare to the configured security profile. This output can be presented as direct evidence that the environment evaluates workload security posture against a defined standard. For high-assurance environments, cryptographic protections can be applied to Kubernetes audit logs to make them tamper-evident and confidential. Kubernetes Role-Based Access Control stores Roles, ClusterRoles, RoleBindings, ClusterRoleBindings, and ServiceAccounts as standard API objects, making the current permission model fully inspectable and exportable at any point; IAM role trust policies can be scoped to specific service accounts and namespaces to enforce least privilege. ValidatingAdmissionPolicy resources define enforcement rules as versioned Kubernetes API objects that can be queried, compared across revisions, and archived as policy compliance snapshots, providing a mechanism for capturing what policy was in effect at a given point in time. Network policies govern ingress and egress traffic at the namespace level as declarative Kubernetes objects, constituting auditable documentation of the implemented network segmentation model. Access to download and manage VKS Cluster Management Security Policy templates requires assignment to the Organization Administrator or Organization Auditor role, maintaining separation between those who define policy and those who audit it. VCF Automation security policies apply constraints at the organization or project level, and those constraints are inherited by all child resources.

To support resilience conformity, VMware vCenter and VCF Operations each support both file-based and image-based backup and restore. The vCenter backup schedule can be configured with backup location, recurrence, and retention parameters, providing administrators with a mechanism to document that scheduled, recoverable backups of the platform management layer are in operation. VKS cluster management supports backup and restore of an entire cluster, selected namespaces, or specific resources identified by a label. These operations are managed through the VCF Automation Tenant Portal under Manage & Govern > VCF Services > Kubernetes Management > Clusters > Data Protection, where backups can also be restored from a source cluster to a target cluster. VKS Supervisor state backup, including cluster node virtual machines, is activated through the vCenter backup feature in the vCenter Management Interface. For workload-level backup, Velero with the vSphere Plugin Snapshot or File System Backup method supports backup and restore of both stateless and stateful VKS cluster workloads; backup repositories support deduplication, compression, and encryption to protect backup integrity, and scheduled backup operations are available to support a regular recovery cadence. Organizations should maintain an etcd backup plan as part of demonstrating that cluster-state resilience capability exists.

Demonstrating conformity with cybersecurity and data protection obligations is fundamentally an organizational responsibility. VCF's compliance scoring, alerting, and reporting capabilities provide a significant portion of the technical evidence needed, but the organization must maintain the broader compliance program, including policy documentation, control mapping to applicable regulations, periodic assessments, and remediation tracking. Additional tools or processes outside VCF are needed to cover areas such as personnel security, physical security, and governance that fall outside the scope of infrastructure platform controls.

VMware Private AI Services (PAIS), formerly Private AI Services, provides several mechanisms that generate evidence relevant to demonstrating security and compliance conformity for AI infrastructure. Organizations can draw on these mechanisms when preparing documentation or responding to audits.

The PAISConfiguration custom resource includes an observability section that activates Prometheus-based metrics collection from PAIS components. Administrators activate metrics collection by uncommenting the spec.observability.prometheusRuntime section of the PAISConfiguration CR. Observability is configured as part of PAIS activation in VCF Automation and must be verified as active in the PAIS instance namespace. Once activated, PAIS controller pod metrics can be sent to VCF Operations through a Telegraf agent running on the Supervisor instance, and metrics can also be visualized in third-party observability platforms such as Grafana. A single Grafana instance can visualize metrics from multiple PAIS instances when they share an OIDC provider, supporting consolidated operational evidence across deployments.

PAIS observability also supports sending LLM traces to an OpenTelemetry Collector, providing a record of model inference activity within the platform. When activated, this trace data together with the Prometheus metrics gives MLOps engineers and auditors operational evidence of AI workload behavior.

PAIS uses Harbor Registry as its model artifact store, with the Model Gallery integrated to Harbor for model storage and retrieval. Harbor project access capabilities restrict access to sensitive training data and model artifacts, and Harbor robot accounts are configured for image pulls when the registry requires authentication. MLOps engineers validate ML models onboarded to PAIS against the security, privacy, and technical requirements of the organization, and PAIS guidance directs users to distribute models validated on deep learning VMs rather than models retrieved directly from the Internet. These workflows produce records of which models entered the gallery and under what governance.

Identity and access management for PAIS is coordinated with an external OIDC provider, including for Grafana integration. Within the platform, PAIS must be activated in organization namespaces by an organization administrator or MLOps engineer after namespace creation, establishing a documented authorization layer over GPU-accelerated workloads. VCF Automation Provider Management also requires trusted certificate import for vCenter certificate validation before integration with PAIS, supporting a documented trust layer. PAIS additionally requires examination and approval of MCP server tools and capabilities before use in agents, creating a review record for specialized data and capability integrations.

Demonstrating conformity with applicable laws and regulations requires more than technical controls alone. The organization must define its compliance scope, identify applicable obligations, map platform capabilities to control requirements, and assemble evidence packages for auditors or regulators. PAIS's observability, model governance, access control, and identity integration mechanisms contribute to that evidence base but do not replace the organizational governance layer that frames and presents the evidence.

#### VMware vDefend (Contributes)

VMware vDefend (VMware vDefend) contributes to demonstrating conformity with cybersecurity obligations by providing auditable records of security policy configuration and enforcement.

The Security Services Platform's Rule Analysis feature detects contradictions and redundancies in firewall policy by comparing effective group memberships and policy paths, allowing organizations to verify that implemented rules align with documented security requirements. Rule Analysis results can be reviewed in the Security Services Platform UI under System > Platform & Features, and the feature produces CSV reports for inclusion in compliance evidence packages. Rule Analysis access is governed by role-based permissions across five defined roles: Enterprise Admin, Auditor, Security Engineer, Security Operator, and Support Bundle Collector.

Security Intelligence policy recommendations can be generated for environments and published as firewall policies applied to environment category pairs. These recommendations include security policies and security groups, creating a documented record of recommended and enforced controls that can be presented during audits.

Role-based access controls include dedicated Auditor, Security Engineer, Security Operator, Enterprise Admin, and Support Bundle Collector roles with differentiated permissions that support segregation of duties during compliance assessments. The Auditor role provides read-only visibility into security configurations and activity, enabling independent review by compliance personnel without modification access. Privileged labels in the Distributed Firewall anchor firewall rules to immutable labels, providing a tamper-proof mechanism that helps administrators demonstrate workloads remain within their designated security groups as intended by policy.

These capabilities help produce demonstrable evidence of security control implementation. Full conformity with legal and contractual obligations also depends on organizational governance, documentation practices, and audit workflows that extend beyond what vDefend provides directly.

#### VCF Protection and Recovery (Contributes)

VCF Protection and Recovery (PNR) generates technical artifacts and supports compliance-oriented subscription tiers that organizations can use as evidence when demonstrating conformity with disaster recovery and data protection requirements. PNR does not include a dedicated compliance management engine, framework mapping capability, or benchmark scoring system.

The Advanced Cyber Compliance subscription, sold as a VCF advanced service, provides on-premises data protection and recovery capabilities designed for regulated environments. Advanced cyber protection and recovery capabilities within PNR require an Advanced Cyber Compliance per-core license in addition to VCF core capabilities, and an Advanced Cyber Compliance subscription is required to configure remote snapshots. The existence of this compliance-tier subscription reflects PNR's intended use in environments subject to regulatory and contractual data protection obligations.

Protection groups and recovery plans constitute documented configurations that must be verified for connection and validity. These configurations identify which workloads are protected and the recovery objectives assigned to each workload. Maintaining verified protection groups and recovery plans produces artifacts that organizations can present to demonstrate that DR procedures are defined and operational.

The Clean Room Orchestrator generates Events representing observations and issues raised by the system, providing information about situations that require attention or action. This event stream contributes to the operational audit record for recovery environment activities.

Identifying which laws and regulations apply, mapping controls to requirements, and managing the overall compliance program are organizational responsibilities outside the scope of PNR.

#### VMware Data Services Manager (Contributes)

VMware Data Services Manager (DSM) contributes to an organization's ability to demonstrate conformity through several mechanisms: enforceable data service policies, per-policy compliance reporting, infrastructure policy guardrails with compliance alerting, configurable backup and retention controls, and audit event logging.

DSM supports the creation and enforcement of data service policies that define organizational standards for database deployments, including PostgreSQL, MySQL, SQL Server, and MinIO databases. Administrators configure these policies and assign them to one or more organizations or tenants, creating a documented, repeatable configuration baseline. When integrated with VCF Automation, these policies can be enforced consistently across tenants to maintain a uniform security and compliance posture. Policy definitions can be tailored to specific organizational requirements, providing an auditable record of the standards applied to each tenant. The Infrastructure Policies view in the DSM dashboard provides visibility into which policies are active and which databases are associated with them.

DSM provides a compliance report for each data service policy that displays policy violations, noncompliant databases, data services, and namespaces, giving administrators a structured view of deviations from defined organizational standards. DSM also generates infrastructure policy compliance alerts that allow administrators to monitor whether clusters are operating in conformance with defined infrastructure policies. Infrastructure policies create guardrails that restrict the quality and quantity of resources DSM users can consume from vSphere clusters, providing a mechanism for documented resource governance that can be presented to auditors as evidence of enforced controls.

For resilience conformity, DSM supports automated database backups with configurable schedules (full and incremental), configurable retention periods, and configurable storage locations using S3-compatible object stores, local storage, or cloud targets. DSM retains automated backups of deleted databases until the configured retention policy is met, and administrators can edit the retention period for retained backups. Backups can be enabled or modified after database creation via the automated-backups setting. Control plane backups are stored in S3 object storage with unique identifiers corresponding to the control plane ID. Backup operations are logged at the error level to both console and file outputs, providing an operational audit trail for backup activity. These capabilities allow an organization to demonstrate that database resilience controls are in place and configured within defined parameters.

Demonstrating conformity to applicable laws, regulations, or contractual obligations requires organizational processes beyond what DSM provides directly. Organizations must map DSM's configuration and operational evidence to the specific requirements of applicable frameworks, collect and maintain that evidence, and manage formal attestation processes. DSM provides technical controls and configuration visibility that form part of the evidentiary foundation, but formal compliance documentation, evidence management, and audit reporting remain organizational responsibilities.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer (Avi) provides configuration export, backup management, and auditable policy artifacts that organizations can use when demonstrating security capability conformity for their application delivery infrastructure.

The Avi Controller CLI includes an export command to capture the full system configuration or an individual virtual service configuration. These exports document the security settings, WAF policies, and access control rules in effect at the time of capture and can be retained as part of a compliance documentation package. In VCF deployments, VCF Operations is used to configure the external backup server and storage path for Avi Load Balancer backups, and backups are stored on the same server as VCF Operations appliance backups by default. For deployments where the Controller runs as a single node, enabling periodic external configuration backups is a mandatory requirement to handle recovery in the case of a complete VM or disk failure.

Configuration backup files can be protected with a passphrase, keeping audit artifacts secure in storage. When a restore is performed, the Controller requires that the passphrase match the one used when creating the backup, validates that all file objects from the backup configuration are present before the restore can proceed, and verifies that the FIPS mode of the backup configuration matches the controller environment. This set of integrity checks supports the reliability of configuration records used as audit documentation.

For application security evidence, Avi's WAF Positive Security model allows administrators to define and document allowed application behavior through explicit policy rules, forming part of the evidence set for application security controls. Avi also provides User-Defined Metrics, which allow administrators to define and extract customized telemetry data required for specific compliance or reporting needs via API calls.

On the administrative access side, Avi supports role-based access control with object-level permissions that can be applied to roles and inherited by user groups. The ability to export certificates and private keys is restricted to the fewest number of administrators possible. The Auth Mapping Profile feature supports LDAP group match rules and attribute-based role assignments, enabling a verifiable access control posture that can be reviewed during an audit.

### Control 31

> The controller and the processor and, where applicable, their representatives, shall cooperate, on request, with the supervisory authority in the performance of its tasks.

**SCF Controls:** CPL-01.3

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to an organization's ability to demonstrate conformity with applicable cybersecurity and data protection requirements by providing built-in compliance measurement, scoring, reporting, and audit logging capabilities. The organizational processes for identifying applicable laws, regulations, and contractual obligations, and for managing the overall compliance program, fall outside the product's scope.

VCF Operations includes a Compliance capability that surfaces core aspects of VCF security configuration in a single view. This capability continuously monitors whether objects in the environment meet industrial, governmental, regulatory, or internal standards, and calculates a compliance score as the ratio of compliant objects to the total number of objects assessed by a given benchmark, displayed as a percentage. When all objects are compliant, the score card displays 100. When objects are non-compliant, the number of non-compliant symptoms is shown in red alongside the total symptom count. The compliance score for an individual object is based on the most critical of the violated standards, and the score is calculated for all objects in the environment regardless of whether a given user has visibility into every object. This means the compliance posture reported reflects the true state of the environment, not a filtered view.

The compliance engine detects violations, highlights risk areas, and provides actionable remediation recommendations. Compliance alerts appear as violations to the standard, and the triggered symptoms appear as violated rules, giving administrators clear evidence of where the environment stands against a given benchmark. VCF supports compliance measurement against multiple industry-standard security guidelines and benchmarks, including the DISA STIG. NSX also provides a compliance report that administrators can use to verify that the NSX networking environment adheres to organizational IT policies and industry standards.

On the audit trail side, VCF components generate detailed logs of security-relevant events. Audit logs capture actions from the API, the user interface, and the CLI. Changes to user role assignments are automatically written to syslog and the audit log. VCF supports syslog forwarding to external monitoring systems for centralized log retention and long-term evidence preservation. VCF Log Management includes content packs for VCF components that provide pre-built dashboards, alerts, and queries for common compliance use cases such as failed login tracking, privilege escalation monitoring, and policy violation detection. Together, these logging and reporting capabilities allow organizations to produce and retain the technical evidence needed when demonstrating conformity to auditors or regulatory bodies.

For workloads running within VMware Kubernetes Service (VKS) on the VCF platform, the Consumption layer contributes a set of policy enforcement and access control mechanisms that produce inspectable, auditable artifacts. Pod Security Admission enforces Pod Security Standards at the namespace level with three profiles: Privileged, Baseline, and Restricted. Each namespace can be independently configured with enforce, audit, and warn modes; when a namespace runs in audit mode, the Kubernetes API server records policy violations without blocking workloads, generating per-namespace records of how running pods compare to the configured security profile. This output can be presented as direct evidence that the environment evaluates workload security posture against a defined standard. For high-assurance environments, cryptographic protections can be applied to Kubernetes audit logs to make them tamper-evident and confidential. Kubernetes Role-Based Access Control stores Roles, ClusterRoles, RoleBindings, ClusterRoleBindings, and ServiceAccounts as standard API objects, making the current permission model fully inspectable and exportable at any point; IAM role trust policies can be scoped to specific service accounts and namespaces to enforce least privilege. ValidatingAdmissionPolicy resources define enforcement rules as versioned Kubernetes API objects that can be queried, compared across revisions, and archived as policy compliance snapshots, providing a mechanism for capturing what policy was in effect at a given point in time. Network policies govern ingress and egress traffic at the namespace level as declarative Kubernetes objects, constituting auditable documentation of the implemented network segmentation model. Access to download and manage VKS Cluster Management Security Policy templates requires assignment to the Organization Administrator or Organization Auditor role, maintaining separation between those who define policy and those who audit it. VCF Automation security policies apply constraints at the organization or project level, and those constraints are inherited by all child resources.

To support resilience conformity, VMware vCenter and VCF Operations each support both file-based and image-based backup and restore. The vCenter backup schedule can be configured with backup location, recurrence, and retention parameters, providing administrators with a mechanism to document that scheduled, recoverable backups of the platform management layer are in operation. VKS cluster management supports backup and restore of an entire cluster, selected namespaces, or specific resources identified by a label. These operations are managed through the VCF Automation Tenant Portal under Manage & Govern > VCF Services > Kubernetes Management > Clusters > Data Protection, where backups can also be restored from a source cluster to a target cluster. VKS Supervisor state backup, including cluster node virtual machines, is activated through the vCenter backup feature in the vCenter Management Interface. For workload-level backup, Velero with the vSphere Plugin Snapshot or File System Backup method supports backup and restore of both stateless and stateful VKS cluster workloads; backup repositories support deduplication, compression, and encryption to protect backup integrity, and scheduled backup operations are available to support a regular recovery cadence. Organizations should maintain an etcd backup plan as part of demonstrating that cluster-state resilience capability exists.

Demonstrating conformity with cybersecurity and data protection obligations is fundamentally an organizational responsibility. VCF's compliance scoring, alerting, and reporting capabilities provide a significant portion of the technical evidence needed, but the organization must maintain the broader compliance program, including policy documentation, control mapping to applicable regulations, periodic assessments, and remediation tracking. Additional tools or processes outside VCF are needed to cover areas such as personnel security, physical security, and governance that fall outside the scope of infrastructure platform controls.

VMware Private AI Services (PAIS), formerly Private AI Services, provides several mechanisms that generate evidence relevant to demonstrating security and compliance conformity for AI infrastructure. Organizations can draw on these mechanisms when preparing documentation or responding to audits.

The PAISConfiguration custom resource includes an observability section that activates Prometheus-based metrics collection from PAIS components. Administrators activate metrics collection by uncommenting the spec.observability.prometheusRuntime section of the PAISConfiguration CR. Observability is configured as part of PAIS activation in VCF Automation and must be verified as active in the PAIS instance namespace. Once activated, PAIS controller pod metrics can be sent to VCF Operations through a Telegraf agent running on the Supervisor instance, and metrics can also be visualized in third-party observability platforms such as Grafana. A single Grafana instance can visualize metrics from multiple PAIS instances when they share an OIDC provider, supporting consolidated operational evidence across deployments.

PAIS observability also supports sending LLM traces to an OpenTelemetry Collector, providing a record of model inference activity within the platform. When activated, this trace data together with the Prometheus metrics gives MLOps engineers and auditors operational evidence of AI workload behavior.

PAIS uses Harbor Registry as its model artifact store, with the Model Gallery integrated to Harbor for model storage and retrieval. Harbor project access capabilities restrict access to sensitive training data and model artifacts, and Harbor robot accounts are configured for image pulls when the registry requires authentication. MLOps engineers validate ML models onboarded to PAIS against the security, privacy, and technical requirements of the organization, and PAIS guidance directs users to distribute models validated on deep learning VMs rather than models retrieved directly from the Internet. These workflows produce records of which models entered the gallery and under what governance.

Identity and access management for PAIS is coordinated with an external OIDC provider, including for Grafana integration. Within the platform, PAIS must be activated in organization namespaces by an organization administrator or MLOps engineer after namespace creation, establishing a documented authorization layer over GPU-accelerated workloads. VCF Automation Provider Management also requires trusted certificate import for vCenter certificate validation before integration with PAIS, supporting a documented trust layer. PAIS additionally requires examination and approval of MCP server tools and capabilities before use in agents, creating a review record for specialized data and capability integrations.

Demonstrating conformity with applicable laws and regulations requires more than technical controls alone. The organization must define its compliance scope, identify applicable obligations, map platform capabilities to control requirements, and assemble evidence packages for auditors or regulators. PAIS's observability, model governance, access control, and identity integration mechanisms contribute to that evidence base but do not replace the organizational governance layer that frames and presents the evidence.

#### VMware vDefend (Contributes)

VMware vDefend (VMware vDefend) contributes to demonstrating conformity with cybersecurity obligations by providing auditable records of security policy configuration and enforcement.

The Security Services Platform's Rule Analysis feature detects contradictions and redundancies in firewall policy by comparing effective group memberships and policy paths, allowing organizations to verify that implemented rules align with documented security requirements. Rule Analysis results can be reviewed in the Security Services Platform UI under System > Platform & Features, and the feature produces CSV reports for inclusion in compliance evidence packages. Rule Analysis access is governed by role-based permissions across five defined roles: Enterprise Admin, Auditor, Security Engineer, Security Operator, and Support Bundle Collector.

Security Intelligence policy recommendations can be generated for environments and published as firewall policies applied to environment category pairs. These recommendations include security policies and security groups, creating a documented record of recommended and enforced controls that can be presented during audits.

Role-based access controls include dedicated Auditor, Security Engineer, Security Operator, Enterprise Admin, and Support Bundle Collector roles with differentiated permissions that support segregation of duties during compliance assessments. The Auditor role provides read-only visibility into security configurations and activity, enabling independent review by compliance personnel without modification access. Privileged labels in the Distributed Firewall anchor firewall rules to immutable labels, providing a tamper-proof mechanism that helps administrators demonstrate workloads remain within their designated security groups as intended by policy.

These capabilities help produce demonstrable evidence of security control implementation. Full conformity with legal and contractual obligations also depends on organizational governance, documentation practices, and audit workflows that extend beyond what vDefend provides directly.

#### VCF Protection and Recovery (Contributes)

VCF Protection and Recovery (PNR) generates technical artifacts and supports compliance-oriented subscription tiers that organizations can use as evidence when demonstrating conformity with disaster recovery and data protection requirements. PNR does not include a dedicated compliance management engine, framework mapping capability, or benchmark scoring system.

The Advanced Cyber Compliance subscription, sold as a VCF advanced service, provides on-premises data protection and recovery capabilities designed for regulated environments. Advanced cyber protection and recovery capabilities within PNR require an Advanced Cyber Compliance per-core license in addition to VCF core capabilities, and an Advanced Cyber Compliance subscription is required to configure remote snapshots. The existence of this compliance-tier subscription reflects PNR's intended use in environments subject to regulatory and contractual data protection obligations.

Protection groups and recovery plans constitute documented configurations that must be verified for connection and validity. These configurations identify which workloads are protected and the recovery objectives assigned to each workload. Maintaining verified protection groups and recovery plans produces artifacts that organizations can present to demonstrate that DR procedures are defined and operational.

The Clean Room Orchestrator generates Events representing observations and issues raised by the system, providing information about situations that require attention or action. This event stream contributes to the operational audit record for recovery environment activities.

Identifying which laws and regulations apply, mapping controls to requirements, and managing the overall compliance program are organizational responsibilities outside the scope of PNR.

#### VMware Data Services Manager (Contributes)

VMware Data Services Manager (DSM) contributes to an organization's ability to demonstrate conformity through several mechanisms: enforceable data service policies, per-policy compliance reporting, infrastructure policy guardrails with compliance alerting, configurable backup and retention controls, and audit event logging.

DSM supports the creation and enforcement of data service policies that define organizational standards for database deployments, including PostgreSQL, MySQL, SQL Server, and MinIO databases. Administrators configure these policies and assign them to one or more organizations or tenants, creating a documented, repeatable configuration baseline. When integrated with VCF Automation, these policies can be enforced consistently across tenants to maintain a uniform security and compliance posture. Policy definitions can be tailored to specific organizational requirements, providing an auditable record of the standards applied to each tenant. The Infrastructure Policies view in the DSM dashboard provides visibility into which policies are active and which databases are associated with them.

DSM provides a compliance report for each data service policy that displays policy violations, noncompliant databases, data services, and namespaces, giving administrators a structured view of deviations from defined organizational standards. DSM also generates infrastructure policy compliance alerts that allow administrators to monitor whether clusters are operating in conformance with defined infrastructure policies. Infrastructure policies create guardrails that restrict the quality and quantity of resources DSM users can consume from vSphere clusters, providing a mechanism for documented resource governance that can be presented to auditors as evidence of enforced controls.

For resilience conformity, DSM supports automated database backups with configurable schedules (full and incremental), configurable retention periods, and configurable storage locations using S3-compatible object stores, local storage, or cloud targets. DSM retains automated backups of deleted databases until the configured retention policy is met, and administrators can edit the retention period for retained backups. Backups can be enabled or modified after database creation via the automated-backups setting. Control plane backups are stored in S3 object storage with unique identifiers corresponding to the control plane ID. Backup operations are logged at the error level to both console and file outputs, providing an operational audit trail for backup activity. These capabilities allow an organization to demonstrate that database resilience controls are in place and configured within defined parameters.

Demonstrating conformity to applicable laws, regulations, or contractual obligations requires organizational processes beyond what DSM provides directly. Organizations must map DSM's configuration and operational evidence to the specific requirements of applicable frameworks, collect and maintain that evidence, and manage formal attestation processes. DSM provides technical controls and configuration visibility that form part of the evidentiary foundation, but formal compliance documentation, evidence management, and audit reporting remain organizational responsibilities.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer (Avi) provides configuration export, backup management, and auditable policy artifacts that organizations can use when demonstrating security capability conformity for their application delivery infrastructure.

The Avi Controller CLI includes an export command to capture the full system configuration or an individual virtual service configuration. These exports document the security settings, WAF policies, and access control rules in effect at the time of capture and can be retained as part of a compliance documentation package. In VCF deployments, VCF Operations is used to configure the external backup server and storage path for Avi Load Balancer backups, and backups are stored on the same server as VCF Operations appliance backups by default. For deployments where the Controller runs as a single node, enabling periodic external configuration backups is a mandatory requirement to handle recovery in the case of a complete VM or disk failure.

Configuration backup files can be protected with a passphrase, keeping audit artifacts secure in storage. When a restore is performed, the Controller requires that the passphrase match the one used when creating the backup, validates that all file objects from the backup configuration are present before the restore can proceed, and verifies that the FIPS mode of the backup configuration matches the controller environment. This set of integrity checks supports the reliability of configuration records used as audit documentation.

For application security evidence, Avi's WAF Positive Security model allows administrators to define and document allowed application behavior through explicit policy rules, forming part of the evidence set for application security controls. Avi also provides User-Defined Metrics, which allow administrators to define and extract customized telemetry data required for specific compliance or reporting needs via API calls.

On the administrative access side, Avi supports role-based access control with object-level permissions that can be applied to roles and inherited by user groups. The ability to export certificates and private keys is restricted to the fewest number of administrators possible. The Auth Mapping Profile feature supports LDAP group match rules and attribute-based role assignments, enabling a verifiable access control posture that can be reviewed during an audit.

### Control 32.1

> Taking into account the state of the art, the costs of implementation and the nature, scope, context and purposes of processing as well as the risk of varying likelihood and severity for the rights and freedoms of natural persons, the controller and the processor shall implement appropriate technical and organisational measures to ensure a level of security appropriate to the risk, including inter alia as appropriate: a. the pseudonymisation and encryption of personal data; b. the ability to ensure the ongoing confidentiality, integrity, availability and resilience of processing systems and services; c. the ability to restore the availability and access to personal data in a timely manner in the event of a physical or technical incident; d. a process for regularly testing, assessing and evaluating the effectiveness of technical and organisational measures for ensuring the security of the processing.

**SCF Controls:** PRI-01.6

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides multiple layers of logical security safeguards that contribute to protecting the confidentiality and integrity of data, including personal data, hosted on the platform. These controls span encryption, access management, workload isolation, network security, host hardening, and privacy-aware features, giving organizations a strong technical foundation on which to build privacy-protective deployments.

VCF supports encryption for data at rest and data in transit across several components. Virtual Machine Encryption provides data-at-rest encryption for virtual machine data and disks, with support for different encryption keys for VM home and virtual disk, allowing granular control over which components are encrypted. Individual virtual machines can also be provisioned with a virtual Trusted Platform Module (vTPM), which exposes TPM 2.0 functionality within the VM to support hardware-backed key storage and attestation for workloads that handle sensitive data. vSAN data-at-rest encryption protects data on storage devices in the event that a device is removed from the cluster, while vSAN data-in-transit encryption protects data as it moves between hosts within the cluster. Fault Tolerance log traffic, which replicates protected virtual machine memory state between hosts, can also be encrypted to prevent sensitive VM data from being exposed in transit. The Supervisor component encrypts all secrets stored in its etcd database, adding a layer of protection for sensitive configuration data. Administrators can configure HTTPS for databus transport in VCF Operations on-premises environments so that data is encrypted during transport. For cryptographic operations requiring higher assurance, VCF supports external entropy sources through hardware security modules (HSMs) that are FIPS 140-3 and EAL4 certified.

VCF isolates workloads at multiple levels. Each virtual machine runs in its own execution environment, preventing interference between tenants and enforcing data separation. vSphere Namespaces provide isolated sandboxes with enforced resource limits, storage policies, and per-namespace access controls that scope which users and groups can reach a given namespace. Workloads running in vSphere Pods or VMware Kubernetes Service clusters have default firewall isolation rules that restrict communication. VCF Automation supports app isolation policies through on-demand security group firewall rules that restrict traffic to only internal resources provisioned by a given cloud template.

Access control mechanisms restrict who can reach sensitive data and administrative functions. VCF supports identity provider federation with multi-factor authentication (MFA), strengthening authentication for access to infrastructure management. LDAP integration provides centralized authentication through an external directory service, giving organizations a single point of control for user lifecycle management. Role-based access control (RBAC) in vCenter allows administrators to scope privileges to specific objects and operations, limiting exposure of data to authorized personnel. The platform tracks user authentication events, including successful and failed login attempts, through its audit logging capabilities in VCF Operations.

Network-level controls provide logical isolation for workloads and their data. ESX does not allow guest virtual machines to have direct access to a physical network unless an administrator explicitly configures a virtual switch with a network interface attached to specific physical network interfaces. This default-deny posture restricts lateral movement and limits the pathways through which data can be accessed.

At the host level, the vSphere Security Configuration Guide provides recommendations for hardening ESX hosts, including configuring authentication and authorization settings, disabling unnecessary services, and enabling security features such as Secure Boot and Trusted Platform Module (TPM). TPM modules, when present, should be running the latest 2.0 firmware.

Storage security best practices documented in the platform guidance address securing access to storage devices, implementing storage encryption, and protecting virtual machine data. Administrators should be aware that core files and audit logs can contain sensitive information such as passwords or encryption keys, requiring appropriate access restrictions on those artifacts. Sensitive data such as passwords or private keys should not be stored in plain text in data sets.

VCF Automation includes a privacy-aware feature that controls whether full user names (first and last name) are displayed in the user interface. This toggle allows organizations to manage explicit consent for exposing personal user data, supporting alignment with global privacy regulations that require consent before displaying personally identifiable information. Deactivating the display revokes consent and prevents user names from appearing in the interface.

While VCF provides these technical safeguards, protecting personal data also requires organizational policies, data classification schemes, data loss prevention tooling, and privacy-specific operational procedures that fall outside the platform's scope. Physical security of the underlying infrastructure and the identification, classification, and handling rules for personal data must be defined and enforced by the organization. VCF supplies the infrastructure-level controls that underpin a privacy program, but the organizational governance layer is a separate responsibility.

#### VMware vDefend (Contributes)

VMware vDefend contributes to protecting personal data through network-level security controls applied to workloads that store, process, or transmit personal data. The vDefend distributed firewall (DFW) enforces microsegmentation policies that isolate workloads handling personal data, restricting lateral movement and limiting which systems can communicate with sensitive data flows. Security profiles can be applied to Virtual Private Clouds (VPCs) to define and manage the security posture of personal data environments.

The Security Services Platform (SSP) provides security segmentation assessment capabilities that identify risky application protocols transporting data in cleartext, and generate reports highlighting exposure of critical infrastructure servers such as DNS, DHCP, NTP, and LDAP. Organizations can use these assessments to restrict or block cleartext protocols and enforce secure protocol versions across their environments.

vDefend IDS/IPS provides signature-based threat detection for network attacks targeting systems holding personal data, including detection and prevention of SQL injection attempts against databases. The vDefend Network Detection and Response (NDR) capability anonymizes sensitive customer information when sharing telemetry to cloud services, directly supporting privacy within the analytics pipeline.

Physical safeguards, data classification, encryption at rest for workload data, and content-level data loss prevention remain outside vDefend's scope and require controls at other layers of the stack.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides application-layer logical security mechanisms that help protect traffic carrying personal data. At the transport layer, Avi supports SSL/TLS termination with certificate management, securing connections between clients and the application proxy and helping protect sensitive data from unauthorized interception or modification in transit (CLI Access Settings > Certificates). For Kubernetes workloads, the Avi Kubernetes Operator (AKO) supports PKIProfile configuration, which enables secure communication with backend services through certificate-based authentication and encryption (Designing and Deploying AKO > Setting up Routing Rules using CRDs > PKIProfile).

For application logging, the Avi Analytics Profile supports the creation of a sensitive log profile that governs how sensitive data is handled within client-side logs (Load Balancing > Analytics Profile > Client Log). Administrators can configure which fields are captured in client logs to limit inadvertent recording of personal data transmitted through applications. TLS persistence data, used to maintain session affinity across Service Engines, is stored in an encrypted format that a Service Engine can read if a client reconnects to a different Service Engine, reducing exposure of session-bound data throughout the persistence lifetime (Load Balancing > Persistence > TLS Persistence).

Client access to applications can be controlled through authentication profiles. Avi supports LDAP Authentication Profiles configurable with LDAPS for encrypted directory connections, validating user identities against a directory service before granting access to application resources (User Authentication and Authorization > Authentication Profile > LDAP Authentication Profile). Avi also supports OAuth 2.0 and OpenID Connect (OIDC) for secure delegated client authentication, enabling identity providers to issue tokens to third-party applications without exposing user credentials directly (Security > Client Authentication > OAuth and OIDC).

Multi-tenant data plane isolation depends on context configuration. When Tenant Context is used, Avi provides both control plane and data plane isolation, scoping application traffic to designated tenant resources and supporting multi-tenant deployments where each tenant's traffic remains separated. When Provider Context is used, only control plane isolation is provided; organizations requiring full data plane separation should configure Tenant Context accordingly (Tenant Settings > Tenants Versus SE Group Isolation).

Health monitor probes in secure environments should use encrypted credentials; Avi supports reconfiguring existing health monitors from plaintext credentials to encrypted form when encrypted authentication is required (Load Balancing > Health Monitoring > HTTP Health Monitor). For deployments with stringent cryptographic requirements, Avi supports FIPS 140-3 compliance, which requires stricter handling of keys, authentication data, and random number generation to help protect sensitive security parameters (FIPS Compliance in Avi Load Balancer > FIPS 140-3 Compliance). For Avi Controller deployments automated via Ansible, Ansible Vault can be used to securely store sensitive variables such as passwords and API tokens, reducing the risk of credential exposure during automated provisioning (Automation Tools Overview > Ansible).

Not applicable for this control: VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 32.1(a)

> Taking into account the state of the art, the costs of implementation and the nature, scope, context and purposes of processing as well as the risk of varying likelihood and severity for the rights and freedoms of natural persons, the controller and the processor shall implement appropriate technical and organisational measures to ensure a level of security appropriate to the risk, including inter alia as appropriate: a. the pseudonymisation and encryption of personal data; 

**SCF Controls:** CRY-01, PRI-01.6

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF implements cryptographic protections across its component stack using publicly standardized, validated cryptographic modules and algorithms.

Multiple VCF components rely on cryptographic modules validated through the NIST Cryptographic Module Validation Program (CMVP) to FIPS 140-2 and FIPS 140-3 standards. NSX is configured to use FIPS 140-3 validated cryptographic modules by default, and NSX Manager uses FIPS 140 approved algorithms for authentication to its cryptographic module. Specific NSX validated modules include IKE with Rambus Safezone 2.0 (Certificate #4898), VMware OpenSSL 3.0.9 (Certificate #4861), VMware BouncyCastle 2.0.0 (Certificate #4986), and VMware BoringCrypto 6.0 (Certificate #4694). VCF Automation uses the BouncyCastle FIPS 2.0.0 cryptographic module, which holds FIPS 140-3 Certificate #4743. VCF Operations for Networks uses BC-FJA (Bouncy Castle FIPS Java API) version 2.0.0 with FIPS 140-2 Certificate #37009 as its validated cryptographic module. This consistent use of FIPS-validated modules across the platform means that organizations deploying VCF in regulated environments can rely on cryptographic implementations that have undergone independent validation against well-known public standards. The VMware Kubernetes Service (VKS) consumption layer also supports FIPS mode: VKS ClusterClass configurations include a fips.enabled variable that, when set, restricts cryptographic operations on cluster nodes to approved algorithm implementations. FIPS-enabled Kubernetes release images, identified by a -fips suffix in the release reference name, are available for organizations that require FIPS-validated cryptography across their containerized workloads.

At the protocol and algorithm level, VCF enforces modern cryptographic standards throughout. Starting in vSphere 9.0, all TLS profiles are FIPS compliant; the COMPATIBLE profile supports modern TLS cipher suites with standardized elliptic curves. Monitoring infrastructure such as Telegraf enforces a modern TLS minimum version for secure communication. The NSX L2 VPN FIPS compliance suite uses AES-GCM encryption with Perfect Forward Secrecy and Diffie-Hellman Group 20. NSX also supports ECDSA (Elliptic Curve Digital Signature Algorithm) encryption for environments with high-assurance cryptographic requirements. VCF Operations for Networks supports several encryption algorithms and ciphers for its data sources. VCF Operations provides a FIPS Security Mode that, when enabled, applies additional algorithm and cipher prerequisites across the management domain. All system management network communications are encrypted by default using standardized cipher suites. At the VKS layer, Kubernetes control plane components expose parameters for restricting permitted TLS configurations: the kube-apiserver --tls-cipher-suites parameter, the kubelet tlsCipherSuites configuration field, and the equivalent parameter on the kube-scheduler each restrict the set of permitted cipher suites, allowing administrators to exclude deprecated or weak algorithms. The kubelet tlsMinVersion field and the --tls-min-version parameter on the kube-apiserver enforce a minimum TLS protocol version floor for inbound connections. The Antrea networking component and vSphere Cloud Provider Interface on VKS clusters also support configurable TLS cipher suites for component-to-component communication. Kubernetes hardening guidance identifies specific preferred cipher suites and calls out cipher suite configuration on the kube-scheduler as a required hardening step. VKS clusters support the Istio service mesh package, which provides mutual TLS between workloads within the mesh; the meshMTLS.minProtocolVersion setting controls the minimum protocol version for inter-service communication, defaulting to TLS 1.2 with support for configuring TLS 1.3.

Data-in-transit protections using TLS have customizable PKI keypair and certificate options. These range from fully automated within VCF to semi-automated using certificates from enterprise PKI infrastructure or fully custom certificates installed manually. Automated certificate issuance is supported with Microsoft Active Directory Certificate Services. Trust establishment uses standard PKI management with multiple certificate options including Root CA certificates, CSR-based certificates, and direct certificate uploads. VCF Operations provides centralized certificate lifecycle management for all VCF components, enabling automated certificate renewal, monitoring, and replacement across the infrastructure. Organizations should be aware that if self-signed certificates and private keys are generated using OpenSSL, those certificates and private keys are not FIPS-compatible. Environments operating under FIPS requirements should use certificate authorities and key generation methods that produce FIPS-compliant artifacts. For FIPS environments, certificates should use key sizes of 2048 or 3072 bits; key sizes greater than 3072 bits have not been tested with FIPS. At the VKS layer, the cert-manager package manages the lifecycle of certificates issued to workloads and ingress endpoints. VKS clusters maintain TLS certificates for component-to-component communication across their control and data planes. The Contour ingress package supports minimum TLS version configuration through the tls.minimum-protocol-version parameter. Harbor, when deployed as a Supervisor Service, accepts custom TLS certificate configuration through the tlsCertificate.tls.crt and tlsCertificate.tls.key fields, allowing organizations to supply certificates from their enterprise certificate authority rather than relying on self-signed certificates. The Supervisor secret injection agent automatically configures mutual TLS for communication with the vault-agent-injector service using auto-generated certificates.

Data-at-rest encryption uses vSAN cluster-based encryption or VM Encryption on non-vSAN storage. vSAN encryption uses AES-NI CPU offloading for efficient processing, and VMware ESX hosts encrypt vSAN disk data using the industry standard AES-256 XTS mode. Encryption keys are managed through KMIP 1.1-compatible external Key Management Servers (KMS) or vSphere Native Key Provider (NKP), which is included in all vSphere editions and does not require an external key server. VCF implements a three-element domain of trust comprising the key provider, VMware vCenter, and vSAN hosts. Key Encryption Keys (KEK) wrap Disk Encryption Keys (DEK) for secure key management; ESX hosts use the KEK to encrypt their internal keys and store only the encrypted internal keys on disk, not the KEK itself.

VCF Standard Key Providers have key wrapping capabilities that let organizations store a single wrapping key in their KMS, protecting multiple Key Encryption Keys within the VCF environment. This creates a three-tier key hierarchy: the Data Encryption Key encrypts object data, the Key Encryption Key protects the DEK, and the wrapping key protects the KEK. This approach reduces the number of keys stored in external KMS systems while maintaining cryptographic separation. Key wrapping includes automatic key rotation with configurable intervals from 30 days to 10 years.

With key persistence enabled, ESX hosts can persist encryption keys in the Trusted Platform Module (TPM) across reboots, allowing encryption operations to continue when the key server is unavailable. Each ESX host obtains the encryption keys initially and retains them in its key cache; if the ESX host has a TPM, the encryption keys are persisted in the TPM across reboots. Key persistence can be enabled using the esxcli system security keypersistence enable command.

VCF supports guest-level security features including virtual Trusted Platform Module (vTPM) 2.0 for VMs. This enables in-guest encryption capabilities such as Windows BitLocker, Linux disk encryption, and other operating system-native security features. Secure Boot provides UEFI verification to help ensure only signed and trusted code runs during the VM boot process. These features work independently of or in combination with infrastructure-level encryption, allowing organizations to implement defense-in-depth strategies.

vSAN offers Data-in-Transit (DIT) encryption as a cluster-wide setting that encrypts all data and metadata traffic as it transits across hosts. For vSAN Original Storage Architecture (OSA), data-at-rest encryption occurs at the Local Object Manager (LSOM) layer on the target host, making DIT encryption strongly recommended to restrict network-level interception. For vSAN Express Storage Architecture (ESA) in HCI mode, data is encrypted at the VM host before network transmission, making DIT encryption optional based on compliance requirements and risk tolerance. DIT encryption operates without requiring external key management servers and provides independent key rotation from data-at-rest encryption.

Encrypted vSphere vMotion secures confidentiality, integrity, and authenticity of data transferred during VM migrations. For encrypted VMs, vMotion always uses encryption. For unencrypted VMs, encrypted vMotion can be set to Disabled, Opportunistic (default), or Required. Cross-vCenter vMotion is supported when using shared key providers or backup/import of Native Key Provider. VCF uses one-time keys (nonces) for each migration session so that captured traffic cannot be replayed or decrypted after migration completes.

Memory Tiering encryption provides protection for tiered memory without requiring external key management. VCF generates random 256-bit AES-XTS keys at the kernel level during VM power-on, unique to each VM instance or per host depending on configuration.

VM Encryption provides protection across all datastore types including vSAN, iSCSI, NFS, and Fibre Channel. Disk encryption uses XTS-AES-256 keys as the disk encryption key. This encryption occurs before data reaches the storage layer, providing both data-at-rest and data-in-transit protection.

Kubernetes on VKS supports encryption at rest for data stored within the control plane. Operators configure the encryption provider and manage key access for control plane secrets; when relying on a managed key provider, administrators retain responsibility for access controls over the managed key material. The VCF Automation consumption layer includes VCF Encryption Management, which grants organization administrators the ability to use encryption keys from their own key providers for encryption of virtual machines and disks in their VCF environment, extending the platform's cryptographic key management to tenant-level operations.

For storage protocols, VCF provides varying levels of native encryption support. iSCSI includes CHAP for session authentication. Fibre Channel Gen 7 supports end-to-end encryption with secure HBAs. For NFS datastores, version 4.1 supports Kerberos authentication with three security levels: krb5 (authentication only), krb5i (authentication plus integrity checking), and krb5p (authentication plus privacy with full encryption).

ESX stores configuration data in encrypted form on boot devices. When the host has a TPM 2.0 enabled and configured, the configuration encryption key is stored in the TPM. The encryption mode can be configured using the esxcli system settings encryption set command with the --mode=TPM parameter.

Cryptographic operations are controlled through fine-grained privileges in vCenter. Only users assigned the Cryptographic Operations privileges can perform cryptographic operations. A dedicated No Cryptography Administrator role enables standard VM and infrastructure management while restricting unauthorized encryption changes. This role can be cloned and customized to grant only specific Cryptographic Operations privileges, such as allowing encryption but not decryption, supporting the principle of least privilege for encryption tasks. The CryptoManager and CryptoManagerKmip managed objects provide programmatic interfaces for handling cryptographic keys and integrating with key management server infrastructure. vSAN encryption key management requires specific permissions including Cryptographer.ManageEncryptionPolicy, Cryptographer.ManageKeyServers, and Cryptographer.ManageKeys.

vSAN includes secure disk wipe capabilities for proper media sanitization when decommissioning storage, supporting the Erase disks before use option during encryption configuration and disk management operations.

Defining the organization's cryptographic policy (algorithm selection, key strength, rotation schedules, KMS architecture, FIPS-mode activation decisions) and the key lifecycle management standards that govern key creation, distribution, storage, archive, and destruction sit with the organization above the platform. VCF supplies the validated cryptographic modules and protocol enforcement; the organizational cryptographic governance program determines how those mechanisms apply across the environment. Security Technical Implementation Guides (STIGs) for Supervisor and VKS releases are available to guide cryptographic hardening of the consumption layer.

VMware Private AI Services (PAIS) provides cryptographic controls across its AI infrastructure components, building on the cryptographic foundation of VCF.

GPU-accelerated VMware Kubernetes Service (VKS) clusters deployed for PAIS workloads use a FIPS-enabled Kubernetes runtime. The VKS cluster topology version applied to both control plane and worker deployments uses a FIPS-enabled VKR build running on Ubuntu 24.04, so AI workloads on PAIS VKS clusters operate within a FIPS-compliant Kubernetes runtime.

PAIS endpoints use TLS for service communication. The PAISConfiguration custom resource supports configurable CA bundle references through spec.clientTls.caBundleRefs for OIDC provider and Harbor registry authentication. The Supervisor endpoint communication for PAIS uses HTTPS on port 6443 with certificate-based authentication. The PAIS Prometheus metrics endpoint uses self-signed certificate authentication with TLS, where the CA certificate is retrieved from the pais-ingress-default Secret in the PAIS namespace and configured in base64-decoded form. Prometheus TLS client authentication and certificate validation are off by default; auditors should verify that client authentication is enabled in production deployments where mutual certificate validation is required.

PAIS requires CA trust bundles to be configured for all external HTTPS connections, including OIDC providers, Harbor registries, content management systems used as data sources in the Data Indexing and Retrieval service (such as Confluence or SharePoint), MCP servers that provide tools to agents, and the pgvector database server used for vector storage. Trust bundle material is obtained from each external system's administrator either as a certificate file or as a ConfigMap stored in the namespace where PAIS is deployed, and PAIS recommends maintaining separate trust bundles per application with periodic updates before certificate expiration. Administrators add trusted certificates through the VCF Automation Provider Management UI under Certificate Management and Trusted Certificates. The issuer certificate of the Harbor registry must also be added to the certificate trust store on Deep Learning VMs that pull models from the registry. When connecting to an MCP server over HTTPS, the MCP server issuer certificate must be added as a CA trust bundle.

The underlying cryptographic algorithms, cipher suites, and platform-level key management are provided by VCF and VKS. Organizations are responsible for selecting and enforcing approved cryptographic standards at the VCF and infrastructure level, while PAIS provides the certificate management and trust chain configuration mechanisms specific to AI service endpoints.

#### VMware vDefend (Contributes)

VMware vDefend contributes to the implementation of cryptographic protection controls by using known public standards and trusted cryptographic technologies across its component stack for securing inter-component communications and providing cryptographic inspection capabilities for network traffic.

Security Services Platform (SSP), the control-plane component of vDefend, secures communications between vDefend product components using certificates and current TLS protocol versions with approved cipher suites. SSP and the SSP Installer deploy with the most current TLS version by default and also support the prior major TLS version. The TLS versions and cipher suites allowed on SSP Installer and SSP are fixed and cannot be modified, which enforces a consistent cryptographic baseline across deployments.

SSP components, including the SSP Installer and the NDR Sensor for vDefend, implement FIPS 140-2 and FIPS 140-3 cryptographic module standards. SSP uses the VMware BouncyCastle Module (NIST CMVP Certificate #4943) and the VMware OpenSSL FIPS provider Object Module (NIST CMVP Certificate #4861) for its cryptographic operations. SSP actively enforces cryptographic hygiene by rejecting any certificate or TLS configuration that uses deprecated algorithms, short keys, or legacy protocol versions, returning a validation error rather than permitting degraded connections.

Certificate management within SSP provides lifecycle controls including certificate export, certificate signing request (CSR) generation, and CA-signed certificate replacement. SSP monitors and manages several certificate types used to identify client and host machines, establish trust between components, secure communications, and control access levels. Administrators can retrieve and validate LDAP certificates using standard tools to establish secure LDAPS connections for platform authentication. These capabilities allow organizations to integrate vDefend into their broader PKI infrastructure and follow standard certificate lifecycle practices.

vDefend provides TLS Inspection capabilities that allow the firewall to decrypt, inspect, and re-encrypt TLS-protected traffic. Without TLS Inspection, encrypted traffic cannot be examined or enforced against security policies even when other advanced security features are enabled. With TLS Inspection enabled, vDefend gains visibility into encrypted traffic flows, supporting more effective access control and threat detection. TLS Inspection also supports importing or generating trusted and untrusted proxy certificate authorities for external decryption profiles, giving administrators control over the CA chain used in inspection.

TLS Inspection includes a Crypto Enforcement option within decryption action profiles that allows administrators to set minimum and maximum protocol version and cipher suite constraints for both client and server connections. Profiles can be configured in Transparent or Enforce modes; the Enforce mode requires compliance with the configured cryptographic constraints.

vDefend IDS/IPS signature rules extend cryptographic visibility by supporting protocol version matching and certificate Subject field matching, enabling enforcement decisions based on certificate metadata in encrypted traffic. IDS/IPS rules also support storing TLS/SSL certificates to disk for forensic analysis and threat investigation. SSP guidance recommends that organizations restrict or block protocols that carry data in cleartext and enforce minimum secure protocol versions as part of their network security practices.

vDefend does not itself provide the underlying key management infrastructure (KMS), platform-wide PKI lifecycle management, or the broader VCF platform's cryptographic controls; those responsibilities belong to VCF. However, vDefend's consistent use of approved cryptographic standards for its own operations and its ability to perform cryptographic inspection of network traffic contribute to an organization's overall implementation of cryptographic protection controls.

#### VCF Protection and Recovery (Contributes)

VCF Protection and Recovery (PNR) implements cryptographic protections for disaster recovery workflows using known public standards and trusted cryptographic technologies.

PNR uses modern TLS by default for all connections to the PNR server. The minimum TLS protocol version is configurable through the envoy-proxy-config.json file by editing the tls_minimum_protocol_version parameter. When the minimum protocol version is modified, PNR requires that the change be applied consistently across all relevant configuration occurrences in the system. Administrators can verify the TLS version in use on the Site Recovery Manager component using standard OpenSSL tooling.

The PNR Appliance requires an SSL/TLS certificate as the endpoint certificate for all TLS connections to the PNR server. PNR supports custom certificates signed by a certificate authority as an alternative to self-signed certificates. Custom SSL/TLS server endpoint certificates must meet specific requirements, including x509v3 Extended Key Usage indicating TLS Web Server Authentication. The Appliance Management Interface allows administrators to import CA-signed server certificates and custom root CA certificates, and to replace the appliance certificate. PNR uses TLS certificates and private keys to protect network communication and establish authentication with other servers. Certificate verification error messages are logged in security-related log files, and operational log files do not contain sensitive information such as private keys or passwords.

For encrypted virtual machine replication, PNR requires that the recovery and protected sites use a common Key Management Server (KMS) or that the KMS clusters at both sites share common encryption keys. Replication of encrypted virtual machines also requires Secure LWD support to be available on the virtual machine. This supports data-at-rest encryption continuity for virtual machines through the recovery lifecycle.

Defining the organization's cryptographic policy, including KMS architecture decisions, minimum TLS version selection, certificate management standards, and key lifecycle practices, sits with the organization above the DR layer. PNR supplies the cryptographic mechanisms needed for DR-specific traffic and operations; the organizational cryptographic governance program determines how those mechanisms apply across the environment.

#### VMware Data Services Manager (Contributes)

VMware Data Services Manager (DSM) implements cryptographic protections across multiple layers of its architecture, applying standard cryptographic technologies for data in transit, certificate trust management, and credential storage.

Starting with DSM, the platform enforces FIPS 140-3 compliant cryptographic standards and validates certificates during upload, rejecting unsupported algorithms or parameters. Only RSA and ECDSA public key algorithms are accepted for certificates. The Ed25519 elliptic curve signature algorithm is rejected because it does not comply with FIPS 140-3. Custom trusted certificates should use ECDSA P-256 or P-384 algorithms; RSA certificates must meet a minimum key size of 2048 bits per FIPS requirements. DSM's latest certificate validation mode enforces strict cryptographic and KeyUsage validations across all DSM endpoints, including the Provider VM and data service clusters.

For connections to database clusters, DSM requires TLS for all client traffic. PostgreSQL database instances enforce a minimum TLS protocol version through the ssl_min_protocol_version setting. MySQL enforces minimum TLS versions on both the main connection interface and the administrative interface; these settings are fixed and cannot be modified by users, which helps maintain a consistent cryptographic baseline across deployments. MySQL also exposes the group_replication_recovery_tls_version setting to specify the TLS protocol used during distributed recovery connections. DSM supports SQL Server clusters, which use TLS to encrypt communication between clients and the cluster; the network.tlsProtocols custom engine setting defines the allowed TLS versions for client connections, and a minimum TLS version must be included for the DSM operator to manage the cluster. DSM supports TLS verification during PostgreSQL database migration, covering replication traffic between source and target clusters.

DSM's certificate management capabilities support standard PKI practices. Administrators configure custom TLS certificates for database clusters through the DSM UI or API, providing certificates in PEM format with associated private keys and CA certificates. Supported private key algorithms are RSA and ECDSA with key sizes of 256 and 384 bits. When present, the X509v3 KeyUsage extension on a custom certificate must include the DigitalSignature capability; DSM also accepts certificates that omit the KeyUsage extension entirely, treating absent KeyUsage as permitting all usages in accordance with RFC 5280. To establish secure connections to database clusters and to the DSM Provider VM, clients add the CA to the operating system trust store or the trusted CA list. DSM's API provides a mechanism to retrieve the CA certificate from a custom certificate secret. The Consumption Operator, which enables self-service database provisioning, requires a TLS certificate for its communication with the DSM provider. Certificate management can also be handled through Kubernetes cert-manager, which manages various issuer types and outputs Kubernetes TLS Secrets in the format DSM requires.

DSM supports TLS for connections to external systems. When configuring log forwarding to an SMTP server, DSM supports Auto TLS to establish a secure connection. For private container registries, DSM supports CA certificate validation for untrusted registries.

For local user credential storage, DSM encrypts passwords using PGP symmetric encryption through the PGCrypto library, with dedicated encryption keys stored using the PGCRYPTO_PASSWORD and PGCRYPTO_ALGORITHM keys. MySQL has FIPS mode available on the client side through the ssl_fips_mode setting. PostgreSQL databases include the pgcrypto extension, which provides cryptographic functions that applications can use directly within the database. The DSM Provider Appliance includes virtual machine encryption, which activates when a Key Management Server is configured in the environment.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides configurable SSL/TLS profiles that control which cipher suites, protocol versions, and key exchange algorithms are permitted for application traffic termination. The SSL/TLS Profile, configured under Templates > Security > SSL/TLS Profile, contains the accepted protocol version list and a prioritized cipher suite list applied to virtual services. Administrators can create custom profiles or select from built-in templates; the documentation notes that the choice of accepted ciphers and protocol versions involves trade-offs between security, client compatibility, and computational expense. SSL profiles in 9.1 include a Post Quantum Cryptography section with support for modern cipher suites. Controller SSL/TLS certificates support elliptic curve (EC) or RSA algorithms, with EC recommended for new deployments.

For environments subject to cryptographic module validation requirements, Avi supports a FIPS mode backed by the OpenSSL FIPS Provider, which has been validated at FIPS 140-3 Security Level 1 and awarded Certificate #4985 by the Cryptographic Module Validation Program (CMVP). When FIPS mode is activated on the Controller cluster, Avi restricts cryptographic operations to FIPS-compliant algorithms only. FIPS 140-3 also requires stricter handling of sensitive security parameters including keys, authentication data, and random number generation. FIPS mode is enabled at the Controller cluster level through the Controller settings. Note that FIPS mode does not support SSL Client Hello events in Avi DataScript, which may affect certain scripted traffic inspection use cases.

Avi Controller allows administrators to restrict specific key exchange algorithms and ciphers for management session access. The Allowed Ciphers field restricts management session ciphers to a specified subset, and the kex_algorithm_exclude field under Controller Settings excludes specific key exchange methods for SSH-based administrative access. Internal communications between the Avi Controller and Service Engines also use SSL/TLS, and custom certificates can be selected for this Secure Channel connection via the Access tab certificate field.

For certificate management, Avi integrates with Hardware Security Modules (HSMs), including the Thales Luna (formerly SafeNet Luna) HSM, for cryptographic key storage and management. The Controller is set up as an HSM client and can create keys and certificates directly on the HSM through client libraries, supporting high-availability HSM configurations. Automated certificate lifecycle management is available through Let's Encrypt integration using the ACME protocol. Avi's App Transport Security feature supports integration with the Venafi Trust Protection Platform for certificate administration across tenants, with the Trust Protection Platform pushing signed certificates and required chain certificates to Avi Load Balancer.

For Kubernetes deployments, the Avi Kubernetes Operator (AKO) supports PKIProfile-based certificate validation and trust management for backend services. The PKIProfile, configured through custom resources, enables secure communication with backend services through certificate-based authentication and encryption. In VCF environments, the Avi PKI Profile defines the list of trusted certificate authorities permitted to sign client certificates and can be used to implement Zero Trust security between servers and clients.

Data-at-rest encryption for Avi Controller and Service Engine VMs is provided by VCF at the platform layer, not by Avi itself. Organizations must configure Avi SSL/TLS profiles, select appropriate cipher suites, and enable FIPS mode where cryptographic module validation requirements apply to activate these controls.

### Control 32.1(b)

> Taking into account the state of the art, the costs of implementation and the nature, scope, context and purposes of processing as well as the risk of varying likelihood and severity for the rights and freedoms of natural persons, the controller and the processor shall implement appropriate technical and organisational measures to ensure a level of security appropriate to the risk, including inter alia as appropriate:  b. the ability to ensure the ongoing confidentiality, integrity, availability and resilience of processing systems and services; 

**SCF Controls:** PRI-01.6

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides multiple layers of logical security safeguards that contribute to protecting the confidentiality and integrity of data, including personal data, hosted on the platform. These controls span encryption, access management, workload isolation, network security, host hardening, and privacy-aware features, giving organizations a strong technical foundation on which to build privacy-protective deployments.

VCF supports encryption for data at rest and data in transit across several components. Virtual Machine Encryption provides data-at-rest encryption for virtual machine data and disks, with support for different encryption keys for VM home and virtual disk, allowing granular control over which components are encrypted. Individual virtual machines can also be provisioned with a virtual Trusted Platform Module (vTPM), which exposes TPM 2.0 functionality within the VM to support hardware-backed key storage and attestation for workloads that handle sensitive data. vSAN data-at-rest encryption protects data on storage devices in the event that a device is removed from the cluster, while vSAN data-in-transit encryption protects data as it moves between hosts within the cluster. Fault Tolerance log traffic, which replicates protected virtual machine memory state between hosts, can also be encrypted to prevent sensitive VM data from being exposed in transit. The Supervisor component encrypts all secrets stored in its etcd database, adding a layer of protection for sensitive configuration data. Administrators can configure HTTPS for databus transport in VCF Operations on-premises environments so that data is encrypted during transport. For cryptographic operations requiring higher assurance, VCF supports external entropy sources through hardware security modules (HSMs) that are FIPS 140-3 and EAL4 certified.

VCF isolates workloads at multiple levels. Each virtual machine runs in its own execution environment, preventing interference between tenants and enforcing data separation. vSphere Namespaces provide isolated sandboxes with enforced resource limits, storage policies, and per-namespace access controls that scope which users and groups can reach a given namespace. Workloads running in vSphere Pods or VMware Kubernetes Service clusters have default firewall isolation rules that restrict communication. VCF Automation supports app isolation policies through on-demand security group firewall rules that restrict traffic to only internal resources provisioned by a given cloud template.

Access control mechanisms restrict who can reach sensitive data and administrative functions. VCF supports identity provider federation with multi-factor authentication (MFA), strengthening authentication for access to infrastructure management. LDAP integration provides centralized authentication through an external directory service, giving organizations a single point of control for user lifecycle management. Role-based access control (RBAC) in vCenter allows administrators to scope privileges to specific objects and operations, limiting exposure of data to authorized personnel. The platform tracks user authentication events, including successful and failed login attempts, through its audit logging capabilities in VCF Operations.

Network-level controls provide logical isolation for workloads and their data. ESX does not allow guest virtual machines to have direct access to a physical network unless an administrator explicitly configures a virtual switch with a network interface attached to specific physical network interfaces. This default-deny posture restricts lateral movement and limits the pathways through which data can be accessed.

At the host level, the vSphere Security Configuration Guide provides recommendations for hardening ESX hosts, including configuring authentication and authorization settings, disabling unnecessary services, and enabling security features such as Secure Boot and Trusted Platform Module (TPM). TPM modules, when present, should be running the latest 2.0 firmware.

Storage security best practices documented in the platform guidance address securing access to storage devices, implementing storage encryption, and protecting virtual machine data. Administrators should be aware that core files and audit logs can contain sensitive information such as passwords or encryption keys, requiring appropriate access restrictions on those artifacts. Sensitive data such as passwords or private keys should not be stored in plain text in data sets.

VCF Automation includes a privacy-aware feature that controls whether full user names (first and last name) are displayed in the user interface. This toggle allows organizations to manage explicit consent for exposing personal user data, supporting alignment with global privacy regulations that require consent before displaying personally identifiable information. Deactivating the display revokes consent and prevents user names from appearing in the interface.

While VCF provides these technical safeguards, protecting personal data also requires organizational policies, data classification schemes, data loss prevention tooling, and privacy-specific operational procedures that fall outside the platform's scope. Physical security of the underlying infrastructure and the identification, classification, and handling rules for personal data must be defined and enforced by the organization. VCF supplies the infrastructure-level controls that underpin a privacy program, but the organizational governance layer is a separate responsibility.

#### VMware vDefend (Contributes)

VMware vDefend contributes to protecting personal data through network-level security controls applied to workloads that store, process, or transmit personal data. The vDefend distributed firewall (DFW) enforces microsegmentation policies that isolate workloads handling personal data, restricting lateral movement and limiting which systems can communicate with sensitive data flows. Security profiles can be applied to Virtual Private Clouds (VPCs) to define and manage the security posture of personal data environments.

The Security Services Platform (SSP) provides security segmentation assessment capabilities that identify risky application protocols transporting data in cleartext, and generate reports highlighting exposure of critical infrastructure servers such as DNS, DHCP, NTP, and LDAP. Organizations can use these assessments to restrict or block cleartext protocols and enforce secure protocol versions across their environments.

vDefend IDS/IPS provides signature-based threat detection for network attacks targeting systems holding personal data, including detection and prevention of SQL injection attempts against databases. The vDefend Network Detection and Response (NDR) capability anonymizes sensitive customer information when sharing telemetry to cloud services, directly supporting privacy within the analytics pipeline.

Physical safeguards, data classification, encryption at rest for workload data, and content-level data loss prevention remain outside vDefend's scope and require controls at other layers of the stack.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides application-layer logical security mechanisms that help protect traffic carrying personal data. At the transport layer, Avi supports SSL/TLS termination with certificate management, securing connections between clients and the application proxy and helping protect sensitive data from unauthorized interception or modification in transit (CLI Access Settings > Certificates). For Kubernetes workloads, the Avi Kubernetes Operator (AKO) supports PKIProfile configuration, which enables secure communication with backend services through certificate-based authentication and encryption (Designing and Deploying AKO > Setting up Routing Rules using CRDs > PKIProfile).

For application logging, the Avi Analytics Profile supports the creation of a sensitive log profile that governs how sensitive data is handled within client-side logs (Load Balancing > Analytics Profile > Client Log). Administrators can configure which fields are captured in client logs to limit inadvertent recording of personal data transmitted through applications. TLS persistence data, used to maintain session affinity across Service Engines, is stored in an encrypted format that a Service Engine can read if a client reconnects to a different Service Engine, reducing exposure of session-bound data throughout the persistence lifetime (Load Balancing > Persistence > TLS Persistence).

Client access to applications can be controlled through authentication profiles. Avi supports LDAP Authentication Profiles configurable with LDAPS for encrypted directory connections, validating user identities against a directory service before granting access to application resources (User Authentication and Authorization > Authentication Profile > LDAP Authentication Profile). Avi also supports OAuth 2.0 and OpenID Connect (OIDC) for secure delegated client authentication, enabling identity providers to issue tokens to third-party applications without exposing user credentials directly (Security > Client Authentication > OAuth and OIDC).

Multi-tenant data plane isolation depends on context configuration. When Tenant Context is used, Avi provides both control plane and data plane isolation, scoping application traffic to designated tenant resources and supporting multi-tenant deployments where each tenant's traffic remains separated. When Provider Context is used, only control plane isolation is provided; organizations requiring full data plane separation should configure Tenant Context accordingly (Tenant Settings > Tenants Versus SE Group Isolation).

Health monitor probes in secure environments should use encrypted credentials; Avi supports reconfiguring existing health monitors from plaintext credentials to encrypted form when encrypted authentication is required (Load Balancing > Health Monitoring > HTTP Health Monitor). For deployments with stringent cryptographic requirements, Avi supports FIPS 140-3 compliance, which requires stricter handling of keys, authentication data, and random number generation to help protect sensitive security parameters (FIPS Compliance in Avi Load Balancer > FIPS 140-3 Compliance). For Avi Controller deployments automated via Ansible, Ansible Vault can be used to securely store sensitive variables such as passwords and API tokens, reducing the risk of credential exposure during automated provisioning (Automation Tools Overview > Ansible).

Not applicable for this control: VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 32.1(c)

> Taking into account the state of the art, the costs of implementation and the nature, scope, context and purposes of processing as well as the risk of varying likelihood and severity for the rights and freedoms of natural persons, the controller and the processor shall implement appropriate technical and organisational measures to ensure a level of security appropriate to the risk, including inter alia as appropriate:  c. the ability to restore the availability and access to personal data in a timely manner in the event of a physical or technical incident; 

**SCF Controls:** BCD-01

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides a broad set of infrastructure-level capabilities that support business continuity and disaster recovery planning. While VCF does not itself constitute a Business Continuity Management System, it supplies the technical mechanisms that underpin resilient deployments and contingency operations.

vSAN stretched clusters allow organizations to extend a single vSAN datastore across two geographically separated sites with an independent witness host. When configured with site mirroring, a stretched cluster can tolerate the complete loss of one site while maintaining data availability. vSphere HA, when enabled on a stretched cluster, automatically restarts virtual machines on the surviving site during a site failure. To support this, vSphere HA admission control should be configured to reserve 50% of the cluster's aggregate CPU and memory resources for failover, and site-specific isolation response addresses should be defined so that vSphere HA can validate host isolation even when network connectivity between sites is lost. The admission control setting for host failures the cluster tolerates should also be updated after cluster expansion to reflect the correct host count per availability zone. When stretching a workload domain cluster, the default management vSphere cluster must already be stretched. vSphere HA uses network heartbeats to validate the state of VMware ESX hosts, and can also use heartbeat datastores mounted to more than one host (excluding vSAN datastores) for cluster membership monitoring.

vSphere HA also operates at the individual cluster level independent of stretched clusters. The HA configuration remediation mode can be set to quarantine mode, maintenance mode, or mixed mode to handle host failures in a controlled manner, helping maintain workload availability during hardware events. vSphere Fault Tolerance provides a higher tier of availability for individual virtual machines by maintaining a secondary VM in continuous lockstep with the primary, enabling instantaneous failover with no data loss if the primary host fails.

vSAN Data Protection provides snapshot-based protection through the vSAN Snapshot Service. Protection groups support configurable snapshot scheduling with adjustable intervals and retention policies that define retention duration and time units. This allows organizations to define data protection policies aligned with their recovery point objectives. The Snapshot Service API also supports operations such as restoring deleted virtual machines from snapshots and creating linked clones from snapshots.

vSphere Replication provides asynchronous replication of virtual machines with a configurable Recovery Point Objective (RPO), allowing organizations to replicate workloads to a secondary site and define acceptable data loss windows as part of their contingency planning.

VCF requires all management components, including VCF Operations, VMware vCenter, NSX, and VCF Automation, to be configured with a regular backup schedule and retention policy. VCF Operations configures NSX Manager backups during the initial deployment, with a recommended backup frequency of hourly and 7-day retention. Backup jobs for VCF Operations and all vCenter instances should start within the same 5-minute window to capture a consistent state. The VMware Infrastructure Health adapter within VCF Operations monitors backup job retention for management components, including NSX Manager. Changed Block Tracking (CBT) tracks modified disk sectors on virtual machines to support incremental backups, reducing backup windows and storage requirements for VM-level backup operations. vCenter itself also supports a High Availability configuration with Active and Passive nodes whose configuration files are continuously replicated, providing management-plane resilience independent of the backup schedule.

VMware HCX provides workload mobility capabilities for migrating and replicating VMs between sites. HCX supports multiple migration types through its Mobility Agent service, including vMotion, Cold Migration, Bulk Migration, and Replication Assisted vMotion (RAV), each addressing different scenarios from large-scale parallel migrations to zero-downtime live migrations. HCX also includes appliance-level backup and restore capabilities for the HCX Manager, including certificate backup and restore, supporting planned migrations and recovery scenarios as part of broader BC/DR operations.

VCF Operations monitors infrastructure health and surfaces alerts when conditions threaten availability, giving operations teams early warning of potential failures. The Platform Health Alerts page provides a centralized view of alerts across data sources and infrastructure nodes. VCF Automation provides alerts through the associated VCF Operations application for capacity, performance, and availability monitoring. VCF Operations also includes infrastructure planning and what-if analysis capabilities that help organizations forecast capacity requirements and plan for contingency scenarios. Committed scenarios reserve capacity by setting aside resources for new, upcoming, or planned workloads, helping stakeholders understand capacity requirements across the environment. Integration with IT Service Management and Configuration Management Database platforms is supported through VCF Automation, enabling organizations to tie their infrastructure management into broader service continuity workflows.

Lifecycle management tools allow administrators to plan updates and schedule maintenance windows to make changes with minimal disruption to services, supporting the operational continuity aspect of business continuity planning.

While VCF provides these technical capabilities, a complete BCMS requires organizational elements that fall outside the platform: documented continuity of operations plans, recovery time and recovery point objectives defined by business stakeholders, regular testing and exercise of recovery procedures, communication plans, and management oversight of the continuity program. VCF supplies the infrastructure resilience and recovery mechanisms that such plans depend on, but the planning, governance, and procedural components must be established and maintained by the organization.

#### VMware vDefend (Contributes)

VMware vDefend contributes to business continuity by providing security-layer continuity mechanisms that remain active during disaster recovery events and workload migrations. NSX Federation Security maintains security posture across data centers during disaster recovery and workload migration, preserving distributed firewall and gateway firewall policies so that enforcement continues through failover.

The Security Services Platform, which provides the underlying infrastructure for vDefend's threat detection and inspection services, supports vSphere High Availability configurations. When a VMware ESX host becomes unhealthy, vSphere HA migrates the affected Security Services Platform virtual machines to healthy hosts in the cluster, restoring threat detection capacity without manual intervention. VMware recommends enabling vSphere HA for host-level failure recovery and configuring a storage policy with RAID for datastore-level failure tolerance in Security Services Platform deployments.

Security Services Platform can also be deployed on a vSAN stretched cluster configuration, which replicates storage across two physically distinct sites connected by a high-bandwidth or low-latency inter-site link. This configuration requires a minimum of two sites with their own hosts and a witness host to handle potential conflicts arising from network partitions, supporting site-level failure scenarios.

When vSphere HA restarts workload VMs on a new recovery host after a failover, the vDefend distributed firewall automatically reinspects all traffic from those VMs on the receiving host, because the Flow Table contents cannot be moved between hosts during host recovery. Security policy enforcement resumes on the new host without manual reconfiguration.

The broader BCMS framework, including Continuity of Operations Plan and BC/DR playbooks, impact analyses, and organizational governance processes, is outside vDefend's scope and must be established through dedicated business continuity management programs.

#### VCF Protection and Recovery (Contributes)

VCF Protection and Recovery (PNR) provides the technical execution layer for contingency planning in virtualized infrastructure. Recovery plans define the sequence, priority, and configuration for failover operations, acting as executable BC/DR playbooks. Protection groups organize virtual machines into logical units aligned with application tiers or business functions, establishing the scope of each contingency plan.

Recovery plans support non-disruptive testing before use in planned migration or disaster recovery, allowing organizations to validate their contingency procedures without affecting production workloads. Recovery plan configuration differs between emergency scenarios at the protected site and planned migration of services from one site to another, with PNR supporting both modes. A forced recovery function is available during disaster recovery plan execution for scenarios requiring immediate failover.

vSphere Replication provides host-based replication with configurable Recovery Point Objectives (RPO), allowing organizations to set per-workload data loss tolerances. vSphere Replication supports up to 200 point-in-time recovery instances per virtual machine using the Latest Instances option, enabling recovery to specific earlier states. This capability is relevant to contingency scenarios involving data corruption or ransomware events. When the source site is accessible at the time of recovery, vSphere Replication can synchronize recent changes from the source site to the target site before completing the operation, reducing data loss.

In 9.1, PNR extends to multi-tenant disaster recovery through integration with VCF Automation. The product implements role-based access control with Organization Administrator, Project Administrator, and Project Advanced User roles, each with defined authorization levels for disaster recovery operations. Role assignments must be configured on both the primary and secondary PNR sites to maintain consistent access control across the DR environment. A multi-region deployment topology places separate management domains in each region to contain disaster impact to one region, while enabling service recovery in an alternate management domain when VCF Automation and VCF Operations are affected. The VCF Operations Orchestrator Plug-In for PNR provides Configuration, Inventory Mappings, Protection Groups, and Storage predefined workflow categories for workflow-driven recovery operations.

Cyber recovery deployments support a standard VCF topology where the workload domain is isolated from the management domain, providing separation between management and user workloads in clean-room recovery scenarios.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides application-layer resilience mechanisms at both the control plane and the data plane that organizations can incorporate into business continuity plans for application delivery services.

At the control plane, the Avi Controller is deployed as a cluster with continuous configuration replication across all nodes, providing management-plane redundancy so that a single Controller node failure does not interrupt application delivery operations. Avi supports deployment of the Controller cluster across two availability zones, with vSphere HA recommended to support recovery of any node that fails in the secondary zone. For single-node deployments, enabling vSphere HA on the Controller VM is recommended for node recovery following a host failure. The Avi Controller provides configuration backup and restore capability that supports disaster recovery and configuration migration across Controller instances; organizations should capture and retain Controller backups as part of their continuity documentation.

Availability Zone awareness in Avi allows multiple availability zones to be configured, each defining a subset of vCenter instances, hosts, and datastores that share a fault domain. Configuring availability zones during Service Engine Group setup distributes data-plane capacity across isolated failure domains, supporting continuity designs where application delivery capacity remains available if one fault domain becomes unavailable.

At the data plane, Avi's Elastic High Availability mode provides fast recovery for individual virtual services following Service Engine failure. In vSphere DRS-enabled clusters, virtual service recovery occurs before vSphere HA brings up a replacement Service Engine when virtual service slots are available in other Service Engines, giving the application delivery layer its own recovery path distinct from the infrastructure restart cycle. If vSphere HA does not recover the failed Service Engine within a configured timeout period, the Avi Controller resumes recovery independently. Service Engine VMs should be deployed on vSphere clusters configured with both HA and DRS in fully automated mode; when Avi is deployed with VMware Kubernetes Service (VKS) on VCF, DRS and HA are required on every vSphere cluster used with Avi.

For Kubernetes environments, the Avi Multi-Cluster Kubernetes Operator (AMKO) provides federation architecture that supports disaster recovery across Kubernetes clusters. AMKO designates a leader cluster and multiple member clusters, coordinating application delivery failover as part of a multi-cluster DR strategy.

Avi ControlScripts, used in conjunction with the alert framework, can perform automated failover actions such as adding or removing routes based on VIP attachment and detachment events, allowing organizations to define automated remediation workflows that respond to system events without manual administrator intervention.

In 9.1 deployments using VCF Automation, Avi's Central Licensing maintains a global capacity pool that removes the requirement for duplicate licenses in DR scenarios, supporting license continuity across failover sites.

Organizations should document these mechanisms, including the Elastic HA configuration, Controller cluster topology and backup schedule, availability zone placement, and AMKO federation design, in their Business Continuity and Disaster Recovery playbooks. The technical recovery capabilities are built into the product; the planning artifacts, testing procedures, and escalation workflows are organizational responsibilities that extend beyond what Avi provides.

Not applicable for this control: VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of this product.

### Control 32.1(d)

> Taking into account the state of the art, the costs of implementation and the nature, scope, context and purposes of processing as well as the risk of varying likelihood and severity for the rights and freedoms of natural persons, the controller and the processor shall implement appropriate technical and organisational measures to ensure a level of security appropriate to the risk, including inter alia as appropriate:  d. a process for regularly testing, assessing and evaluating the effectiveness of technical and organisational measures for ensuring the security of the processing.

**SCF Controls:** CPL-02, CPL-02.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 32.2

> In assessing the appropriate level of security account shall be taken in particular of the risks that are presented by processing, in particular from accidental or unlawful destruction, loss, alteration, unauthorised disclosure of, or access to personal data transmitted, stored or otherwise processed. 

**SCF Controls:** RSK-01

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 32.4

> The controller and processor shall take steps to ensure that any natural person acting under the authority of the controller or the processor who has access to personal data does not process them except on instructions from the controller, unless he or she is required to do so by Union or Member State law.

**SCF Controls:** HRS-02, HRS-03, IAC-08

**Aggregate Coverage:** Meets

#### VCF (Meets)

VCF enforces role-based access control across all major platform components, restricting access to technology assets, applications, services, and data based on assigned roles with defined permissions. RBAC is applied consistently throughout the stack, covering compute management, networking, storage, operations management, automation services, and Kubernetes workloads.

VMware vCenter provides fine-grained authorization through a permissions model that associates roles with users or groups on objects in the vCenter inventory hierarchy. Roles are sets of privileges, and vCenter defines three authorization levels: operator (read-only access to configuration, the most restricted level), administrator (read and write access to configuration but cannot manage user accounts, intended for users who alter vCenter configuration or exercise control functions), and super administrator (full control). When a predefined role is modified, the updated privilege set applies immediately to all users assigned that role. New roles are created with three default system-defined privileges (System.Anonymous, System.Read, System.View), and administrators add specific privileges to match the intended access level. vCenter also supports creation of custom roles with granular privilege assignment and permission propagation to vSphere objects in the inventory hierarchy.

NSX implements RBAC by assigning users predefined roles with specific permissions. The platform includes 15 built-in roles: Enterprise Admin, Admin, Network Admin, Network Operator, Security Admin, Security Operator, Cloud Admin, Cloud Operator, Cloud Project Admin, Load Balancer Admin, Load Balancer Operator, VPN Admin, GI Platform Admin, NSX Platform Admin, and Support Bundle Collector. These roles follow the principle of least privilege, with each role carrying only the permissions needed for its functional area. NSX RBAC applies across multiple operational domains including inventory, plan and troubleshoot, and system management functions. NSX also supports project-scoped RBAC, where Network Admin, Network Operator, Security Admin, and Security Operator roles assigned within a project have permissions limited to that project's scope rather than the entire NSX system. This project-scoped model extends to VPCs and subnets within the NSX networking hierarchy. For organizations that need role definitions beyond the built-in set, NSX allows creation of custom roles tailored to specific operational requirements. Only an Enterprise Administrator can assign the role management permission to a custom role. NSX Federation extends RBAC to multi-site deployments, applying the same access control model across federated NSX instances. Principal identities, which are used for service-to-service authentication local to NSX, also support RBAC role assignment, so automated integrations operate under the same access control model as human users.

VCF Operations enforces RBAC through the assignment of service roles to users and groups. Administrators configure role-based permissions through the Roles tab under Infrastructure Operations, where individual permissions can be selected or deselected to define what each role is authorized to do. The System Administrator role includes rights covering approvals, audits, certificates, datastores, edge clusters, integrations, LDAP settings, namespaces, proxy rules, system settings, tokens, and truststore operations. Administrative operations such as password management require authentication with a user assigned the ADMIN role. VCF Operations also defines its own roles within vCenter, with privileges named using a convention that appends the role to the product name (such as VCF Operations ContentAdmin Role and VCF Operations PowerUser Role). The PowerUser role has privileges to perform the actions of the Administrator role except for user management and cluster management. A further restricted PowerUserMinusRemediation role excludes remediation actions in addition to those limitations. A vCenter administrator assigns these roles to users, and VCF Operations maps vCenter users to the appropriate role.

vSAN supports RBAC and permissions management for authentication and authorization of storage operations. The vSAN Security Configuration Guide provides guidance on configuring these role-based controls for storage infrastructure.

VCF Automation governs access through multiple RBAC mechanisms at different scopes. At the organization level, rights bundles assign specific API permissions to roles including Organization Administrator, Organization Auditor, and Organization User. Group membership and role assignment are managed through the Access Control interface, and organization administrators can edit role assignments for groups at any time. At the project level, VCF Automation defines three distinct roles: administrators, members, and viewers, providing tiered access to project resources and operations. VCF Automation also governs blueprints, catalogs, content libraries, and custom entities through its role model. The Assembler Administrator role has read and write access to the entire user interface and API resources, while other roles have progressively narrower permissions.

For Kubernetes workloads running on VMware Kubernetes Service (VKS), VCF enforces RBAC through two complementary control layers. At the vSphere layer, vSphere Namespaces assign three permission roles: Owner (full control including namespace deletion), Can Edit (provisioning and operating workloads), and Can View (read-only access). At the Kubernetes layer, the Kubernetes RBAC authorization framework governs access to all API server requests through four core objects: Roles define permissions scoped to a single namespace, ClusterRoles define permissions applying cluster-wide, and RoleBindings and ClusterRoleBindings associate those roles with authenticated subjects such as users, groups, or ServiceAccounts. Permissions are purely additive with no deny rules, and administrators can restrict access to individual resource instances by name using the resourceNames list in role rules.

VKS clusters integrate with VCF SSO so that Kubernetes RoleBinding objects grant RBAC permissions directly to VCF SSO users and groups. This means the same identity provider that governs VMware vCenter access also governs Kubernetes cluster access, providing a consistent identity model across both the platform and workload layers. Cluster operators use kubectl or the Kubernetes API to assign role permissions to developers and other personas with defined responsibilities.

Kubernetes RBAC also governs ServiceAccounts, which provide discrete identities for pods and automation processes. This separation allows human access and workload access to be governed independently, with each scoped to the minimum permissions required for its function. ServiceAccounts follow the principle of least privilege by receiving only the minimum set of permissions required to function correctly, and RBAC should be applied to Secret objects to enforce least-privilege access to sensitive data stored within namespaces.

The Kubernetes RBAC API includes built-in controls against privilege escalation: the API prevents users from editing roles or role bindings to gain permissions beyond those they already hold, and this enforcement applies at the API level regardless of the authorization mode in use. Role-binding authority can be explicitly delegated by granting a user permission to perform the bind verb on a specific Role or ClusterRole, limiting the roles that identity can delegate to others.

In multi-tenant VKS deployments, RBAC is the primary mechanism for isolating tenants within a shared cluster. Administrators use Role and RoleBinding objects at the namespace level to restrict each tenant's access to its assigned namespaces, and ClusterRole and ClusterRoleBinding objects to control access to cluster-level resources, blocking unprivileged users from crossing tenant boundaries.

Supervisor services deployed on VKS clusters extend RBAC to their own access models. The Secret Store Supervisor Service enforces role-based access control across administrator, DevOps engineer, and application tenant roles, controlling who can manage and retrieve sensitive data. The Argo CD Supervisor Service implements RBAC through a configurable policy field using Casbin syntax, with the spec.rbac.policy setting defining role assignments and permission rules; policy rules (p rules) control account permissions including the ability to grant admin roles to specific local accounts, and group mappings (g rules) assign accounts to role groups.

VMware Private AI Services (PAIS) provides role-based access control scoped to its AI services and AI workload delivery components. The central mechanism is OIDC group-based authorization for PAIS. When activating PAIS in an organization namespace, administrators populate the authorizedGroups setting with one or more OIDC group identifiers so that only users who belong to those groups can access the service. The OIDC configuration supports a configurable groups claim name through the oidc-groups-claim setting, with the groups claim carried in the Access Token and evaluated at access time. PAIS requires an OIDC provider configured as a public client application with Authorization Code and Refresh Token grant types, and it can be configured with one OIDC provider. Additional OAuth 2.0 client identifiers can be accepted by configuring Extra Audiences through the oidc-extra-audiences setting when the OIDC provider issues tokens for multiple audiences.

PAIS extends the same identity model to the Grafana observability platform used for PAIS metrics. Grafana role assignment is configured through the grafana-oidc-role-mapping property using an expression such as contains(groups[*], 'pais-access-group') && 'Admin' || 'Viewer', so OIDC group membership maps automatically to Grafana Admin or Viewer roles. PAIS uses the same OIDC provider for Grafana authentication that it uses for service access.

For machine learning model storage, the Model Gallery uses Harbor project access capabilities to restrict access to the sensitive data used to train and tune models. PAIS integrates with Harbor registries as the model storage backend and requires authentication and certificate-based trust for model retrieval. PAIS is compatible with OCI-compliant registries from other vendors when deployed in a disconnected or air-gapped environment, and the project-scoped access controls apply to the chosen registry.

Access to PAIS catalog items for GPU-accelerated VKS clusters and other AI workloads is governed through project-based permissions in VCF Automation. PAIS custom forms in blueprints can be modified to control user inputs at request time, scoping which configuration choices a requester can make when provisioning AI workloads. Knowledge Base data sources used by PAIS retrieval augmented generation require authenticated access to external repositories, including user name and password authentication for SharePoint On-Premises data sources and access keys with list and read permissions on the target bucket for Amazon S3 compatible stores. PAIS uses a CA trust bundle for secure communication with external services and databases.

These PAIS-specific controls operate at the AI services and workload layer. Access to the underlying compute, storage, and networking infrastructure is governed by platform-level RBAC in VCF, including VCF SSO and VMware vCenter role assignments, and database-level access for vector and operational data is governed by Data Services Manager. PAIS adds service-level and workload-level RBAC for AI-specific assets on top of the VCF platform foundation rather than replacing those platform controls.

#### VMware vDefend (Contributes)

VMware vDefend (vDefend) enforces role-based access control across its security management interfaces to restrict access to firewall policy administration, threat analysis functions, and monitoring capabilities based on assigned user roles.

The vDefend distributed firewall (DFW) implements RBAC to control who can create or modify firewall rules, limiting policy changes to authorized personnel. Access to DFW monitoring features, including Firewall Insights, requires one of three designated roles: Enterprise Admin, Security Admin, or Security Operator. Rule Analysis operations within the platform are also role-gated across the five defined role types.

Security Services Platform (SSP) implements RBAC with five defined roles governing access to platform operations: Enterprise Admin, Auditor, Security Engineer, Security Operator, and Support Bundle Collector. Each role carries differentiated permissions; Full Access grants create, read, update, and delete capabilities, while Read-only access is available for monitoring-oriented roles such as Auditor and Support Bundle Collector. Role assignments can be applied to individual remote users or to remote user groups managed through a directory service, allowing administrators to align vDefend access with existing organizational structures. Multiple roles can be assigned to a single user or group to meet varying operational requirements. SSP's RBAC model also applies to License Hub operations, restricting licensing management actions to authorized roles.

Security Intelligence RBAC in 9.1 uses the same five-role model as SSP (Enterprise Admin, Auditor, Security Engineer, Security Operator, and Support Bundle Collector), aligning Security Intelligence access governance with SSP's permission model and providing consistent role boundaries across both the detection and platform layers.

For organizations using VCF Automation for vDefend firewall management, VCF Automation provides a dedicated Firewall category under RBAC rights, controlling access to the management and viewing of DFW rules, Tenant Gateway Firewall policy, VPC Gateway Firewall policy, and VPC Security Profiles. This allows organizations to scope firewall administration rights independently of other VCF Automation capabilities, supporting separation of duties between network automation and security policy management.

vDefend's RBAC controls complement the broader VCF RBAC model by restricting access to network security policy management independently of compute, storage, or platform configuration access. An administrator with VMware vCenter privileges does not automatically gain the ability to modify firewall rules or security analytics configurations unless explicitly granted the appropriate vDefend roles. This separation of duties between infrastructure administration and security policy management supports distinct team structures for network security management.

#### VCF Protection and Recovery (Contributes)

Protection and Recovery (PNR) implements role-based access control through purpose-built roles registered in VMware vCenter and through a multi-tenant administrative model for Protection and Recovery for VCF Automation. The SRM Administrator role allows users or user groups to perform all PNR configuration and administration operations. The Protection and Recovery Administrator role can be assigned to user groups to manage permissions. Default roles provide the privileges users require to manage protection groups and perform recoveries, while restricting access to resources belonging to other users.

For automatic protection of virtual machines within a protection group, administrators assign either the SrmAdministrator or SrmProtectionGroupsAdministrator role to the automatic protection user or user group. This scopes the protection actions performed on the user's behalf to the privileges of the assigned role.

Each role is a collection of privileges that defines the actions a user can perform on the protection and recovery site. A user can have at most one role on an object, but roles combine when the user belongs to multiple groups that all have roles on the object. PNR supports propagating roles to child objects in the inventory hierarchy, so administrators can extend privileges from parent objects such as folders to all virtual machines within them.

Protection and Recovery for VCF Automation introduces a multi-tenant role model with Provider Administrator, Organization Administrator, Project Administrator, and Project Advanced User. Each role has specific authorization levels for disaster recovery operations. Provider Administrators select which replication classes each Organization can use, restricting organizational access to specific recovery configurations. Organization Administrators manage the pairing of namespaces and assignment of replication classes within their tenancy.

Underlying directory services, authentication, and enterprise identity governance are provided by VCF SSO and the broader VCF platform. PNR consumes those identities and layers its protection and recovery roles on top of them.

#### VMware Data Services Manager (Meets)

VMware Data Services Manager (DSM) implements role-based access control natively, with two defined role types that govern access to all data service resources. The DSM Admin role is a super-user role with full access to create, monitor, and manage all data services across the environment. The DSM User role is a restricted role that limits a user to viewing and managing only the data service deployments they own. This separation is enforced at the console level: the views and available actions in the DSM interface differ based on the assigned role, so users with the DSM User role cannot see or act on resources outside their own scope.

Access control is further refined through namespace scoping. DSM User role assignments can be restricted to one or more specific namespaces, limiting access to data services within those assigned namespaces only. Administrators can modify a user's assigned role and namespace access after initial provisioning. DSM namespaces enforce role-based access control that allows multiple users to work on data services within a shared namespace while maintaining appropriate permission boundaries between them.

DSM supports both local user accounts and directory service integration for identity management. Local users are created through the DSM UI, where administrators specify the user's role, email address, and password. For enterprise directory integration, DSM supports LDAPS-based authentication with Directory Service Group mapping, allowing administrators to assign users to either the DSM Admin or DSM User role based on their LDAP group membership. This group-based mapping is configured through the vSphere Client during DSM setup or through the DSM UI after deployment.

Access control extends to storage and database resources as well. DSM IAM policies for S3-compatible storage support granular access control through policy statements that allow specific S3 actions, including PutObject, GetObject, DeleteObject, and ListMultipartUploadParts. At the database level, PostgreSQL instances support the CREATE ROLE command to create database roles for LDAPS users with configurable login capabilities, and administrators can configure Host-Based Authentication (HBA) rules to restrict which clients and authentication methods may connect to a PostgreSQL instance. For SQL Server instances, DSM applies least-privilege access by granting the cluster administrator login restricted read-only privileges and specific ALTER privileges for server management and auditing, rather than full administrative access. Data service policies also support allowlist configuration to restrict users to selecting only from a specific set of approved parameters when provisioning databases.

The DSM Permissions view provides a centralized interface for administrators to create, monitor, and manage configured users. This view supports ongoing governance of who has access to what within the DSM environment, making it straightforward to audit and adjust role assignments as business needs change.

#### VMware Avi Load Balancer (Meets)

VMware Avi Load Balancer provides a native, multi-tiered Role-Based Access Control (RBAC) framework that governs all administrative access to the Avi Controller. At the base level, Avi roles assign one of four privilege types to each resource category: Write (full create, read, modify, and delete access), Read (view-only access to configuration, health, and analytics data without modification capability), Assorted (a mixed access level combining permissions across specific operations), and No Access (no access to the resource at all, including the inability to read or list it). Roles are combined with tenants to define the complete authorization settings for each user, scoping what resources a user can interact with and what actions they may take.

Beyond base privilege levels, the Extended Granular RBAC feature refines access using markers, which are key-value label pairs assigned to Avi objects. A role definition specifies that a user may access only objects bearing labels that match the role's marker set. The allow_unlabelled_access parameter controls whether a user can view objects that lack matching labels, allowing administrators to restrict visibility to labeled objects only. Label groups can be associated with tenants to enforce label-based access policies across the tenant boundary. Multiple label values can be mapped to a single key, enabling flexible classification schemes. This mechanism enables resource-level scoping across tenants and teams: for example, restricting a group of operators to only the virtual services labeled with their team's identifier, without granting visibility into other teams' objects.

At the finest granularity, Avi implements sub-resource (field-level) RBAC, which scopes which specific fields within a configuration object a given user is authorized to modify. Sub-resource definitions can be combined so that a user can configure multiple fields or features within a single object while remaining restricted from updating others. Label-based permissions for cloud objects extend this field-level control to infrastructure resources managed by the Avi Controller. Virtual service configuration exposes RBAC directly: the RBAC tab in the Virtual Service advanced setup provides label-based access control for health monitors and associated objects, extending role enforcement down to individual service configuration items.

For GSLB deployments, the Avi Controller enforces RBAC through role references such as Gslb_Group_Enabled and Gslb_Health_Monitor that can be assigned to user accounts with tenant-level scope. These role references apply to follower sites configured with federated JWT profiles, scoping which accounts can modify GSLB configuration.

The Avi Controller applies RBAC within the License Hub, limiting which users can perform specific actions based on their assigned role.

For deployments using the Avi Kubernetes Operator (AKO), the Avi Controller implements RBAC by assigning tenants and roles to user accounts at the Kubernetes or OpenShift cluster level. AKO Custom Resource Definitions (CRDs) can leverage Kubernetes RBAC policies to restrict which user groups can configure routing rules, extending the Controller's authorization model into the Kubernetes control plane.

For deployments on Microsoft Azure, Avi integrates with Azure IAM to control which Azure identities have access to Avi Load Balancer resources hosted in Azure. Administrators can use built-in Azure roles such as Reader (read-only access) or Owner (full access), or define custom roles for finer control over specific resources.

RBAC configuration is managed through the Users section of the Avi Controller UI. Roles are defined per resource type and then assigned to users within a tenant. Extended Granular RBAC markers are attached to individual Avi objects (virtual services, pools, health monitors, and others) and referenced in the role definition. Sub-resource RBAC is configured as part of the Extended Granular RBAC object, combining field-level restrictions as needed.

### Control 33.1

> In the case of a personal data breach, the controller shall without undue delay and, where feasible, not later than 72 hours after having become aware of it, notify the personal data breach to the supervisory authority competent in accordance with Article 55, unless the personal data breach is unlikely to result in a risk to the rights and freedoms of natural persons. Where the notification to the supervisory authority is not made within 72 hours, it shall be accompanied by reasons for the delay.

**SCF Controls:** IRO-04.1, IRO-10.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides detection, monitoring, alerting, notification delivery, and investigation capabilities through VCF Operations that support timely identification and reporting of incidents involving sensitive or regulated data. While the organizational process of formally reporting such incidents to regulators, affected individuals, or other stakeholders falls outside the platform's scope, VCF supplies the technical foundation that enables an organization to detect incidents quickly, gather evidence, and route information to the people and systems responsible for response.

VCF Operations event auditing provides visibility into platform interaction changes across the VCF infrastructure and surfaces suspicious access events and policy violations. This capability allows security teams to identify unauthorized or anomalous activity that may indicate a data incident. VCF Operations also provides audit tracking that identifies who made changes to the data center during a specific time range, which is important for establishing the scope and timeline of an incident involving sensitive data.

VCF Operations compliance management continuously monitors infrastructure by evaluating collected data against defined policies. When a compliance alert is triggered on VMware vCenter instances, VMware ESX hosts, virtual machines, distributed port groups, or distributed switches, compliance violations are recorded for investigation. This automated detection of deviations from compliance baselines helps organizations identify potential data-related incidents as they occur rather than discovering them after the fact. Compliance management also highlights risk areas and provides actionable remediation recommendations, supporting the triage process that precedes formal incident reporting.

VCF Operations generates alerts based on configurable thresholds and event definitions. When an alert fires, VCF Operations can deliver notifications through multiple outbound channels: SNMP traps to network management platforms, webhook calls to REST-enabled systems (in JSON or XML format), a ServiceNow plug-in that automatically creates incidents in the ServiceNow ticketing system, a Slack plug-in that forwards alerts to Slack channels with links to alert details, and email. Notification rules let administrators filter which alerts are forwarded and to which endpoints, so that events potentially involving data exposure reach the right teams without delay.

All VCF components support syslog forwarding to external log aggregation and SIEM platforms. vCenter syslog forwarding can be configured through the vCenter Management API, and ESX hosts send syslog feeds through Log Collections configuration. VCF Log Management ingests and indexes these events from across the stack, providing real-time analytics to search and filter logs instantly for troubleshooting or auditing. Users can collect and analyze log feeds, view log-related metrics, and dynamically extract fields from log messages based on customized queries. This centralized log management gives security operations teams the ability to correlate events across the environment.

Accurate log correlation depends on synchronized clocks across all components. The vSphere documentation notes that incorrect time settings in vCenter and ESX hosts make it difficult to inspect and correlate log files to detect attacks and render auditing inaccurate; NTP should be configured on all vCenter instances and ESX hosts so that log timestamps are reliable for incident investigation and reporting.

The Diagnostic Findings feature provides a consolidated view of known product issues, VMSA-based security exposures, and industry best-practice recommendations across the VCF environment. Diagnostic Findings are alerts without notifications that result from a scan of the platform against known issues, logs, and properties. This provides an additional signal that may be relevant during incident triage, helping teams determine whether an observed event is related to a known vulnerability.

For incident tracking and investigation, VCF Operations provides capabilities at multiple levels. The Troubleshooting Incident Page in VCF Network Operations displays information related to incidents, including status, root cause metrics, closing remarks, and timestamps for when incidents were created. During investigation, analysts can flag metrics and mark root causes, creating a documented trail that supports the incident reporting process. Incident status can be tracked as resolved or unresolved within the platform. VCF Operations also supports scheduled automated reports at regular intervals to track current resources and identify potential risks to the environment, which can feed an organization's incident reporting workflow.

VCF Operations Data and Site Resiliency Monitoring provides centralized visibility into data protection metrics across private clouds, giving organizations awareness of the state of their data protection posture. VCF Automation includes data compliance controls that require explicit consent before exposing user names. This supports organizations that must track access to personally identifiable information.

To satisfy this control fully, organizations must establish incident response procedures that define reporting timelines, designate responsible personnel, identify the authorities and regulators to notify, and specify the content and format of incident reports. VCF provides the detection, correlation, notification delivery, and evidence-gathering layer, but the reporting process itself requires organizational policies, communication channels, and human decision-making.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 33.2

> The processor shall notify the controller without undue delay after becoming aware of a personal data breach.

**SCF Controls:** IRO-10.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides detection, monitoring, alerting, notification delivery, and investigation capabilities through VCF Operations that support timely identification and reporting of incidents involving sensitive or regulated data. While the organizational process of formally reporting such incidents to regulators, affected individuals, or other stakeholders falls outside the platform's scope, VCF supplies the technical foundation that enables an organization to detect incidents quickly, gather evidence, and route information to the people and systems responsible for response.

VCF Operations event auditing provides visibility into platform interaction changes across the VCF infrastructure and surfaces suspicious access events and policy violations. This capability allows security teams to identify unauthorized or anomalous activity that may indicate a data incident. VCF Operations also provides audit tracking that identifies who made changes to the data center during a specific time range, which is important for establishing the scope and timeline of an incident involving sensitive data.

VCF Operations compliance management continuously monitors infrastructure by evaluating collected data against defined policies. When a compliance alert is triggered on VMware vCenter instances, VMware ESX hosts, virtual machines, distributed port groups, or distributed switches, compliance violations are recorded for investigation. This automated detection of deviations from compliance baselines helps organizations identify potential data-related incidents as they occur rather than discovering them after the fact. Compliance management also highlights risk areas and provides actionable remediation recommendations, supporting the triage process that precedes formal incident reporting.

VCF Operations generates alerts based on configurable thresholds and event definitions. When an alert fires, VCF Operations can deliver notifications through multiple outbound channels: SNMP traps to network management platforms, webhook calls to REST-enabled systems (in JSON or XML format), a ServiceNow plug-in that automatically creates incidents in the ServiceNow ticketing system, a Slack plug-in that forwards alerts to Slack channels with links to alert details, and email. Notification rules let administrators filter which alerts are forwarded and to which endpoints, so that events potentially involving data exposure reach the right teams without delay.

All VCF components support syslog forwarding to external log aggregation and SIEM platforms. vCenter syslog forwarding can be configured through the vCenter Management API, and ESX hosts send syslog feeds through Log Collections configuration. VCF Log Management ingests and indexes these events from across the stack, providing real-time analytics to search and filter logs instantly for troubleshooting or auditing. Users can collect and analyze log feeds, view log-related metrics, and dynamically extract fields from log messages based on customized queries. This centralized log management gives security operations teams the ability to correlate events across the environment.

Accurate log correlation depends on synchronized clocks across all components. The vSphere documentation notes that incorrect time settings in vCenter and ESX hosts make it difficult to inspect and correlate log files to detect attacks and render auditing inaccurate; NTP should be configured on all vCenter instances and ESX hosts so that log timestamps are reliable for incident investigation and reporting.

The Diagnostic Findings feature provides a consolidated view of known product issues, VMSA-based security exposures, and industry best-practice recommendations across the VCF environment. Diagnostic Findings are alerts without notifications that result from a scan of the platform against known issues, logs, and properties. This provides an additional signal that may be relevant during incident triage, helping teams determine whether an observed event is related to a known vulnerability.

For incident tracking and investigation, VCF Operations provides capabilities at multiple levels. The Troubleshooting Incident Page in VCF Network Operations displays information related to incidents, including status, root cause metrics, closing remarks, and timestamps for when incidents were created. During investigation, analysts can flag metrics and mark root causes, creating a documented trail that supports the incident reporting process. Incident status can be tracked as resolved or unresolved within the platform. VCF Operations also supports scheduled automated reports at regular intervals to track current resources and identify potential risks to the environment, which can feed an organization's incident reporting workflow.

VCF Operations Data and Site Resiliency Monitoring provides centralized visibility into data protection metrics across private clouds, giving organizations awareness of the state of their data protection posture. VCF Automation includes data compliance controls that require explicit consent before exposing user names. This supports organizations that must track access to personally identifiable information.

To satisfy this control fully, organizations must establish incident response procedures that define reporting timelines, designate responsible personnel, identify the authorities and regulators to notify, and specify the content and format of incident reports. VCF provides the detection, correlation, notification delivery, and evidence-gathering layer, but the reporting process itself requires organizational policies, communication channels, and human decision-making.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 33.3(a)

> The notification referred to in paragraph 1 shall at least: a. describe the nature of the personal data breach including where possible, the categories and approximate number of data subjects concerned and the categories and approximate number of personal data records concerned; b.communicate the name and contact details of the data protection officer or other contact point where more information can be obtained; c. describe the likely consequences of the personal data breach; d. describe the measures taken or proposed to be taken by the controller to address the personal data breach, including, where appropriate, measures to mitigate its possible adverse effects.

**SCF Controls:** IRO-10.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides detection, monitoring, alerting, notification delivery, and investigation capabilities through VCF Operations that support timely identification and reporting of incidents involving sensitive or regulated data. While the organizational process of formally reporting such incidents to regulators, affected individuals, or other stakeholders falls outside the platform's scope, VCF supplies the technical foundation that enables an organization to detect incidents quickly, gather evidence, and route information to the people and systems responsible for response.

VCF Operations event auditing provides visibility into platform interaction changes across the VCF infrastructure and surfaces suspicious access events and policy violations. This capability allows security teams to identify unauthorized or anomalous activity that may indicate a data incident. VCF Operations also provides audit tracking that identifies who made changes to the data center during a specific time range, which is important for establishing the scope and timeline of an incident involving sensitive data.

VCF Operations compliance management continuously monitors infrastructure by evaluating collected data against defined policies. When a compliance alert is triggered on VMware vCenter instances, VMware ESX hosts, virtual machines, distributed port groups, or distributed switches, compliance violations are recorded for investigation. This automated detection of deviations from compliance baselines helps organizations identify potential data-related incidents as they occur rather than discovering them after the fact. Compliance management also highlights risk areas and provides actionable remediation recommendations, supporting the triage process that precedes formal incident reporting.

VCF Operations generates alerts based on configurable thresholds and event definitions. When an alert fires, VCF Operations can deliver notifications through multiple outbound channels: SNMP traps to network management platforms, webhook calls to REST-enabled systems (in JSON or XML format), a ServiceNow plug-in that automatically creates incidents in the ServiceNow ticketing system, a Slack plug-in that forwards alerts to Slack channels with links to alert details, and email. Notification rules let administrators filter which alerts are forwarded and to which endpoints, so that events potentially involving data exposure reach the right teams without delay.

All VCF components support syslog forwarding to external log aggregation and SIEM platforms. vCenter syslog forwarding can be configured through the vCenter Management API, and ESX hosts send syslog feeds through Log Collections configuration. VCF Log Management ingests and indexes these events from across the stack, providing real-time analytics to search and filter logs instantly for troubleshooting or auditing. Users can collect and analyze log feeds, view log-related metrics, and dynamically extract fields from log messages based on customized queries. This centralized log management gives security operations teams the ability to correlate events across the environment.

Accurate log correlation depends on synchronized clocks across all components. The vSphere documentation notes that incorrect time settings in vCenter and ESX hosts make it difficult to inspect and correlate log files to detect attacks and render auditing inaccurate; NTP should be configured on all vCenter instances and ESX hosts so that log timestamps are reliable for incident investigation and reporting.

The Diagnostic Findings feature provides a consolidated view of known product issues, VMSA-based security exposures, and industry best-practice recommendations across the VCF environment. Diagnostic Findings are alerts without notifications that result from a scan of the platform against known issues, logs, and properties. This provides an additional signal that may be relevant during incident triage, helping teams determine whether an observed event is related to a known vulnerability.

For incident tracking and investigation, VCF Operations provides capabilities at multiple levels. The Troubleshooting Incident Page in VCF Network Operations displays information related to incidents, including status, root cause metrics, closing remarks, and timestamps for when incidents were created. During investigation, analysts can flag metrics and mark root causes, creating a documented trail that supports the incident reporting process. Incident status can be tracked as resolved or unresolved within the platform. VCF Operations also supports scheduled automated reports at regular intervals to track current resources and identify potential risks to the environment, which can feed an organization's incident reporting workflow.

VCF Operations Data and Site Resiliency Monitoring provides centralized visibility into data protection metrics across private clouds, giving organizations awareness of the state of their data protection posture. VCF Automation includes data compliance controls that require explicit consent before exposing user names. This supports organizations that must track access to personally identifiable information.

To satisfy this control fully, organizations must establish incident response procedures that define reporting timelines, designate responsible personnel, identify the authorities and regulators to notify, and specify the content and format of incident reports. VCF provides the detection, correlation, notification delivery, and evidence-gathering layer, but the reporting process itself requires organizational policies, communication channels, and human decision-making.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 33.3(b)

> The notification referred to in paragraph 1 shall at least:  b.communicate the name and contact details of the data protection officer or other contact point where more information can be obtained; 

**SCF Controls:** IRO-10.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides detection, monitoring, alerting, notification delivery, and investigation capabilities through VCF Operations that support timely identification and reporting of incidents involving sensitive or regulated data. While the organizational process of formally reporting such incidents to regulators, affected individuals, or other stakeholders falls outside the platform's scope, VCF supplies the technical foundation that enables an organization to detect incidents quickly, gather evidence, and route information to the people and systems responsible for response.

VCF Operations event auditing provides visibility into platform interaction changes across the VCF infrastructure and surfaces suspicious access events and policy violations. This capability allows security teams to identify unauthorized or anomalous activity that may indicate a data incident. VCF Operations also provides audit tracking that identifies who made changes to the data center during a specific time range, which is important for establishing the scope and timeline of an incident involving sensitive data.

VCF Operations compliance management continuously monitors infrastructure by evaluating collected data against defined policies. When a compliance alert is triggered on VMware vCenter instances, VMware ESX hosts, virtual machines, distributed port groups, or distributed switches, compliance violations are recorded for investigation. This automated detection of deviations from compliance baselines helps organizations identify potential data-related incidents as they occur rather than discovering them after the fact. Compliance management also highlights risk areas and provides actionable remediation recommendations, supporting the triage process that precedes formal incident reporting.

VCF Operations generates alerts based on configurable thresholds and event definitions. When an alert fires, VCF Operations can deliver notifications through multiple outbound channels: SNMP traps to network management platforms, webhook calls to REST-enabled systems (in JSON or XML format), a ServiceNow plug-in that automatically creates incidents in the ServiceNow ticketing system, a Slack plug-in that forwards alerts to Slack channels with links to alert details, and email. Notification rules let administrators filter which alerts are forwarded and to which endpoints, so that events potentially involving data exposure reach the right teams without delay.

All VCF components support syslog forwarding to external log aggregation and SIEM platforms. vCenter syslog forwarding can be configured through the vCenter Management API, and ESX hosts send syslog feeds through Log Collections configuration. VCF Log Management ingests and indexes these events from across the stack, providing real-time analytics to search and filter logs instantly for troubleshooting or auditing. Users can collect and analyze log feeds, view log-related metrics, and dynamically extract fields from log messages based on customized queries. This centralized log management gives security operations teams the ability to correlate events across the environment.

Accurate log correlation depends on synchronized clocks across all components. The vSphere documentation notes that incorrect time settings in vCenter and ESX hosts make it difficult to inspect and correlate log files to detect attacks and render auditing inaccurate; NTP should be configured on all vCenter instances and ESX hosts so that log timestamps are reliable for incident investigation and reporting.

The Diagnostic Findings feature provides a consolidated view of known product issues, VMSA-based security exposures, and industry best-practice recommendations across the VCF environment. Diagnostic Findings are alerts without notifications that result from a scan of the platform against known issues, logs, and properties. This provides an additional signal that may be relevant during incident triage, helping teams determine whether an observed event is related to a known vulnerability.

For incident tracking and investigation, VCF Operations provides capabilities at multiple levels. The Troubleshooting Incident Page in VCF Network Operations displays information related to incidents, including status, root cause metrics, closing remarks, and timestamps for when incidents were created. During investigation, analysts can flag metrics and mark root causes, creating a documented trail that supports the incident reporting process. Incident status can be tracked as resolved or unresolved within the platform. VCF Operations also supports scheduled automated reports at regular intervals to track current resources and identify potential risks to the environment, which can feed an organization's incident reporting workflow.

VCF Operations Data and Site Resiliency Monitoring provides centralized visibility into data protection metrics across private clouds, giving organizations awareness of the state of their data protection posture. VCF Automation includes data compliance controls that require explicit consent before exposing user names. This supports organizations that must track access to personally identifiable information.

To satisfy this control fully, organizations must establish incident response procedures that define reporting timelines, designate responsible personnel, identify the authorities and regulators to notify, and specify the content and format of incident reports. VCF provides the detection, correlation, notification delivery, and evidence-gathering layer, but the reporting process itself requires organizational policies, communication channels, and human decision-making.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 33.3(c)

> The notification referred to in paragraph 1 shall at least:  c. describe the likely consequences of the personal data breach; 

**SCF Controls:** IRO-10.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides detection, monitoring, alerting, notification delivery, and investigation capabilities through VCF Operations that support timely identification and reporting of incidents involving sensitive or regulated data. While the organizational process of formally reporting such incidents to regulators, affected individuals, or other stakeholders falls outside the platform's scope, VCF supplies the technical foundation that enables an organization to detect incidents quickly, gather evidence, and route information to the people and systems responsible for response.

VCF Operations event auditing provides visibility into platform interaction changes across the VCF infrastructure and surfaces suspicious access events and policy violations. This capability allows security teams to identify unauthorized or anomalous activity that may indicate a data incident. VCF Operations also provides audit tracking that identifies who made changes to the data center during a specific time range, which is important for establishing the scope and timeline of an incident involving sensitive data.

VCF Operations compliance management continuously monitors infrastructure by evaluating collected data against defined policies. When a compliance alert is triggered on VMware vCenter instances, VMware ESX hosts, virtual machines, distributed port groups, or distributed switches, compliance violations are recorded for investigation. This automated detection of deviations from compliance baselines helps organizations identify potential data-related incidents as they occur rather than discovering them after the fact. Compliance management also highlights risk areas and provides actionable remediation recommendations, supporting the triage process that precedes formal incident reporting.

VCF Operations generates alerts based on configurable thresholds and event definitions. When an alert fires, VCF Operations can deliver notifications through multiple outbound channels: SNMP traps to network management platforms, webhook calls to REST-enabled systems (in JSON or XML format), a ServiceNow plug-in that automatically creates incidents in the ServiceNow ticketing system, a Slack plug-in that forwards alerts to Slack channels with links to alert details, and email. Notification rules let administrators filter which alerts are forwarded and to which endpoints, so that events potentially involving data exposure reach the right teams without delay.

All VCF components support syslog forwarding to external log aggregation and SIEM platforms. vCenter syslog forwarding can be configured through the vCenter Management API, and ESX hosts send syslog feeds through Log Collections configuration. VCF Log Management ingests and indexes these events from across the stack, providing real-time analytics to search and filter logs instantly for troubleshooting or auditing. Users can collect and analyze log feeds, view log-related metrics, and dynamically extract fields from log messages based on customized queries. This centralized log management gives security operations teams the ability to correlate events across the environment.

Accurate log correlation depends on synchronized clocks across all components. The vSphere documentation notes that incorrect time settings in vCenter and ESX hosts make it difficult to inspect and correlate log files to detect attacks and render auditing inaccurate; NTP should be configured on all vCenter instances and ESX hosts so that log timestamps are reliable for incident investigation and reporting.

The Diagnostic Findings feature provides a consolidated view of known product issues, VMSA-based security exposures, and industry best-practice recommendations across the VCF environment. Diagnostic Findings are alerts without notifications that result from a scan of the platform against known issues, logs, and properties. This provides an additional signal that may be relevant during incident triage, helping teams determine whether an observed event is related to a known vulnerability.

For incident tracking and investigation, VCF Operations provides capabilities at multiple levels. The Troubleshooting Incident Page in VCF Network Operations displays information related to incidents, including status, root cause metrics, closing remarks, and timestamps for when incidents were created. During investigation, analysts can flag metrics and mark root causes, creating a documented trail that supports the incident reporting process. Incident status can be tracked as resolved or unresolved within the platform. VCF Operations also supports scheduled automated reports at regular intervals to track current resources and identify potential risks to the environment, which can feed an organization's incident reporting workflow.

VCF Operations Data and Site Resiliency Monitoring provides centralized visibility into data protection metrics across private clouds, giving organizations awareness of the state of their data protection posture. VCF Automation includes data compliance controls that require explicit consent before exposing user names. This supports organizations that must track access to personally identifiable information.

To satisfy this control fully, organizations must establish incident response procedures that define reporting timelines, designate responsible personnel, identify the authorities and regulators to notify, and specify the content and format of incident reports. VCF provides the detection, correlation, notification delivery, and evidence-gathering layer, but the reporting process itself requires organizational policies, communication channels, and human decision-making.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 33.3(d)

> The notification referred to in paragraph 1 shall at least:  d. describe the measures taken or proposed to be taken by the controller to address the personal data breach, including, where appropriate, measures to mitigate its possible adverse effects.

**SCF Controls:** IRO-10.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides detection, monitoring, alerting, notification delivery, and investigation capabilities through VCF Operations that support timely identification and reporting of incidents involving sensitive or regulated data. While the organizational process of formally reporting such incidents to regulators, affected individuals, or other stakeholders falls outside the platform's scope, VCF supplies the technical foundation that enables an organization to detect incidents quickly, gather evidence, and route information to the people and systems responsible for response.

VCF Operations event auditing provides visibility into platform interaction changes across the VCF infrastructure and surfaces suspicious access events and policy violations. This capability allows security teams to identify unauthorized or anomalous activity that may indicate a data incident. VCF Operations also provides audit tracking that identifies who made changes to the data center during a specific time range, which is important for establishing the scope and timeline of an incident involving sensitive data.

VCF Operations compliance management continuously monitors infrastructure by evaluating collected data against defined policies. When a compliance alert is triggered on VMware vCenter instances, VMware ESX hosts, virtual machines, distributed port groups, or distributed switches, compliance violations are recorded for investigation. This automated detection of deviations from compliance baselines helps organizations identify potential data-related incidents as they occur rather than discovering them after the fact. Compliance management also highlights risk areas and provides actionable remediation recommendations, supporting the triage process that precedes formal incident reporting.

VCF Operations generates alerts based on configurable thresholds and event definitions. When an alert fires, VCF Operations can deliver notifications through multiple outbound channels: SNMP traps to network management platforms, webhook calls to REST-enabled systems (in JSON or XML format), a ServiceNow plug-in that automatically creates incidents in the ServiceNow ticketing system, a Slack plug-in that forwards alerts to Slack channels with links to alert details, and email. Notification rules let administrators filter which alerts are forwarded and to which endpoints, so that events potentially involving data exposure reach the right teams without delay.

All VCF components support syslog forwarding to external log aggregation and SIEM platforms. vCenter syslog forwarding can be configured through the vCenter Management API, and ESX hosts send syslog feeds through Log Collections configuration. VCF Log Management ingests and indexes these events from across the stack, providing real-time analytics to search and filter logs instantly for troubleshooting or auditing. Users can collect and analyze log feeds, view log-related metrics, and dynamically extract fields from log messages based on customized queries. This centralized log management gives security operations teams the ability to correlate events across the environment.

Accurate log correlation depends on synchronized clocks across all components. The vSphere documentation notes that incorrect time settings in vCenter and ESX hosts make it difficult to inspect and correlate log files to detect attacks and render auditing inaccurate; NTP should be configured on all vCenter instances and ESX hosts so that log timestamps are reliable for incident investigation and reporting.

The Diagnostic Findings feature provides a consolidated view of known product issues, VMSA-based security exposures, and industry best-practice recommendations across the VCF environment. Diagnostic Findings are alerts without notifications that result from a scan of the platform against known issues, logs, and properties. This provides an additional signal that may be relevant during incident triage, helping teams determine whether an observed event is related to a known vulnerability.

For incident tracking and investigation, VCF Operations provides capabilities at multiple levels. The Troubleshooting Incident Page in VCF Network Operations displays information related to incidents, including status, root cause metrics, closing remarks, and timestamps for when incidents were created. During investigation, analysts can flag metrics and mark root causes, creating a documented trail that supports the incident reporting process. Incident status can be tracked as resolved or unresolved within the platform. VCF Operations also supports scheduled automated reports at regular intervals to track current resources and identify potential risks to the environment, which can feed an organization's incident reporting workflow.

VCF Operations Data and Site Resiliency Monitoring provides centralized visibility into data protection metrics across private clouds, giving organizations awareness of the state of their data protection posture. VCF Automation includes data compliance controls that require explicit consent before exposing user names. This supports organizations that must track access to personally identifiable information.

To satisfy this control fully, organizations must establish incident response procedures that define reporting timelines, designate responsible personnel, identify the authorities and regulators to notify, and specify the content and format of incident reports. VCF provides the detection, correlation, notification delivery, and evidence-gathering layer, but the reporting process itself requires organizational policies, communication channels, and human decision-making.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 33.4

> Where, and in so far as, it is not possible to provide the information at the same time, the information may be provided in phases without undue further delay.

**SCF Controls:** IRO-10.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides detection, monitoring, alerting, notification delivery, and investigation capabilities through VCF Operations that support timely identification and reporting of incidents involving sensitive or regulated data. While the organizational process of formally reporting such incidents to regulators, affected individuals, or other stakeholders falls outside the platform's scope, VCF supplies the technical foundation that enables an organization to detect incidents quickly, gather evidence, and route information to the people and systems responsible for response.

VCF Operations event auditing provides visibility into platform interaction changes across the VCF infrastructure and surfaces suspicious access events and policy violations. This capability allows security teams to identify unauthorized or anomalous activity that may indicate a data incident. VCF Operations also provides audit tracking that identifies who made changes to the data center during a specific time range, which is important for establishing the scope and timeline of an incident involving sensitive data.

VCF Operations compliance management continuously monitors infrastructure by evaluating collected data against defined policies. When a compliance alert is triggered on VMware vCenter instances, VMware ESX hosts, virtual machines, distributed port groups, or distributed switches, compliance violations are recorded for investigation. This automated detection of deviations from compliance baselines helps organizations identify potential data-related incidents as they occur rather than discovering them after the fact. Compliance management also highlights risk areas and provides actionable remediation recommendations, supporting the triage process that precedes formal incident reporting.

VCF Operations generates alerts based on configurable thresholds and event definitions. When an alert fires, VCF Operations can deliver notifications through multiple outbound channels: SNMP traps to network management platforms, webhook calls to REST-enabled systems (in JSON or XML format), a ServiceNow plug-in that automatically creates incidents in the ServiceNow ticketing system, a Slack plug-in that forwards alerts to Slack channels with links to alert details, and email. Notification rules let administrators filter which alerts are forwarded and to which endpoints, so that events potentially involving data exposure reach the right teams without delay.

All VCF components support syslog forwarding to external log aggregation and SIEM platforms. vCenter syslog forwarding can be configured through the vCenter Management API, and ESX hosts send syslog feeds through Log Collections configuration. VCF Log Management ingests and indexes these events from across the stack, providing real-time analytics to search and filter logs instantly for troubleshooting or auditing. Users can collect and analyze log feeds, view log-related metrics, and dynamically extract fields from log messages based on customized queries. This centralized log management gives security operations teams the ability to correlate events across the environment.

Accurate log correlation depends on synchronized clocks across all components. The vSphere documentation notes that incorrect time settings in vCenter and ESX hosts make it difficult to inspect and correlate log files to detect attacks and render auditing inaccurate; NTP should be configured on all vCenter instances and ESX hosts so that log timestamps are reliable for incident investigation and reporting.

The Diagnostic Findings feature provides a consolidated view of known product issues, VMSA-based security exposures, and industry best-practice recommendations across the VCF environment. Diagnostic Findings are alerts without notifications that result from a scan of the platform against known issues, logs, and properties. This provides an additional signal that may be relevant during incident triage, helping teams determine whether an observed event is related to a known vulnerability.

For incident tracking and investigation, VCF Operations provides capabilities at multiple levels. The Troubleshooting Incident Page in VCF Network Operations displays information related to incidents, including status, root cause metrics, closing remarks, and timestamps for when incidents were created. During investigation, analysts can flag metrics and mark root causes, creating a documented trail that supports the incident reporting process. Incident status can be tracked as resolved or unresolved within the platform. VCF Operations also supports scheduled automated reports at regular intervals to track current resources and identify potential risks to the environment, which can feed an organization's incident reporting workflow.

VCF Operations Data and Site Resiliency Monitoring provides centralized visibility into data protection metrics across private clouds, giving organizations awareness of the state of their data protection posture. VCF Automation includes data compliance controls that require explicit consent before exposing user names. This supports organizations that must track access to personally identifiable information.

To satisfy this control fully, organizations must establish incident response procedures that define reporting timelines, designate responsible personnel, identify the authorities and regulators to notify, and specify the content and format of incident reports. VCF provides the detection, correlation, notification delivery, and evidence-gathering layer, but the reporting process itself requires organizational policies, communication channels, and human decision-making.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 33.5

> The controller shall document any personal data breaches, comprising the facts relating to the personal data breach, its effects and the remedial action taken. That documentation shall enable the supervisory authority to verify compliance with this Article.

**SCF Controls:** IRO-09

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides technical capabilities for documenting, monitoring, and reporting cybersecurity incident status through VCF Operations and its integration with external IT service management platforms. These capabilities give internal stakeholders visibility into incident lifecycle from detection through resolution, though the organizational processes governing stakeholder communication and escalation must be established separately.

VCF Operations includes a dedicated Troubleshooting Incidents page that displays a summary of all incidents, including their current status, the count of affected entities for in-progress incidents, and the top root causes identified. Individual incident records capture detailed metadata: state, resolution code, resolution notes, impact (business criticality), urgency (resolution timeframe), priority (resolution sequence), severity level, and approval workflow documentation. Each incident can be tracked with a status of resolved (root cause found) or unresolved (no root cause identified), providing a basic incident lifecycle within the platform. Investigators can flag specific metrics and mark them as root cause during analysis. The incident page also shows historical context, including past incidents created for the same entity, traffic and flow data, and anomaly highlights that allow filtering by metric name, entity name, and other parameters. Each incident records who created it and when, providing an audit trail of incident activity. A consolidated list view of all incidents with their status is available, with options to edit, share, or delete individual records.

For alert-driven incident detection, VCF Operations allows administrators to define metric event symptoms based on threshold violations reported by monitored systems. These symptoms feed into alert definitions, where the impact setting can be configured to indicate risk levels requiring near-term attention. Symptom definitions can describe incremental levels of concern, giving operations teams graduated visibility into developing issues. Critical and immediate alerts are surfaced for prompt action. VCF Operations maps events from target systems into its own severity model, defining event triggers and mapping severity levels so that high-priority conditions are appropriately flagged.

To facilitate stakeholder reporting and integration with organizational incident management workflows, VCF Operations provides a ServiceNow Notification Plug-in that sends alert notifications to ServiceNow to create incident tickets automatically. These incidents carry structured data including the caller, category, subcategory, business service, and contact type. Notification rules can be configured to populate incident fields such as state, resolution code, resolution notes, on-hold reason, impact, urgency, priority, assignment group, assigned person, severity, approval actions, related problems, and change cause. The ServiceNow Management Pack extends this integration by watching a predefined set of incident, alert, and event columns in ServiceNow and displaying current values back in VCF Operations as alert notes, keeping both systems synchronized. The impact parameter for incidents opened in ServiceNow defaults to the value set in the VCF Operations alert, maintaining consistency across platforms.

VCF also integrates with SIEM and log management systems via syslog forwarding. VMware vCenter syslog forwarding supports the TCP, UDP, TLS, and RELP protocols and can be configured through the vCenter Management API. VCF Operations supports configuration of a remote syslog host for centralized log collection. These syslog capabilities enable continuous monitoring and data correlation across the infrastructure stack, feeding incident-relevant data to external analysis platforms.

These capabilities address the technical side of incident situational awareness, but the control also requires organizational processes for defining stakeholder notification procedures, escalation paths, reporting cadences, and data protection incident handling workflows. VCF Operations provides the tooling to document and track incidents with rich metadata, monitor their status in real time, and push incident information to external systems where broader stakeholder communication can occur. The organization must define the policies and procedures that govern how and when this information reaches the appropriate internal stakeholders throughout the incident lifecycle.

#### VMware vDefend (Contributes)

VMware vDefend provides network-layer situational awareness capabilities that contribute to documenting, monitoring, and reporting the status of cybersecurity incidents through their lifecycle.

Security Intelligence is the primary situational awareness engine within vDefend. It detects and categorizes suspicious traffic events by severity (Critical, High, Medium, and Low) and maps them to MITRE ATT&CK tactics and techniques, giving incident responders a structured understanding of what is occurring on the network and how it relates to known attack patterns. The Monitor & Plan Overview dashboard in Security Intelligence displays high-level information about the most recent state of network activities and objects under management, providing operators with a current picture of the environment. Security Intelligence supports detection and display of tactics and techniques from the ATT&CK framework, showing the number of detected suspicious events that used each tactic or technique during the selected time period. Security teams can compare the ratio of detected versus prevented events to assess how effectively security controls are containing activity, and the Threat Event Monitoring tab provides key insights about the current state of various security issues in the data center to help security teams understand network activity and prioritize focus areas. The IDS/IPS threat event monitoring page displays summaries for the last 14 days.

The Security Explorer Computes view provides a record of all IDS/IPS events for in-depth analysis over a 30-day timeframe, giving teams the historical context needed to understand incident progression. The View Full Event History capability displays all events associated with a specific signature ID and intrusion severity, supporting focused investigation of recurring or related events.

Network Detection and Response (NDR) correlates individual detection events into campaigns, providing a higher-level view that connects related events across time and across workloads. Each campaign aggregates correlated threat activity and maps it to different stages of an attack, giving responders a consolidated view of an ongoing incident rather than a stream of disconnected alerts. The Campaign Blueprint tab within Security Services Platform visualizes correlated security events and key actors for security incident investigation. Security teams can investigate individual threat events and correlated campaigns through the Security Services Platform interface to assess impact, identify root causes, and take mitigation actions.

The Security Segmentation Report gives security operations personnel insight into their organization's security posture and supports prioritization of remediation efforts. The report includes an Inter-Environment Pair Protection Rule Action Summary that provides a tabular summary of inter-environment communications. The Rule Analysis feature generates downloadable CSV reports of the last successful analysis, with separate CSV files for each detected anomaly type, providing exportable documentation of security findings. Alarms notify of all open conditions categorized by severity (Critical, High, Medium, and Informational) to flag conditions requiring attention. The Security Services Platform defines a dedicated Security Operator role that monitors security systems and responds to security incidents, providing a role-based access model for incident response functions.

These capabilities provide the network security dimension of incident situational awareness: detecting threats, categorizing their severity, mapping them to attack frameworks, correlating events into campaigns, and maintaining historical records. However, vDefend does not manage the organizational processes of notifying stakeholders, assigning incident ownership, tracking resolution status through a ticketing system, or producing management reports on incident posture. Those responsibilities require organizational incident management procedures and dedicated ITSM or SOAR tooling.

#### VCF Protection and Recovery (Contributes)

VCF Protection and Recovery (PNR) supplies mechanisms that help internal stakeholders track the status of cyber recovery operations and protection-related incidents through to resolution. The PNR appliance records operational information into log files, and the platform logs events with corresponding alarms to track system health and surface issues before they affect protection. The Alarms list maintains a history of all notifications that require attention, with search and filtering by severity.

The Clean Room Orchestrator is the primary surface for incident situational awareness during ransomware recovery operations. Events carry severity levels of Info, Warning, Error, and Emergency, and a global view shows the collection of clean room events, tasks, and alarms across recovery operations. PNR supports configuration of email alerts for critical events in the clean room orchestrator so that designated recipients receive notification of important recovery operations and system events.

Cyber Recovery, the ransomware recovery capability within PNR, integrates with Carbon Black and CrowdStrike for security and vulnerability analysis during ransomware recovery. CrowdStrike-integrated detection records include date, time, duration, status, the affected process or executable, the user who performed the action, and the threat tactic and technique. CrowdScore for Incident Detections measures real-time threat level on a scale of 0 to 100, with a score of 100 indicating a critical threat that calls for immediate attention. Vulnerabilities are presented with their Common Vulnerabilities and Exposures (CVE) identifiers and links to articles in the National Institute of Standards and Technology (NIST) database. Carbon Black behavior analysis results appear on the Analysis > Alerts tab, and malware scan findings are displayed in the Alerts tab ranked by severity score. Cyber Recovery also maintains a history log for reprotect operations that can be exported as a report to verify the reprotection process.

Snapshot badging provides a documented audit trail of snapshot validation, marking snapshots as Verified for clean snapshots, Compromised for malware-confirmed snapshots, or Encrypted for data encryption findings. The Protection and Recovery Cloud Management Pack integrates with VCF Operations to collect data from a Protection and Recovery Cloud instance, extending incident visibility into the VCF Operations console.

#### VMware Data Services Manager (Contributes)

VMware Data Services Manager (DSM) provides audit logging and alerting capabilities that support situational awareness during cybersecurity and data protection incidents. The System Audit Events view, accessible through the DSM administrative interface, records administrative actions with structured fields: Source (the user identifier or "System" when DSM initiates the operation), Event Type (the category of audited operation), Status (the outcome), Component (the DSM subsystem involved), Event Time (UTC), and Event Details (operation-specific context). These records give administrators a traceable account of actions within DSM that can be reviewed during an incident investigation to establish what occurred, when it occurred, and who or what initiated it. Audit event data can be exported from DSM in CSV or XLSX format using the ACTIONS drop-down menu in the System Audit Events view, supporting the documentation and reporting requirements of an incident response process.

DSM generates alerts for specific categories of security-relevant events, including authentication failures, backup and restore corruptions, and certificate errors. Administrators can enable or disable alerts for database operation failures through the "Enable Alerts for DB Operation Failure" setting. DSM also raises metrics-based alerts when resource thresholds are exceeded, and surfaces resolution suggestions alongside active database alerts in the UI to support investigation and remediation. Alerts are classified at multiple severity levels, including CRITICAL and WARNING. When alerts fire, DSM transmits notifications to configured webhooks with structured data including the alert name, alert level, trigger timestamp, current service status, and database cluster identifier and name.

Webhook configuration in DSM includes direct integration with ServiceNow. DSM populates the ServiceNow short_description, description, close_code, and close_notes fields with alert and cluster context, allowing DSM alert data to be routed into an existing incident management workflow without additional middleware. This reduces the manual steps required to open and populate incident tickets when DSM detects a security-relevant event.

DSM can also be monitored using VCF Operations for troubleshooting and status visibility, extending operational awareness beyond the DSM interface.

DSM's contribution to this control is through audit trail visibility, configurable alerting with severity classification, external notification forwarding, and ServiceNow integration. The broader requirement to document incident status end-to-end, assign incidents to responsible parties, track them through resolution, and formally report outcomes to stakeholders requires an organizational incident response process and dedicated case management tooling. DSM provides the data feeds, event notifications, and ServiceNow integration that support that process but does not replace it.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer (Avi) provides application-layer visibility and reporting mechanisms that support an organization's incident documentation and status communication processes. The primary reporting tool is the Application Security Report, accessible under Application Monitoring in the Avi Controller UI. This report can be generated per virtual service and downloaded in PDF format, with report generation status visible on the Reports page. It produces a structured summary of WAF findings and pre-check results, including ranked lists of top attack types such as SQL injection and cross-site scripting, lists of top attacking IP addresses, trend summaries showing total and flagged requests, and overall application security posture. The Application Security Report is designed for security teams, executives, and auditors, providing audit-ready documentation of WAF activity that personnel can distribute to internal stakeholders as part of incident documentation workflows.

Avi generates structured alert events for security-relevant and operational conditions. The Alert feature processes system events and metrics against user-defined rules and generates alerts that initiate configured actions such as sending an email, a syslog message, or an SNMP trap, enabling integration with an organization's broader incident management tooling. Alert configurations define triggers with configurable parameters that determine when alerts fire and what actions follow. Metric-based alerts can be configured with multiple events combined using logical operators against specified thresholds. The Service Engine Analytics Anomalies Overlay generates alerts with a timestamp, a resource name identifying the object reporting the alert, and a severity level of High, Medium, or Low that determines whether additional notification is triggered. Avi also logs denial of service attack events with detailed context including event ID, attack count, threshold values, and alert level.

Avi Controller and Avi Service Engine log audit records for certificate validation failures, client authentication failures, SSH session establishment failures, and identification of initiators and targets of failed trusted channel establishment attempts. These audit records are forwarded to Events, Syslog, and Splunk, providing integration points for an organization's centralized incident monitoring and log aggregation infrastructure.

Avi does not provide an end-to-end incident management and tracking system. Defining incident categories, assigning ownership, tracking status through resolution, communicating updates to internal stakeholders at each stage, and maintaining incident records beyond Avi's application-layer logs and reports are organizational responsibilities. Avi's reporting and alerting capabilities feed the organization's incident management process as inputs alongside other tools and workflows.

### Control 34.1

> When the personal data breach is likely to result in a high risk to the rights and freedoms of natural persons, the controller shall communicate the personal data breach to the data subject without undue delay.

**SCF Controls:** IRO-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 34.2

> The communication to the data subject referred to in paragraph 1 of this Article shall describe in clear and plain language the nature of the personal data breach and contain at least the information and measures referred to in points (b), (c) and (d) of Article 33(3).

**SCF Controls:** IRO-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 35.1

> Where a type of processing in particular using new technologies, and taking into account the nature, scope, context and purposes of the processing, is likely to result in a high risk to the rights and freedoms of natural persons, the controller shall, prior to the processing, carry out an assessment of the impact of the envisaged processing operations on the protection of personal data. A single assessment may address a set of similar processing operations that present similar high risks.

**SCF Controls:** RSK-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 35.2

> The controller shall seek the advice of the data protection officer, where designated, when carrying out a data protection impact assessment.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 35.3(a)

> A data protection impact assessment referred to in paragraph 1 shall in particular be required in the case of: a. a systematic and extensive evaluation of personal aspects relating to natural persons which is based on automated processing, including profiling, and on which decisions are based that produce legal effects concerning the natural person or similarly significantly affect the natural person; 

**SCF Controls:** RSK-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 35.3(b)

> A data protection impact assessment referred to in paragraph 1 shall in particular be required in the case of:  b. processing on a large scale of special categories of data referred to in Article 9(1), or of personal data relating to criminal convictions and offences referred to in Article 10; or  

**SCF Controls:** RSK-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 35.3(c)

> A data protection impact assessment referred to in paragraph 1 shall in particular be required in the case of:  c. a systematic monitoring of a publicly accessible area on a large scale. 

**SCF Controls:** RSK-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 35.7(a)

> The assessment shall contain at least: a. a systematic description of the envisaged processing operations and the purposes of the processing, including, where applicable, the legitimate interest pursued by the controller; 

**SCF Controls:** RSK-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 35.7(b)

> The assessment shall contain at least:  b. an assessment of the necessity and proportionality of the processing operations in relation to the purposes; 

**SCF Controls:** RSK-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 35.7(c)

> The assessment shall contain at least:  c. an assessment of the risks to the rights and freedoms of data subjects referred to in paragraph 1; and 

**SCF Controls:** RSK-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 35.7(d)

> The assessment shall contain at least:  d. the measures envisaged to address the risks, including safeguards, security measures and mechanisms to ensure the protection of personal data and to demonstrate compliance with this Regulation taking into account the rights and legitimate interests of data subjects and other persons concerned. 

**SCF Controls:** RSK-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 35.8

> Compliance with approved codes of conduct referred to in Article 40 by the relevant controllers or processors shall be taken into due account in assessing the impact of the processing operations performed by such controllers or processors, in particular for the purposes of a data protection impact assessment.

**SCF Controls:** RSK-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 35.9

> Where appropriate, the controller shall seek the views of data subjects or their representatives on the intended processing, without prejudice to the protection of commercial or public interests or the security of processing operations.

**SCF Controls:** RSK-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 35.11

> Where necessary, the controller shall carry out a review to assess if processing is performed in accordance with the data protection impact assessment at least when there is a change of the risk represented by processing operations.

**SCF Controls:** RSK-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 36.1

> The controller shall consult the supervisory authority prior to processing where a data protection impact assessment under Article 35 indicates that the processing would result in a high risk in the absence of measures taken by the controller to mitigate the risk.

**SCF Controls:** RSK-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 37.1

> The controller and the processor shall designate a data protection officer in any case where: a. the processing is carried out by a public authority or body, except for courts acting in their judicial capacity; b. the core activities of the controller or the processor consist of processing operations which, by virtue of their nature, their scope and/or their purposes, require regular and systematic monitoring of data subjects on a large scale; or c. the core activities of the controller or the processor consist of processing on a large scale of special categories of data pursuant to Article 9 or personal data relating to criminal convictions and offences referred to in Article 10.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 37.1(a)

> The controller and the processor shall designate a data protection officer in any case where: a. the processing is carried out by a public authority or body, except for courts acting in their judicial capacity; 

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 37.1(b)

> The controller and the processor shall designate a data protection officer in any case where:  b. the core activities of the controller or the processor consist of processing operations which, by virtue of their nature, their scope and/or their purposes, require regular and systematic monitoring of data subjects on a large scale; or 

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 37.1(c)

> The controller and the processor shall designate a data protection officer in any case where:  c. the core activities of the controller or the processor consist of processing on a large scale of special categories of data pursuant to Article 9 or personal data relating to criminal convictions and offences referred to in Article 10.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 37.2

> A group of undertakings may appoint a single data protection officer provided that a data protection officer is easily accessible from each establishment.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 37.3

> Where the controller or the processor is a public authority or body, a single data protection officer may be designated for several such authorities or bodies, taking account of their organisational structure and size.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 37.4

> In cases other than those referred to in paragraph 1, the controller or processor or associations and other bodies representing categories of controllers or processors may or, where required by Union or Member State law shall, designate a data protection officer. The data protection officer may act for such associations and other bodies representing controllers or processors.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 37.5

> The data protection officer shall be designated on the basis of professional qualities and, in particular, expert knowledge of data protection law and practices and the ability to fulfil the tasks referred to in Article 39.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 37.6

> The data protection officer may be a staff member of the controller or processor, or fulfil the tasks on the basis of a service contract.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 37.7

> The controller or the processor shall publish the contact details of the data protection officer and communicate them to the supervisory authority.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 38.1

> The controller and the processor shall ensure that the data protection officer is involved, properly and in a timely manner, in all issues which relate to the protection of personal data.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 38.2

> The controller and processor shall support the data protection officer in performing the tasks referred to in Article 39 by providing resources necessary to carry out those tasks and access to personal data and processing operations, and to maintain his or her expert knowledge.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 38.3

> The controller and processor shall ensure that the data protection officer does not receive any instructions regarding the exercise of those tasks. He or she shall not be dismissed or penalised by the controller or the processor for performing his tasks. The data protection officer shall directly report to the highest management level of the controller or the processor.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 38.4

> Data subjects may contact the data protection officer with regard to all issues related to processing of their personal data and to the exercise of their rights under this Regulation.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 38.5

> The data protection officer shall be bound by secrecy or confidentiality concerning the performance of his or her tasks, in accordance with Union or Member State law.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 38.6

> The data protection officer may fulfil other tasks and duties. The controller or processor shall ensure that any such tasks and duties do not result in a conflict of interests. 

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 39.1

> The data protection officer shall have at least the following tasks: a. to inform and advise the controller or the processor and the employees who carry out processing of their obligations pursuant to this Regulation and to other Union or Member State data protection provisions; b. to monitor compliance with this Regulation, with other Union or Member State data protection provisions and with the policies of the controller or processor in relation to the protection of personal data, including the assignment of responsibilities, awareness-raising and training of staff involved in processing operations, and the related audits; c. to provide advice where requested as regards the data protection impact assessment and monitor its performance pursuant to Article 35; d. to cooperate with the supervisory authority; e. to act as the contact point for the supervisory authority on issues relating to processing, including the prior consultation referred to in Article 36, and to consult, where appropriate, with regard to any other matter. 

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 39.1(a)

> The data protection officer shall have at least the following tasks: a. to inform and advise the controller or the processor and the employees who carry out processing of their obligations pursuant to this Regulation and to other Union or Member State data protection provisions; 

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 39.1(b)

> The data protection officer shall have at least the following tasks:  b. to monitor compliance with this Regulation, with other Union or Member State data protection provisions and with the policies of the controller or processor in relation to the protection of personal data, including the assignment of responsibilities, awareness-raising and training of staff involved in processing operations, and the related audits; 

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 39.1(c)

> The data protection officer shall have at least the following tasks:  c. to provide advice where requested as regards the data protection impact assessment and monitor its performance pursuant to Article 35; 

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 39.1(d)

> The data protection officer shall have at least the following tasks:  d. to cooperate with the supervisory authority; 

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 39.1(e)

> The data protection officer shall have at least the following tasks:  e. to act as the contact point for the supervisory authority on issues relating to processing, including the prior consultation referred to in Article 36, and to consult, where appropriate, with regard to any other matter. 

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 39.2

> The data protection officer shall in the performance of his or her tasks have due regard to the risk associated with processing operations, taking into account the nature, scope, context and purposes of processing.

**SCF Controls:** PRI-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 44

> Any transfer of personal data which are undergoing processing or are intended for processing after transfer to a third country or to an international organisation shall take place only if, subject to the other provisions of this Regulation, the conditions laid down in this Chapter are complied with by the controller and processor, including for onward transfers of personal data from the third country or an international organisation to another third country or to another international organisation. All provisions in this Chapter shall be applied in order to ensure that the level of protection of natural persons guaranteed by this Regulation is not undermined.

**SCF Controls:** DCH-25

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 45.1

> A transfer of personal data to a third country or an international organisation may take place where the Commission has decided that the third country, a territory or one or more specified sectors within that third country, or the international organisation in question ensures an adequate level of protection. Such a transfer shall not require any specific authorisation.

**SCF Controls:** DCH-25, PRI-01.5

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 46.1

> In the absence of a decision pursuant to Article 45(3), a controller or processor may transfer personal data to a third country or an international organisation only if the controller or processor has provided appropriate safeguards, and on condition that enforceable data subject rights and effective legal remedies for data subjects are available.

**SCF Controls:** DCH-25, PRI-01.5

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 46.2

> The appropriate safeguards referred to in paragraph 1 may be provided for, without requiring any specific authorisation from a supervisory authority, by: a. a legally binding and enforceable instrument between public authorities or bodies; b. binding corporate rules in accordance with Article 47;

**SCF Controls:** DCH-25

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 46.2(a)

> The appropriate safeguards referred to in paragraph 1 may be provided for, without requiring any specific authorisation from a supervisory authority, by: a. a legally binding and enforceable instrument between public authorities or bodies; 

**SCF Controls:** DCH-25

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 46.2(b)

> The appropriate safeguards referred to in paragraph 1 may be provided for, without requiring any specific authorisation from a supervisory authority, by:  b. binding corporate rules in accordance with Article 47;

**SCF Controls:** PRI-01.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 46.3(a)

> Subject to the authorisation from the competent supervisory authority, the appropriate safeguards referred to in paragraph 1 may also be provided for, in particular, by: a. contractual clauses between the controller or processor and the controller, processor or the recipient of the personal data in the third country or international organisation;

**SCF Controls:** PRI-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 49.1

> In the absence of an adequacy decision pursuant to Article 45(3), or of appropriate safeguards pursuant to Article 46, including binding corporate rules, a transfer or a set of transfers of personal data to a third country or an international organisation shall take place only on one of the following conditions: a. the data subject has explicitly consented to the proposed transfer, after having been informed of the possible risks of such transfers for the data subject due to the absence of an adequacy decision and appropriate safeguards; b. the transfer is necessary for the performance of a contract between the data subject and the controller or the implementation of pre-contractual measures taken at the data subject’s request; c. the transfer is necessary for the conclusion or performance of a contract concluded in the interest of the data subject between the controller and another natural or legal person; d. the transfer is necessary for important reasons of public interest; e. the transfer is necessary for the establishment, exercise or defence of legal claims; f. the transfer is necessary in order to protect the vital interests of the data subject or of other persons, where the data subject is physically or legally incapable of giving consent; g. the transfer is made from a register which according to Union or Member State law is intended to provide information to the public and which is open to consultation either by the public in general or by any person who can demonstrate a legitimate interest, but only to the extent that the conditions laid down by Union or Member State law for consultation are fulfilled in the particular case.

**SCF Controls:** DCH-25

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 49.1(a)

> In the absence of an adequacy decision pursuant to Article 45(3), or of appropriate safeguards pursuant to Article 46, including binding corporate rules, a transfer or a set of transfers of personal data to a third country or an international organisation shall take place only on one of the following conditions: a. the data subject has explicitly consented to the proposed transfer, after having been informed of the possible risks of such transfers for the data subject due to the absence of an adequacy decision and appropriate safeguards; 

**SCF Controls:** DCH-25

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 49.1(b)

> In the absence of an adequacy decision pursuant to Article 45(3), or of appropriate safeguards pursuant to Article 46, including binding corporate rules, a transfer or a set of transfers of personal data to a third country or an international organisation shall take place only on one of the following conditions:  b. the transfer is necessary for the performance of a contract between the data subject and the controller or the implementation of pre-contractual measures taken at the data subject’s request; 

**SCF Controls:** DCH-25

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 49.1(c)

> In the absence of an adequacy decision pursuant to Article 45(3), or of appropriate safeguards pursuant to Article 46, including binding corporate rules, a transfer or a set of transfers of personal data to a third country or an international organisation shall take place only on one of the following conditions:  c. the transfer is necessary for the conclusion or performance of a contract concluded in the interest of the data subject between the controller and another natural or legal person; 

**SCF Controls:** DCH-25

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 49.1(d)

> In the absence of an adequacy decision pursuant to Article 45(3), or of appropriate safeguards pursuant to Article 46, including binding corporate rules, a transfer or a set of transfers of personal data to a third country or an international organisation shall take place only on one of the following conditions:  d. the transfer is necessary for important reasons of public interest; 

**SCF Controls:** DCH-25

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 49.1(e)

> In the absence of an adequacy decision pursuant to Article 45(3), or of appropriate safeguards pursuant to Article 46, including binding corporate rules, a transfer or a set of transfers of personal data to a third country or an international organisation shall take place only on one of the following conditions:  e. the transfer is necessary for the establishment, exercise or defence of legal claims; 

**SCF Controls:** DCH-25

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 49.1(f)

> In the absence of an adequacy decision pursuant to Article 45(3), or of appropriate safeguards pursuant to Article 46, including binding corporate rules, a transfer or a set of transfers of personal data to a third country or an international organisation shall take place only on one of the following conditions:   f. the transfer is necessary in order to protect the vital interests of the data subject or of other persons, where the data subject is physically or legally incapable of giving consent; 

**SCF Controls:** DCH-25

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 49.1(g)

> In the absence of an adequacy decision pursuant to Article 45(3), or of appropriate safeguards pursuant to Article 46, including binding corporate rules, a transfer or a set of transfers of personal data to a third country or an international organisation shall take place only on one of the following conditions: a. the data subject has explicitly consented to the proposed transfer, after having been informed of the possible risks of such transfers for the data subject   g. the transfer is made from a register which according to Union or Member State law is intended to provide information to the public and which is open to consultation either by the public in general or by any person who can demonstrate a legitimate interest, but only to the extent that the conditions laid down by Union or Member State law for consultation are fulfilled in the particular case.

**SCF Controls:** DCH-25

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 49.2

> A transfer pursuant to point (g) of the first subparagraph of paragraph 1 shall not involve the entirety of the personal data or entire categories of the personal data contained in the register. Where the register is intended for consultation by persons having a legitimate interest, the transfer shall be made only at the request of those persons or if they are to be the recipients.

**SCF Controls:** DCH-25

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 49.3

> Points (a), (b) and (c) of the first subparagraph of paragraph 1 and the second subparagraph thereof shall not apply to activities carried out by public authorities in the exercise of their public powers.

**SCF Controls:** DCH-25

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 49.4

> The public interest referred to in point (d) of the first subparagraph of paragraph 1 shall be recognised in Union law or in the law of the Member State to which the controller is subject.

**SCF Controls:** DCH-25

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 49.6

> The controller or processor shall document the assessment as well as the suitable safeguards referred to in the second subparagraph of paragraph 1 of this Article in the records referred to in Article 30.

**SCF Controls:** DCH-25

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend (DFW) and Gateway Firewall enable network-level policy enforcement that restricts east-west and north-south connections, including outbound transfers to unauthorized or geographically prohibited destinations. Gateway Firewall rules can deny all inter-project communication except for infrastructure protocols such as DHCP, DNS, NTP, and ICMP, providing a mechanism to prevent sensitive workloads from transferring data to unauthorized external destinations. URL filtering and TLS inspection extend these controls by enabling policy-based blocking or inspection of outbound connections based on category, reputation, or destination.

Security Intelligence, part of the Security Services Platform (SSP), provides flow visibility and audit capabilities that support compliance documentation for data transfer governance. The Export All Flows capability exports network flow data to a CSV file for analysis and compliance documentation. Security Intelligence also exports user-defined label assignments, which associate compute entities with classification tags, to CSV, supporting audit documentation of which workloads are subject to data handling policies. Policy recommendations generated by Security Intelligence can be exported in JSON or CSV format for further analysis. SSP stores processed, enriched, and correlated flow data, with aggregated flow records updated every six hours.

Network Detection and Response (NDR) anonymizes sensitive customer information when sharing data to cloud services, providing a privacy control over what platform telemetry leaves the environment. SSP regions can also be associated with security and network policies to control policy scope across multiple geographic locations, supporting governance of which security rules apply where.

vDefend operates at the network layer and does not enforce data residency, contractual, or legal compliance obligations directly. Those obligations require complementary governance frameworks and organizational processes that extend beyond network-level enforcement.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides geographic enforcement mechanisms at the application delivery layer that help organizations restrict application traffic flows by source geography. The Geo-DB feature allows administrators to define named groups of geographic entities, including specific country lists and regional groupings such as embargo country sets, which can then be applied as match conditions in virtual service traffic policies. This allows Avi to block, log, or redirect requests based on the geographic origin of the connection.

The Avi Web Application Firewall (WAF), built on the ModSecurity rules engine, extends geographic enforcement through the t:IPtoCountryCode transformation. This transformation converts a client IP address to its corresponding country code within WAF rule expressions, enabling administrators to write rules that match and act on traffic associated with specific jurisdictions. Geo-DB policy groups and WAF country-code rules can be layered to create enforcement at the application proxy boundary.

The Avi Analytics Profile supports configuration of a sensitive log profile that controls how sensitive data appearing in client logs is handled. This limits inadvertent exposure of regulated data within Avi's own telemetry and complements the traffic enforcement mechanisms described above.

Effective use requires that the organization identify which applications process data subject to cross-border transfer regulations, determine which jurisdictions are restricted or permitted, and then configure the corresponding Geo-DB groups and WAF rules. Avi provides the enforcement mechanism; the underlying data classification and jurisdictional analysis are organizational responsibilities.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.
