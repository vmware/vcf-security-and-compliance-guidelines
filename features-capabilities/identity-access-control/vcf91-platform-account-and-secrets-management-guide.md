# Platform Accounts and Secrets

*VMware Cloud Foundation 9.1*

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.

## Introduction

This guide covers the architecture and management of 122 platform accounts in VCF 9.1 across three core populations: shared administrative accounts (OS and application administrative logins), non-human identities / service accounts (inter-component machine-to-machine logins), and workload identities (Kubernetes ServiceAccounts).

> **Terminology Note:** Synonyms previously or commonly used to describe these platform-provisioned identities include *functional ID (FID)*, *non-human identity (NHI)*, *service account*, *machine identity*, *shared administrative account*, and *workload identity*. This guide standardizes the **platform account** vocabulary across all component inventories.

Refer to the companion CSV file (`vcf91-platform-account-reference.csv`) for complete 24-column detail per account, including per-account security controls, access methods, privilege scope, and audit log paths.

---

## Table of Contents

- [Platform Accounts and Secrets](#platform-accounts-and-secrets)  
- [Disclaimer](#disclaimer)  
- [Section 1: The Centralized Secrets Management Architecture](#section-1-the-centralized-secrets-management-architecture)  
  - [Stateless Security Control Framework (Tier 1)](#stateless-security-control-framework-tier-1)  
  - [Policy Compliance Engine](#policy-compliance-engine)  
  - [Tier 2: Inter-Component Service Accounts](#tier-2-inter-component-service-accounts)  
  - [Workload Identities (Kubernetes ServiceAccounts)](#workload-identities-kubernetes-serviceaccounts)  
  - [Out-of-Band Password Changes](#out-of-band-password-changes)  
- [Section 2: Vault Integration Scope and Fleet Password Policy](#section-2-vault-integration-scope-and-fleet-password-policy)  
  - [Out-of-the-Box (OOTB) Appliance Integration Matrix](#out-of-the-box-ootb-appliance-integration-matrix)  
  - [Programmatic REST API Translation Paths](#programmatic-rest-api-translation-paths)  
  - [API Authentication Mechanics](#api-authentication-mechanics)  
    - [Method 1: OpsToken (Credentials-Based)](#method-1-opstoken-credentials-based)  
    - [Method 2: Bearer Token (OAuth 2.0 API Token Workflow)](#method-2-bearer-token-oauth-20-api-token-workflow)  
  - [Core Fleet Management Password API Endpoints](#core-fleet-management-password-api-endpoints)  
    - [1. Query Managed Accounts](#1-query-managed-accounts)  
    - [2. Update Account Password](#2-update-account-password)  
    - [3. Monitor Task Status](#3-monitor-task-status)  
  - [SDDC Manager Credential API Syntax](#sddc-manager-credential-api-syntax)  
  - [Structural Delineation of Non-Integrated Accounts](#structural-delineation-of-non-integrated-accounts)  
- [Section 3: Native Platform Service Accounts (Tier 2 Mesh)](#section-3-native-platform-service-accounts-tier-2-mesh)  
  - [Process-to-Process Automation and Lifecycle Rules](#process-to-process-automation-and-lifecycle-rules)  
  - [Operational Exceptions](#operational-exceptions)  
    - [Failed Deployments Cleanup Requirement (VCFMS Accounts)](#failed-deployments-cleanup-requirement-vcfms-accounts)  
    - [Avi Controller Integration Validation Workaround](#avi-controller-integration-validation-workaround)  
- [Section 4: Security Auditing and SIEM Telemetry Reference](#section-4-security-auditing-and-siem-telemetry-reference)  
  - [A. Local/Bypass Password Modifications](#a-localbypass-password-modifications)  
  - [B. API Authentication and Account Lockouts](#b-api-authentication-and-account-lockouts)  
  - [C. VCF Log Management and Session Auditing](#c-vcf-log-management-and-session-auditing)  
  - [D. SDDC Manager Credential and Activity Auditing](#d-sddc-manager-credential-and-activity-auditing)  
  - [E. Preventing Unplanned Password Expiry](#e-preventing-unplanned-password-expiry)  
  - [Component Event Name Mapping](#component-event-name-mapping)  
- [Section 5: Platform Account Inventory Summary](#section-5-platform-account-inventory-summary)  
  - [Population Breakdown and Tiers](#population-breakdown-and-tiers)  
  - [Vault Integration Status Distribution](#vault-integration-status-distribution)  
- [Additional Resources](#additional-resources)

## Section 1: The Centralized Secrets Management Architecture

To support the security of software-defined data center (SDDC) operations at enterprise scale, VMware Cloud Foundation (VCF) 9.1 uses a centralized secrets architecture managed via VCF Operations through the Fleet Management engine. This architecture replaces legacy models where credentials were managed within individual component interfaces, consolidating security operations into a single fleet password management engine.  
To maintain clear operational and audit boundaries, administrators and security teams must recognize that VCF 9.1 splits accounts into three distinct administrative domains:

* **Tier 1: OS and Application Administrative Accounts (External Vault / Fleet Policy Integrated):** Interactive credentials used by system administrators to initiate SSH sessions, execute CLI commands, or authenticate directly to individual component software management interfaces (such as root or admin).  
* **Tier 2: Inter-Component Service Accounts (Natively Automated Mesh):** Non-interactive, machine-to-machine application identities automatically provisioned during platform deployment to govern background service-to-service communication paths.  
* **Tier 3: Workload Identities (Container-Native):** Kubernetes ServiceAccounts and equivalent identities used by the containerized management services, provisioned and rotated by the Kubernetes control plane.

### Stateless Security Control Framework (Tier 1)

To minimize the platform's attack surface and avoid a centralized credential repository, the Fleet Management engine enforces a **Stateless Zero-Storage Mandate** for Tier 1 accounts.

* **Zero Local Retention:** VCF Operations does not retain plain-text credentials, hashes, or vault-managed passwords locally. This property is an architectural baseline that applies regardless of whether an external vault is connected to VCF Operations.  
    
  *Note on SDDC Manager Credential Store:* Separately from VCF Operations, SDDC Manager maintains its own credential records in its legacy credential store for lifecycle orchestration. Modifying passwords out-of-band directly on target components leaves SDDC Manager's stored record stale, resulting in lifecycle operation authentication failures.  
    
* **Pass-Through Execution:** Credential updates or verification requests are handled strictly in-flight, passed securely to the destination component node via native APIs, and immediately flushed from memory.  
    
* **Metadata Status Tracking:** Compliance visibility is maintained by querying non-sensitive lifecycle metadata from individual components via periodic collection cycles. The platform monitors and displays the operational status of the account using standard metadata lifecycle values:  
    
  * ACTIVE: Credential is valid and operating within configured lifecycle limits.  
  * EXPIRING: Credential is approaching its predefined rotation or expiration threshold.  
  * EXPIRED: Credential exceeds its maximum allowed operational age.  
  * UNKNOWN: Component status metadata cannot currently be reached by the collection engine.  
  * DISCONNECTED: Local component account password has drifted from the stored record value (e.g., via an out-of-band modification).

### Policy Compliance Engine

Beyond individual account states, the platform allows administrators to define explicit global password compliance baselines (password complexity, maximum age, and lockout thresholds) across component groups. Background async compliance tasks (COMPLIANCE_RUN) audit these settings against active workloads on a six-hour automated cadence.

* COMPLIANT: Meets all requirements of the assigned policy rules.  
* NON_COMPLIANT: Violates an assigned password policy rule. This flags the user interface to facilitate rapid remediation via async tasks.  
* FAILED: The compliance check or policy remediation task could not be completed.  
* NOT_ELIGIBLE: A component is not a candidate for password policy because the component is of an earlier version or it is not a part of a VCF instance.  
* NO_POLICY: No password policy is configured/assigned for the component

### Tier 2: Inter-Component Service Accounts

VCF 9.1 Tier 2 accounts handle continuous machine-to-machine data streaming, programmatic integration, and background initialization.

* **Authentication Mechanism:** These identities authenticate with natively managed credentials. Appliance-to-appliance accounts use username and password pairs. Container-native identities use Kubernetes ServiceAccount tokens, and some components use client certificates. Lifecycles are controlled by internal platform managers.  
* **Isolation Boundaries:** These credentials do not expose public lookup interfaces and are not managed through the external vault integration to support uninterrupted internal fabric communication.

### Workload Identities (Kubernetes ServiceAccounts)

VCF 9.1 includes container-native workload identities represented as Kubernetes ServiceAccounts.

* **Provisioning and Lifecycle:** These identities are provisioned automatically by the Kubernetes control plane during platform deployment and upgrade, and are not customer-managed.  
* **Scope of Vault Integration:** Workload identities are out of scope for external vault integration by design. They are provisioned and rotated natively by the Kubernetes control plane rather than by the fleet password pipeline, as they have no interactive access path and operate entirely within in-cluster workload contexts.  
* **Operational Guidance:** Administrators should not attempt to manually modify or rotate these ServiceAccounts out-of-band. Manual modifications can disrupt container orchestration and cause service failures.

### Out-of-Band Password Changes

Once centralized password tracking is configured through VCF Operations, administrators should not update administrative passwords out-of-band locally within individual product modules (such as editing a root password directly via an ESX shell or a VMware vCenter Appliance Management Interface).

SDDC Manager maintains a reference copy of Tier 1 credentials within its legacy credential store (accessible via the `/v1/credentials` API). Modifying credentials directly at the component causes SDDC Manager's stored credential to become stale. This disconnects the orchestration layer, causing lifecycle management operations (upgrades, patches, host commissioning, and pre-checks), health validations, and remediation workflows to abort with authentication errors (HTTP 401).

## Section 2: Vault Integration Scope and Fleet Password Policy

VCF Operations provides a stateless passthrough architecture for credential operations. The enterprise vault initiates rotations and holds the master record, while VCF Operations executes the delivery across target component nodes. VCF Operations does not store passwords locally during this workflow.

**External Vault Integration:**  
VCF Operations supports external enterprise vault integration through plugin extensions. An external vault plugin connects a third-party vault to the VCF Operations Fleet Management engine to automate credential lifecycle management for supported Tier 1 accounts listed in the integration matrix below.

Separately from external vault integration, the built-in **Fleet Password Policy** capability operates natively within VCF Operations. Administrators can assign complexity and expiration rules to component groups without configuring an external vault system, tracking metadata states natively via async collection cycles.

### Out-of-the-Box (OOTB) Appliance Integration Matrix

The matrix assumes the external vault integration is already configured. "No customer action required" means no per-account work beyond that onboarding.

The following table defines the explicit component boundaries, target account scopes, and required customer actions under VCF 9.1:

| Base Appliance / Component Node | New VCF 9.1 Deployments | Upgraded Environments (4.x / 5.x) | Target Account Scope | Required Customer Action and Integration Guidance |
| :---- | :---- | :---- | :---- | :---- |
| **ESX Hypervisors** | Supported | Supported | root | **No Customer Action Required:** Full programmatic lifecycle automation. Password tracking and custody are held by the enterprise vault. |
| **vCenter** | Partially Supported | Partially Supported | root (OS) *Excluded:* `administrator@vsphere.local` | **Customer Action Required:** VCF 9.1 automates base appliance OS identities (root). Application administrative users are excluded and must be rotated manually via the SDDC Manager Credential API (PATCH /v1/credentials) or the native vCenter Appliance Management Interface (VAMI). |
| **NSX Local Manager** | Supported | Supported | root, admin, audit | **No Customer Action Required:** Complete lifecycle monitoring and vault tracking for appliance management logins. |
| **NSX Edge and VNA** | Supported | Supported | root, admin, audit | **No Customer Action Required:** Automated remediation loop execution across physical and virtual data plane routing endpoints (explicitly managing root, admin, and audit account states). |
| **NSX Global Manager** | Unsupported | Unsupported | root, admin, audit | **Manual Lifecycle Required:** Excluded from the fleet password management. Credentials must be maintained manually using native local API paths. |
| **SDDC Manager** | Partially Supported | Partially Supported | backup *Manual:* root, admin@local, vcf | **Customer Action Required:** VCF 9.1 GA integration is constrained to built-in backup identities (backup). The root, vcf, and admin@local accounts are maintained manually. |
| **VCF Operations Console** | Supported | Supported | admin (App), root (OS) | **No Customer Action Required:** Direct vault tracking and fleet password policy enforcement applied to its own local engine login interfaces via the fleet password management API. |
| **VCF Operations for Networks** | Supported | Supported | admin@local, consoleuser, support | **No Customer Action Required:** Automated coverage applied across primary network analysis systems, tracking application and OS-level maintenance access paths. |
| **VCF Automation Platform** | Supported | Supported | admin | **No Customer Action Required:** Initial launch brings the core setup and configuration user (admin) into the fleet password management engine. **Note:** VCF Automation does not support Fleet Password Policy compliance checks - password policy enforcement is not available for VCF Automation accounts. Vault credential management for the admin account is supported; policy-based compliance auditing is not. |
| **VCF Management Services** | Supported | Supported | `admin@vsp.local`, vmware-system-user | **No Customer Action Required:** Integrates runtime environment services and orchestration platform user profiles into the fleet password management engine. |
| **Advanced Services (HCX, AVI)** | Partially Supported | Partially Supported | **HCX:** root, admin **AVI:** admin | **Customer Action Required:** Only a limited subset of migration and load-balancing engine accounts are vaulted at initial GA. Non-supported separately licensed advanced service accounts must be maintained manually. |

### Programmatic REST API Translation Paths

To programmatically query, retrieve, or update administrative credentials, external automation and vaulting platforms interact with the VCF Operations Fleet Management API and the SDDC Manager Credential API.

### API Authentication Mechanics

VCF Operations rejects legacy HTTP Basic Authentication strings for fleet management endpoints. To authorize programmatic API calls, automation platforms must use one of two validated authentication workflows:

#### Method 1: OpsToken (Credentials-Based)

```
POST /suite-api/api/auth/token/acquire
Content-Type: application/json
```

```json
{
  "username": "admin",
  "password": "<password>"
}
```

The endpoint returns a JSON payload containing a unique token string:

```json
{
  "token": "cc658985-64d7-4ae9-9deb-1c95d86d68c5::...",
  "validity": 1788264000000,
  "expiresAt": "2026-09-01T12:00:00.000Z"
}
```

The returned token value must be supplied as an `opstoken` header key (e.g., `opstoken: cc658985-64d7-4ae9-9deb-1c95d86d68c5::...`) in subsequent API calls.

#### Method 2: Bearer Token (OAuth 2.0 API Token Workflow)

Bearer Token authentication uses the VIDB (VMware Identity Database) token issuance service embedded within the VCF Operations appliance. The token endpoint URL is deployment-specific and follows this pattern:

```
POST https://{vcf-ops-fqdn}/{vidb-tenant-path}/token
Content-Type: application/x-www-form-urlencoded
```

```
grant_type=urn:custom:vcf:params:oauth:grant-type:api-token&api_token=<Valid_API_Token>
```

> **Note:** The exact VIDB token endpoint path (`{vidb-tenant-path}`) is specific to your VCF Operations deployment configuration. Confirm the path in the identity provider configuration of your VCF Operations deployment before automating. The CUSTOMER tenant identifier is typically set during initial VCF Operations deployment.

The endpoint returns a standard bearer structure:

```json
{
  "scope": "user",
  "access_token": "ey...",
  "token_type": "Bearer",
  "expires_in": 1799
}
```

The returned value must be supplied as `Authorization: Bearer <access_token>`.

### Core Fleet Management Password API Endpoints

The core endpoints execute stateless query and async password modification workflows. All endpoints share the base path `/suite-api/api/fleet-management/password-management/`.

#### 1. Query Managed Accounts

* **Method:** POST  
* **URL:** `/suite-api/api/fleet-management/password-management/accounts/query`  
* **Payload (AccountFilterCriteria):**

```json
{
  "status": "ACTIVE",
  "username": "root",
  "appliance": "VCENTER",
  "applianceFqdn": "vcenter-mgmt-01.example.com",
  "vcfDomainId": "4c133fd4-6d00-408c-a9cb-18fa36a1c8b1"
}
```

* **Response (VcfPasswordAccount):**

```json
{
  "pageInfo": { "totalCount": 1, "page": 0, "pageSize": 10 },
  "vcfPasswordAccounts": [
    {
      "passwordAccountKey": "vcenter_vcenter-mgmt-01.example.com_root",
      "applianceFqdn": "vcenter-mgmt-01.example.com",
      "username": "root",
      "status": "ACTIVE",
      "expiryDate": 1788264000,
      "appliance": "VCENTER"
    }
  ]
}
```

**Operational Guidance on vcfDomainId:** The `vcfDomainId` filter string must be populated when onboarding accounts within multi-SDDC environments containing identical appliance FQDNs across separate domains.

#### 2. Update Account Password

* **Method:** PATCH  
* **URL:** `/suite-api/api/fleet-management/password-management/accounts/{passwordAccountKey}/password`  
* **Path Parameter:** `passwordAccountKey` - the account key returned by endpoint 1 (e.g., `vcenter_vcenter-mgmt-01.example.com_root`)  
* **Payload:**

```json
{
  "newPassword": "<new-password-string>"
}
```

* **Response:** Returns a task reference ID (`requestId`) used to track async execution progress via endpoint 3.  
* **Behavior:** This endpoint initiates an async password update task. The platform validates the new password against the assigned Fleet Password Policy before dispatching to the target component node. The call is non-blocking - poll endpoint 3 for completion status.

#### 3. Monitor Task Status

* **Method:** GET  
* **URL:** `/suite-api/api/workflows/requests/{requestId}`  
* **Tracking Pattern:** External platforms must poll this endpoint and trace the state enum transition: CREATED to IN_PROGRESS to COMPLETED or FAILED.

### SDDC Manager Credential API Syntax

For managing workload plane components that rely on SDDC Manager's legacy credential subsystem, tools invoke the following paths:

* **Query Credentials:** `GET https://{sddc-manager-fqdn}/v1/credentials`  
    
  * **Query Parameters:** `resourceType` (Accepted filter values: `ESXI`, `VCENTER`, `NSXT_MANAGER`, `NSX_EDGE`, `BACKUP`, `HCX`).  
  * **RBAC Constraints:** Access requires the `ADMIN` security role. Requests initiated by credentials bound to an `OPERATOR` profile are rejected with HTTP 403 Forbidden.


* **Update Credential Record (PATCH):** `PATCH https://{sddc-manager-fqdn}/v1/credentials`  
    
  * **Payload Structure:**

```json
{
  "credentials": [
    {
      "entityType": "VCENTER",
      "entityHeader": "vcenter-mgmt-01.example.com",
      "username": "administrator@vsphere.local",
      "password": "<new-password-string>"
    }
  ]
}
```

  * **Usage:** Used to align SDDC Manager's stored credential record following manual or external rotations of non-integrated accounts.

### Structural Delineation of Non-Integrated Accounts

Separating platform-provisioned accounts from customer-created local accounts keeps the audit scope clear, because the two have different lifecycles and different owners.

* **Definition:** Any administrative, maintenance, or audit entity manually provisioned by administrators directly within an individual product console post-deployment (for example, creating a specific read-only local analytics login directly within a localized vCenter node).  
* **Vault Integration Boundary:** VCF Operations and SDDC Manager do not track these accounts. They are processed strictly at the component level, remain uncataloged within central dashboard views, and are outside the scope of automated fleet remediation. These accounts must be managed manually via localized product interfaces.

## Section 3: Native Platform Service Accounts (Tier 2 Mesh)

Tier 2 service accounts manage process-to-process automation tracking and are decoupled from external vault architectures to prevent control-plane dependency loops.

### Process-to-Process Automation and Lifecycle Rules

In VCF 9.1, background inter-component communication is secured using platform-provisioned non-human identities (service accounts) that operate across a native service mesh. These credentials - such as `vpxuser` (vCenter to ESX), `nsxt_<cm-uuid>` (NSX to vCenter), `svc-sddc-manager-*` (SDDC Manager to infrastructure appliances), and `svc-vcfsp-vc-*` (VMSP to vCenter) - are generated automatically during deployment or component pairing and rotate on background schedules (typically 30-day or 90-day intervals) managed natively by the respective component control planes.

> **Deduplication Notice:** Complete, account-by-account technical attributes for all 31 Tier 2 inter-component service accounts - including connection endpoints, rotation and lifecycle behavior, modifier controls, log paths, and SIEM event filters - are maintained centrally in the companion CSV reference file (`vcf91-platform-account-reference.csv`). Refer to the companion CSV for per-account rotation detail.

### Operational Exceptions

#### Failed Deployments Cleanup Requirement (VCFMS Accounts)

If a VCF Automation deployment aborts during initial orchestration setup, the automated platform cleanup routine may leave orphaned instances of both the `svc-vcfsp-vc-` and `svc-vcfsp-vc-admin-` service accounts inside vCenter Directory structures. Operators must manually purge these orphaned entities from the vCenter Directory so the account inventory stays accurate.

#### Avi Controller Integration Validation Workaround

The `vcfops-admin` account brokers the API-driven communication loop between VCF Operations and the Avi Controller cluster. If the Avi Controller generates a "multiple roles" validation conflict error during a platform restoration or upgrade sequence, administrators can force a database refresh via the UI:

1. Log into the Avi Controller UI and navigate to **Administration > Accounts > Users**.  
2. Locate the `vcfops-admin` account entry.  
3. Click **Edit**, and immediately click **Save** without altering any configuration variables.

This action flushes the validation fault from the active runtime database.

## Section 4: Security Auditing and SIEM Telemetry Reference

To track credential lifecycles, unauthorized modifications, and system-level lockouts, SIEM platforms and security response teams must ingest the following file paths and monitor for these specific operational log signatures. Note that per-account audit log paths for ESX, vCenter, and NSX are detailed in the companion CSV file, while this section focuses on the fleet credential subsystem. Log collection should be performed using standard syslog forwarding or log agents to ingest these files into your SIEM platform.

### A. Local/Bypass Password Modifications

When an operator attempts to bypass VCF Operations and modify a system password locally via an appliance local GUI (such as CASA):

* **Log File Path:** `/storage/log/vcops/log/casa/casa.audit.log`  
* **Log Signature:** `Category : UPDATE_PASSWORD - User updating system admin password`

### B. API Authentication and Account Lockouts

When an out-of-band local password change leaves the stored credential record stale, background API logins fail repeatedly and the account locks:

* **Log File Path:** `/storage/log/vcops/log/analytics.audit-<epoch>.log` (where the suffix represents a 10-digit epoch seconds rotation timestamp)  
* **Log Signature:** `auditID="AUTHENTICATION_LOGIN"` accompanied by `Due to the following error: "Account is locked"`

### C. VCF Log Management and Session Auditing

To record interactive user logins, logouts, administrative session terminations, and role assignments:

* **Log File Path:** `/var/log/vmware/loginsight/audit.log`

### D. SDDC Manager Credential and Activity Auditing

Credential lookup activities and interactive UI activities within the SDDC orchestration layer are separated across three distinct trace paths:

* **Credential Lookup Audit Path:** `/var/log/vmware/vcf/operationsmanager/operationsmanager.log`  
    
  * *Log Signature:* `PasswordAudit:Received request for credentials lookup for resource`  
  * *SIEM Filtering Rule:* Security teams should route lookups by the internal system identity `svc-ops-sddc-manager-<uid>` to a separate view so that human-initiated lookups stand out, while retaining those events for volume and timing anomaly detection.


* **Dedicated Password Event Audit Path:** `/var/log/vmware/vcf/operationsmanager/audit/password-events/audit-events.log`  
    
  * This dedicated audit stream captures all password lifecycle events (create, update, rotate, delete) as a separate structured log, distinct from the general operationsmanager application log. SIEM integrations requiring password-event-only ingestion should target this path directly.


* **Console UI Interactive Operations Path:** `/var/log/vcf/vcf-ui/audit.log` (Tracks non-credential user actions performed inside the management console).

### E. Preventing Unplanned Password Expiry

Fleet Management monitoring depends on reaching appliance accounts. When an appliance root password expires, collection for that account stops and the account reports EXPIRED or UNKNOWN. Track the EXPIRING state and rotate ahead of the deadline rather than removing the age limit.

Where an operational exception is genuinely required, `chage -M -1 root` removes the maximum-age limit for the root account on a Photon-based appliance. This conflicts with the maximum-password-age requirements in common hardening baselines, so record it as an accepted exception with a compensating rotation schedule. The command does not apply to ESX hosts, where password aging is configured through host advanced settings.

### Component Event Name Mapping

Because different VCF components use distinct event naming conventions, use the following mapping to correlate common account events across your SIEM:

| Event Category | ESX Event Name | NSX Event Name | SDDC Manager Event Name | VCF Operations Event Name | Networks Event Name |
| :---- | :---- | :---- | :---- | :---- | :---- |
| **Login** | `vim.connect` | `session.create` | `account.login` | `authentication.login` | `web-application.login` |
| **Logout** | `vim.disconnect` | `session.destroy` | `account.logout` | `authentication.logout` | `web-application.logout` |
| **Lockout** | `user.locked` | `user.lockout` | `account.locked` | `user.lockout` | `user.lockout` |

> *Note on Event Signatures:* Event names for logout and lockout are subject to minor per-component logging level configurations. Security teams should verify exact lockout string matches against local component syslog forwarding policies in their SIEM.

VCF 9.1 components emit standardized audit records with consistent `auditID` values designed for cross-component SIEM correlation. Configure your SIEM to monitor the following baseline audit events:

| auditID | Category | Description |
| :---- | :---- | :---- |
| `account.changepassword` | Account | Password change attempt (user or service account) |
| `account.create` | Account | Account creation attempt |
| `account.delete` | Account | Account deletion attempt |
| `account.edit` | Account | Account edit attempt |
| `account.locked` | Account | Account locked |
| `account.remove` | Account | Account removed |
| `passwordpolicy.update` | Security | Password policy update |
| `passwordpolicy.attach` | Security | Password policy attached to a managed object |
| `passwordpolicy.detach` | Security | Password policy detached from a managed object |
| `authentication.login` | Auth | Login |
| `authentication.logout` | Auth | Logout |

**Component-specific audit IDs for platform-account operations:**

**ESX** - filter on: `ssh.connect`, `ssh.session.begin`, `dcui.login`, `vim.connect`, `service.access.denied`, `mfa.enable`, `mfa.disable`

**NSX Local Manager / NSX Edge** - filter on: `session.create`, `session.destroy`, `user.create`, `user.delete`, `user.update`, `user.clear`, `user.activate`, `user.deactivate`, `role.create`, `role.update`, `role.delete`, `auth_policy.update`

**SDDC Manager** - filter on: `account.login`, `account.login.failed`, `account.locked`, `account.changepassword`, `credential.update`, `passwordpolicy.update`

**VCF Operations** - filter on: `authentication.login`, `authentication.logout`, `user.create`, `user.delete`, `user_password.change`, `credential.create`, `credential.update`, `vcf_password_management.update_password`, `vcf_password_management.remediate_password`, `vcf_role_assignment.create`, `vcf_role_assignment.delete`

**VCF Operations for Networks** - filter on: `web-application.login`, `web-application.logout`, `user.add`, `user.delete`, `user.modify`, `password.update`, `service-accounts.configure`

**VIDB / Identity Bridge** - filter on: `user.create`, `user.delete`, `identity_provider.create`, `identity_provider.delete`, `role.create`, `role.delete`, `crypto_keys_db.create`, `crypto_keys_db.delete`

**VCFMS / Supervisor (Kubernetes)** - filter on: `serviceaccounts.create`, `secrets.create`, `secrets.delete`, `tokenreviews.create`, `clusterrolebindings.patch`, `rolebindings.patch`

**Coverage:** Audit event IDs verified for: ESX, NSX Local Manager, NSX Edge, SDDC Manager, VCF Operations, VCF Operations for Networks, VIDB/Identity Bridge, and VCFMS/Supervisor - 8 components in all, covering 7 of the 16 component areas in the companion reference (VIDB / Identity Bridge is documented here for audit purposes but has no inventory rows of its own). Audit event IDs for VMware vCenter and NSX Global Manager are not documented here. HCX, Avi, and VMware vSphere Kubernetes Service (VKS) use Kubernetes API server audit events - apply the VCFMS/Supervisor patterns above for those components.

---

## Section 5: Platform Account Inventory Summary

This section provides a high-level structural breakdown of the 131 inventory entries cataloged across VCF 9.1 components. To eliminate data drift and maintain single-source-of-truth accuracy, full row-level attribute detail (24 columns per account) is published exclusively in the companion CSV reference file **`vcf91-platform-account-reference.csv`**.

**Note:** VMware Data Services Manager (DSM) accounts are not covered in this revision.

### Population Breakdown and Tiers

The VCF 9.1 inventory comprises **122 platform accounts** and **9 security objects** across 16 distinct VCF component areas. Component areas are counted at the product level; the companion CSV splits VCF Operations, VCF Operations for Networks, and VCF Automation into sub-component entries that roll up into their parent area here:

| Population / Class | Tier Level | Count | Description |
| :---- | :---- | :---- | :---- |
| **Shared Administrative Accounts** | Tier 1 | 34 | Interactive OS (`root`, `consoleuser`, `support`) and application administrative logins (`admin`, `administrator@vsphere.local`). Managed via VCF Operations Fleet Management or an external vault plugin where supported. |
| **Non-Human Identities / Service Accounts** | Tier 2 | 31 | Machine-to-machine service accounts (`vpxuser`, `nsxt_*`, `svc-sddc-manager-*`, `svc-vcfsp-vc-*`) powering background inter-component communication. Natively automated rotation. |
| **Workload Identities** | Tier 3 | 57 | Container-native Kubernetes ServiceAccounts (`tanzu-auth-*`, `capv-manager`, `flux-install-sa`, etc.). Provisioned and rotated natively by the Kubernetes control plane. |
| **Security Objects** | N/A | 9 | Non-principal security material (truststores, Kubernetes Secrets, ConfigMaps, OAuth2 client credentials, signing keys, and certificates). |

### Vault Integration Status Distribution

Account lifecycle integration across the VCF 9.1 fleet breaks down as follows in the companion reference record:

| Integration Status | Account Count | Description / Scope |
| :---- | :---- | :---- |
| **`Yes`** | 23 | VCF Operations Fleet Management and external vault plugin integration supported in 9.1 GA. |
| **`No (container-native)`** | 57 | Provisioned, bound, and rotated natively by the Kubernetes control plane (Tier 3 workload identities). |
| **`No (platform-managed)`** | 28 | Natively automated inter-component service mesh accounts (Tier 2 service accounts). |
| **`No (manual lifecycle)`** | 10 | Customer-managed local logins, SDDC Manager native identities (root, vcf, admin@local), and excluded advanced services accounts requiring manual rotation. |
| **`Pending confirmation`** | 4 | Accounts under active engineering confirmation for fleet management API translation. |
| **`Not applicable`** | 9 | Security objects and key material (non-principal entries). |

For complete 24-column detail on any specific account - including exact UID, security methods, access paths, SIEM filter sets, and audit log signatures - refer to **`vcf91-platform-account-reference.csv`**.

## Additional Resources

* The VCF Operations fleet management API reference, in the Broadcom developer documentation
* The SDDC Manager API reference, in the Broadcom developer documentation
* External vault plugin documentation from your vault vendor

---
