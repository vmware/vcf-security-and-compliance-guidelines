# Rapid, Non-Disruptive Security Patching

*VMware Cloud Foundation 9.1*

# Disclaimer {#disclaimer}

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This document is not intended to provide advice and is provided "AS IS." Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.

# Executive Summary {#executive-summary}

Exploitation can follow vulnerability disclosure quickly enough that a fixed quarterly patch schedule is insufficient for some vulnerabilities. VMware Cloud Foundation (VCF) 9.1 includes several patch and update methods that can reduce operator-visible interruption and workload impact. The result depends on the component, payload eligibility, redundancy, available capacity, and workload configuration.

This paper explains how VCF 9.1 patches and updates its main components. It distinguishes effects on management services, data-plane forwarding, and virtual machine (VM) and container-based workloads.

The paper maps these capabilities to the management, control, and data plane layers of VCF. It also examines optional VMware vDefend controls for the period before a patch is applied. Separate sections cover workload patch planning and infrastructure repaving as an organization-defined security strategy.

# The New Patching Reality {#the-new-patching-reality}

Fixed quarterly patch cycles assume enough time for testing and a negotiated maintenance window. That assumption does not hold for every vulnerability.

Researchers, bug bounty programs, and automated scanners can shorten the interval between discovery and disclosure. Defenders still need time to assess exposure, test a fix, and obtain change approval.

The interval between publication and known exploitation can also be short. [Zero Day Clock](https://zerodayclock.com/) analyzes Common Vulnerabilities and Exposures (CVEs) with confirmed in-the-wild exploitation. For entries in its dataset, the [reproducibility guide](https://zerodayclock.com/audit) reports a median interval of 771 days for vulnerabilities published in 2018. The median was less than one day for vulnerabilities published in 2024. Vulnerabilities exploited on that timescale require a response process that can prioritize, test, and apply a fix outside a routine cycle.

The operational barriers remain familiar: change management, regression testing, maintenance windows, and limited capacity. A system without direct internet access can still be reachable through lateral movement, a compromised dependency, or an authorized account. Teams should assess actual reachability and compensating controls instead of treating "internal" as equivalent to isolated. They also need patch methods that reduce the cost and interruption of an urgent change.

VCF 9.1 coordinates patching across the management services, control plane, and data plane. Each layer uses mechanisms matched to its operational role, with different effects on management services, data-plane forwarding, and workloads. The degree of interruption depends on the patch method and environment.

# New Patching Capabilities in VCF 9.1 {#new-patching-capabilities-in-vcf-9.1}

VCF 9.1 includes capabilities designed to reduce patch duration or interruption. Their effect on running workloads depends on patch eligibility, component redundancy, available capacity, and workload configuration:

**VMware vCenter Quick Patch:** Quick Patch updates only the RPMs or binaries changed by an eligible payload. Broadcom reports that this can reduce [total vCenter patch-operation time by as much as 80% compared with traditional in-place patching](https://blogs.vmware.com/cloud-foundation/2026/05/05/scale-smarter-save-more-redefining-infrastructure-economics-with-vsphere-in-vcf-9-1/). Management-service downtime depends on the affected services and [can be zero](https://blogs.vmware.com/cloud-foundation/2026/05/12/vcenter-quick-patch/).

**VMware ESX Live Patching for TPM-enabled Hosts:** For an eligible payload and compatible host, Live Patch applies a fix in memory without a host reboot or VM evacuation. If the payload updates the vmx runtime, compatible VMs [briefly pause during Fast-Suspend-Resume (FSR)](https://blogs.vmware.com/cloud-foundation/2025/07/15/live-patch-gets-even-better-in-vsphere-with-vmware-cloud-foundation-9-0/).

**Enhanced vCenter Reduced Downtime Upgrade (RDU):** For vCenter 9.1.x and later payloads, RDU [can obtain content from the online depot or use a mounted ISO in an offline environment](https://blogs.vmware.com/cloud-foundation/2026/05/12/whats-new-with-vsphere-9-1/). The final switchover typically requires [less than five minutes of vCenter service downtime](https://blogs.vmware.com/cloud-foundation/2024/07/11/vcenter-reduced-downtime-update-in-vmware-vsphere-8-update-3/).

**Rolling NSX Manager Updates:** In a standard three-node cluster, Manager nodes are upgraded sequentially while at least two remain active. The [management plane remains available, although an active UI or API connection may need to reconnect](https://knowledge.broadcom.com/external/article/379034/troubleshooting-nsx-manager-upgrade-fail.html). Existing data-plane forwarding continues during the Manager upgrade.

**Coordinated ESX and NSX Host Updates:** [NSX host components embedded in the base ESX image are life-cycled with that image](https://blogs.vmware.com/cloud-foundation/2025/06/23/vsphere-in-vcf-9-0-whats-new/). A Live Patch can include eligible NSX host components. [Other payloads can require host evacuation and a restart](https://blogs.vmware.com/cloud-foundation/2026/05/12/whats-new-with-vsphere-9-1/), subject to cluster capacity and Edge redundancy.

**Independent Patching for vSphere Supervisor and VMware vSphere Kubernetes Service (VKS):** Platform teams can manage Supervisor and VKS cluster versions through rolling workflows. [Application continuity depends on replicas, PodDisruptionBudget settings, and capacity for replacement nodes](https://knowledge.broadcom.com/external/article/433183/vks-cluster-upgrade-fails-with-update-ca.html). A single-replica application can be interrupted while its pod is rescheduled.

**VKS Fast Deploy:** [Fast Deploy can use Linked Mode or Direct Mode](https://blogs.vmware.com/cloud-foundation/2026/05/05/accelerate-streamline-and-control-your-self-service-private-cloud-with-vcf-9-1/) to provision replacement cluster nodes. It reduces provisioning time but does not change the application's availability requirements.

# Knowing What to Patch {#knowing-what-to-patch}

Rapid response begins before any patch is applied. [VMware Security Advisories (VMSAs)](https://support.broadcom.com/web/ecx/security-advisory) identify affected products and versions, severity, vulnerability details, and available fixes. Security and infrastructure teams should monitor VMSAs and configure the notification options available through their [Broadcom Support Portal accounts](https://support.broadcom.com/documents/d/ecx/broadcom-support-portal-getting-started-guide).

[VCF Operations provides a centralized view of component versions, patches, and updates](https://blogs.vmware.com/cloud-foundation/2026/05/05/scale-simplify-and-secure-your-private-cloud-operations-with-vcf-9-1/). In-product patch details identify affected services, eligibility, and expected impact when the payload supplies that information. Operators can use this inventory to map an advisory to deployed components, then select the supported remediation path for each component.

[VCF Operations Diagnostics Findings](https://blogs.vmware.com/cloud-foundation/2026/01/21/diagnostics-for-vmware-cloud-foundation-operations-newest-findings-2/) surfaces known conditions associated with security advisories, support cases, engineering findings, and customer-nominated issues. The Findings Catalog records details such as severity, associated knowledge base articles, and recommended actions. Operators can combine a finding's severity with reachability, business exposure, and remediation impact when setting patch priority. A finding supports that decision, but it does not replace review of the advisory and the affected configuration.

# Protection Before a Patch Is Applied {#protection-before-a-patch-is-applied}

A gap usually exists between disclosure and completion of a tested patch rollout. VMware vDefend is an optional, [separately licensed advanced service](https://knowledge.broadcom.com/external/article/430651/vdefend-does-not-show-up-under-licenses.html) that can provide compensating controls during that interval.

## Virtual Patching via Distributed IDS/IPS for VMware vDefend {#virtual-patching-via-distributed-ids/ips-for-vmware-vdefend}

[Virtual patching](https://blogs.vmware.com/security/2020/11/virtual-patching-with-nsx-distributed-ids-ips.html) uses an Intrusion Detection and Prevention System (IDS/IPS) signature or rule to detect or block traffic that matches a known exploit pattern. It does not modify the vulnerable software and should be treated as a temporary compensating control.

Protection requires enabled inspection and a policy with the intended detect or prevent action. [Current content must also include an applicable signature](https://blogs.vmware.com/security/2026/08/vmware-vdefend-idps-frontier-ai.html). Prevent mode can block matching traffic without a guest reboot. Detect-only mode reports the match but does not block it. Teams must still test and apply the vendor-supplied software patch.

**Distributed IDS/IPS for VMware vDefend** places inspection in the distributed network path close to protected workloads. It inspects traffic selected by policy, not every flow by default. VCF 9.1 can also [extend inspection to supported VKS pod traffic through its container networking integration](https://blogs.vmware.com/security/2026/05/vdefend-vcf-9-1-zero-trust.html). Policy scope, exemptions, traffic paths, and capacity determine which traffic is inspected.

For a known vulnerability, virtual-patch coverage depends on an applicable signature and current signature content. Connected, air-gapped, and egress-restricted sites need a documented process to obtain, stage, and validate content within their required response time. [Custom signatures can address some gaps](https://blogs.vmware.com/security/2026/08/vmware-vdefend-idps-frontier-ai.html), but they also require validation and ongoing maintenance.

[Behavioral detection](https://blogs.vmware.com/security/2021/12/whats-new-in-security-with-vmware-nsx-3-2.html) evaluates activity such as anomalous DNS or beaconing patterns even when no signature fires. It can produce evidence for investigation. It is not a virtual patch for an unknown vulnerability and does not prove that every exploit attempt will be detected.

Use signature-based prevention and behavioral detection as separate, complementary controls. Their coverage depends on configuration, content, traffic visibility, and operating mode. Neither control substitutes for the permanent patch.

## Limiting Reachability with VMware vDefend Distributed Firewall {#limiting-reachability-with-vmware-vdefend-distributed-firewall}

[VMware vDefend Distributed Firewall applies microsegmentation policy in the distributed network path](https://blogs.vmware.com/security/2026/05/vdefend-vcf-9-1-zero-trust.html) for workloads in scope. Security teams can use that policy to restrict which systems may communicate with a vulnerable service while its patch is tested and staged. The control changes permitted network paths without changing the guest, but its effect depends on policy coverage, grouping accuracy, and allowed flows.

If one system is compromised, distributed firewall policy can restrict its permitted paths to other systems. Teams should validate the effective rules and required application flows before applying an emergency restriction.

These controls can reduce exposure between disclosure and remediation. They do not eliminate the need to patch or validate the protected traffic scope.

# VCF's Layered Patching Architecture {#vcf's-layered-patching-architecture}

VCF manages infrastructure across three conceptual layers, each carrying distinct patching considerations and risk profiles.

* **The management layer** includes VCF Operations, VCF Automation, VCF Identity Broker, VCF Log Management, and VCF Operations for Networks.
* **The control plane layer** includes vCenter, NSX Manager, the vSphere Supervisor, and VKS clusters. These components govern compute, network, and container resources across the environment.
* **The data plane layer** consists of ESX hypervisors, vSAN storage, and NSX Edge and transport nodes: the infrastructure on which workloads actually run.

This paper concentrates on these core layers of the VCF stack. Components such as VMware Avi Load Balancer and VMware HCX have separate lifecycle workflows. Their update processes are outside the scope of this discussion.

VCF 9.1 addresses each layer with mechanisms matched to its disruption profile. When a fix is eligible for a low-disruption method and the required redundancy and capacity are available, teams can apply it without taking workloads offline.

VCF 9 uses a [unified product version and release model](https://knowledge.broadcom.com/external/article/410435/unified-vcf-product-releases-versioning.html). The five release types are major, minor, maintenance, Express Patch, and Hot Patch. Express Patches are generally available, targeted releases for time-sensitive security or critical issues. Hot Patches are targeted fixes delivered to affected customers through Broadcom Support. The model replaces earlier user-facing aliases such as "Update 2a" or "U3b."

Release type helps an operator understand the scope of change, but it does not by itself establish the remediation method. Release notes and the in-product lifecycle view identify the affected component, dependencies, required sequence, and eligibility for mechanisms such as Quick Patch or Live Patch. Operators can then prioritize an applicable component patch without assuming that every fix requires a full-stack update.

## The Management Layer: VCF Operations and VCF Automation {#the-management-layer:-vcf-operations-and-vcf-automation}

VCF 9.1 uses a declarative lifecycle model for VCF infrastructure components. Administrators select a target version in VCF Operations. [Fleet Lifecycle plans the workflow, resolves dependencies, and obtains the required binaries](https://blogs.vmware.com/cloud-foundation/2026/06/18/how-to-upgrade-to-vmware-cloud-foundation-9-1/). Operators remain responsible for reviewing the generated plan, prerequisites, impact, and recovery procedure before execution.

[SDDC Lifecycle performs lifecycle operations for an individual VCF instance, and Software Depot stores installation, update, and patch artifacts](https://blogs.vmware.com/cloud-foundation/2026/06/18/how-to-upgrade-to-vmware-cloud-foundation-9-1/). Air-gapped and partially connected sites must populate the applicable depot through the supported offline content process before lifecycle operations begin.

An update to VCF Operations or VCF Automation can interrupt the monitoring, lifecycle, portal, or API workflows that depend on the component being updated. Availability depends on the deployment model and update procedure. The [Simple deployment uses single-node management appliances, while the High Availability deployment uses three-node clusters and is recommended for production](https://blogs.vmware.com/cloud-foundation/2025/07/03/vcf-9-0-deployment-pathways/). Before an update, operators should confirm the documented service impact and arrange any required out-of-band monitoring or operational access.

The [management layer is architecturally separate from workload execution](https://blogs.vmware.com/cloud-foundation/2025/07/03/vcf-9-0-deployment-pathways/). Planned VCF Operations or VCF Automation service interruption during an update does not by itself stop running VMs or take vCenter or NSX services offline.

## The Control Plane: vCenter, NSX, and Kubernetes {#the-control-plane:-vcenter,-nsx,-and-kubernetes}

vCenter and NSX management form part of the control plane. An update can interrupt operations that depend on an affected service. VCF 9.1 provides rolling NSX Manager updates, vCenter Quick Patch with service-dependent downtime, and rolling workflows for Kubernetes cluster nodes. These mechanisms do not make every control-plane operation non-disruptive.

### VMware vCenter Quick Patching

For a [Quick Patch-compatible payload within a release line](https://blogs.vmware.com/cloud-foundation/2026/05/12/vcenter-quick-patch/), vCenter Quick Patch updates only the RPMs or binaries modified by that payload. The affected services determine vCenter downtime, which [can be less than one minute and, in some cases, zero](https://blogs.vmware.com/cloud-foundation/2026/05/12/vcenter-quick-patch/). Traditional in-place patching updates every software package and [can take the vCenter instance offline for an hour or more](https://blogs.vmware.com/cloud-foundation/2026/05/12/vcenter-quick-patch/). During Quick Patch, [VM and Kubernetes cluster deployments are not interrupted, and automation and API workflows continue](https://blogs.vmware.com/cloud-foundation/2026/05/12/vcenter-quick-patch/).

[Quick Patch availability is package-specific](https://knowledge.broadcom.com/external/article/452092/vcenter-91-quick-patch-feature-limitatio.html). The in-product patch details [indicate whether a patch qualifies and identify the affected services, expected workload impact, and estimated downtime](https://blogs.vmware.com/cloud-foundation/2026/05/12/vcenter-quick-patch/). If a patch is not compatible, use the update path specified for that release. The path can be a standard in-place update or Reduced Downtime Upgrade.

### Reduced Downtime Upgrade for vCenter and Rolling Updates for NSX {#reduced-downtime-upgrade-for-vcenter-and-nsx}

For a supported version-level update, vCenter Reduced Downtime Upgrade (RDU) deploys a new appliance in parallel. It copies data and configuration while the source appliance remains operational. The final switchover stops the source services and starts the target services. Broadcom reports that this vCenter service interruption [typically lasts less than five minutes](https://blogs.vmware.com/cloud-foundation/2024/07/11/vcenter-reduced-downtime-update-in-vmware-vsphere-8-update-3/); actual duration depends on the environment and update.

VCF 9.1 coordinates vCenter and NSX lifecycle steps, but the mechanisms remain distinct. RDU handles the vCenter appliance, while NSX Manager nodes use a rolling process. Operators should complete available downloads and pre-checks before the maintenance window, then follow the dependency order in the generated update plan. The [VCF 9.1 upgrade sequence is mandatory and varies with the starting environment](https://knowledge.broadcom.com/external/article/440630).

NSX Manager nodes are upgraded sequentially. A standard three-node cluster keeps at least two nodes active, and transport-node assignments move to peer Manager nodes before a node is upgraded. [The UI and API remain available during a supported rolling update](https://knowledge.broadcom.com/external/article/379034/troubleshooting-nsx-manager-upgrade-fail.html), although an active session can reconnect as a node transitions. Existing data-plane forwarding continues while Manager nodes are updated. New-version management behavior becomes available after the NSX Finalize Upgrade step completes.

### VMware vSphere Supervisor and VMware vSphere Kubernetes Service Cluster Lifecycle

Containerized workloads add a separate lifecycle boundary. The vSphere Supervisor provides the Kubernetes control plane in VCF. VKS provisions and manages guest Kubernetes clusters on that infrastructure. Supervisor, cluster-node, and application updates each require their own plan.

The vSphere Supervisor coordinates rolling updates of VKS clusters. During a version upgrade, [VKS replaces control-plane nodes first and then worker nodes](https://knowledge.broadcom.com/external/article/386651/vsphere-kubernetes-cluster-upgrade-stuck.html). [Health and compatibility pre-checks can stop the rollout if a node or cluster component is not ready](https://knowledge.broadcom.com/external/article/433183/vks-cluster-upgrade-fails-with-update-ca.html). [Changes to the cluster object are paused during the upgrade, but that management restriction does not by itself interrupt running applications](https://knowledge.broadcom.com/external/article/399348).

VKS version upgrades are managed through the vSphere Supervisor. [VKS Fast Deploy uses Linked Mode or Direct Mode](https://blogs.vmware.com/cloud-foundation/2026/05/05/accelerate-streamline-and-control-your-self-service-private-cloud-with-vcf-9-1/) to provision replacement nodes during deployments and rolling upgrades. This can reduce rollout duration, but it does not change application-availability requirements.

Application availability during a rolling upgrade depends on replica placement, [PodDisruptionBudget settings](https://knowledge.broadcom.com/external/article/433183/vks-cluster-upgrade-fails-with-update-ca.html), and available capacity. Multiple replicas can remain available when enough stay ready and the disruption budget permits pod eviction. A single-replica application can be interrupted while its pod is rescheduled. The cluster needs capacity for replacement nodes and rescheduled pods. In an air-gapped VCF 9.1 environment, the [required release content must be available through Fleet Depot Service](https://blogs.vmware.com/cloud-foundation/2026/08/11/vmware-bootstrap-registry-appliance-air-gapped-harbor-deployment/) before the upgrade begins.

## The Data Plane: ESX, vSAN, and NSX Edge {#the-data-plane:-esx,-vsan,-and-nsx-edge}

Data-plane maintenance can affect workload execution, storage access, or network forwarding. Operators must evaluate each plane separately instead of inferring workload continuity from management-service availability.

### ESX Live Patching

For a [Live Patch-eligible payload and compatible host configuration](https://blogs.vmware.com/cloud-foundation/2026/05/12/whats-new-with-vsphere-9-1/), ESX Live Patch applies the fix to running memory. [The host does not enter maintenance mode, evacuate its VMs, or reboot](https://blogs.vmware.com/cloud-foundation/2025/07/15/live-patch-gets-even-better-in-vsphere-with-vmware-cloud-foundation-9-0/). VMs remain powered on. If the payload updates the vmx runtime, [compatible VMs undergo an FSR operation that briefly pauses guest execution](https://blogs.vmware.com/cloud-foundation/2025/07/15/live-patch-gets-even-better-in-vsphere-with-vmware-cloud-foundation-9-0/). [Live Patch supports TPM-enabled hosts](https://blogs.vmware.com/cloud-foundation/2026/05/12/whats-new-with-vsphere-9-1/). Depending on the payload, Live Patch can update the [vmkernel, supported user-space daemons, NSX components, and vmx](https://blogs.vmware.com/cloud-foundation/2025/07/15/live-patch-gets-even-better-in-vsphere-with-vmware-cloud-foundation-9-0/).

Depending on the patch payload, a Live Patch operation can surface two operator-visible behaviors. If a user-space daemon such as hostd is patched and restarted, the host may briefly appear disconnected from vCenter. This expected transition does not affect running VMs. If the vmx runtime is patched, VMs undergo a Fast-Suspend-Resume (FSR) operation. FSR is a local, in-memory suspend and resume analogous to a vMotion within the same host. It keeps the VM powered on but briefly pauses guest execution. vSphere also uses FSR for routine operations such as hot-adding virtual hardware. [Traditional workloads typically do not experience a perceptible application pause during FSR](https://blogs.vmware.com/cloud-foundation/2025/07/15/live-patch-gets-even-better-in-vsphere-with-vmware-cloud-foundation-9-0/). For vGPU-enabled VMs, FSR must also checkpoint GPU memory. VCF 9 reduces FSR stun time for these VMs. [Internal testing with a VM configured with two 48 GB L40 GPUs measured an FSR time of approximately two seconds](https://blogs.vmware.com/cloud-foundation/2025/06/23/vsphere-in-vcf-9-0-whats-new/).

Some VM configurations are not compatible with the FSR step. [Fault Tolerance, DirectPath I/O, vSphere Pods, and shared-disk clustering configurations cannot undergo FSR](https://blogs.vmware.com/cloud-foundation/2025/07/15/live-patch-gets-even-better-in-vsphere-with-vmware-cloud-foundation-9-0/). Their presence does not block the cluster operation. vSphere Lifecycle Manager reports the incompatible VMs and the reason before remediation. Those VMs continue on the pre-patch vmx runtime until they are power cycled or migrated to a patched host. Operators must track that follow-up remediation.

[Live Patch applies to eligible Express Patches and Hot Patches; maintenance releases use standard remediation](https://blogs.vmware.com/cloud-foundation/2025/07/15/live-patch-gets-even-better-in-vsphere-with-vmware-cloud-foundation-9-0/). Release notes and vSphere Lifecycle Manager identify eligibility before remediation. Do not infer eligibility from severity or release type alone.

[Live Patch runs through vSphere Lifecycle Manager or its APIs, and pre-checks validate host resources](https://blogs.vmware.com/cloud-foundation/2025/07/15/live-patch-gets-even-better-in-vsphere-with-vmware-cloud-foundation-9-0/). Hosts using data processing units (DPUs) through vSphere Distributed Services Engine follow the standard remediation path.

### Quick Boot

When a patch requires an ESX restart, Quick Boot can reduce host downtime on supported systems. It restarts the hypervisor without rebooting the physical hardware, bypassing [Power-On Self Test (POST) and firmware and device initialization](https://knowledge.broadcom.com/external/article/425234/esxi-quick-boot-is-not-supported-when-in.html). [vSphere Lifecycle Manager checks Quick Boot compatibility before remediation and uses a regular reboot if the server or configuration is unsupported](https://knowledge.broadcom.com/external/article/312153/understanding-esxi-quick-boot-compatibil.html). Combined with DRS-driven VM migration, Quick Boot shortens the maintenance window and the period of reduced cluster capacity.

### Pre-Staging and Parallel Remediation

[vSphere Lifecycle Manager can stage the desired ESX image to all or selected hosts before remediation](https://developer.broadcom.com/xapis/vsphere-automation-api/latest/api/esx/settings/clusters/cluster/software__action%3Dstage__vmw-task%3Dtrue/post/). Staging transfers the image content to the target hosts without applying it. Moving the transfer ahead of remediation can reduce the active remediation phase and the period of reduced cluster capacity. It does not remove the time required for VM evacuation, image installation, a required restart, health checks, or return to service.

For clusters that support it, parallel remediation can shorten elapsed update time by patching multiple hosts concurrently. Administrators must place those hosts in maintenance mode and confirm that the remaining hosts can carry the workloads. [vSphere Lifecycle Manager skips hosts not already in maintenance mode](https://knowledge.broadcom.com/external/article/344948/remediation-task-completes-successfully.html). [Parallel remediation is not supported for vSAN clusters](https://knowledge.broadcom.com/external/article/447058/vsphere-lifecycle-manager-vlcm-parallel.html) and [cannot be combined with Live Patch](https://knowledge.broadcom.com/external/article/419942/requirements-for-enabling-the-vsphere-li.html). vSAN remediation and Live Patch process hosts sequentially.

### DRS and vMotion Integration

When maintenance mode is required, DRS can use vMotion to evacuate running VMs to compatible hosts with sufficient capacity. [VCF 9.1 can restrict evacuation to destination hosts that can satisfy the VMs' current compute demand](https://blogs.vmware.com/cloud-foundation/2026/05/12/whats-new-with-vsphere-9-1/). [vMotion keeps each VM powered on but briefly stuns it during final switchover](https://blogs.vmware.com/cloud-foundation/2025/06/19/enhanced-vmotion-for-vgpu-vms-in-vmware-cloud-foundation-9-0/). [Storage vMotion can move a running VM's virtual disks between compatible datastores and also includes a brief switchover stun](https://blogs.vmware.com/cloud-foundation/2020/06/23/vsphere-7-storage-vmotion-improvements/). The effect depends on VM configuration, workload behavior, and available migration bandwidth. These capabilities allow many routine host and datastore maintenance operations to proceed without powering off the VMs.

### vSAN Fault Domain-Aware Patching

In vSAN clusters, [vSphere Lifecycle Manager remediates one host at a time](https://knowledge.broadcom.com/external/article/447058/vsphere-lifecycle-manager-vlcm-parallel.html). Sequential remediation alone does not establish storage-policy compliance. [Objects can remain accessible while temporarily reporting reduced availability during maintenance](https://knowledge.broadcom.com/external/article/391750). The result depends on the selected [maintenance-mode data-migration option](https://knowledge.broadcom.com/external/article/433056/vm-in-inaccessible-state-with-objects-in.html), object policy, [capacity and fault domains](https://knowledge.broadcom.com/external/article/396312/unable-to-place-host-into-maintenance-mo.html), cluster health, and resynchronization state. Before remediation, run the [vSAN data-migration pre-check and resolve inaccessible objects or active resynchronization](https://knowledge.broadcom.com/external/article/433056/vm-in-inaccessible-state-with-objects-in.html).

### NSX Edge and Transport Nodes

An NSX Edge cluster provides routing or network services between virtual and physical networks. An Edge transition can affect traffic that depends on the services and paths carried by that cluster.

[NSX Edge nodes within a cluster are upgraded serially so peer nodes can continue forwarding traffic](https://knowledge.broadcom.com/external/article/398482/nsx-edge-cluster-upgrade-fails-with-reso.html). Continuity still depends on Edge health, high-availability mode, routing convergence, and topology. A failed or delayed failover can interrupt an application path. Patching the ESX host that runs an Edge VM is a separate scenario, and its impact depends on Live Patch eligibility.

For a [Live Patch-eligible payload, the ESX host remains out of maintenance mode and the Edge VM remains powered on](https://blogs.vmware.com/cloud-foundation/2025/07/15/live-patch-gets-even-better-in-vsphere-with-vmware-cloud-foundation-9-0/). The remediation workflow therefore does not intentionally trigger an Edge shutdown or peer failover.

When Live Patch is unavailable, the host must enter maintenance mode. [Edge Host Affinity and the Best Effort Restart (BER) policy cause pinned Edge VMs to shut down instead of migrating with vMotion](https://knowledge.broadcom.com/external/article/395307/failover-prechecks-are-not-performed-whe.html). During vSphere Lifecycle Manager remediation, NSX checks peer Edge health before shutdown and blocks remediation if failover is not ready. A healthy peer assumes the affected forwarding functions according to the configured Edge HA mode and routing protocols. The interruption depends on the topology and protocol convergence settings. BER attempts to restart the Edge VM on a compatible host in its affinity group. If none is available, the VM remains powered off until its original host exits maintenance mode.

# Pre-Checks and Recoverability {#pre-checks-and-recoverability}

Pre-checks reduce avoidable failures, but they do not prove that an update will succeed. [vSphere Lifecycle Manager checks compatibility and health before remediation](https://blogs.vmware.com/cloud-foundation/2025/07/15/live-patch-gets-even-better-in-vsphere-with-vmware-cloud-foundation-9-0/). The [VCF 9.1 RDU workflow runs a prerequisite check before the update](https://blogs.vmware.com/cloud-foundation/2026/06/18/how-to-upgrade-to-vmware-cloud-foundation-9-1/), and [Quick Patch identifies affected services and expected impact](https://blogs.vmware.com/cloud-foundation/2026/05/12/vcenter-quick-patch/). Operators must resolve failed checks and still retain a component-specific recovery plan.

Recovery behavior differs by component. During RDU, the source vCenter remains available while data is copied, and [a failed workflow can revert to the source appliance](https://knowledge.broadcom.com/external/article/313288/vcenter-server-upgrades-with-the-reduced.html). That workflow recovery is not a substitute for a current vCenter file-based backup or a tested restore procedure. A failed VKS upgrade can stop until the unhealthy condition is corrected and the workflow is retried; [VKS does not provide a general-purpose rollback guarantee](https://knowledge.broadcom.com/external/article/386651/vsphere-kubernetes-cluster-upgrade-stuck.html). For ESX, [vSphere Lifecycle Manager compares hosts with a desired image and remediates drift](https://knowledge.broadcom.com/external/article/322186/managing-esxi-host-lifecycle-operations.html). The organization must validate the desired image before treating it as a recovery baseline.

# De-Risking Workload Patching {#de-risking-workload-patching}

Application owners remain responsible for patching guest operating systems, middleware, databases, and applications. Platform capabilities can support testing and recovery, but they do not make guest patching non-disruptive. Each application needs its own impact, data-protection, and rollback plan.

A pre-patch VM snapshot can provide short-lived rollback for some guest changes. It is not an independent backup or a guaranteed application recovery point because its delta disks depend on the base virtual disks. Quiescing can improve file-system or application consistency when the guest, VMware Tools, and application support it. Quiescing can fail or fall back to crash consistency. Database recovery should use the database's native backup or a certified application-aware solution. Broadcom recommends [retaining snapshots for no more than 72 hours](https://knowledge.broadcom.com/external/article/318825/best-practices-for-using-vmware-snapshot.html), and its [database snapshot guidance limits them to minutes or hours around a change](https://knowledge.broadcom.com/external/article/426571/guidance-on-using-snapshots-for-database.html). Before patching, test the rollback procedure and document the rollback point, potential data loss, consolidation capacity, and external dependencies.

A clone reproduces the VM configuration and disks at the time of cloning, but it does not reproduce every external dependency or production condition. Use the supported cloning workflow and isolate the clone before first power-on. Then customize or neutralize duplicate host names, IP configuration, directory membership, service identities, agents, credentials, and other environment-specific settings. A copied VM can retain a [duplicate DHCP identity](https://knowledge.broadcom.com/external/article/316620/cloned-vm-acquires-the-same-dhcp-ip-addr.html), and the default clone policy can [copy virtual Trusted Platform Module secrets](https://knowledge.broadcom.com/external/article/392515/changing-the-default-vtpm-provisioning-p.html). VCF Automation can help provision repeatable test environments, but application owners must validate the test article and its isolation.

A guest patch and reboot can interrupt that VM and its application. DRS and vMotion support host maintenance; they do not provide application-level continuity for a guest reboot. Application replicas, failover, state synchronization, and health checks determine whether a service remains available. For protected traffic in scope, vDefend signature-based prevention and microsegmentation can provide temporary controls while application teams test the permanent patch.

# Infrastructure Repaving as a Security Strategy {#infrastructure-repaving-as-a-security-strategy}

Incremental patching assumes that the existing infrastructure state is suitable for continued operation. After a confirmed compromise or loss of trust in foundational components, an organization may choose to rebuild infrastructure instead of patching it in place. Incident-response findings should determine the recovery scope.

**Recommendation:** Treat infrastructure repaving as an organization-defined recovery pattern, not as a named VCF assurance outcome. [VCF Operations can automate deployment of workload domains](https://blogs.vmware.com/cloud-foundation/2025/07/03/vcf-9-0-deployment-pathways/), which can support building a replacement domain from approved inputs. Automation reduces manual deployment work, but it does not establish that the replacement environment is free of compromise.

Confidence in a replacement domain depends on trusted firmware, binaries, images, desired-state inputs, credentials, keys, network and storage services, and validation evidence. Workload movement also requires compatibility, spare capacity, dependency mapping, and an application-specific migration plan. Some migrations include a switchover pause, restart, or data synchronization period. After a compromise, the incident-response team must decide whether moving workload state could also move malicious code, credentials, or persistence mechanisms.

Repaving can complement Live Patch, Quick Patch, rolling updates, backups, and incident response. An organization may also use planned rebuilds to reduce configuration drift. Repaving does not replace patching, credential recovery, forensic analysis, data recovery, or verification of external dependencies.

# Conclusion {#conclusion}

[Some vulnerabilities are exploited too quickly](https://zerodayclock.com/audit) for a fixed quarterly or monthly cycle to be the only response path. Organizations need a risk-based process that can invoke an urgent path when exposure and available evidence justify it.

VCF 9.1 provides lower-disruption methods for eligible payloads. [Quick Patch can reduce vCenter operation time, and its service downtime depends on the affected services](https://blogs.vmware.com/cloud-foundation/2026/05/12/vcenter-quick-patch/). [RDU moves most vCenter update work before the switchover](https://blogs.vmware.com/cloud-foundation/2024/07/11/vcenter-reduced-downtime-update-in-vmware-vsphere-8-update-3/). [Live Patch can avoid host evacuation and reboot, although an eligible vmx payload can briefly pause compatible VMs](https://blogs.vmware.com/cloud-foundation/2025/07/15/live-patch-gets-even-better-in-vsphere-with-vmware-cloud-foundation-9-0/). Rolling NSX Manager and VKS workflows depend on redundancy, capacity, health, and application design.

Optional VMware vDefend controls can [restrict permitted network paths](https://blogs.vmware.com/security/2026/05/vdefend-vcf-9-1-zero-trust.html), [block traffic that matches applicable signatures](https://blogs.vmware.com/security/2026/08/vmware-vdefend-idps-frontier-ai.html), and report behavioral findings while a patch is tested. Their coverage depends on licensing, deployment, policy, content, traffic visibility, and operating mode.

For each component and workload, teams should define the eligible patch path, prerequisites, expected interruption by plane, validation checks, and recovery procedure. If a payload or configuration is not eligible for a lower-disruption method, use the supported standard remediation path.

# Additional Resources {#additional-resources}

* Lifecycle Management Capabilities in VMware Cloud Foundation 9.1
  https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-service-administration-and-development/9-1.html
* VMware Security Advisories
  https://support.broadcom.com/web/ecx/security-advisory
* VMware Security Hardening Guidance
  https://github.com/vmware/vcf-security-and-compliance-guidelines/
* Identity and Access Management Best Practices for VMware Cloud Foundation 9.1
  https://brcm.tech/vcf-identity-design-best-practices
* VMware vDefend Design Library
  https://techdocs.broadcom.com/us/en/vmware-security-load-balancing/vdefend/design-library-for-vdefend/index.html
