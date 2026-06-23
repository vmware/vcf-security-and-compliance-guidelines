# Companion Guide to Regulation (EU) 2024/1689 Artificial Intelligence Act for VMware Cloud Foundation 9.1

## Version

910-20260623-01

## Introduction

This document describes how VMware Cloud Foundation (VCF) 9.1 and the separately licensed advanced services assessed alongside it, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, and VMware Avi Load Balancer, can support organizations working toward compliance with the EU Artificial Intelligence Act, formally Regulation (EU) 2024/1689. The AI Act establishes harmonised rules for the development, placing on the market, and use of artificial intelligence systems in the European Union. It follows a risk-based approach, setting requirements for high-risk AI systems covering risk management, data governance, technical documentation, record-keeping, transparency, human oversight, accuracy, robustness, and cybersecurity, along with obligations for providers of general-purpose AI models. Each assessed product is reported separately for every control, with VCF covering the full platform, including its consumption services and Private AI Services capabilities. The responsibility for assessing and achieving compliance with the AI Act remains with the provider, deployer, or other regulated operator.

https://eur-lex.europa.eu/eli/reg/2024/1689/oj

This guidance evolves. Please check the current revision at: https://brcm.tech/vcf-compliance

## Additional Resources

This is one of a library of companion guides that map VMware Cloud Foundation and its advanced services to security and compliance frameworks. For each framework, the guide is published as a spreadsheet, a CSV data file, a Markdown document, and a PDF, together with a Security Configuration Guide crosswalk that identifies the VCF technical hardening settings relevant to that framework. The companion guide library, the VMware Cloud Foundation Security Configuration Guide, and related security documentation, sample scripts, and Q&A are available at https://brcm.tech/vcf-security.

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

### Control 3

> For the purposes of this Regulation, the following definitions apply: (1) ‘AI system’ means a machine-based system that is designed to operate with varying levels of autonomy and that may exhibit adaptiveness after deployment, and that, for explicit or implicit objectives, infers, from the input it receives, how to generate outputs such as predictions, content, recommendations, or decisions that can influence physical or virtual environments; (2) ‘risk’ means the combination of the probability of an occurrence of harm and the severity of that harm; (3) ‘provider’ means a natural or legal person, public authority, agency or other body that develops an AI system or a general-purpose AI model or that has an AI system or a general-purpose AI model developed and places it on the market or puts the AI system into service under its own name or trademark, whether for payment or free of charge; (4) ‘deployer’ means a natural or legal person, public authority, agency or other body using an AI system under its authority except where the AI system is used in the course of a personal non-professional activity; (5) ‘authorised representative’ means a natural or legal person located or established in the Union who has received and accepted a written mandate from a provider of an AI system or a general-purpose AI model to, respectively, perform and carry out on its behalf the obligations and procedures established by this Regulation; (6) ‘importer’ means a natural or legal person located or established in the Union that places on the market an AI system that bears the name or trademark of a natural or legal person established in a third country; (7) ‘distributor’ means a natural or legal person in the supply chain, other than the provider or the importer, that makes an AI system available on the Union market; (8) ‘operator’ means a provider, product manufacturer, deployer, authorised representative, importer or distributor; (9) ‘placing on the market’ means the first making available of an AI system or a general-purpose AI model on the Union market; (10) ‘making available on the market’ means the supply of an AI system or a general-purpose AI model for distribution or use on the Union market in the course of a commercial activity, whether in return for payment or free of charge; (11) ‘putting into service’ means the supply of an AI system for first use directly to the deployer or for own use in the Union for its intended purpose; (12) ‘intended purpose’ means the use for which an AI system is intended by the provider, including the specific context and conditions of use, as specified in the information supplied by the provider in the instructions for use, promotional or sales materials and statements, as well as in the technical documentation; (13) ‘reasonably foreseeable misuse’ means the use of an AI system in a way that is not in accordance with its intended purpose, but which may result from reasonably foreseeable human behaviour or interaction with other systems, including other AI systems; (14) ‘safety component’ means a component of a product or of an AI system which fulfils a safety function for that product or AI system, or the failure or malfunctioning of which endangers the health and safety of persons or property; (15) ‘instructions for use’ means the information provided by the provider to inform the deployer of, in particular, an AI system’s intended purpose and proper use; (16) ‘recall of an AI system’ means any measure aiming to achieve the return to the provider or taking out of service or disabling the use of an AI system made available to deployers; (17) ‘withdrawal of an AI system’ means any measure aiming to prevent an AI system in the supply chain being made available on the market; (18) ‘performance of an AI system’ means the ability of an AI system to achieve its intended purpose; (19) ‘notifying authority’ means the national authority responsible for setting up and carrying out the necessary procedures for the assessment, designation and notification of conformity assessment bodies and for their monitoring; (20) ‘conformity assessment’ means the process of demonstrating whether the requirements set out in Chapter III, Section 2 relating to a high-risk AI system have been fulfilled; (21) ‘conformity assessment body’ means a body that performs third-party conformity assessment activities, including testing, certification and inspection; (22) ‘notified body’ means a conformity assessment body notified in accordance with this Regulation and other relevant Union harmonisation legislation; (23) ‘substantial modification’ means a change to an AI system after its placing on the market or putting into service which is not foreseen or planned in the initial conformity assessment carried out by the provider and as a result of which the compliance of the AI system with the requirements set out in Chapter III, Section 2 is affected or results in a modification to the intended purpose for which the AI system has been assessed; (24) ‘CE marking’ means a marking by which a provider indicates that an AI system is in conformity with the requirements set out in Chapter III, Section 2 and other applicable Union harmonisation legislation providing for its affixing; (25) ‘post-market monitoring system’ means all activities carried out by providers of AI systems to collect and review experience gained from the use of AI systems they place on the market or put into service for the purpose of identifying any need to immediately apply any necessary corrective or preventive actions; (26) ‘market surveillance authority’ means the national authority carrying out the activities and taking the measures pursuant to Regulation (EU) 2019/1020; (27) ‘harmonised standard’ means a harmonised standard as defined in Article 2(1), point (c), of Regulation (EU) No 1025/2012; (28) ‘common specification’ means a set of technical specifications as defined in Article 2, point (4) of Regulation (EU) No 1025/2012, providing means to comply with certain requirements established under this Regulation; (29) ‘training data’ means data used for training an AI system through fitting its learnable parameters; (30) ‘validation data’ means data used for providing an evaluation of the trained AI system and for tuning its non-learnable parameters and its learning process in order, inter alia, to prevent underfitting or overfitting; (31) ‘validation data set’ means a separate data set or part of the training data set, either as a fixed or variable split; (32) ‘testing data’ means data used for providing an independent evaluation of the AI system in order to confirm the expected performance of that system before its placing on the market or putting into service; (33) ‘input data’ means data provided to or directly acquired by an AI system on the basis of which the system produces an output; (34) ‘biometric data’ means personal data resulting from specific technical processing relating to the physical, physiological or behavioural characteristics of a natural person, such as facial images or dactyloscopic data; (35) ‘biometric identification’ means the automated recognition of physical, physiological, behavioural, or psychological human features for the purpose of establishing the identity of a natural person by comparing biometric data of that individual to biometric data of individuals stored in a database; (36) ‘biometric verification’ means the automated, one-to-one verification, including authentication, of the identity of natural persons by comparing their biometric data to previously provided biometric data; (37) ‘special categories of personal data’ means the categories of personal data referred to in Article 9(1) of Regulation (EU) 2016/679, Article 10 of Directive (EU) 2016/680 and Article 10(1) of Regulation (EU) 2018/1725; (38) ‘sensitive operational data’ means operational data related to activities of prevention, detection, investigation or prosecution of criminal offences, the disclosure of which could jeopardise the integrity of criminal proceedings; (39) ‘emotion recognition system’ means an AI system for the purpose of identifying or inferring emotions or intentions of natural persons on the basis of their biometric data; (40) ‘biometric categorisation system’ means an AI system for the purpose of assigning natural persons to specific categories on the basis of their biometric data, unless it is ancillary to another commercial service and strictly necessary for objective technical reasons; (41) ‘remote biometric identification system’ means an AI system for the purpose of identifying natural persons, without their active involvement, typically at a distance through the comparison of a person’s biometric data with the biometric data contained in a reference database; (42) ‘real-time remote biometric identification system’ means a remote biometric identification system, whereby the capturing of biometric data, the comparison and the identification all occur without a significant delay, comprising not only instant identification, but also limited short delays in order to avoid circumvention; (43) ‘post-remote biometric identification system’ means a remote biometric identification system other than a real-time remote biometric identification system; (44) ‘publicly accessible space’ means any publicly or privately owned physical place accessible to an undetermined number of natural persons, regardless of whether certain conditions for access may apply, and regardless of the potential capacity restrictions; (45) ‘law enforcement authority’ means:

**SCF Controls:** SEA-02.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 4

> Providers and deployers of AI systems shall take measures to ensure, to their best extent, a sufficient level of AI literacy of their staff and other persons dealing with the operation and use of AI systems on their behalf, taking into account their technical knowledge, experience, education and training and the context the AI systems are to be used in, and considering the persons or groups of persons on whom the AI systems are to be used.

**SCF Controls:** AAT-13.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.1

> The following AI practices shall be prohibited:

**SCF Controls:** AAT-19

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.1(a)

> The placing on the market, the putting into service or the use of an AI system that deploys subliminal techniques beyond a person’s consciousness or purposefully manipulative or deceptive techniques, with the objective, or the effect of materially distorting the behaviour of a person or a group of persons by appreciably impairing their ability to make an informed decision, thereby causing them to take a decision that they would not have otherwise taken in a manner that causes or is reasonably likely to cause that person, another person or group of persons significant harm.

**SCF Controls:** AAT-19.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.1(b)

> The placing on the market, the putting into service or the use of an AI system that exploits any of the vulnerabilities of a natural person or a specific group of persons due to their age, disability or a specific social or economic situation, with the objective, or the effect, of materially distorting the behaviour of that person or a person belonging to that group in a manner that causes or is reasonably likely to cause that person or another person significant harm.

**SCF Controls:** AAT-19.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.1(c)

> The placing on the market, the putting into service or the use of AI systems for the evaluation or classification of natural persons or groups of persons over a certain period of time based on their social behaviour or known, inferred or predicted personal or personality characteristics, with the social score leading to either or both of the following:.

**SCF Controls:** AAT-19.3

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.1(c)(i)

> Detrimental or unfavourable treatment of certain natural persons or groups of persons in social contexts that are unrelated to the contexts in which the data was originally generated or collected.

**SCF Controls:** AAT-19.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.1(c)(ii)

> Detrimental or unfavourable treatment of certain natural persons or groups of persons that is unjustified or disproportionate to their social behaviour or its gravity.

**SCF Controls:** AAT-19.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.1(d)

> The placing on the market, the putting into service for this specific purpose, or the use of an AI system for making risk assessments of natural persons in order to assess or predict the risk of a natural person committing a criminal offence, based solely on the profiling of a natural person or on assessing their personality traits and characteristics; this prohibition shall not apply to AI systems used to support the human assessment of the involvement of a person in a criminal activity, which is already based on objective and verifiable facts directly linked to a criminal activity.

**SCF Controls:** AAT-19.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.1(e)

> The placing on the market, the putting into service for this specific purpose, or the use of AI systems that create or expand facial recognition databases through the untargeted scraping of facial images from the internet or CCTV footage.

**SCF Controls:** AAT-19.6

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.1(f)

> The placing on the market, the putting into service for this specific purpose, or the use of AI systems to infer emotions of a natural person in the areas of workplace and education institutions, except where the use of the AI system is intended to be put in place or into the market for medical or safety reasons.

**SCF Controls:** AAT-19.7

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 5.1(g)

> The placing on the market, the putting into service for this specific purpose, or the use of biometric categorisation systems that categorise individually natural persons based on their biometric data to deduce or infer their race, political opinions, trade union membership, religious or philosophical beliefs, sex life or sexual orientation; this prohibition does not cover any labelling or filtering of lawfully acquired biometric datasets, such as images, based on biometric data or categorizing of biometric data in the area of law enforcement.

**SCF Controls:** AAT-19.8

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 6.1

> Irrespective of whether an AI system is placed on the market or put into service independently of the products referred to in points (a) and (b), that AI system shall be considered to be high-risk where both of the following conditions are fulfilled:

**SCF Controls:** AAT-09.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 6.1(a)

> The AI system is intended to be used as a safety component of a product, or the AI system is itself a product, covered by the Union harmonisation legislation listed in Annex I.

**SCF Controls:** AAT-09.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 6.3

> By derogation from paragraph 2, an AI system referred to in Annex III shall not be considered to be high-risk where it does not pose a significant risk of harm to the health, safety or fundamental rights of natural persons, including by not materially influencing the outcome of decision making. The first subparagraph shall apply where any of the following conditions is fulfilled:

**SCF Controls:** AAT-09.1, AST-31.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 8.1

> High-risk AI systems shall comply with the requirements laid down in this Section, taking into account their intended purpose as well as the generally acknowledged state of the art on AI and AI-related technologies. The risk management system referred to in Article 9 shall be taken into account when ensuring compliance with those requirements.

**SCF Controls:** AAT-03, RSK-01, TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 8.2

> Where a product contains an AI system, to which the requirements of this Regulation as well as requirements of the Union harmonisation legislation listed in Section A of Annex I apply, providers shall be responsible for ensuring that their product is fully compliant with all applicable requirements under applicable Union harmonisation legislation. In ensuring the compliance of high-risk AI systems referred to in paragraph 1 with the requirements set out in this Section, and in order to ensure consistency, avoid duplication and minimise additional burdens, providers shall have a choice of integrating, as appropriate, the necessary testing and reporting processes, information and documentation they provide with regard to their product into documentation and procedures that already exist and are required under the Union harmonisation legislation listed in Section A of Annex I.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.1

> A risk management system shall be established, implemented, documented and maintained in relation to high-risk AI systems.

**SCF Controls:** AAT-02.1, RSK-01

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.2

> The risk management system shall be understood as a continuous iterative process planned and run throughout the entire lifecycle of a high-risk AI system, requiring regular systematic review and updating. It shall comprise the following steps:

**SCF Controls:** RSK-01

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.2(a)

> The identification and analysis of the known and the reasonably foreseeable risks that the high-risk AI system can pose to health, safety or fundamental rights when the high-risk AI system is used in accordance with its intended purpose.

**SCF Controls:** AAT-07, AAT-09

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.2(b)

> The estimation and evaluation of the risks that may emerge when the high-risk AI system is used in accordance with its intended purpose, and under conditions of reasonably foreseeable misuse.

**SCF Controls:** AAT-04.2, AAT-09

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.2(c)

> The evaluation of other risks possibly arising, based on the analysis of data gathered from the post-market monitoring system referred to in Article 72.

**SCF Controls:** RSK-03, RSK-04

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.2(d)

> The adoption of appropriate and targeted risk management measures designed to address the risks identified pursuant to point (a).

**SCF Controls:** RSK-06

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.4

> The risk management measures referred to in paragraph 2, point (d), shall give due consideration to the effects and possible interaction resulting from the combined application of the requirements set out in this Section, with a view to minimising risks more effectively while achieving an appropriate balance in implementing the measures to fulfil those requirements.

**SCF Controls:** RSK-01, RSK-06.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.5

> The risk management measures referred to in paragraph 2, point (d), shall be such that the relevant residual risk associated with each hazard, as well as the overall residual risk of the high-risk AI systems is judged to be acceptable. In identifying the most appropriate risk management measures, the following shall be ensured:

**SCF Controls:** RSK-01, RSK-06.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.5(a)

> Elimination or reduction of risks identified and evaluated pursuant to paragraph 2 in as far as technically feasible through adequate design and development of the high-risk AI system.

**SCF Controls:** RSK-06.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.5(b)

> Where appropriate, implementation of adequate mitigation and control measures addressing risks that cannot be eliminated.

**SCF Controls:** RSK-06.1, RSK-06.2

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend provides a layered set of technical mechanisms that organizations can deploy as compensating countermeasures to reduce risk exposure and limit the impact of threats at the network security layer. In addition to core preventive controls such as Distributed Firewall microsegmentation, Distributed IDS/IPS, TLS Inspection, URL filtering, and malware prevention, vDefend includes identification and response capabilities that support the compensating countermeasure lifecycle.

The vDefend distributed firewall (DFW) supports targeted policy enforcement using the Applied To field to scope policies to specific workload groups, zones, tenants, or applications without affecting other policies. Stage 2 of the vDefend Zero Trust journey (Infrastructure Services Protection) prioritizes securing critical infrastructure services such as DNS with specific deny rules scoped to infrastructure groups, providing a risk reduction approach that does not require a full Zero Trust policy deployment. DFW policies applied globally allow sources or destinations to be any object without span restrictions, supporting broad or targeted countermeasure scope as needed.

vDefend Distributed IDS/IPS provides intrusion detection and prevention capabilities and supports custom signature creation, allowing administrators to address threats from custom applications and zero-day vulnerabilities beyond standard signature coverage. The Oversubscription setting for Distributed IDS/IPS lets administrators configure whether excess traffic is dropped or bypassed when the IDS/IPS engine is overloaded, providing operational control over inspection behavior under high load.

The Security Services Platform supports investigation of individual threat events and correlated campaigns, enabling security teams to assess impact, identify root causes, and take mitigation actions. Campaign impact scoring within the Security Services Platform helps administrators prioritize which threats to address first. Comparing the ratio of detected versus prevented events in Security Intelligence informs administrators about how well current controls are protecting infrastructure, supporting identification of areas where additional countermeasures may be warranted.

vDefend Advanced Threat Prevention includes Network Detection and Response (NDR) as an activatable feature, providing supplemental threat detection coverage that complements preventive controls.

Formal compensating control documentation and organizational approval processes remain outside vDefend's scope; this control requires those organizational governance processes in addition to the technical mechanisms vDefend supplies.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.5(c)

> Provision of information required pursuant to Article 13 and, where appropriate, training to deployers.

**SCF Controls:** SAT-03

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.6

> High-risk AI systems shall be tested for the purpose of identifying the most appropriate and targeted risk management measures. Testing shall ensure that high-risk AI systems perform consistently for their intended purpose and that they are in compliance with the requirements set out in this Section.

**SCF Controls:** AAT-10, AAT-10.3, AAT-10.4, AAT-10.5

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides infrastructure that supports AI Test, Evaluation, Validation and Verification (TEVV) activities throughout the model lifecycle. Deep learning VMs provisioned from PAIS images provide dedicated testing environments for AI prototyping, fine-tuning, validation, and inference workloads. These DL VMs run on the same GPU-accelerated workload domains, vGPU profiles, and VM classes used in production, so TEVV activities occur in conditions comparable to the deployment environment.

The validate-then-publish workflow creates a formal gate for AI deployment. MLOps engineers validate models for inference functionality using the Triton Inference Server and evaluate performance and safety against business use cases, including examination of inference requests for malicious behavior and functional testing. Models must pass this validation before being uploaded to the Model Gallery for production use. Model integrity is verified through hash code validation, and each revision is assigned a unique digest stored as an OCI artifact with an immutable manifest, giving cryptographic verification that the tested model is the same artifact that gets deployed.

The platform also supports TEVV through its monitoring stack. VCF Operations monitors GPU consumption at cluster, host system, and host properties levels. Each DL VM includes a pre-installed DCGM Exporter with Prometheus collection at 5-second scrape intervals and Grafana visualization, supplying performance telemetry during testing and evaluation. The software stack for running AI applications on top of NVIDIA GPUs is validated in advance, and NVIDIA NGC containers are pre-tested and ready to run, reducing variables during TEVV by providing a known-good baseline.

#### VMware vDefend (Contributes)

VMware vDefend contributes to evaluating the security and resilience of AI and autonomous technology workloads by providing continuous network-level security assessment capabilities that operate during and after deployment.

The vDefend distributed firewall includes a dedicated Security Assessment workflow that generates Security Segmentation Reports and Blast Radius Reports. These reports identify at-risk workloads, communication chains, and traffic flows, providing structured input for evaluating whether network isolation is correctly applied to AI workload segments and identifying gaps in protection coverage.

Security Intelligence offers traffic flow analysis, a quantitative Security Segmentation Score, and environment-level monitoring that can inform resilience assessments. The Security Segmentation Score calculates posture by evaluating Distributed Firewall configuration and traffic rules; score values from 0 to 50 indicate low security, 50 to 80 indicate medium security, and values above 80 indicate a highly secure environment. The score breakdown report details total environments and environment pairs, protection rule actions, and highlights environment pairs lacking inter-environment policies. Security Intelligence generates policy recommendations by analyzing VM traffic flows over specified time periods and boundary definitions, and monitors inter-environment traffic to detect leakage and support lockdown rule implementation. The Security Intelligence dashboard displays environments, environment pairs, and segmentation state to help administrators understand current security posture.

The Security Services Platform collects and surfaces IDS/IPS readiness and performance metrics. Administrators can view intrusion details including severity, CVE identifiers, CVSS scores, and affected VMs through vDefend IDS/IPS to inform mitigation planning. Intelligent Assist assists with IDS policies, rules, and security profiles during remediation operations. The vDefend Threat Intelligence Service Portal supplies application-level threat intelligence that can inform distributed and gateway firewall policies targeting lateral and perimeter network threats.

The broader TEVV program for AI security and resilience, including defining evaluation criteria, establishing test plans, and interpreting results against organizational risk thresholds, is an organizational responsibility outside vDefend's scope.

Not applicable for this control: VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.7

> Testing procedures may include testing in real-world conditions in accordance with Article 60.

**SCF Controls:** AAT-10.12, AAT-24

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.8

> The testing of high-risk AI systems shall be performed, as appropriate, at any time throughout the development process, and, in any event, prior to their being placed on the market or put into service. Testing shall be carried out against prior defined metrics and probabilistic thresholds that are appropriate to the intended purpose of the high-risk AI system.

**SCF Controls:** IAO-01, IAO-02

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 9.9

> When implementing the risk management system as provided for in paragraphs 1 to 7, providers shall give consideration to whether in view of its intended purpose the high-risk AI system is likely to have an adverse impact on persons under the age of 18 and, as appropriate, other vulnerable groups.

**SCF Controls:** AAT-07.2, RSK-01

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.1

> High-risk AI systems which make use of techniques involving the training of AI models with data shall be developed on the basis of training, validation and testing data sets that meet the quality criteria referred to in paragraphs 2 to 5 whenever such data sets are used.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.2

> Training, validation and testing data sets shall be subject to data governance and management practices appropriate for the intended purpose of the high-risk AI system. Those practices shall concern in particular:

**SCF Controls:** DCH-18.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.2(a)

> The relevant design choices.

**SCF Controls:** DCH-18.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.2(b)

> Data collection processes and the origin of data, and in the case of personal data, the original purpose of the data collection.

**SCF Controls:** DCH-18.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.2(c)

> Relevant data-preparation processing operations, such as annotation, labelling, cleaning, updating, enrichment and aggregation.

**SCF Controls:** DCH-18.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.2(d)

> The formulation of assumptions, in particular with respect to the information that the data are supposed to measure and represent.

**SCF Controls:** DCH-18.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.2(e)

> An assessment of the availability, quantity and suitability of the data sets that are needed.

**SCF Controls:** DCH-18.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.2(f)

> Examination in view of possible biases that are likely to affect the health and safety of persons, have a negative impact on fundamental rights or lead to discrimination prohibited under Union law, especially where data outputs influence inputs for future operations.

**SCF Controls:** AAT-10.8

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.2(g)

> Appropriate measures to detect, prevent and mitigate possible biases identified according to point (f).

**SCF Controls:** AAT-10.8

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.2(h)

> The identification of relevant data gaps or shortcomings that prevent compliance with this Regulation, and how those gaps and shortcomings can be addressed.

**SCF Controls:** CPL-01.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.3

> Training, validation and testing data sets shall be relevant, sufficiently representative, and to the best extent possible, free of errors and complete in view of the intended purpose. They shall have the appropriate statistical properties, including, where applicable, as regards the persons or groups of persons in relation to whom the high-risk AI system is intended to be used. Those characteristics of the data sets may be met at the level of individual data sets or at the level of a combination thereof.

**SCF Controls:** AAT-10.12, DCH-18.2, DCH-22

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides infrastructure mechanisms that allow AI workload validation to occur on the same VCF configuration used for production deployment. The Private AI Services Quickstart in VCF Automation generates catalog items for both deep learning VMs and AI applications on VMware Kubernetes Service (VKS) clusters, and the Quickstart prepares the environment for both workload platform models even when only one is planned for production. The same VCF Automation catalog items, default VM class, vGPU and GPU passthrough deployment modes, and Provider Management Region to Supervisor cluster associations are available to validation and production consumers within an organization namespace.

Validation and production deployments draw from the same Harbor registry project created for PAIS deployment, so model and container artifacts used during testing are the same artifacts consumed in production. Deployment leases control how long an AI deployment can exist, which allows time-bound validation environments to be provisioned from the same catalog items as production. PAIS observability is activated through the spec.observability.prometheusRuntime section of the PAISConfiguration custom resource, and PAIS controller pod metrics are integrated into VCF Operations through a Telegraf ConfigMap in the vmware-system-monitoring namespace, with Grafana available to DevOps and MLOps engineers to visualize health and performance under conditions comparable to deployment settings. Setup workflows are documented for both connected and disconnected air-gapped environments, so validation in one connectivity mode can be replicated for the production deployment mode.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.4

> Data sets shall take into account, to the extent required by the intended purpose, the characteristics or elements that are particular to the specific geographical, contextual, behavioural or functional setting within which the high-risk AI system is intended to be used.

**SCF Controls:** AAT-10.8

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.5

> To the extent that it is strictly necessary for the purpose of ensuring bias detection and correction in relation to the high-risk AI systems in accordance with paragraph (2), points (f) and (g) of this Article, the providers of such systems may exceptionally process special categories of personal data, subject to appropriate safeguards for the fundamental rights and freedoms of natural persons. In addition to the provisions set out in Regulations (EU) 2016/679 and (EU) 2018/1725 and Directive (EU) 2016/680, all the following conditions must be met in order for such processing to occur:

**SCF Controls:** AAT-10.8, PRI-01, PRI-05.7

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.5(a)

> The bias detection and correction cannot be effectively fulfilled by processing other data, including synthetic or anonymised data.

**SCF Controls:** AAT-10.8

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.5(b)

> The special categories of personal data are subject to technical limitations on the re-use of the personal data, and state-of-the-art security and privacy-preserving measures, including pseudonymisation.

**SCF Controls:** DCH-23, PRI-01.6

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

### Control 10.5(c)

> The special categories of personal data are subject to measures to ensure that the personal data processed are secured, protected, subject to suitable safeguards, including strict controls and documentation of the access, to avoid misuse and ensure that only authorised persons have access to those personal data with appropriate confidentiality obligations.

**SCF Controls:** PRI-01.6, PRI-05.4

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

### Control 10.5(d)

> The special categories of personal data are not to be transmitted, transferred or otherwise accessed by other parties.

**SCF Controls:** PRI-05.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.5(e)

> The special categories of personal data are deleted once the bias has been corrected or the personal data has reached the end of its retention period, whichever comes first.

**SCF Controls:** PRI-05

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.5(f)

> The records of processing activities pursuant to Regulations (EU) 2016/679 and (EU) 2018/1725 and Directive (EU) 2016/680 include the reasons why the processing of special categories of personal data was strictly necessary to detect and correct biases, and why that objective could not be achieved by processing other data.

**SCF Controls:** PRI-14

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 10.6

> For the development of high-risk AI systems not using techniques involving the training of AI models, paragraphs 2 to 5 apply only to the testing data sets.

**SCF Controls:** DCH-18.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 11.1

> The technical documentation of a high-risk AI system shall be drawn up before that system is placed on the market or put into service and shall be kept up-to date. The technical documentation shall be drawn up in such a way as to demonstrate that the high-risk AI system complies with the requirements set out in this Section and to provide national competent authorities and notified bodies with the necessary information in a clear and comprehensive form to assess the compliance of the AI system with those requirements. It shall contain, at a minimum, the elements set out in Annex IV. SMEs, including start-ups, may provide the elements of the technical documentation specified in Annex IV in a simplified manner. To that end, the Commission shall establish a simplified technical documentation form targeted at the needs of small and microenterprises. Where an SME, including a start-up, opts to provide the information required in Annex IV in a simplified manner, it shall use the form referred to in this paragraph. Notified bodies shall accept the form for the purposes of the conformity assessment.

**SCF Controls:** AAT-10, AAT-14, CPL-01.3, IAO-03, TDA-04, TDA-22

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF ships with extensive administrator documentation covering secure configuration, security feature usage, and known vulnerabilities across all stack components.

The VCF documentation set includes a Product Overview, Design Guide, Release Notes, and detailed operational guides. Administrators are expected to be familiar with these materials before deploying or managing VCF, and the documentation explicitly states prerequisites for applying configuration and design guidance. The Planning and Preparation Workbook provides a structured approach for documenting existing components and configuration decisions before deployment begins, establishing a baseline for secure installation.

For secure configuration and hardening, the vSphere Security Configuration Guide outlines best practices and recommendations for securing VMware vSphere, covering various aspects of vSphere security and providing configuration guidelines to help administrators protect their infrastructure from potential threats and vulnerabilities. Similar Security Configuration Guides exist for NSX and vSAN components, providing recommendations for securing NSX nodes, NSX Controllers, NSX Edge nodes, and vSAN storage. DISA Security Technical Implementation Guides (STIGs) provide detailed instructions on how to secure and configure operating systems, applications, and network devices. Security Requirements Guides (SRGs) address access control, identification and authentication, audit and accountability, and encryption. A STIG Viewer tool is available to automate checking system configurations against STIG requirements, helping organizations identify and remediate security vulnerabilities. The vSphere documentation describes how security administrators can create user-defined security baselines and compare hosts and virtual machines against these baselines to identify and remediate deviations from expected configurations.

The documentation describes administrative role definitions and privilege separation in detail. vCenter defines an operator authorization level that maps to the SystemConfiguration.Administrators group and a dedicated operator local role. A No Cryptography Administrator role provides all Administrator privileges except Cryptographic Operations, allowing organizations to separate cryptographic duties from general administration. System Administrators in VCF Automation have documented rights to manage rights bundles, global roles, and service accounts, and the documentation describes how these rights bundles control what is available to each organization. System administrator credentials are established during the installation and configuration process. The vSphere documentation also covers the Privilege Recorder ListAPI, which enables retrieval of privilege check records alongside the associated sessions, users, managed objects, and operation IDs, giving administrators tooling to audit and review privilege usage patterns.

The VCF Audit Guide describes the compliance conditions required for assessing the security posture of VCF environments, and VCF Compliance based on the VCF Audit Guides can be enabled in VCF Operations. The complete documentation set covers security features across the stack, including role-based access control, certificate management, encryption, identity federation, and logging. The VCF Operations REST API documentation includes reference material for all elements, types, queries, and operations, with schema definition files accessible through Swagger documentation, supporting administrators who manage the platform programmatically.

VMware publishes security advisories (VMSAs) that describe known vulnerabilities in VCF components. VMware releases security advisories for critical known vulnerabilities with step-by-step instructions on remediation, and security-related updates for components such as VCF Operations come in the form of a VMSA.

VCF provides the documentation content, but obtaining updates, controlling access to sensitive configuration guides, and distributing documentation to the appropriate personnel requires organizational processes outside the scope of the product. The organization must establish its own mechanisms for tracking documentation releases, restricting access to sensitive administrative guides, and distributing relevant materials to administrators who need them.

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

### Control 11.2

> Where a high-risk AI system related to a product covered by the Union harmonisation legislation listed in Section A of Annex I is placed on the market or put into service, a single set of technical documentation shall be drawn up containing all the information set out in paragraph 1, as well as the information required under those legal acts.

**SCF Controls:** TDA-22

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 12.1

> High-risk AI systems shall technically allow for the automatic recording of events (logs) over the lifetime of the system.

**SCF Controls:** AAT-16, AAT-16.8, MON-01.4

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

The specific event data elements this control requires, including database query history, matched input data, and the identity of individuals who verified results, are characteristics of AI and autonomous technology applications and must be implemented by those applications. VCF does not operate AI systems or manage AI decision logic directly, so it does not natively record these application-level details. The Consumption layer of VCF, however, provides the audit framework, log collection infrastructure, and forwarding mechanisms that AI workloads running on the platform can use to satisfy the event recording requirements this control specifies.

The Kubernetes API server built into VMware Kubernetes Service (VKS) clusters, managed through the vSphere Supervisor, supports configurable audit logging governed by an audit policy. Each audit event captures the authenticated identity of the requesting user or service account, addressing the control's requirement to identify individuals involved in verification activities. Kubernetes Event objects record the time when events are first observed using the eventTime field with microsecond-level precision, and the API server records requestReceivedTimestamp and stageTimestamp fields in each audit event, addressing the start and end time requirements. Kubernetes audit policy determines which events are recorded and at what detail level, with log-file and webhook backends available for routing structured audit events to external log management systems for retention and analysis.

For application-level log collection, VKS clusters run Fluent Bit as a standard package deployed in the vmware-system-logging namespace. Fluent Bit automatically collects container logs, Kubernetes API audit logs, Linux daemon logs, and Linux authentication logs from every node, and can forward these streams to VCF Log Management over the CFAPI protocol or to external systems including Syslog, HTTP, Elasticsearch, Kafka, and Splunk. For workloads running in vSphere Namespaces, the LogAgentConfiguration Custom Resource enables structured Syslog streaming; each log message automatically includes the namespace name, pod UID, pod name, container name, and ESX host name, giving operators the context needed to correlate events back to specific workloads and requesting identities. Kubernetes also records pod scheduling, image pull operations, and container creation events with timestamps and source information in the event log, providing an infrastructure-level audit trail that complements application-generated records.

Argo CD, when deployed as a Supervisor Service, records application synchronization events including resource creation, sync status, and health status with timestamps, providing an additional audit trail for GitOps-managed AI workload deployments. AI workloads that produce structured event records can write them to standard output or dedicated log streams, which Fluent Bit collects and forwards without requiring additional agent deployment within the workload.

Operators enabling AI workloads on VKS should configure Kubernetes audit policies to capture API interactions at the Request or RequestResponse level, enable Fluent Bit forwarding to a centralized log management system, and apply the LogAgentConfiguration Custom Resource to vSphere Namespaces hosting AI workloads. AI application owners must implement structured logging that captures the four data elements this control requires; the platform supplies the collection, forwarding, and retention infrastructure that makes those records durable and queryable.

VMware Private AI Services (PAIS) provides AI-specific observability and logging mechanisms that partially address the enumerated requirements over and above platform-level logging.

For requirement (1) timestamps, PAIS supports LLM trace collection that sends traces from agents and knowledge base indexing to an OpenTelemetry Collector using HTTP/protobuf or gRPC, capturing timing information for AI service operations. Trace collection is activated by uncommenting the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge base operations record timing metrics including total time for downloading files, total time for generating embeddings, and total time of the index operation. PAIS Controller metrics are exposed at the Prometheus endpoint on the pais-controller-manager service, and observability can be activated through the PAISConfiguration custom resource to enable Prometheus metrics collection with a configurable storage class and retention period. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log. PAIS controller pod metrics can be streamed from the Supervisor cluster to VCF Operations, and PAIS metrics can be visualized in Grafana and VCF Operations. These mechanisms cover timing for inference, indexing, and infrastructure operations, while per-session start and end timestamps for individual agent conversations require additional logging configuration at the AI application layer.

For requirement (2) databases queried, PAIS knowledge bases can be linked to data sources that supply content for retrieval-augmented generation, and indexing operations record timing metrics tied to those configured data sources. Per-query identification of which specific data source returned matching content requires additional instrumentation beyond the indexing record.

For requirement (3) input data matched, knowledge base indexing records aggregate operations across documents but does not record which specific input content matched individual retrieval queries. This requirement is addressed only at aggregate granularity by PAIS itself.

For requirement (4) identification of individuals, PAIS uses VCF SSO and VCF Automation identity for access to deployment and management functions, attributing administrative actions to the authenticated user. Identification of individuals involved in verification of AI results beyond platform identity, such as application-level review and approval workflows, requires additional organizational tooling layered on top of the PAIS platform.

PAIS event logging is strongest for AI service timing and infrastructure observability, partial for data source documentation, and limited for per-query matching and individual verification tracking, which together justify a Contributes rating against this Process-categorized control.

#### VMware vDefend (Contributes)

VMware vDefend contributes to monitoring the functionality and behavior of deployed AI workloads running on VCF by providing continuous network-level behavioral monitoring, threat detection, and AI-assisted security analysis around those workloads.

Security Intelligence, running on the Security Services Platform, provides continuous network-level behavioral monitoring that detects new traffic flows, unauthorized communications, and anomalous activity around deployed systems, including AI workloads. It continuously monitors for new flows between environments and alerts administrators to unauthorized or unexpected traffic, supporting ongoing policy adjustments. The Segmentation Monitoring Dashboard provides dedicated views for monitoring environment-level traffic flows; when monitoring identifies an environment pair without a configured protection policy, it offers a Run Recommendations option to generate policy recommendations based on observed traffic. Security Intelligence provides Infrastructure, Environment, and Application Monitoring capabilities. The application monitoring view within the Segmentation Monitoring Dashboard surfaces metrics including unprotected flows and applications with unprotected rule hits, providing targeted visibility into workloads, including AI systems, that lack active firewall policy coverage. The Policy Recommendations monitoring capability checks for changes in monitored entity scope every hour when enabled. Security Intelligence also runs a scheduled daily classification job, automatically categorizing compute entities based on traffic flows observed over the prior 30 days.

Intelligent Assist is an AI-assisted analysis feature accessible through the NSX Manager UI and Security Services Platform UI. It provides contextual analysis support on the IDS/IPS, Detections, and Campaigns pages, enabling administrators to investigate security events affecting deployed workloads with AI-driven guidance.

IDS/IPS provides ongoing threat detection through monitoring dashboards scoped to both distributed and gateway deployments. Project-scoped dashboards display events triggered for specific projects, allowing targeted monitoring of AI workload deployments. Network Detection and Response (NDR) applies behavioral analysis to identify suspicious activity targeting monitored workloads. The NDR Sensor periodically checks the status of activated features on the Security Services Platform every 15 minutes and updates its configuration accordingly.

Monitoring AI system functionality at the application layer, including model performance, output quality, and behavioral drift, is outside vDefend's domain and requires additional tooling.

#### VCF Protection and Recovery (Contributes)

VCF Protection and Recovery (PNR) provides alert generation and notification capabilities for data protection activities, integrating with the VMware vCenter alarm framework and supporting outbound notification to external response systems.

PNR extends vCenter's alarm system with recovery-specific alarm types. Alarms are generated automatically when connectivity issues are encountered or when protection groups and recovery plans enter an error state. PNR logs events and triggers corresponding alarms to track system health and address potential issues before they affect protection. Administrators can define and configure the action taken by each alarm type.

Alarm notifications can be configured to send email, SNMP traps, or run scripts on the vCenter host when an alarm triggers. For email notifications to function, Mail settings must be configured in vCenter Settings. PNR requires an administrator email address to be configured during appliance registration with vCenter. Licensing event alerts can also be configured so that licensing administrators receive email notifications when licensing compliance issues occur.

vSphere Replication supports configurable alarms for replication events. Administrators can define and edit alarms so that specific replication events, such as after configuring a virtual machine for replication, trigger notifications.

In 9.1, the unified PNR appliance includes the Clean Room Orchestrator, which adds a distinct alerting surface for cyber recovery operations. The Clean Room Orchestrator sends email alerts to configured recipients when the status of recovery environment components changes, such as when the Orchestrator or connector moves from good to warning status. PNR maintains an Alarms list for the clean room showing a history of all notifications requiring attention, with search and filtering by severity. PNR also supports configuration of email alerts for critical events to notify users of important recovery operations and system events.

The Protection and Recovery Overview Dashboard displays alerts with severity levels of Critical, Immediate, and Warning for snapshots, protection groups, recovery plans, and deployment settings. Through the VCF Protection and Recovery Cloud Management Pack integration with VCF Operations, administrators receive health alerts for protection groups, recovery plans, cloud file systems, recovery SDDCs, and protected sites.

For environments using PNR's Cyber Recovery capability, PNR supports integration with CrowdStrike, which provides CrowdScore for Incident Detections. CrowdScore measures the real-time threat level to recovery endpoints on a scale of 0 to 100, calculated using factors including frequency, severity, and correlation of security alerts, giving administrators a data protection-scoped view of security conditions relevant to recovery readiness.

These PNR-native alerting mechanisms contribute to situational awareness for data protection activities. Physical infrastructure alerting, network security alerting, and supply chain alerting fall outside PNR's scope and depend on the broader VCF platform and supplementary tools.

#### VMware Data Services Manager (Contributes)

VMware Data Services Manager (DSM) generates system alerts for conditions within its operational scope, covering database engine health, infrastructure connectivity, cybersecurity events, and data protection activities. The Dashboard displays Global Alerts at a glance, and a dedicated Global Alerts page, accessible from both the plug-in UI within vSphere Client and the standalone UI, provides a consolidated view of non-catastrophic alerts and overall system status. An Alerts pane in the Monitoring tab gives administrators a database-scoped view of active conditions for individual instances.

DSM categorizes alert conditions at three severity levels: OK, WARNING, and CRITICAL. Named alert types include INFRASTRUCTURE_POLICY_VC_ALARMS, triggered when one or more infrastructure resource alarms found in VMware vCenter (vCenter) are active; VCENTER_CONNECTIVITY, triggered when vCenter connectivity fails; DATABASE_ENGINE_HEALTH_ALERT, triggered when the database engine service is experiencing problems or disruptions; and alerts for vCenterBinding API status and LicensingNotUpdated conditions. DSM also generates alerts for authentication failures, backup and restore corruptions, and certificate errors. When critical alarms are active for vCenter hosts, DSM surfaces guidance to avoid create, upgrade, and scale operations to reduce the risk of failures during degraded infrastructure states. Each alert includes resolution suggestions that give operators actionable steps to resolve conditions without disrupting database services. Alert notification settings and threshold values for database alerts are configurable.

To support integration with broader monitoring and incident response workflows, DSM can forward alerts as email notifications or as webhook notifications to external systems. Named integration targets include Slack channels and ServiceNow. Webhooks support customizable payload templates and AlertLevel filtering, restricting delivery to CRITICAL or WARNING conditions as appropriate for the operational model. Alert payloads include the alert name, alert level, alert description, trigger timestamp, alert message, database cluster identifier, cluster name, triggered user email, task status, previous status, and task type. At the individual database level, administrators can configure alert notifications to route to Email, Slack, or ServiceNow endpoints. This mechanism supports routing DSM-generated alerts into enterprise monitoring platforms, SIEM systems, or ticketing workflows.

DSM integrates with VCF Operations to surface monitoring data for database services, providing an additional visibility channel for triggered or active alerts scoped to individual nodes or the overall cluster within the broader VCF observability stack.

DSM's alert coverage is scoped to the database-as-a-service layer: database instance health, infrastructure policy compliance, connectivity to platform components, authentication events, and backup operation outcomes. Physical security, network-level cybersecurity events, and supply chain activities are outside DSM's scope and require monitoring through the broader VCF platform and organizational tooling. Correlating DSM alerts with alerts from other platform components, and implementing a coordinated response workflow that spans physical, cybersecurity, data protection, and supply chain domains, requires organizational processes and enterprise monitoring capabilities beyond what DSM provides on its own.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer has a native alerting subsystem that generates, routes, and responds to alerts from application delivery and cybersecurity events. Alert Configurations define the conditions under which alerts are generated, drawing from system events or metrics as the configurable source, with parameters specifying when an alert should fire and what actions to take. When conditions are met, Avi executes the configured Action Groups that trigger notifications for new alerts. The Alert Manager captures alert details across the system, including information for Service Engines, Virtual Services, and Pools, along with event identifiers and cloud-specific metadata such as Service Engine VM UUIDs.

For alert routing, the Avi Controller supports four notification destinations: the local Controller UI (visible under Operations > Alerts > All Alerts, categorized by configured Alert Level), email, syslog, and SNMP traps. SNMP trap support covers both SNMPv2c and SNMPv3 protocols. In 9.1, SNMP notifications can additionally be configured with TLS encryption and strict certificate verification for secure transport to external SNMP servers, and multiple SNMP servers can be specified for notification delivery to support redundancy. Syslog Audit Persistence forwards alert events to remote syslog servers for centralized monitoring and audit trail collection. All destinations are configured through Operations > Notifications in the Controller UI. The Controller cluster leader issues SNMP trap notifications based on system events, and event-based traps can include status-change events such as virtual-service-down conditions. Local alert notifications are generated by default in addition to any configured external alert actions.

For automated response, Avi Alert Actions support ControlScripts: Python scripts executed on the Controller that receive the triggering alert's EVENT_DESCRIPTION as an environment variable and full alert details as JSON. Alert Actions can be associated with specific system events and can trigger email, Syslog, SNMP Trap, or ControlScript responses. Avi logs configured alerts and their execution status in the Alert Actions tab under Operations > Alerts. Custom Alert Actions can be created alongside or in place of the default system alert actions (such as System-Alert-Level-High), allowing organizations to tailor alerting and automated response to their operational and security requirements.

For VCF-integrated deployments in 9.1, the Avi Load Balancer Observability Management Pack provides unified alert reporting across multiple Avi instances, giving VCF platform operators a consolidated view of alerting state across the Avi deployment.

Auditors should verify that Alert Configurations and Alert Actions are configured under Operations in the Avi Controller UI, that syslog or SNMP trap destinations are set to route events to the organization's centralized monitoring platform, and that alert thresholds reflect the cybersecurity and application availability events within the Avi scope. The organization is responsible for routing Avi alerts into the broader monitoring stack and for establishing the cross-domain correlation required to achieve integrated situational awareness across physical, data protection, and supply chain domains.

### Control 12.2

> In order to ensure a level of traceability of the functioning of a high-risk AI system that is appropriate to the intended purpose of the system, logging capabilities shall enable the recording of events relevant for:

**SCF Controls:** AAT-16.8

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

The specific event data elements this control requires, including database query history, matched input data, and the identity of individuals who verified results, are characteristics of AI and autonomous technology applications and must be implemented by those applications. VCF does not operate AI systems or manage AI decision logic directly, so it does not natively record these application-level details. The Consumption layer of VCF, however, provides the audit framework, log collection infrastructure, and forwarding mechanisms that AI workloads running on the platform can use to satisfy the event recording requirements this control specifies.

The Kubernetes API server built into VMware Kubernetes Service (VKS) clusters, managed through the vSphere Supervisor, supports configurable audit logging governed by an audit policy. Each audit event captures the authenticated identity of the requesting user or service account, addressing the control's requirement to identify individuals involved in verification activities. Kubernetes Event objects record the time when events are first observed using the eventTime field with microsecond-level precision, and the API server records requestReceivedTimestamp and stageTimestamp fields in each audit event, addressing the start and end time requirements. Kubernetes audit policy determines which events are recorded and at what detail level, with log-file and webhook backends available for routing structured audit events to external log management systems for retention and analysis.

For application-level log collection, VKS clusters run Fluent Bit as a standard package deployed in the vmware-system-logging namespace. Fluent Bit automatically collects container logs, Kubernetes API audit logs, Linux daemon logs, and Linux authentication logs from every node, and can forward these streams to VCF Log Management over the CFAPI protocol or to external systems including Syslog, HTTP, Elasticsearch, Kafka, and Splunk. For workloads running in vSphere Namespaces, the LogAgentConfiguration Custom Resource enables structured Syslog streaming; each log message automatically includes the namespace name, pod UID, pod name, container name, and ESX host name, giving operators the context needed to correlate events back to specific workloads and requesting identities. Kubernetes also records pod scheduling, image pull operations, and container creation events with timestamps and source information in the event log, providing an infrastructure-level audit trail that complements application-generated records.

Argo CD, when deployed as a Supervisor Service, records application synchronization events including resource creation, sync status, and health status with timestamps, providing an additional audit trail for GitOps-managed AI workload deployments. AI workloads that produce structured event records can write them to standard output or dedicated log streams, which Fluent Bit collects and forwards without requiring additional agent deployment within the workload.

Operators enabling AI workloads on VKS should configure Kubernetes audit policies to capture API interactions at the Request or RequestResponse level, enable Fluent Bit forwarding to a centralized log management system, and apply the LogAgentConfiguration Custom Resource to vSphere Namespaces hosting AI workloads. AI application owners must implement structured logging that captures the four data elements this control requires; the platform supplies the collection, forwarding, and retention infrastructure that makes those records durable and queryable.

VMware Private AI Services (PAIS) provides AI-specific observability and logging mechanisms that partially address the enumerated requirements over and above platform-level logging.

For requirement (1) timestamps, PAIS supports LLM trace collection that sends traces from agents and knowledge base indexing to an OpenTelemetry Collector using HTTP/protobuf or gRPC, capturing timing information for AI service operations. Trace collection is activated by uncommenting the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge base operations record timing metrics including total time for downloading files, total time for generating embeddings, and total time of the index operation. PAIS Controller metrics are exposed at the Prometheus endpoint on the pais-controller-manager service, and observability can be activated through the PAISConfiguration custom resource to enable Prometheus metrics collection with a configurable storage class and retention period. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log. PAIS controller pod metrics can be streamed from the Supervisor cluster to VCF Operations, and PAIS metrics can be visualized in Grafana and VCF Operations. These mechanisms cover timing for inference, indexing, and infrastructure operations, while per-session start and end timestamps for individual agent conversations require additional logging configuration at the AI application layer.

For requirement (2) databases queried, PAIS knowledge bases can be linked to data sources that supply content for retrieval-augmented generation, and indexing operations record timing metrics tied to those configured data sources. Per-query identification of which specific data source returned matching content requires additional instrumentation beyond the indexing record.

For requirement (3) input data matched, knowledge base indexing records aggregate operations across documents but does not record which specific input content matched individual retrieval queries. This requirement is addressed only at aggregate granularity by PAIS itself.

For requirement (4) identification of individuals, PAIS uses VCF SSO and VCF Automation identity for access to deployment and management functions, attributing administrative actions to the authenticated user. Identification of individuals involved in verification of AI results beyond platform identity, such as application-level review and approval workflows, requires additional organizational tooling layered on top of the PAIS platform.

PAIS event logging is strongest for AI service timing and infrastructure observability, partial for data source documentation, and limited for per-query matching and individual verification tracking, which together justify a Contributes rating against this Process-categorized control.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 12.2(a)

> Identifying situations that may result in the high-risk AI system presenting a risk within the meaning of Article 79(1) or in a substantial modification.

**SCF Controls:** AAT-14, AAT-16, AAT-16.3

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to monitoring deployed AI workloads through VCF Operations, which provides continuous visibility into the health, performance, and capacity of the infrastructure those workloads run on. VCF Operations dashboards display real-time and historical metrics for compute, storage, and networking resources consumed by AI VMs. VCF Log Management aggregates log data across the stack. VMware vCenter alarms trigger on configurable thresholds for CPU, memory, disk, and network conditions.

For AI and autonomous technology workloads deployed as containerized applications on VMware Kubernetes Service (VKS) clusters, the platform provides a layered observability stack. The Prometheus Standard Package, available for deployment on VKS clusters, collects metrics from configured targets at defined intervals, evaluates alerting rules, and forwards alerts to Alertmanager. The package includes prometheus-server, which handles scraping, rule processing, and alerting, as well as prometheus-kube-state-metrics for tracking node status, replica-set compliance, pod and job status, and resource requests and limits across namespaces. For batch inference or training jobs that cannot be scraped directly, Prometheus Pushgateway accepts pushed metrics. Grafana Operator pairs with Prometheus to provide dashboards and configurable alert thresholds, enabling operators to define visual representations of AI workload metrics and receive notifications when behavior deviates from expected patterns.

Monitoring agents for Kubernetes device plugin resources, including GPUs commonly consumed by AI inference and training workloads, can be deployed as DaemonSets on worker nodes to track resource utilization and associate metrics with specific containers. The Kubernetes Node Problem Detector can be extended with custom monitoring scripts written in any language, which allows AI-specific health checks to be added without modifying core Kubernetes components. Kubernetes also provides built-in auditing capabilities for monitoring and recording cluster activities.

Istio, available as a Standard Package for VKS clusters, provides mechanisms to secure, connect, and monitor services. For AI inference services that expose APIs, Istio supplies request rate, latency, and error rate metrics without requiring application-level instrumentation.

Deployments using the Harness CI/CD Supervisor Service can integrate Dynatrace, which automatically instruments applications and infrastructure upon deployment and collects metrics, logs, and traces. The Dynatrace AI engine detects anomalies, identifies root causes, and generates intelligent alerts. The Dynatrace operator automates the deployment, scaling, and maintenance of the monitoring stack within the VKS cluster. Harness Service Reliability Management monitors deployed services post-deployment to calculate a real-time health score based on transaction success and latency.

VKS cluster management proactively monitors the VKS cluster estate to confirm assigned policies are enforced correctly, and generates Policy Insights when configuration conflicts or environmental errors are detected.

Monitoring AI model behavior at the application level, including model drift, inference accuracy, and data distribution shifts, requires organization-defined monitoring logic implemented using these platform tools. VCF and its Kubernetes consumption layer provide the collection, storage, and alerting infrastructure, but the organization must configure the signals to collect, define thresholds for AI-specific behavioral anomalies, and establish processes for reviewing and responding to monitoring data.

VMware Private AI Services (PAIS) provides production monitoring for deployed AI workloads through metrics collection, telemetry, and integration with observability platforms. The Private AI Services controller exposes a Prometheus metrics endpoint on the pais-controller-manager service, and Private AI Services deployments include a Prometheus server pod that collects metrics for observability platforms. DevOps engineers visualize health and performance metrics for Private AI Services components running in a VCF Automation namespace using observability platforms such as Grafana.

Observability is activated by updating the PAISConfiguration custom resource with parameters that enable metrics collection for observability platforms and LLM traces for the OpenTelemetry (OTel) Collector. When LLM traces collection is activated, MLOps engineers can analyze traces from agents and knowledge base indexing in the OpenTelemetry Collector, supporting observation of model behavior and application health in agentic workflows. Private AI Services supports sending traces to an OpenTelemetry collector over HTTP/protobuf or gRPC.

Operators can monitor Private AI Services deployments in Grafana for pod restart frequency, vGPU licensing status, and idle or underutilized GPU devices in passthrough mode. Private AI Services controller pod metrics are integrated into observability platforms through Telegraf configuration in the Supervisor instance, which allows VCF Operations to ingest PAIS controller metrics alongside the broader infrastructure telemetry it already collects for GPU-enabled workload domains. Deployment health is verified through Kubernetes pod state of the API, ingress, rex worker, and Prometheus server pods.

MLOps engineers and application developers can perform monitoring and diagnostics of models used in agents through observability platforms like Grafana to track the health, quality, and behavior of AI applications.

#### VMware vDefend (Contributes)

VMware vDefend contributes to monitoring the functionality and behavior of deployed AI workloads running on VCF by providing continuous network-level behavioral monitoring, threat detection, and AI-assisted security analysis around those workloads.

Security Intelligence, running on the Security Services Platform, provides continuous network-level behavioral monitoring that detects new traffic flows, unauthorized communications, and anomalous activity around deployed systems, including AI workloads. It continuously monitors for new flows between environments and alerts administrators to unauthorized or unexpected traffic, supporting ongoing policy adjustments. The Segmentation Monitoring Dashboard provides dedicated views for monitoring environment-level traffic flows; when monitoring identifies an environment pair without a configured protection policy, it offers a Run Recommendations option to generate policy recommendations based on observed traffic. Security Intelligence provides Infrastructure, Environment, and Application Monitoring capabilities. The application monitoring view within the Segmentation Monitoring Dashboard surfaces metrics including unprotected flows and applications with unprotected rule hits, providing targeted visibility into workloads, including AI systems, that lack active firewall policy coverage. The Policy Recommendations monitoring capability checks for changes in monitored entity scope every hour when enabled. Security Intelligence also runs a scheduled daily classification job, automatically categorizing compute entities based on traffic flows observed over the prior 30 days.

Intelligent Assist is an AI-assisted analysis feature accessible through the NSX Manager UI and Security Services Platform UI. It provides contextual analysis support on the IDS/IPS, Detections, and Campaigns pages, enabling administrators to investigate security events affecting deployed workloads with AI-driven guidance.

IDS/IPS provides ongoing threat detection through monitoring dashboards scoped to both distributed and gateway deployments. Project-scoped dashboards display events triggered for specific projects, allowing targeted monitoring of AI workload deployments. Network Detection and Response (NDR) applies behavioral analysis to identify suspicious activity targeting monitored workloads. The NDR Sensor periodically checks the status of activated features on the Security Services Platform every 15 minutes and updates its configuration accordingly.

Monitoring AI system functionality at the application layer, including model performance, output quality, and behavioral drift, is outside vDefend's domain and requires additional tooling.

Not applicable for this control: VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 12.2(b)

> Facilitating the post-market monitoring referred to in Article 72.

**SCF Controls:** AAT-16

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to monitoring deployed AI workloads through VCF Operations, which provides continuous visibility into the health, performance, and capacity of the infrastructure those workloads run on. VCF Operations dashboards display real-time and historical metrics for compute, storage, and networking resources consumed by AI VMs. VCF Log Management aggregates log data across the stack. VMware vCenter alarms trigger on configurable thresholds for CPU, memory, disk, and network conditions.

For AI and autonomous technology workloads deployed as containerized applications on VMware Kubernetes Service (VKS) clusters, the platform provides a layered observability stack. The Prometheus Standard Package, available for deployment on VKS clusters, collects metrics from configured targets at defined intervals, evaluates alerting rules, and forwards alerts to Alertmanager. The package includes prometheus-server, which handles scraping, rule processing, and alerting, as well as prometheus-kube-state-metrics for tracking node status, replica-set compliance, pod and job status, and resource requests and limits across namespaces. For batch inference or training jobs that cannot be scraped directly, Prometheus Pushgateway accepts pushed metrics. Grafana Operator pairs with Prometheus to provide dashboards and configurable alert thresholds, enabling operators to define visual representations of AI workload metrics and receive notifications when behavior deviates from expected patterns.

Monitoring agents for Kubernetes device plugin resources, including GPUs commonly consumed by AI inference and training workloads, can be deployed as DaemonSets on worker nodes to track resource utilization and associate metrics with specific containers. The Kubernetes Node Problem Detector can be extended with custom monitoring scripts written in any language, which allows AI-specific health checks to be added without modifying core Kubernetes components. Kubernetes also provides built-in auditing capabilities for monitoring and recording cluster activities.

Istio, available as a Standard Package for VKS clusters, provides mechanisms to secure, connect, and monitor services. For AI inference services that expose APIs, Istio supplies request rate, latency, and error rate metrics without requiring application-level instrumentation.

Deployments using the Harness CI/CD Supervisor Service can integrate Dynatrace, which automatically instruments applications and infrastructure upon deployment and collects metrics, logs, and traces. The Dynatrace AI engine detects anomalies, identifies root causes, and generates intelligent alerts. The Dynatrace operator automates the deployment, scaling, and maintenance of the monitoring stack within the VKS cluster. Harness Service Reliability Management monitors deployed services post-deployment to calculate a real-time health score based on transaction success and latency.

VKS cluster management proactively monitors the VKS cluster estate to confirm assigned policies are enforced correctly, and generates Policy Insights when configuration conflicts or environmental errors are detected.

Monitoring AI model behavior at the application level, including model drift, inference accuracy, and data distribution shifts, requires organization-defined monitoring logic implemented using these platform tools. VCF and its Kubernetes consumption layer provide the collection, storage, and alerting infrastructure, but the organization must configure the signals to collect, define thresholds for AI-specific behavioral anomalies, and establish processes for reviewing and responding to monitoring data.

VMware Private AI Services (PAIS) provides production monitoring for deployed AI workloads through metrics collection, telemetry, and integration with observability platforms. The Private AI Services controller exposes a Prometheus metrics endpoint on the pais-controller-manager service, and Private AI Services deployments include a Prometheus server pod that collects metrics for observability platforms. DevOps engineers visualize health and performance metrics for Private AI Services components running in a VCF Automation namespace using observability platforms such as Grafana.

Observability is activated by updating the PAISConfiguration custom resource with parameters that enable metrics collection for observability platforms and LLM traces for the OpenTelemetry (OTel) Collector. When LLM traces collection is activated, MLOps engineers can analyze traces from agents and knowledge base indexing in the OpenTelemetry Collector, supporting observation of model behavior and application health in agentic workflows. Private AI Services supports sending traces to an OpenTelemetry collector over HTTP/protobuf or gRPC.

Operators can monitor Private AI Services deployments in Grafana for pod restart frequency, vGPU licensing status, and idle or underutilized GPU devices in passthrough mode. Private AI Services controller pod metrics are integrated into observability platforms through Telegraf configuration in the Supervisor instance, which allows VCF Operations to ingest PAIS controller metrics alongside the broader infrastructure telemetry it already collects for GPU-enabled workload domains. Deployment health is verified through Kubernetes pod state of the API, ingress, rex worker, and Prometheus server pods.

MLOps engineers and application developers can perform monitoring and diagnostics of models used in agents through observability platforms like Grafana to track the health, quality, and behavior of AI applications.

#### VMware vDefend (Contributes)

VMware vDefend contributes to monitoring the functionality and behavior of deployed AI workloads running on VCF by providing continuous network-level behavioral monitoring, threat detection, and AI-assisted security analysis around those workloads.

Security Intelligence, running on the Security Services Platform, provides continuous network-level behavioral monitoring that detects new traffic flows, unauthorized communications, and anomalous activity around deployed systems, including AI workloads. It continuously monitors for new flows between environments and alerts administrators to unauthorized or unexpected traffic, supporting ongoing policy adjustments. The Segmentation Monitoring Dashboard provides dedicated views for monitoring environment-level traffic flows; when monitoring identifies an environment pair without a configured protection policy, it offers a Run Recommendations option to generate policy recommendations based on observed traffic. Security Intelligence provides Infrastructure, Environment, and Application Monitoring capabilities. The application monitoring view within the Segmentation Monitoring Dashboard surfaces metrics including unprotected flows and applications with unprotected rule hits, providing targeted visibility into workloads, including AI systems, that lack active firewall policy coverage. The Policy Recommendations monitoring capability checks for changes in monitored entity scope every hour when enabled. Security Intelligence also runs a scheduled daily classification job, automatically categorizing compute entities based on traffic flows observed over the prior 30 days.

Intelligent Assist is an AI-assisted analysis feature accessible through the NSX Manager UI and Security Services Platform UI. It provides contextual analysis support on the IDS/IPS, Detections, and Campaigns pages, enabling administrators to investigate security events affecting deployed workloads with AI-driven guidance.

IDS/IPS provides ongoing threat detection through monitoring dashboards scoped to both distributed and gateway deployments. Project-scoped dashboards display events triggered for specific projects, allowing targeted monitoring of AI workload deployments. Network Detection and Response (NDR) applies behavioral analysis to identify suspicious activity targeting monitored workloads. The NDR Sensor periodically checks the status of activated features on the Security Services Platform every 15 minutes and updates its configuration accordingly.

Monitoring AI system functionality at the application layer, including model performance, output quality, and behavioral drift, is outside vDefend's domain and requires additional tooling.

Not applicable for this control: VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 12.2(c)

> Monitoring the operation of high-risk AI systems referred to in Article 26(5).

**SCF Controls:** AAT-16

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to monitoring deployed AI workloads through VCF Operations, which provides continuous visibility into the health, performance, and capacity of the infrastructure those workloads run on. VCF Operations dashboards display real-time and historical metrics for compute, storage, and networking resources consumed by AI VMs. VCF Log Management aggregates log data across the stack. VMware vCenter alarms trigger on configurable thresholds for CPU, memory, disk, and network conditions.

For AI and autonomous technology workloads deployed as containerized applications on VMware Kubernetes Service (VKS) clusters, the platform provides a layered observability stack. The Prometheus Standard Package, available for deployment on VKS clusters, collects metrics from configured targets at defined intervals, evaluates alerting rules, and forwards alerts to Alertmanager. The package includes prometheus-server, which handles scraping, rule processing, and alerting, as well as prometheus-kube-state-metrics for tracking node status, replica-set compliance, pod and job status, and resource requests and limits across namespaces. For batch inference or training jobs that cannot be scraped directly, Prometheus Pushgateway accepts pushed metrics. Grafana Operator pairs with Prometheus to provide dashboards and configurable alert thresholds, enabling operators to define visual representations of AI workload metrics and receive notifications when behavior deviates from expected patterns.

Monitoring agents for Kubernetes device plugin resources, including GPUs commonly consumed by AI inference and training workloads, can be deployed as DaemonSets on worker nodes to track resource utilization and associate metrics with specific containers. The Kubernetes Node Problem Detector can be extended with custom monitoring scripts written in any language, which allows AI-specific health checks to be added without modifying core Kubernetes components. Kubernetes also provides built-in auditing capabilities for monitoring and recording cluster activities.

Istio, available as a Standard Package for VKS clusters, provides mechanisms to secure, connect, and monitor services. For AI inference services that expose APIs, Istio supplies request rate, latency, and error rate metrics without requiring application-level instrumentation.

Deployments using the Harness CI/CD Supervisor Service can integrate Dynatrace, which automatically instruments applications and infrastructure upon deployment and collects metrics, logs, and traces. The Dynatrace AI engine detects anomalies, identifies root causes, and generates intelligent alerts. The Dynatrace operator automates the deployment, scaling, and maintenance of the monitoring stack within the VKS cluster. Harness Service Reliability Management monitors deployed services post-deployment to calculate a real-time health score based on transaction success and latency.

VKS cluster management proactively monitors the VKS cluster estate to confirm assigned policies are enforced correctly, and generates Policy Insights when configuration conflicts or environmental errors are detected.

Monitoring AI model behavior at the application level, including model drift, inference accuracy, and data distribution shifts, requires organization-defined monitoring logic implemented using these platform tools. VCF and its Kubernetes consumption layer provide the collection, storage, and alerting infrastructure, but the organization must configure the signals to collect, define thresholds for AI-specific behavioral anomalies, and establish processes for reviewing and responding to monitoring data.

VMware Private AI Services (PAIS) provides production monitoring for deployed AI workloads through metrics collection, telemetry, and integration with observability platforms. The Private AI Services controller exposes a Prometheus metrics endpoint on the pais-controller-manager service, and Private AI Services deployments include a Prometheus server pod that collects metrics for observability platforms. DevOps engineers visualize health and performance metrics for Private AI Services components running in a VCF Automation namespace using observability platforms such as Grafana.

Observability is activated by updating the PAISConfiguration custom resource with parameters that enable metrics collection for observability platforms and LLM traces for the OpenTelemetry (OTel) Collector. When LLM traces collection is activated, MLOps engineers can analyze traces from agents and knowledge base indexing in the OpenTelemetry Collector, supporting observation of model behavior and application health in agentic workflows. Private AI Services supports sending traces to an OpenTelemetry collector over HTTP/protobuf or gRPC.

Operators can monitor Private AI Services deployments in Grafana for pod restart frequency, vGPU licensing status, and idle or underutilized GPU devices in passthrough mode. Private AI Services controller pod metrics are integrated into observability platforms through Telegraf configuration in the Supervisor instance, which allows VCF Operations to ingest PAIS controller metrics alongside the broader infrastructure telemetry it already collects for GPU-enabled workload domains. Deployment health is verified through Kubernetes pod state of the API, ingress, rex worker, and Prometheus server pods.

MLOps engineers and application developers can perform monitoring and diagnostics of models used in agents through observability platforms like Grafana to track the health, quality, and behavior of AI applications.

#### VMware vDefend (Contributes)

VMware vDefend contributes to monitoring the functionality and behavior of deployed AI workloads running on VCF by providing continuous network-level behavioral monitoring, threat detection, and AI-assisted security analysis around those workloads.

Security Intelligence, running on the Security Services Platform, provides continuous network-level behavioral monitoring that detects new traffic flows, unauthorized communications, and anomalous activity around deployed systems, including AI workloads. It continuously monitors for new flows between environments and alerts administrators to unauthorized or unexpected traffic, supporting ongoing policy adjustments. The Segmentation Monitoring Dashboard provides dedicated views for monitoring environment-level traffic flows; when monitoring identifies an environment pair without a configured protection policy, it offers a Run Recommendations option to generate policy recommendations based on observed traffic. Security Intelligence provides Infrastructure, Environment, and Application Monitoring capabilities. The application monitoring view within the Segmentation Monitoring Dashboard surfaces metrics including unprotected flows and applications with unprotected rule hits, providing targeted visibility into workloads, including AI systems, that lack active firewall policy coverage. The Policy Recommendations monitoring capability checks for changes in monitored entity scope every hour when enabled. Security Intelligence also runs a scheduled daily classification job, automatically categorizing compute entities based on traffic flows observed over the prior 30 days.

Intelligent Assist is an AI-assisted analysis feature accessible through the NSX Manager UI and Security Services Platform UI. It provides contextual analysis support on the IDS/IPS, Detections, and Campaigns pages, enabling administrators to investigate security events affecting deployed workloads with AI-driven guidance.

IDS/IPS provides ongoing threat detection through monitoring dashboards scoped to both distributed and gateway deployments. Project-scoped dashboards display events triggered for specific projects, allowing targeted monitoring of AI workload deployments. Network Detection and Response (NDR) applies behavioral analysis to identify suspicious activity targeting monitored workloads. The NDR Sensor periodically checks the status of activated features on the Security Services Platform every 15 minutes and updates its configuration accordingly.

Monitoring AI system functionality at the application layer, including model performance, output quality, and behavioral drift, is outside vDefend's domain and requires additional tooling.

Not applicable for this control: VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 12.3(a)

> Recording of the period of each use of the system (start date and time and end date and time of each use).

**SCF Controls:** AAT-16.8

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

The specific event data elements this control requires, including database query history, matched input data, and the identity of individuals who verified results, are characteristics of AI and autonomous technology applications and must be implemented by those applications. VCF does not operate AI systems or manage AI decision logic directly, so it does not natively record these application-level details. The Consumption layer of VCF, however, provides the audit framework, log collection infrastructure, and forwarding mechanisms that AI workloads running on the platform can use to satisfy the event recording requirements this control specifies.

The Kubernetes API server built into VMware Kubernetes Service (VKS) clusters, managed through the vSphere Supervisor, supports configurable audit logging governed by an audit policy. Each audit event captures the authenticated identity of the requesting user or service account, addressing the control's requirement to identify individuals involved in verification activities. Kubernetes Event objects record the time when events are first observed using the eventTime field with microsecond-level precision, and the API server records requestReceivedTimestamp and stageTimestamp fields in each audit event, addressing the start and end time requirements. Kubernetes audit policy determines which events are recorded and at what detail level, with log-file and webhook backends available for routing structured audit events to external log management systems for retention and analysis.

For application-level log collection, VKS clusters run Fluent Bit as a standard package deployed in the vmware-system-logging namespace. Fluent Bit automatically collects container logs, Kubernetes API audit logs, Linux daemon logs, and Linux authentication logs from every node, and can forward these streams to VCF Log Management over the CFAPI protocol or to external systems including Syslog, HTTP, Elasticsearch, Kafka, and Splunk. For workloads running in vSphere Namespaces, the LogAgentConfiguration Custom Resource enables structured Syslog streaming; each log message automatically includes the namespace name, pod UID, pod name, container name, and ESX host name, giving operators the context needed to correlate events back to specific workloads and requesting identities. Kubernetes also records pod scheduling, image pull operations, and container creation events with timestamps and source information in the event log, providing an infrastructure-level audit trail that complements application-generated records.

Argo CD, when deployed as a Supervisor Service, records application synchronization events including resource creation, sync status, and health status with timestamps, providing an additional audit trail for GitOps-managed AI workload deployments. AI workloads that produce structured event records can write them to standard output or dedicated log streams, which Fluent Bit collects and forwards without requiring additional agent deployment within the workload.

Operators enabling AI workloads on VKS should configure Kubernetes audit policies to capture API interactions at the Request or RequestResponse level, enable Fluent Bit forwarding to a centralized log management system, and apply the LogAgentConfiguration Custom Resource to vSphere Namespaces hosting AI workloads. AI application owners must implement structured logging that captures the four data elements this control requires; the platform supplies the collection, forwarding, and retention infrastructure that makes those records durable and queryable.

VMware Private AI Services (PAIS) provides AI-specific observability and logging mechanisms that partially address the enumerated requirements over and above platform-level logging.

For requirement (1) timestamps, PAIS supports LLM trace collection that sends traces from agents and knowledge base indexing to an OpenTelemetry Collector using HTTP/protobuf or gRPC, capturing timing information for AI service operations. Trace collection is activated by uncommenting the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge base operations record timing metrics including total time for downloading files, total time for generating embeddings, and total time of the index operation. PAIS Controller metrics are exposed at the Prometheus endpoint on the pais-controller-manager service, and observability can be activated through the PAISConfiguration custom resource to enable Prometheus metrics collection with a configurable storage class and retention period. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log. PAIS controller pod metrics can be streamed from the Supervisor cluster to VCF Operations, and PAIS metrics can be visualized in Grafana and VCF Operations. These mechanisms cover timing for inference, indexing, and infrastructure operations, while per-session start and end timestamps for individual agent conversations require additional logging configuration at the AI application layer.

For requirement (2) databases queried, PAIS knowledge bases can be linked to data sources that supply content for retrieval-augmented generation, and indexing operations record timing metrics tied to those configured data sources. Per-query identification of which specific data source returned matching content requires additional instrumentation beyond the indexing record.

For requirement (3) input data matched, knowledge base indexing records aggregate operations across documents but does not record which specific input content matched individual retrieval queries. This requirement is addressed only at aggregate granularity by PAIS itself.

For requirement (4) identification of individuals, PAIS uses VCF SSO and VCF Automation identity for access to deployment and management functions, attributing administrative actions to the authenticated user. Identification of individuals involved in verification of AI results beyond platform identity, such as application-level review and approval workflows, requires additional organizational tooling layered on top of the PAIS platform.

PAIS event logging is strongest for AI service timing and infrastructure observability, partial for data source documentation, and limited for per-query matching and individual verification tracking, which together justify a Contributes rating against this Process-categorized control.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 12.3(b)

> The reference database against which input data has been checked by the system.

**SCF Controls:** AAT-16.8

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

The specific event data elements this control requires, including database query history, matched input data, and the identity of individuals who verified results, are characteristics of AI and autonomous technology applications and must be implemented by those applications. VCF does not operate AI systems or manage AI decision logic directly, so it does not natively record these application-level details. The Consumption layer of VCF, however, provides the audit framework, log collection infrastructure, and forwarding mechanisms that AI workloads running on the platform can use to satisfy the event recording requirements this control specifies.

The Kubernetes API server built into VMware Kubernetes Service (VKS) clusters, managed through the vSphere Supervisor, supports configurable audit logging governed by an audit policy. Each audit event captures the authenticated identity of the requesting user or service account, addressing the control's requirement to identify individuals involved in verification activities. Kubernetes Event objects record the time when events are first observed using the eventTime field with microsecond-level precision, and the API server records requestReceivedTimestamp and stageTimestamp fields in each audit event, addressing the start and end time requirements. Kubernetes audit policy determines which events are recorded and at what detail level, with log-file and webhook backends available for routing structured audit events to external log management systems for retention and analysis.

For application-level log collection, VKS clusters run Fluent Bit as a standard package deployed in the vmware-system-logging namespace. Fluent Bit automatically collects container logs, Kubernetes API audit logs, Linux daemon logs, and Linux authentication logs from every node, and can forward these streams to VCF Log Management over the CFAPI protocol or to external systems including Syslog, HTTP, Elasticsearch, Kafka, and Splunk. For workloads running in vSphere Namespaces, the LogAgentConfiguration Custom Resource enables structured Syslog streaming; each log message automatically includes the namespace name, pod UID, pod name, container name, and ESX host name, giving operators the context needed to correlate events back to specific workloads and requesting identities. Kubernetes also records pod scheduling, image pull operations, and container creation events with timestamps and source information in the event log, providing an infrastructure-level audit trail that complements application-generated records.

Argo CD, when deployed as a Supervisor Service, records application synchronization events including resource creation, sync status, and health status with timestamps, providing an additional audit trail for GitOps-managed AI workload deployments. AI workloads that produce structured event records can write them to standard output or dedicated log streams, which Fluent Bit collects and forwards without requiring additional agent deployment within the workload.

Operators enabling AI workloads on VKS should configure Kubernetes audit policies to capture API interactions at the Request or RequestResponse level, enable Fluent Bit forwarding to a centralized log management system, and apply the LogAgentConfiguration Custom Resource to vSphere Namespaces hosting AI workloads. AI application owners must implement structured logging that captures the four data elements this control requires; the platform supplies the collection, forwarding, and retention infrastructure that makes those records durable and queryable.

VMware Private AI Services (PAIS) provides AI-specific observability and logging mechanisms that partially address the enumerated requirements over and above platform-level logging.

For requirement (1) timestamps, PAIS supports LLM trace collection that sends traces from agents and knowledge base indexing to an OpenTelemetry Collector using HTTP/protobuf or gRPC, capturing timing information for AI service operations. Trace collection is activated by uncommenting the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge base operations record timing metrics including total time for downloading files, total time for generating embeddings, and total time of the index operation. PAIS Controller metrics are exposed at the Prometheus endpoint on the pais-controller-manager service, and observability can be activated through the PAISConfiguration custom resource to enable Prometheus metrics collection with a configurable storage class and retention period. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log. PAIS controller pod metrics can be streamed from the Supervisor cluster to VCF Operations, and PAIS metrics can be visualized in Grafana and VCF Operations. These mechanisms cover timing for inference, indexing, and infrastructure operations, while per-session start and end timestamps for individual agent conversations require additional logging configuration at the AI application layer.

For requirement (2) databases queried, PAIS knowledge bases can be linked to data sources that supply content for retrieval-augmented generation, and indexing operations record timing metrics tied to those configured data sources. Per-query identification of which specific data source returned matching content requires additional instrumentation beyond the indexing record.

For requirement (3) input data matched, knowledge base indexing records aggregate operations across documents but does not record which specific input content matched individual retrieval queries. This requirement is addressed only at aggregate granularity by PAIS itself.

For requirement (4) identification of individuals, PAIS uses VCF SSO and VCF Automation identity for access to deployment and management functions, attributing administrative actions to the authenticated user. Identification of individuals involved in verification of AI results beyond platform identity, such as application-level review and approval workflows, requires additional organizational tooling layered on top of the PAIS platform.

PAIS event logging is strongest for AI service timing and infrastructure observability, partial for data source documentation, and limited for per-query matching and individual verification tracking, which together justify a Contributes rating against this Process-categorized control.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 12.3(c)

> The input data for which the search has led to a match.

**SCF Controls:** AAT-16.8

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

The specific event data elements this control requires, including database query history, matched input data, and the identity of individuals who verified results, are characteristics of AI and autonomous technology applications and must be implemented by those applications. VCF does not operate AI systems or manage AI decision logic directly, so it does not natively record these application-level details. The Consumption layer of VCF, however, provides the audit framework, log collection infrastructure, and forwarding mechanisms that AI workloads running on the platform can use to satisfy the event recording requirements this control specifies.

The Kubernetes API server built into VMware Kubernetes Service (VKS) clusters, managed through the vSphere Supervisor, supports configurable audit logging governed by an audit policy. Each audit event captures the authenticated identity of the requesting user or service account, addressing the control's requirement to identify individuals involved in verification activities. Kubernetes Event objects record the time when events are first observed using the eventTime field with microsecond-level precision, and the API server records requestReceivedTimestamp and stageTimestamp fields in each audit event, addressing the start and end time requirements. Kubernetes audit policy determines which events are recorded and at what detail level, with log-file and webhook backends available for routing structured audit events to external log management systems for retention and analysis.

For application-level log collection, VKS clusters run Fluent Bit as a standard package deployed in the vmware-system-logging namespace. Fluent Bit automatically collects container logs, Kubernetes API audit logs, Linux daemon logs, and Linux authentication logs from every node, and can forward these streams to VCF Log Management over the CFAPI protocol or to external systems including Syslog, HTTP, Elasticsearch, Kafka, and Splunk. For workloads running in vSphere Namespaces, the LogAgentConfiguration Custom Resource enables structured Syslog streaming; each log message automatically includes the namespace name, pod UID, pod name, container name, and ESX host name, giving operators the context needed to correlate events back to specific workloads and requesting identities. Kubernetes also records pod scheduling, image pull operations, and container creation events with timestamps and source information in the event log, providing an infrastructure-level audit trail that complements application-generated records.

Argo CD, when deployed as a Supervisor Service, records application synchronization events including resource creation, sync status, and health status with timestamps, providing an additional audit trail for GitOps-managed AI workload deployments. AI workloads that produce structured event records can write them to standard output or dedicated log streams, which Fluent Bit collects and forwards without requiring additional agent deployment within the workload.

Operators enabling AI workloads on VKS should configure Kubernetes audit policies to capture API interactions at the Request or RequestResponse level, enable Fluent Bit forwarding to a centralized log management system, and apply the LogAgentConfiguration Custom Resource to vSphere Namespaces hosting AI workloads. AI application owners must implement structured logging that captures the four data elements this control requires; the platform supplies the collection, forwarding, and retention infrastructure that makes those records durable and queryable.

VMware Private AI Services (PAIS) provides AI-specific observability and logging mechanisms that partially address the enumerated requirements over and above platform-level logging.

For requirement (1) timestamps, PAIS supports LLM trace collection that sends traces from agents and knowledge base indexing to an OpenTelemetry Collector using HTTP/protobuf or gRPC, capturing timing information for AI service operations. Trace collection is activated by uncommenting the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge base operations record timing metrics including total time for downloading files, total time for generating embeddings, and total time of the index operation. PAIS Controller metrics are exposed at the Prometheus endpoint on the pais-controller-manager service, and observability can be activated through the PAISConfiguration custom resource to enable Prometheus metrics collection with a configurable storage class and retention period. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log. PAIS controller pod metrics can be streamed from the Supervisor cluster to VCF Operations, and PAIS metrics can be visualized in Grafana and VCF Operations. These mechanisms cover timing for inference, indexing, and infrastructure operations, while per-session start and end timestamps for individual agent conversations require additional logging configuration at the AI application layer.

For requirement (2) databases queried, PAIS knowledge bases can be linked to data sources that supply content for retrieval-augmented generation, and indexing operations record timing metrics tied to those configured data sources. Per-query identification of which specific data source returned matching content requires additional instrumentation beyond the indexing record.

For requirement (3) input data matched, knowledge base indexing records aggregate operations across documents but does not record which specific input content matched individual retrieval queries. This requirement is addressed only at aggregate granularity by PAIS itself.

For requirement (4) identification of individuals, PAIS uses VCF SSO and VCF Automation identity for access to deployment and management functions, attributing administrative actions to the authenticated user. Identification of individuals involved in verification of AI results beyond platform identity, such as application-level review and approval workflows, requires additional organizational tooling layered on top of the PAIS platform.

PAIS event logging is strongest for AI service timing and infrastructure observability, partial for data source documentation, and limited for per-query matching and individual verification tracking, which together justify a Contributes rating against this Process-categorized control.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 12.3(d)

> The identification of the natural persons involved in the verification of the results, as referred to in Article 14(5).

**SCF Controls:** AAT-16.8

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

The specific event data elements this control requires, including database query history, matched input data, and the identity of individuals who verified results, are characteristics of AI and autonomous technology applications and must be implemented by those applications. VCF does not operate AI systems or manage AI decision logic directly, so it does not natively record these application-level details. The Consumption layer of VCF, however, provides the audit framework, log collection infrastructure, and forwarding mechanisms that AI workloads running on the platform can use to satisfy the event recording requirements this control specifies.

The Kubernetes API server built into VMware Kubernetes Service (VKS) clusters, managed through the vSphere Supervisor, supports configurable audit logging governed by an audit policy. Each audit event captures the authenticated identity of the requesting user or service account, addressing the control's requirement to identify individuals involved in verification activities. Kubernetes Event objects record the time when events are first observed using the eventTime field with microsecond-level precision, and the API server records requestReceivedTimestamp and stageTimestamp fields in each audit event, addressing the start and end time requirements. Kubernetes audit policy determines which events are recorded and at what detail level, with log-file and webhook backends available for routing structured audit events to external log management systems for retention and analysis.

For application-level log collection, VKS clusters run Fluent Bit as a standard package deployed in the vmware-system-logging namespace. Fluent Bit automatically collects container logs, Kubernetes API audit logs, Linux daemon logs, and Linux authentication logs from every node, and can forward these streams to VCF Log Management over the CFAPI protocol or to external systems including Syslog, HTTP, Elasticsearch, Kafka, and Splunk. For workloads running in vSphere Namespaces, the LogAgentConfiguration Custom Resource enables structured Syslog streaming; each log message automatically includes the namespace name, pod UID, pod name, container name, and ESX host name, giving operators the context needed to correlate events back to specific workloads and requesting identities. Kubernetes also records pod scheduling, image pull operations, and container creation events with timestamps and source information in the event log, providing an infrastructure-level audit trail that complements application-generated records.

Argo CD, when deployed as a Supervisor Service, records application synchronization events including resource creation, sync status, and health status with timestamps, providing an additional audit trail for GitOps-managed AI workload deployments. AI workloads that produce structured event records can write them to standard output or dedicated log streams, which Fluent Bit collects and forwards without requiring additional agent deployment within the workload.

Operators enabling AI workloads on VKS should configure Kubernetes audit policies to capture API interactions at the Request or RequestResponse level, enable Fluent Bit forwarding to a centralized log management system, and apply the LogAgentConfiguration Custom Resource to vSphere Namespaces hosting AI workloads. AI application owners must implement structured logging that captures the four data elements this control requires; the platform supplies the collection, forwarding, and retention infrastructure that makes those records durable and queryable.

VMware Private AI Services (PAIS) provides AI-specific observability and logging mechanisms that partially address the enumerated requirements over and above platform-level logging.

For requirement (1) timestamps, PAIS supports LLM trace collection that sends traces from agents and knowledge base indexing to an OpenTelemetry Collector using HTTP/protobuf or gRPC, capturing timing information for AI service operations. Trace collection is activated by uncommenting the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge base operations record timing metrics including total time for downloading files, total time for generating embeddings, and total time of the index operation. PAIS Controller metrics are exposed at the Prometheus endpoint on the pais-controller-manager service, and observability can be activated through the PAISConfiguration custom resource to enable Prometheus metrics collection with a configurable storage class and retention period. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log. PAIS controller pod metrics can be streamed from the Supervisor cluster to VCF Operations, and PAIS metrics can be visualized in Grafana and VCF Operations. These mechanisms cover timing for inference, indexing, and infrastructure operations, while per-session start and end timestamps for individual agent conversations require additional logging configuration at the AI application layer.

For requirement (2) databases queried, PAIS knowledge bases can be linked to data sources that supply content for retrieval-augmented generation, and indexing operations record timing metrics tied to those configured data sources. Per-query identification of which specific data source returned matching content requires additional instrumentation beyond the indexing record.

For requirement (3) input data matched, knowledge base indexing records aggregate operations across documents but does not record which specific input content matched individual retrieval queries. This requirement is addressed only at aggregate granularity by PAIS itself.

For requirement (4) identification of individuals, PAIS uses VCF SSO and VCF Automation identity for access to deployment and management functions, attributing administrative actions to the authenticated user. Identification of individuals involved in verification of AI results beyond platform identity, such as application-level review and approval workflows, requires additional organizational tooling layered on top of the PAIS platform.

PAIS event logging is strongest for AI service timing and infrastructure observability, partial for data source documentation, and limited for per-query matching and individual verification tracking, which together justify a Contributes rating against this Process-categorized control.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.1

> High-risk AI systems shall be designed and developed in such a way as to ensure that their operation is sufficiently transparent to enable deployers to interpret a system’s output and use it appropriately. An appropriate type and degree of transparency shall be ensured with a view to achieving compliance with the relevant obligations of the provider and deployer set out in Section 3.

**SCF Controls:** AAT-09, AAT-09.1, AAT-20, AAT-20.1

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides infrastructure that supports accuracy, robustness, and cybersecurity across the AI workload lifecycle with competent oversight. For development and validation, PAIS publishes catalog items in VCF Automation that include AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, giving data scientists and MLOps engineers consistent environments for prototyping, fine-tuning, and validation on the same GPU-accelerated infrastructure used in production. Models are stored in a Harbor registry service in the Supervisor, and PAIS can also integrate with OCI-compliant registries from other vendors. PAIS retrieves models with authentication and certificate-based trust, and a CA trust bundle is used for secure communication with external services and databases, helping maintain integrity from development through inference.

For consistent performance throughout the lifecycle, PAIS exposes application-level observability that is activated by updating the PAISConfiguration custom resource. The spec.observability.prometheusRuntime section turns on Prometheus metrics collection for PAIS components, and the PAISConfiguration parameters also enable forwarding of LLM traces to an OpenTelemetry (OTel) Collector for request-level tracing. PAIS controller pod metrics are integrated into observability platforms through Telegraf configuration in the Supervisor instance, and DevOps engineers, MLOps engineers, and application developers can visualize health and performance metrics in Grafana and VCF Operations to track the health, quality, and behavior of AI applications. The Prometheus runtime is configured with a storage class policy and a configurable metrics retention period that controls how long metrics are stored. Knowledge base operations record timing metrics including total time for downloading files, generating embeddings, and indexing.

For oversight by competent individuals, PAIS must be activated in organization namespaces by an organization administrator or MLOps engineer after namespace creation, and activation requires coordination with the OIDC provider administrator to set up identity and access management. PAIS provides a UI and API for AI application developers to interact with deployed models and services within their authorized namespaces. For agent-based workloads, PAIS requires examination and approval of MCP server tools and capabilities before use in agents, and the PAIS Agent Builder maintains a list of approved tools for use in AI agents when connecting to MCP servers, supporting human review of capabilities that agents can invoke. Underlying VCF platform mechanisms such as vSphere High Availability, Distributed Resource Scheduler, and vMotion support continuous operation of AI workloads through infrastructure events; identity is provided by VCF SSO and is an inherited platform capability rather than a PAIS-native one.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.2

> High-risk AI systems shall be accompanied by instructions for use in an appropriate digital format or otherwise that include concise, complete, correct and clear information that is relevant, accessible and comprehensible to deployers.

**SCF Controls:** AAT-20.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to AI implementation documentation by providing documented compute and hardware resource requirements, event log collection mechanisms, and infrastructure configuration references that support the documentation of AI deployment environments. VCF's compatibility guides document supported hardware, VCF Operations tracks infrastructure configuration, and VCF Log Management documents the event collection architecture.

Documenting AI model architecture, training methodology, and decision logic is outside VCF's scope.

VMware Private AI Services (PAIS), formerly Private AI Services, provides documentation and platform features that address several of the listed implementation documentation requirements. For computational and hardware resource requirements (item 6), the platform documents the system architecture of PAIS deployments, including GPU-accelerated workload domain requirements, vGPU profile configurations, VM class definitions for AI workloads, and the NVIDIA GPU and driver compatibility requirements. VI administrators configure vGPU-based VM classes that define the GPU resource allocations available to AI workloads. The PAIS catalog items in VCF Automation, including AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, document the components users can provision in selected namespaces, and the deployment Overview tab summarizes the installed software and the access points for the application, services, and workstation VM. PAIS setup is documented for both connected and disconnected (air-gapped) deployment models, with a Harbor registry in the Supervisor or another OCI-compliant registry used to store validated ML models.

For event logging mechanisms (item 8), the platform documents multiple logging and telemetry capabilities. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log, and they provide JupyterLab instances and console logs for verifying component installation and operation. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. PAIS Controller pod metrics are exposed at a Prometheus endpoint on the pais-controller-manager service and are integrated into observability platforms through Telegraf configuration in the Supervisor instance, with VCF Operations as the documented consuming platform. Deep Learning VMs also expose vGPU performance metrics through Prometheus. PAIS supports LLM traces collection in an OpenTelemetry Collector by configuring the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge Base operations track crawled documents, new documents found, deleted documents, modified documents requiring embeddings updates, and skipped documents, and record timing metrics for download, embedding generation, and the overall index operation.

For human oversight measures (item 5) and for interpreting outputs (items 4 and 5), MLOps engineers analyze LLM traces and Prometheus metrics to inspect agent execution flow across components and knowledge base indexing. The PAIS Agent Builder maintains a list of approved tools for use in AI agents and requires examination and approval of MCP server tools and capabilities before they are used by agents. Knowledge Bases are created with linked data sources such as Microsoft SharePoint sites and Amazon S3-compatible stores, which gives implementers a documented data lineage for retrieval-augmented generation outputs. Access to PAIS is controlled through OIDC authorized groups, where user accounts must be members of specified groups to consume the service, and personal access tokens generated from user account settings provide programmatic access to Knowledge Bases and data sources.

Requirements 1 (provider contact details), 2 (characteristics, capabilities, and limitations of the AI system), 3 (errata from initial conformity assessment), and 7 (projected useable lifetime) are documentation obligations carried by model vendors and the deploying organization rather than by the infrastructure platform. PAIS supplies registry and catalog mechanisms that organizations can attach revision and provenance metadata to, but the substantive documentation content for those items is outside the platform's scope.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.3(a)

> The identity and the contact details of the provider and, where applicable, of its authorised representative.

**SCF Controls:** AAT-20.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.3(b)(i)

> Its intended purpose.

**SCF Controls:** AAT-20.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.3(b)(ii)

> The level of accuracy, including its metrics, robustness and cybersecurity referred to in Article 15 against which the high-risk AI system has been tested and validated and which can be expected, and any known and foreseeable circumstances that may have an impact on that expected level of accuracy, robustness and cybersecurity.

**SCF Controls:** AAT-20.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.3(b)(iii)

> Any known or foreseeable circumstance, related to the use of the high-risk AI system in accordance with its intended purpose or under conditions of reasonably foreseeable misuse, which may lead to risks to the health and safety or fundamental rights referred to in Article 9(2).

**SCF Controls:** AAT-20.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.3(b)(iv)

> Where applicable, the technical capabilities and characteristics of the high-risk AI system to provide information that is relevant to explain its output.

**SCF Controls:** AAT-20.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to AI implementation documentation by providing documented compute and hardware resource requirements, event log collection mechanisms, and infrastructure configuration references that support the documentation of AI deployment environments. VCF's compatibility guides document supported hardware, VCF Operations tracks infrastructure configuration, and VCF Log Management documents the event collection architecture.

Documenting AI model architecture, training methodology, and decision logic is outside VCF's scope.

VMware Private AI Services (PAIS), formerly Private AI Services, provides documentation and platform features that address several of the listed implementation documentation requirements. For computational and hardware resource requirements (item 6), the platform documents the system architecture of PAIS deployments, including GPU-accelerated workload domain requirements, vGPU profile configurations, VM class definitions for AI workloads, and the NVIDIA GPU and driver compatibility requirements. VI administrators configure vGPU-based VM classes that define the GPU resource allocations available to AI workloads. The PAIS catalog items in VCF Automation, including AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, document the components users can provision in selected namespaces, and the deployment Overview tab summarizes the installed software and the access points for the application, services, and workstation VM. PAIS setup is documented for both connected and disconnected (air-gapped) deployment models, with a Harbor registry in the Supervisor or another OCI-compliant registry used to store validated ML models.

For event logging mechanisms (item 8), the platform documents multiple logging and telemetry capabilities. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log, and they provide JupyterLab instances and console logs for verifying component installation and operation. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. PAIS Controller pod metrics are exposed at a Prometheus endpoint on the pais-controller-manager service and are integrated into observability platforms through Telegraf configuration in the Supervisor instance, with VCF Operations as the documented consuming platform. Deep Learning VMs also expose vGPU performance metrics through Prometheus. PAIS supports LLM traces collection in an OpenTelemetry Collector by configuring the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge Base operations track crawled documents, new documents found, deleted documents, modified documents requiring embeddings updates, and skipped documents, and record timing metrics for download, embedding generation, and the overall index operation.

For human oversight measures (item 5) and for interpreting outputs (items 4 and 5), MLOps engineers analyze LLM traces and Prometheus metrics to inspect agent execution flow across components and knowledge base indexing. The PAIS Agent Builder maintains a list of approved tools for use in AI agents and requires examination and approval of MCP server tools and capabilities before they are used by agents. Knowledge Bases are created with linked data sources such as Microsoft SharePoint sites and Amazon S3-compatible stores, which gives implementers a documented data lineage for retrieval-augmented generation outputs. Access to PAIS is controlled through OIDC authorized groups, where user accounts must be members of specified groups to consume the service, and personal access tokens generated from user account settings provide programmatic access to Knowledge Bases and data sources.

Requirements 1 (provider contact details), 2 (characteristics, capabilities, and limitations of the AI system), 3 (errata from initial conformity assessment), and 7 (projected useable lifetime) are documentation obligations carried by model vendors and the deploying organization rather than by the infrastructure platform. PAIS supplies registry and catalog mechanisms that organizations can attach revision and provenance metadata to, but the substantive documentation content for those items is outside the platform's scope.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.3(b)(v)

> When appropriate, its performance regarding specific persons or groups of persons on which the system is intended to be used.

**SCF Controls:** AAT-20.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.3(b)(vi)

> When appropriate, specifications for the input data, or any other relevant information in terms of the training, validation and testing data sets used, taking into account the intended purpose of the high-risk AI system.

**SCF Controls:** AAT-20.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to AI implementation documentation by providing documented compute and hardware resource requirements, event log collection mechanisms, and infrastructure configuration references that support the documentation of AI deployment environments. VCF's compatibility guides document supported hardware, VCF Operations tracks infrastructure configuration, and VCF Log Management documents the event collection architecture.

Documenting AI model architecture, training methodology, and decision logic is outside VCF's scope.

VMware Private AI Services (PAIS), formerly Private AI Services, provides documentation and platform features that address several of the listed implementation documentation requirements. For computational and hardware resource requirements (item 6), the platform documents the system architecture of PAIS deployments, including GPU-accelerated workload domain requirements, vGPU profile configurations, VM class definitions for AI workloads, and the NVIDIA GPU and driver compatibility requirements. VI administrators configure vGPU-based VM classes that define the GPU resource allocations available to AI workloads. The PAIS catalog items in VCF Automation, including AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, document the components users can provision in selected namespaces, and the deployment Overview tab summarizes the installed software and the access points for the application, services, and workstation VM. PAIS setup is documented for both connected and disconnected (air-gapped) deployment models, with a Harbor registry in the Supervisor or another OCI-compliant registry used to store validated ML models.

For event logging mechanisms (item 8), the platform documents multiple logging and telemetry capabilities. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log, and they provide JupyterLab instances and console logs for verifying component installation and operation. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. PAIS Controller pod metrics are exposed at a Prometheus endpoint on the pais-controller-manager service and are integrated into observability platforms through Telegraf configuration in the Supervisor instance, with VCF Operations as the documented consuming platform. Deep Learning VMs also expose vGPU performance metrics through Prometheus. PAIS supports LLM traces collection in an OpenTelemetry Collector by configuring the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge Base operations track crawled documents, new documents found, deleted documents, modified documents requiring embeddings updates, and skipped documents, and record timing metrics for download, embedding generation, and the overall index operation.

For human oversight measures (item 5) and for interpreting outputs (items 4 and 5), MLOps engineers analyze LLM traces and Prometheus metrics to inspect agent execution flow across components and knowledge base indexing. The PAIS Agent Builder maintains a list of approved tools for use in AI agents and requires examination and approval of MCP server tools and capabilities before they are used by agents. Knowledge Bases are created with linked data sources such as Microsoft SharePoint sites and Amazon S3-compatible stores, which gives implementers a documented data lineage for retrieval-augmented generation outputs. Access to PAIS is controlled through OIDC authorized groups, where user accounts must be members of specified groups to consume the service, and personal access tokens generated from user account settings provide programmatic access to Knowledge Bases and data sources.

Requirements 1 (provider contact details), 2 (characteristics, capabilities, and limitations of the AI system), 3 (errata from initial conformity assessment), and 7 (projected useable lifetime) are documentation obligations carried by model vendors and the deploying organization rather than by the infrastructure platform. PAIS supplies registry and catalog mechanisms that organizations can attach revision and provenance metadata to, but the substantive documentation content for those items is outside the platform's scope.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.3(b)(vii)

> Where applicable, information to enable deployers to interpret the output of the high-risk AI system and use it appropriately.

**SCF Controls:** AAT-20.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to AI implementation documentation by providing documented compute and hardware resource requirements, event log collection mechanisms, and infrastructure configuration references that support the documentation of AI deployment environments. VCF's compatibility guides document supported hardware, VCF Operations tracks infrastructure configuration, and VCF Log Management documents the event collection architecture.

Documenting AI model architecture, training methodology, and decision logic is outside VCF's scope.

VMware Private AI Services (PAIS), formerly Private AI Services, provides documentation and platform features that address several of the listed implementation documentation requirements. For computational and hardware resource requirements (item 6), the platform documents the system architecture of PAIS deployments, including GPU-accelerated workload domain requirements, vGPU profile configurations, VM class definitions for AI workloads, and the NVIDIA GPU and driver compatibility requirements. VI administrators configure vGPU-based VM classes that define the GPU resource allocations available to AI workloads. The PAIS catalog items in VCF Automation, including AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, document the components users can provision in selected namespaces, and the deployment Overview tab summarizes the installed software and the access points for the application, services, and workstation VM. PAIS setup is documented for both connected and disconnected (air-gapped) deployment models, with a Harbor registry in the Supervisor or another OCI-compliant registry used to store validated ML models.

For event logging mechanisms (item 8), the platform documents multiple logging and telemetry capabilities. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log, and they provide JupyterLab instances and console logs for verifying component installation and operation. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. PAIS Controller pod metrics are exposed at a Prometheus endpoint on the pais-controller-manager service and are integrated into observability platforms through Telegraf configuration in the Supervisor instance, with VCF Operations as the documented consuming platform. Deep Learning VMs also expose vGPU performance metrics through Prometheus. PAIS supports LLM traces collection in an OpenTelemetry Collector by configuring the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge Base operations track crawled documents, new documents found, deleted documents, modified documents requiring embeddings updates, and skipped documents, and record timing metrics for download, embedding generation, and the overall index operation.

For human oversight measures (item 5) and for interpreting outputs (items 4 and 5), MLOps engineers analyze LLM traces and Prometheus metrics to inspect agent execution flow across components and knowledge base indexing. The PAIS Agent Builder maintains a list of approved tools for use in AI agents and requires examination and approval of MCP server tools and capabilities before they are used by agents. Knowledge Bases are created with linked data sources such as Microsoft SharePoint sites and Amazon S3-compatible stores, which gives implementers a documented data lineage for retrieval-augmented generation outputs. Access to PAIS is controlled through OIDC authorized groups, where user accounts must be members of specified groups to consume the service, and personal access tokens generated from user account settings provide programmatic access to Knowledge Bases and data sources.

Requirements 1 (provider contact details), 2 (characteristics, capabilities, and limitations of the AI system), 3 (errata from initial conformity assessment), and 7 (projected useable lifetime) are documentation obligations carried by model vendors and the deploying organization rather than by the infrastructure platform. PAIS supplies registry and catalog mechanisms that organizations can attach revision and provenance metadata to, but the substantive documentation content for those items is outside the platform's scope.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.3(c)

> The changes to the high-risk AI system and its performance which have been pre-determined by the provider at the moment of the initial conformity assessment, if any.

**SCF Controls:** AAT-20.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.3(d)

> The human oversight measures referred to in Article 14, including the technical measures put in place to facilitate the interpretation of the outputs of the high-risk AI systems by the deployers.

**SCF Controls:** AAT-20.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to AI implementation documentation by providing documented compute and hardware resource requirements, event log collection mechanisms, and infrastructure configuration references that support the documentation of AI deployment environments. VCF's compatibility guides document supported hardware, VCF Operations tracks infrastructure configuration, and VCF Log Management documents the event collection architecture.

Documenting AI model architecture, training methodology, and decision logic is outside VCF's scope.

VMware Private AI Services (PAIS), formerly Private AI Services, provides documentation and platform features that address several of the listed implementation documentation requirements. For computational and hardware resource requirements (item 6), the platform documents the system architecture of PAIS deployments, including GPU-accelerated workload domain requirements, vGPU profile configurations, VM class definitions for AI workloads, and the NVIDIA GPU and driver compatibility requirements. VI administrators configure vGPU-based VM classes that define the GPU resource allocations available to AI workloads. The PAIS catalog items in VCF Automation, including AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, document the components users can provision in selected namespaces, and the deployment Overview tab summarizes the installed software and the access points for the application, services, and workstation VM. PAIS setup is documented for both connected and disconnected (air-gapped) deployment models, with a Harbor registry in the Supervisor or another OCI-compliant registry used to store validated ML models.

For event logging mechanisms (item 8), the platform documents multiple logging and telemetry capabilities. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log, and they provide JupyterLab instances and console logs for verifying component installation and operation. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. PAIS Controller pod metrics are exposed at a Prometheus endpoint on the pais-controller-manager service and are integrated into observability platforms through Telegraf configuration in the Supervisor instance, with VCF Operations as the documented consuming platform. Deep Learning VMs also expose vGPU performance metrics through Prometheus. PAIS supports LLM traces collection in an OpenTelemetry Collector by configuring the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge Base operations track crawled documents, new documents found, deleted documents, modified documents requiring embeddings updates, and skipped documents, and record timing metrics for download, embedding generation, and the overall index operation.

For human oversight measures (item 5) and for interpreting outputs (items 4 and 5), MLOps engineers analyze LLM traces and Prometheus metrics to inspect agent execution flow across components and knowledge base indexing. The PAIS Agent Builder maintains a list of approved tools for use in AI agents and requires examination and approval of MCP server tools and capabilities before they are used by agents. Knowledge Bases are created with linked data sources such as Microsoft SharePoint sites and Amazon S3-compatible stores, which gives implementers a documented data lineage for retrieval-augmented generation outputs. Access to PAIS is controlled through OIDC authorized groups, where user accounts must be members of specified groups to consume the service, and personal access tokens generated from user account settings provide programmatic access to Knowledge Bases and data sources.

Requirements 1 (provider contact details), 2 (characteristics, capabilities, and limitations of the AI system), 3 (errata from initial conformity assessment), and 7 (projected useable lifetime) are documentation obligations carried by model vendors and the deploying organization rather than by the infrastructure platform. PAIS supplies registry and catalog mechanisms that organizations can attach revision and provenance metadata to, but the substantive documentation content for those items is outside the platform's scope.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.3(e)

> The computational and hardware resources needed, the expected lifetime of the high-risk AI system and any necessary maintenance and care measures, including their frequency, to ensure the proper functioning of that AI system, including as regards software updates.

**SCF Controls:** AAT-20.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to AI implementation documentation by providing documented compute and hardware resource requirements, event log collection mechanisms, and infrastructure configuration references that support the documentation of AI deployment environments. VCF's compatibility guides document supported hardware, VCF Operations tracks infrastructure configuration, and VCF Log Management documents the event collection architecture.

Documenting AI model architecture, training methodology, and decision logic is outside VCF's scope.

VMware Private AI Services (PAIS), formerly Private AI Services, provides documentation and platform features that address several of the listed implementation documentation requirements. For computational and hardware resource requirements (item 6), the platform documents the system architecture of PAIS deployments, including GPU-accelerated workload domain requirements, vGPU profile configurations, VM class definitions for AI workloads, and the NVIDIA GPU and driver compatibility requirements. VI administrators configure vGPU-based VM classes that define the GPU resource allocations available to AI workloads. The PAIS catalog items in VCF Automation, including AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, document the components users can provision in selected namespaces, and the deployment Overview tab summarizes the installed software and the access points for the application, services, and workstation VM. PAIS setup is documented for both connected and disconnected (air-gapped) deployment models, with a Harbor registry in the Supervisor or another OCI-compliant registry used to store validated ML models.

For event logging mechanisms (item 8), the platform documents multiple logging and telemetry capabilities. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log, and they provide JupyterLab instances and console logs for verifying component installation and operation. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. PAIS Controller pod metrics are exposed at a Prometheus endpoint on the pais-controller-manager service and are integrated into observability platforms through Telegraf configuration in the Supervisor instance, with VCF Operations as the documented consuming platform. Deep Learning VMs also expose vGPU performance metrics through Prometheus. PAIS supports LLM traces collection in an OpenTelemetry Collector by configuring the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge Base operations track crawled documents, new documents found, deleted documents, modified documents requiring embeddings updates, and skipped documents, and record timing metrics for download, embedding generation, and the overall index operation.

For human oversight measures (item 5) and for interpreting outputs (items 4 and 5), MLOps engineers analyze LLM traces and Prometheus metrics to inspect agent execution flow across components and knowledge base indexing. The PAIS Agent Builder maintains a list of approved tools for use in AI agents and requires examination and approval of MCP server tools and capabilities before they are used by agents. Knowledge Bases are created with linked data sources such as Microsoft SharePoint sites and Amazon S3-compatible stores, which gives implementers a documented data lineage for retrieval-augmented generation outputs. Access to PAIS is controlled through OIDC authorized groups, where user accounts must be members of specified groups to consume the service, and personal access tokens generated from user account settings provide programmatic access to Knowledge Bases and data sources.

Requirements 1 (provider contact details), 2 (characteristics, capabilities, and limitations of the AI system), 3 (errata from initial conformity assessment), and 7 (projected useable lifetime) are documentation obligations carried by model vendors and the deploying organization rather than by the infrastructure platform. PAIS supplies registry and catalog mechanisms that organizations can attach revision and provenance metadata to, but the substantive documentation content for those items is outside the platform's scope.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 13.3(f)

> Where relevant, a description of the mechanisms included within the high-risk AI system that allows deployers to properly collect, store and interpret the logs in accordance with Article 12.

**SCF Controls:** AAT-20.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to AI implementation documentation by providing documented compute and hardware resource requirements, event log collection mechanisms, and infrastructure configuration references that support the documentation of AI deployment environments. VCF's compatibility guides document supported hardware, VCF Operations tracks infrastructure configuration, and VCF Log Management documents the event collection architecture.

Documenting AI model architecture, training methodology, and decision logic is outside VCF's scope.

VMware Private AI Services (PAIS), formerly Private AI Services, provides documentation and platform features that address several of the listed implementation documentation requirements. For computational and hardware resource requirements (item 6), the platform documents the system architecture of PAIS deployments, including GPU-accelerated workload domain requirements, vGPU profile configurations, VM class definitions for AI workloads, and the NVIDIA GPU and driver compatibility requirements. VI administrators configure vGPU-based VM classes that define the GPU resource allocations available to AI workloads. The PAIS catalog items in VCF Automation, including AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, document the components users can provision in selected namespaces, and the deployment Overview tab summarizes the installed software and the access points for the application, services, and workstation VM. PAIS setup is documented for both connected and disconnected (air-gapped) deployment models, with a Harbor registry in the Supervisor or another OCI-compliant registry used to store validated ML models.

For event logging mechanisms (item 8), the platform documents multiple logging and telemetry capabilities. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log, and they provide JupyterLab instances and console logs for verifying component installation and operation. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. PAIS Controller pod metrics are exposed at a Prometheus endpoint on the pais-controller-manager service and are integrated into observability platforms through Telegraf configuration in the Supervisor instance, with VCF Operations as the documented consuming platform. Deep Learning VMs also expose vGPU performance metrics through Prometheus. PAIS supports LLM traces collection in an OpenTelemetry Collector by configuring the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge Base operations track crawled documents, new documents found, deleted documents, modified documents requiring embeddings updates, and skipped documents, and record timing metrics for download, embedding generation, and the overall index operation.

For human oversight measures (item 5) and for interpreting outputs (items 4 and 5), MLOps engineers analyze LLM traces and Prometheus metrics to inspect agent execution flow across components and knowledge base indexing. The PAIS Agent Builder maintains a list of approved tools for use in AI agents and requires examination and approval of MCP server tools and capabilities before they are used by agents. Knowledge Bases are created with linked data sources such as Microsoft SharePoint sites and Amazon S3-compatible stores, which gives implementers a documented data lineage for retrieval-augmented generation outputs. Access to PAIS is controlled through OIDC authorized groups, where user accounts must be members of specified groups to consume the service, and personal access tokens generated from user account settings provide programmatic access to Knowledge Bases and data sources.

Requirements 1 (provider contact details), 2 (characteristics, capabilities, and limitations of the AI system), 3 (errata from initial conformity assessment), and 7 (projected useable lifetime) are documentation obligations carried by model vendors and the deploying organization rather than by the infrastructure platform. PAIS supplies registry and catalog mechanisms that organizations can attach revision and provenance metadata to, but the substantive documentation content for those items is outside the platform's scope.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.1

> High-risk AI systems shall be designed and developed in such a way, including with appropriate human-machine interface tools, that they can be effectively overseen by natural persons during the period in which they are in use.

**SCF Controls:** AAT-20, TDA-02.3

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides infrastructure that supports accuracy, robustness, and cybersecurity across the AI workload lifecycle with competent oversight. For development and validation, PAIS publishes catalog items in VCF Automation that include AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, giving data scientists and MLOps engineers consistent environments for prototyping, fine-tuning, and validation on the same GPU-accelerated infrastructure used in production. Models are stored in a Harbor registry service in the Supervisor, and PAIS can also integrate with OCI-compliant registries from other vendors. PAIS retrieves models with authentication and certificate-based trust, and a CA trust bundle is used for secure communication with external services and databases, helping maintain integrity from development through inference.

For consistent performance throughout the lifecycle, PAIS exposes application-level observability that is activated by updating the PAISConfiguration custom resource. The spec.observability.prometheusRuntime section turns on Prometheus metrics collection for PAIS components, and the PAISConfiguration parameters also enable forwarding of LLM traces to an OpenTelemetry (OTel) Collector for request-level tracing. PAIS controller pod metrics are integrated into observability platforms through Telegraf configuration in the Supervisor instance, and DevOps engineers, MLOps engineers, and application developers can visualize health and performance metrics in Grafana and VCF Operations to track the health, quality, and behavior of AI applications. The Prometheus runtime is configured with a storage class policy and a configurable metrics retention period that controls how long metrics are stored. Knowledge base operations record timing metrics including total time for downloading files, generating embeddings, and indexing.

For oversight by competent individuals, PAIS must be activated in organization namespaces by an organization administrator or MLOps engineer after namespace creation, and activation requires coordination with the OIDC provider administrator to set up identity and access management. PAIS provides a UI and API for AI application developers to interact with deployed models and services within their authorized namespaces. For agent-based workloads, PAIS requires examination and approval of MCP server tools and capabilities before use in agents, and the PAIS Agent Builder maintains a list of approved tools for use in AI agents when connecting to MCP servers, supporting human review of capabilities that agents can invoke. Underlying VCF platform mechanisms such as vSphere High Availability, Distributed Resource Scheduler, and vMotion support continuous operation of AI workloads through infrastructure events; identity is provided by VCF SSO and is an inherited platform capability rather than a PAIS-native one.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.2

> Human oversight shall aim to prevent or minimise the risks to health, safety or fundamental rights that may emerge when a high-risk AI system is used in accordance with its intended purpose or under conditions of reasonably foreseeable misuse, in particular where such risks persist despite the application of other requirements set out in this Section.

**SCF Controls:** AAT-15.2, AAT-16, AAT-17, AAT-22.1

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides platform mechanisms that support the assignment and enforcement of human oversight over AI workloads, helping organizations reduce risks to health, safety, and fundamental rights.

PAIS uses a validate-then-publish workflow for ML models. MLOps engineers validate models against the security, privacy, and technical requirements of their organization before publishing them to a Harbor registry that PAIS uses as the model gallery in the Supervisor; PAIS is also compatible with OCI-compliant registries from other vendors. A Harbor administrator must create a project for PAIS in the registry before deployment, and a robot account must be configured in the Harbor project allocated for the model gallery so that PAIS can pull model images on the customer's terms. This workflow places explicit human decision points between model acquisition and production availability so that oversight personnel can assess risks before a model becomes consumable by application developers.

PAIS access requires deliberate human configuration at each layer. An organization administrator or MLOps engineer must activate PAIS in organization namespaces after namespace creation, and activation requires coordination with the OIDC provider administrator to set up identity and access management. Once activated, PAIS access is gated through OIDC group membership: only user accounts that belong to specified authorized groups can access the service, configured through the authorizedGroups and oidc-authorized-groups settings during activation. Access to AI capabilities is therefore enabled by intentional administrative action rather than by default.

For AI agents that connect to MCP servers, PAIS requires examination and approval of MCP server tools and capabilities before they can be used in agents, so administrators can define and constrain the set of external tools an agent is allowed to invoke. PAIS deployments can also be bounded by leases, allowing organizations to limit how long a PAIS deployment can exist before review or renewal. PAIS metrics can be visualized in observability platforms for monitoring and audit, giving oversight personnel operational visibility into running AI workloads.

The organizational decisions about what constitutes acceptable AI behavior, who is designated as oversight personnel, and how to assess risk to health, safety, and fundamental rights remain outside PAIS scope.

#### VMware vDefend (Contributes)

VMware vDefend contributes to monitoring the functionality and behavior of deployed AI workloads running on VCF by providing continuous network-level behavioral monitoring, threat detection, and AI-assisted security analysis around those workloads.

Security Intelligence, running on the Security Services Platform, provides continuous network-level behavioral monitoring that detects new traffic flows, unauthorized communications, and anomalous activity around deployed systems, including AI workloads. It continuously monitors for new flows between environments and alerts administrators to unauthorized or unexpected traffic, supporting ongoing policy adjustments. The Segmentation Monitoring Dashboard provides dedicated views for monitoring environment-level traffic flows; when monitoring identifies an environment pair without a configured protection policy, it offers a Run Recommendations option to generate policy recommendations based on observed traffic. Security Intelligence provides Infrastructure, Environment, and Application Monitoring capabilities. The application monitoring view within the Segmentation Monitoring Dashboard surfaces metrics including unprotected flows and applications with unprotected rule hits, providing targeted visibility into workloads, including AI systems, that lack active firewall policy coverage. The Policy Recommendations monitoring capability checks for changes in monitored entity scope every hour when enabled. Security Intelligence also runs a scheduled daily classification job, automatically categorizing compute entities based on traffic flows observed over the prior 30 days.

Intelligent Assist is an AI-assisted analysis feature accessible through the NSX Manager UI and Security Services Platform UI. It provides contextual analysis support on the IDS/IPS, Detections, and Campaigns pages, enabling administrators to investigate security events affecting deployed workloads with AI-driven guidance.

IDS/IPS provides ongoing threat detection through monitoring dashboards scoped to both distributed and gateway deployments. Project-scoped dashboards display events triggered for specific projects, allowing targeted monitoring of AI workload deployments. Network Detection and Response (NDR) applies behavioral analysis to identify suspicious activity targeting monitored workloads. The NDR Sensor periodically checks the status of activated features on the Security Services Platform every 15 minutes and updates its configuration accordingly.

Monitoring AI system functionality at the application layer, including model performance, output quality, and behavioral drift, is outside vDefend's domain and requires additional tooling.

Not applicable for this control: VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.3

> The oversight measures shall be commensurate with the risks, level of autonomy and context of use of the high-risk AI system, and shall be ensured through either one or both of the following types of measures:

**SCF Controls:** AAT-22.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides AI-specific mechanisms that allow organizations to calibrate oversight intensity in proportion to the assessed risk, autonomy level, and context of each AI workload.

PAIS requires examination and approval of MCP (Model Context Protocol) server tools and capabilities before they can be used in agents, giving administrators a deployment-time checkpoint that scopes the actions available to autonomous agents. Access to PAIS itself is controlled through OIDC group membership, with the authorizedGroups setting in PAISConfiguration restricting which groups can deploy or interact with AI workloads in an organization namespace. PAIS must be activated in each organization namespace by an organization administrator or MLOps engineer after namespace creation, which places a deliberate enablement gate before AI workloads become operational.

PAIS includes built-in observability for AI workloads, configured through the PAISConfiguration custom resource. The spec.observability.prometheusRuntime section activates Prometheus metrics collection with a configurable storage class policy and metrics retention period, and the observability.llmTraces setting enables LLM trace forwarding to an OpenTelemetry (OTel) Collector for tracing agent execution flow across components and knowledge base indexing. These metrics and traces support workload-level review of inference behavior proportionate to the autonomy of the deployed model. PAIS controller pod operation metrics integrate into VCF Operations through Telegraf configuration in the Supervisor instance, giving VI administrators visibility alongside other platform telemetry, and the same metrics can be visualized in third-party observability platforms such as Grafana.

PAIS uses a Harbor registry service in the Supervisor (or an OCI-compliant registry from another vendor) to store validated ML models, supporting an inspect-before-publish pattern for AI model artifacts. The Kubernetes RBAC and namespace isolation that scope AI workload deployments are provided by VMware Kubernetes Service (VKS) and the Supervisor (see VCF Coverage), and VCF Automation provides the catalog and blueprint framework through which AI workloads are provisioned. PAIS contributes the AI-specific oversight controls layered on top of those platforms: MCP tool approval, OIDC-scoped activation of AI services in a namespace, validated model storage, and AI workload observability surfaced in VCF Operations.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.3(a)

> Measures identified and built, when technically feasible, into the high-risk AI system by the provider before it is placed on the market or put into service.

**SCF Controls:** AAT-20, CFG-02.5

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides infrastructure that supports accuracy, robustness, and cybersecurity across the AI workload lifecycle with competent oversight. For development and validation, PAIS publishes catalog items in VCF Automation that include AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, giving data scientists and MLOps engineers consistent environments for prototyping, fine-tuning, and validation on the same GPU-accelerated infrastructure used in production. Models are stored in a Harbor registry service in the Supervisor, and PAIS can also integrate with OCI-compliant registries from other vendors. PAIS retrieves models with authentication and certificate-based trust, and a CA trust bundle is used for secure communication with external services and databases, helping maintain integrity from development through inference.

For consistent performance throughout the lifecycle, PAIS exposes application-level observability that is activated by updating the PAISConfiguration custom resource. The spec.observability.prometheusRuntime section turns on Prometheus metrics collection for PAIS components, and the PAISConfiguration parameters also enable forwarding of LLM traces to an OpenTelemetry (OTel) Collector for request-level tracing. PAIS controller pod metrics are integrated into observability platforms through Telegraf configuration in the Supervisor instance, and DevOps engineers, MLOps engineers, and application developers can visualize health and performance metrics in Grafana and VCF Operations to track the health, quality, and behavior of AI applications. The Prometheus runtime is configured with a storage class policy and a configurable metrics retention period that controls how long metrics are stored. Knowledge base operations record timing metrics including total time for downloading files, generating embeddings, and indexing.

For oversight by competent individuals, PAIS must be activated in organization namespaces by an organization administrator or MLOps engineer after namespace creation, and activation requires coordination with the OIDC provider administrator to set up identity and access management. PAIS provides a UI and API for AI application developers to interact with deployed models and services within their authorized namespaces. For agent-based workloads, PAIS requires examination and approval of MCP server tools and capabilities before use in agents, and the PAIS Agent Builder maintains a list of approved tools for use in AI agents when connecting to MCP servers, supporting human review of capabilities that agents can invoke. Underlying VCF platform mechanisms such as vSphere High Availability, Distributed Resource Scheduler, and vMotion support continuous operation of AI workloads through infrastructure events; identity is provided by VCF SSO and is an inherited platform capability rather than a PAIS-native one.

#### VMware vDefend (Contributes)

VMware vDefend provides several capabilities that support applying more restrictive security configurations to technology assets in high-risk network zones.

Security Services Platform (SSP) organizes data center assets into a structured hierarchy of regions, zones, environments, applications, and application tiers. This hierarchy enables administrators to classify workloads into security zones such as Production, Non-Prod, DMZ, PCI, and Development, and to distinguish critical applications from regular ones. Segmentation planning in SSP organizes inventory assets into this defined hierarchy and generates associated security policies for infrastructure services and environments. Application-level prioritization configuration takes precedence over group-level configuration, so policies scoped to critical applications in high-risk zones override broader group-level defaults.

The vDefend distributed firewall enforces security policy at the vNIC level and supports group-based and tag-based policy application. Administrators can define firewall rule sections scoped to specific security zones or application tiers, applying more restrictive allow-lists to high-risk workloads while maintaining broader connectivity for lower-risk environments. PCI-scoped workloads can be microsegmented with deny-all default policies and explicit per-service allow rules, while development workloads operate under less restrictive baselines. The Distributed Firewall organizes rules into pre-defined policy categories (Infrastructure, Environment, and Application) that correspond to the asset hierarchy levels, allowing administrators to layer policy progressively from global to application-level with the most restrictive controls at the application tier.

In environments using vDefend's multi-tenancy model, the Default Project/Infra maintains global scope with the highest policy precedence, covering global security, project isolation, Tier-0 Gateway Firewall rules, and Transit Gateway rules. Enterprise administrators can enforce baseline security controls at this infrastructure level that take precedence over project-level configurations, supporting the consistent application of restrictive policies to shared high-risk infrastructure components. SSP regions can be associated with Security and Network policies to control policy scope across multiple physical locations, enabling zone-based enforcement at geographic scale.

Security Intelligence, part of SSP, provides traffic flow analysis and visualization that helps administrators understand communication patterns within and between security zones. The Security Segmentation Report identifies workloads at elevated risk that could be used as vectors for lateral movement, enabling administrators to target those assets for more restrictive firewall configurations. Environment Asset Collections in Security Intelligence map directly to security zones, providing visibility into whether high-risk zones have appropriate network controls in place. SSP also provides capabilities to address security risks identified through application monitoring, so administrators can make targeted policy adjustments where risks are observed.

IDS/IPS profiles can be applied at different enforcement levels per group or segment, allowing high-risk zones to receive intrusion detection and prevention signatures tuned for greater sensitivity while other zones use standard profiles. Gateway Firewall rules can be differentiated by zone, applying stricter north-south traffic controls to segments hosting sensitive workloads.

#### VMware Data Services Manager (Contributes)

VMware Data Services Manager (DSM) provides an infrastructure policy framework that administrators can use to apply differentiated baseline configurations to database workloads, supporting the organizational practice of assigning more restrictive configurations to high-risk deployments.

Infrastructure policies in DSM define the compute resources, IP pools, VM classes, and storage policies available to database instances. A vSphere administrator creates and manages these policies, selecting clusters, resource pools, and storage policies that govern what underlying infrastructure a database workload can access. By defining multiple policies with different resource profiles and access constraints, administrators can establish stricter baselines for workloads that require more controlled resource boundaries. Once an infrastructure policy is created, certain topology choices such as Cross-Cluster HA configuration are fixed and cannot be subsequently modified, enforcing the baseline selected at provisioning time.

The DataServicePolicy custom resource mechanism provides an additional constraint layer. The allowedInfrastructurePolicies field in a DataServicePolicy restricts which infrastructure policies can be applied to database instances within a given scope, preventing users from selecting less restrictive configurations than the administrator has designated. The Consumption Operator requires this field to be populated, so policy selection cannot be left open-ended. DSM administrators can also use data services policies to specify which supported versions of data services, which infrastructure policies, and which backup locations are permitted within each namespace, adding a version-scoping control alongside the infrastructure placement restrictions.

Infrastructure policies are bound to specific Kubernetes namespaces, allowing administrators to restrict each team's database workloads to the infrastructure profile assigned to their namespace. DSM database clusters are deployed with the infrastructure policy and storage policy specified at provisioning time, which enforces isolation and resource constraints throughout the cluster's lifecycle. The Infrastructure Policies view in the DSM dashboard allows administrators to see which policies are active in the environment and which databases are associated with each policy, supporting ongoing oversight of configuration assignments.

DSM provides the technical mechanisms to define differentiated configurations and restrict users to administrator-approved options. The determination of which environments or workloads qualify as high-risk, and the definition of what constitutes a more restrictive configuration for those contexts, remains an organizational responsibility. Administrators must assess the risk profile of each deployment, define policies with appropriately restrictive resource and storage parameters for high-risk contexts, and bind those policies to the relevant namespaces as part of a governance process that DSM supports but does not drive.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer (Avi) provides several mechanisms that allow administrators to apply more restrictive baseline configurations to applications identified as higher-risk.

Each Avi virtual service carries its own application profile, network profile, analytics profile, SSL profile, and VRF context. Because these profiles are assigned at the per-service level, security posture can be differentiated across services without affecting the broader application delivery infrastructure.

The Web Application Firewall (WAF) built into Avi operates at Layer 7. Avi Application Insights provides virtual-service-level analytics that allow administrators to drill down into application details, assess application path validity, and evaluate HTTP method and Content-Type combinations before tuning WAF rules. This supports targeted, risk-based WAF configuration on a per-service basis.

In Avi for VCF environments, the VCF Automation Provider Management portal enables administrators to define infrastructure boundaries by creating regions and organizations, with region quotas specifying accessible zones and capacity allocation. In Organization-Managed Mode, organization administrators manage their own Service Engine Group configurations and infrastructure settings, providing scoped control over the resources serving their workloads. An application limit can also be set per organization in provider-managed mode, further constraining the resource envelope available to individual tenants.

Avi Load Balancer configuration and WAF policy can be automated through Ansible, Terraform, and VCF Automation, integrating with DevOps workflows and infrastructure-as-code practices. This supports consistent, repeatable application of more restrictive configurations across services the organization designates as higher-risk.

Not applicable for this control: VCF Protection and Recovery. This control addresses an end user activity or process, a design decision, or activity outside the scope of this product.

### Control 14.3(b)

> Measures identified by the provider before placing the high-risk AI system on the market or putting it into service and that are appropriate to be implemented by the deployer.

**SCF Controls:** AAT-20, AAT-20.1, PRM-05, TDA-01.1

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides infrastructure that supports accuracy, robustness, and cybersecurity across the AI workload lifecycle with competent oversight. For development and validation, PAIS publishes catalog items in VCF Automation that include AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, giving data scientists and MLOps engineers consistent environments for prototyping, fine-tuning, and validation on the same GPU-accelerated infrastructure used in production. Models are stored in a Harbor registry service in the Supervisor, and PAIS can also integrate with OCI-compliant registries from other vendors. PAIS retrieves models with authentication and certificate-based trust, and a CA trust bundle is used for secure communication with external services and databases, helping maintain integrity from development through inference.

For consistent performance throughout the lifecycle, PAIS exposes application-level observability that is activated by updating the PAISConfiguration custom resource. The spec.observability.prometheusRuntime section turns on Prometheus metrics collection for PAIS components, and the PAISConfiguration parameters also enable forwarding of LLM traces to an OpenTelemetry (OTel) Collector for request-level tracing. PAIS controller pod metrics are integrated into observability platforms through Telegraf configuration in the Supervisor instance, and DevOps engineers, MLOps engineers, and application developers can visualize health and performance metrics in Grafana and VCF Operations to track the health, quality, and behavior of AI applications. The Prometheus runtime is configured with a storage class policy and a configurable metrics retention period that controls how long metrics are stored. Knowledge base operations record timing metrics including total time for downloading files, generating embeddings, and indexing.

For oversight by competent individuals, PAIS must be activated in organization namespaces by an organization administrator or MLOps engineer after namespace creation, and activation requires coordination with the OIDC provider administrator to set up identity and access management. PAIS provides a UI and API for AI application developers to interact with deployed models and services within their authorized namespaces. For agent-based workloads, PAIS requires examination and approval of MCP server tools and capabilities before use in agents, and the PAIS Agent Builder maintains a list of approved tools for use in AI agents when connecting to MCP servers, supporting human review of capabilities that agents can invoke. Underlying VCF platform mechanisms such as vSphere High Availability, Distributed Resource Scheduler, and vMotion support continuous operation of AI workloads through infrastructure events; identity is provided by VCF SSO and is an inherited platform capability rather than a PAIS-native one.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.4

> For the purpose of implementing paragraphs 1, 2 and 3, the high-risk AI system shall be provided to the deployer in such a way that natural persons to whom human oversight is assigned are enabled, as appropriate and proportionate:

**SCF Controls:** AAT-20.1, AAT-20.2, TDA-01

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to AI implementation documentation by providing documented compute and hardware resource requirements, event log collection mechanisms, and infrastructure configuration references that support the documentation of AI deployment environments. VCF's compatibility guides document supported hardware, VCF Operations tracks infrastructure configuration, and VCF Log Management documents the event collection architecture.

Documenting AI model architecture, training methodology, and decision logic is outside VCF's scope.

VMware Private AI Services (PAIS), formerly Private AI Services, provides documentation and platform features that address several of the listed implementation documentation requirements. For computational and hardware resource requirements (item 6), the platform documents the system architecture of PAIS deployments, including GPU-accelerated workload domain requirements, vGPU profile configurations, VM class definitions for AI workloads, and the NVIDIA GPU and driver compatibility requirements. VI administrators configure vGPU-based VM classes that define the GPU resource allocations available to AI workloads. The PAIS catalog items in VCF Automation, including AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, document the components users can provision in selected namespaces, and the deployment Overview tab summarizes the installed software and the access points for the application, services, and workstation VM. PAIS setup is documented for both connected and disconnected (air-gapped) deployment models, with a Harbor registry in the Supervisor or another OCI-compliant registry used to store validated ML models.

For event logging mechanisms (item 8), the platform documents multiple logging and telemetry capabilities. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log, and they provide JupyterLab instances and console logs for verifying component installation and operation. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. PAIS Controller pod metrics are exposed at a Prometheus endpoint on the pais-controller-manager service and are integrated into observability platforms through Telegraf configuration in the Supervisor instance, with VCF Operations as the documented consuming platform. Deep Learning VMs also expose vGPU performance metrics through Prometheus. PAIS supports LLM traces collection in an OpenTelemetry Collector by configuring the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge Base operations track crawled documents, new documents found, deleted documents, modified documents requiring embeddings updates, and skipped documents, and record timing metrics for download, embedding generation, and the overall index operation.

For human oversight measures (item 5) and for interpreting outputs (items 4 and 5), MLOps engineers analyze LLM traces and Prometheus metrics to inspect agent execution flow across components and knowledge base indexing. The PAIS Agent Builder maintains a list of approved tools for use in AI agents and requires examination and approval of MCP server tools and capabilities before they are used by agents. Knowledge Bases are created with linked data sources such as Microsoft SharePoint sites and Amazon S3-compatible stores, which gives implementers a documented data lineage for retrieval-augmented generation outputs. Access to PAIS is controlled through OIDC authorized groups, where user accounts must be members of specified groups to consume the service, and personal access tokens generated from user account settings provide programmatic access to Knowledge Bases and data sources.

Requirements 1 (provider contact details), 2 (characteristics, capabilities, and limitations of the AI system), 3 (errata from initial conformity assessment), and 7 (projected useable lifetime) are documentation obligations carried by model vendors and the deploying organization rather than by the infrastructure platform. PAIS supplies registry and catalog mechanisms that organizations can attach revision and provenance metadata to, but the substantive documentation content for those items is outside the platform's scope.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.4(a)

> To properly understand the relevant capacities and limitations of the high-risk AI system and be able to duly monitor its operation, including in view of detecting and addressing anomalies, dysfunctions and unexpected performance.

**SCF Controls:** AAT-20.1, AAT-20.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to AI implementation documentation by providing documented compute and hardware resource requirements, event log collection mechanisms, and infrastructure configuration references that support the documentation of AI deployment environments. VCF's compatibility guides document supported hardware, VCF Operations tracks infrastructure configuration, and VCF Log Management documents the event collection architecture.

Documenting AI model architecture, training methodology, and decision logic is outside VCF's scope.

VMware Private AI Services (PAIS), formerly Private AI Services, provides documentation and platform features that address several of the listed implementation documentation requirements. For computational and hardware resource requirements (item 6), the platform documents the system architecture of PAIS deployments, including GPU-accelerated workload domain requirements, vGPU profile configurations, VM class definitions for AI workloads, and the NVIDIA GPU and driver compatibility requirements. VI administrators configure vGPU-based VM classes that define the GPU resource allocations available to AI workloads. The PAIS catalog items in VCF Automation, including AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, document the components users can provision in selected namespaces, and the deployment Overview tab summarizes the installed software and the access points for the application, services, and workstation VM. PAIS setup is documented for both connected and disconnected (air-gapped) deployment models, with a Harbor registry in the Supervisor or another OCI-compliant registry used to store validated ML models.

For event logging mechanisms (item 8), the platform documents multiple logging and telemetry capabilities. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log, and they provide JupyterLab instances and console logs for verifying component installation and operation. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. PAIS Controller pod metrics are exposed at a Prometheus endpoint on the pais-controller-manager service and are integrated into observability platforms through Telegraf configuration in the Supervisor instance, with VCF Operations as the documented consuming platform. Deep Learning VMs also expose vGPU performance metrics through Prometheus. PAIS supports LLM traces collection in an OpenTelemetry Collector by configuring the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge Base operations track crawled documents, new documents found, deleted documents, modified documents requiring embeddings updates, and skipped documents, and record timing metrics for download, embedding generation, and the overall index operation.

For human oversight measures (item 5) and for interpreting outputs (items 4 and 5), MLOps engineers analyze LLM traces and Prometheus metrics to inspect agent execution flow across components and knowledge base indexing. The PAIS Agent Builder maintains a list of approved tools for use in AI agents and requires examination and approval of MCP server tools and capabilities before they are used by agents. Knowledge Bases are created with linked data sources such as Microsoft SharePoint sites and Amazon S3-compatible stores, which gives implementers a documented data lineage for retrieval-augmented generation outputs. Access to PAIS is controlled through OIDC authorized groups, where user accounts must be members of specified groups to consume the service, and personal access tokens generated from user account settings provide programmatic access to Knowledge Bases and data sources.

Requirements 1 (provider contact details), 2 (characteristics, capabilities, and limitations of the AI system), 3 (errata from initial conformity assessment), and 7 (projected useable lifetime) are documentation obligations carried by model vendors and the deploying organization rather than by the infrastructure platform. PAIS supplies registry and catalog mechanisms that organizations can attach revision and provenance metadata to, but the substantive documentation content for those items is outside the platform's scope.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.4(b)

> To remain aware of the possible tendency of automatically relying or over-relying on the output produced by a high-risk AI system (automation bias), in particular for high-risk AI systems used to provide information or recommendations for decisions to be taken by natural persons.

**SCF Controls:** AAT-22.3

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.4(c)

> To correctly interpret the high-risk AI system’s output, taking into account, for example, the interpretation tools and methods available.

**SCF Controls:** AAT-22.3

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.4(d)

> To decide, in any particular situation, not to use the high-risk AI system or to otherwise disregard, override or reverse the output of the high-risk AI system.

**SCF Controls:** AAT-15.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.4(e)

> To intervene in the operation of the high-risk AI system or interrupt the system through a ‘stop’ button or a similar procedure that allows the system to come to a halt in a safe state.

**SCF Controls:** AAT-15.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 14.5

> For high-risk AI systems referred to in point 1(a) of Annex III, the measures referred to in paragraph 3 of this Article shall be such as to ensure that, in addition, no action or decision is taken by the deployer on the basis of the identification resulting from the system unless that identification has been separately verified and confirmed by at least two natural persons with the necessary competence, training and authority. The requirement for a separate verification by at least two natural persons shall not apply to high-risk AI systems used for the purposes of law enforcement, migration, border control or asylum, where Union or national law considers the application of this requirement to be disproportionate.

**SCF Controls:** AAT-22.3

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 15.1

> High-risk AI systems shall be designed and developed in such a way that they achieve an appropriate level of accuracy, robustness, and cybersecurity, and that they perform consistently in those respects throughout their lifecycle.

**SCF Controls:** AAT-20

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides infrastructure that supports accuracy, robustness, and cybersecurity across the AI workload lifecycle with competent oversight. For development and validation, PAIS publishes catalog items in VCF Automation that include AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, giving data scientists and MLOps engineers consistent environments for prototyping, fine-tuning, and validation on the same GPU-accelerated infrastructure used in production. Models are stored in a Harbor registry service in the Supervisor, and PAIS can also integrate with OCI-compliant registries from other vendors. PAIS retrieves models with authentication and certificate-based trust, and a CA trust bundle is used for secure communication with external services and databases, helping maintain integrity from development through inference.

For consistent performance throughout the lifecycle, PAIS exposes application-level observability that is activated by updating the PAISConfiguration custom resource. The spec.observability.prometheusRuntime section turns on Prometheus metrics collection for PAIS components, and the PAISConfiguration parameters also enable forwarding of LLM traces to an OpenTelemetry (OTel) Collector for request-level tracing. PAIS controller pod metrics are integrated into observability platforms through Telegraf configuration in the Supervisor instance, and DevOps engineers, MLOps engineers, and application developers can visualize health and performance metrics in Grafana and VCF Operations to track the health, quality, and behavior of AI applications. The Prometheus runtime is configured with a storage class policy and a configurable metrics retention period that controls how long metrics are stored. Knowledge base operations record timing metrics including total time for downloading files, generating embeddings, and indexing.

For oversight by competent individuals, PAIS must be activated in organization namespaces by an organization administrator or MLOps engineer after namespace creation, and activation requires coordination with the OIDC provider administrator to set up identity and access management. PAIS provides a UI and API for AI application developers to interact with deployed models and services within their authorized namespaces. For agent-based workloads, PAIS requires examination and approval of MCP server tools and capabilities before use in agents, and the PAIS Agent Builder maintains a list of approved tools for use in AI agents when connecting to MCP servers, supporting human review of capabilities that agents can invoke. Underlying VCF platform mechanisms such as vSphere High Availability, Distributed Resource Scheduler, and vMotion support continuous operation of AI workloads through infrastructure events; identity is provided by VCF SSO and is an inherited platform capability rather than a PAIS-native one.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 15.3

> The levels of accuracy and the relevant accuracy metrics of high-risk AI systems shall be declared in the accompanying instructions of use.

**SCF Controls:** AAT-16, AAT-20.2

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 15.4

> High-risk AI systems shall be as resilient as possible regarding errors, faults or inconsistencies that may occur within the system or the environment in which the system operates, in particular due to their interaction with natural persons or other systems. Technical and organisational measures shall be taken in this regard. The robustness of high-risk AI systems may be achieved through technical redundancy solutions, which may include backup or fail-safe plans. High-risk AI systems that continue to learn after being placed on the market or put into service shall be developed in such a way as to eliminate or reduce as far as possible the risk of possibly biased outputs influencing input for future operations (feedback loops), and as to ensure that any such feedback loops are duly addressed with appropriate mitigation measures.

**SCF Controls:** AAT-20, SEA-01.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides infrastructure that supports accuracy, robustness, and cybersecurity across the AI workload lifecycle with competent oversight. For development and validation, PAIS publishes catalog items in VCF Automation that include AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, giving data scientists and MLOps engineers consistent environments for prototyping, fine-tuning, and validation on the same GPU-accelerated infrastructure used in production. Models are stored in a Harbor registry service in the Supervisor, and PAIS can also integrate with OCI-compliant registries from other vendors. PAIS retrieves models with authentication and certificate-based trust, and a CA trust bundle is used for secure communication with external services and databases, helping maintain integrity from development through inference.

For consistent performance throughout the lifecycle, PAIS exposes application-level observability that is activated by updating the PAISConfiguration custom resource. The spec.observability.prometheusRuntime section turns on Prometheus metrics collection for PAIS components, and the PAISConfiguration parameters also enable forwarding of LLM traces to an OpenTelemetry (OTel) Collector for request-level tracing. PAIS controller pod metrics are integrated into observability platforms through Telegraf configuration in the Supervisor instance, and DevOps engineers, MLOps engineers, and application developers can visualize health and performance metrics in Grafana and VCF Operations to track the health, quality, and behavior of AI applications. The Prometheus runtime is configured with a storage class policy and a configurable metrics retention period that controls how long metrics are stored. Knowledge base operations record timing metrics including total time for downloading files, generating embeddings, and indexing.

For oversight by competent individuals, PAIS must be activated in organization namespaces by an organization administrator or MLOps engineer after namespace creation, and activation requires coordination with the OIDC provider administrator to set up identity and access management. PAIS provides a UI and API for AI application developers to interact with deployed models and services within their authorized namespaces. For agent-based workloads, PAIS requires examination and approval of MCP server tools and capabilities before use in agents, and the PAIS Agent Builder maintains a list of approved tools for use in AI agents when connecting to MCP servers, supporting human review of capabilities that agents can invoke. Underlying VCF platform mechanisms such as vSphere High Availability, Distributed Resource Scheduler, and vMotion support continuous operation of AI workloads through infrastructure events; identity is provided by VCF SSO and is an inherited platform capability rather than a PAIS-native one.

#### VMware vDefend (Contributes)

VMware vDefend contributes to achieving resilience requirements by maintaining continuous network security enforcement during both normal operations and failure scenarios. While the broader resilience story for VCF spans compute, storage, and disaster recovery infrastructure, vDefend addresses the network security dimension: firewall policies, microsegmentation, IDS/IPS inspection, and threat prevention must remain operational through failures and recovery events for the overall resilience posture to hold.

The vDefend distributed firewall (DFW) enforces security policies at the vNIC level of each virtual machine. Because policies are applied at the hypervisor rather than at a centralized appliance, they follow workloads automatically during live migration and are re-established when virtual machines restart on surviving hosts after a failure. This architecture means that microsegmentation boundaries and firewall rules remain intact through host maintenance windows, load-balancing migrations, and unplanned host failures without requiring manual reconfiguration or policy re-application.

For site-level resilience, NSX Federation Security maintains a consistent security posture across multiple locations. During disaster recovery events and workload migrations between sites, NSX Federation Security synchronizes firewall rules, security groups, and policy definitions so that the security framework established at the primary site is preserved at the recovery site. This reduces security gaps during the period when workloads are transitioning between sites or running at a secondary location.

The Security Services Platform (SSP), which hosts vDefend's centralized management and analytics functions, offers several resilience mechanisms. For host-level failures, VMware recommends deploying SSP with vSphere HA enabled so that failed management components are automatically restarted on surviving hosts. For storage-level resilience, SSP can be deployed on a vSAN stretched configuration, which protects SSP data from multiple host failures within a single site and facilitates quick recovery from site failures. SSP supports backup and restore operations to recover its own configuration and state; backup operations require the platform to be in a healthy state, and administrators should verify certificate consistency between backup and restore environments to avoid NDR Sensor disruptions. SSP cluster health monitoring tracks NetworkUnavailable, DiskPressure, and Ready conditions with a 5-minute timeout threshold for remediation, enabling automated detection of degraded cluster conditions. After restoring a backup in a disaster recovery or in-place scenario, Agent health status must be verified as Up on Bare Metal servers before the platform is considered operational. Administrators should also back up the SSP system before performing scale-out operations to allow recovery if expansion encounters issues.

vDefend also provides operational resilience through its threat response capabilities. Intelligent Assist offers two remediation strategies to help security teams respond to threats while maintaining the broader security posture: the Targeted Strategy applies surgical, lower-risk remediation with potentially lower effectiveness, while the Comprehensive Strategy selects the broadest available response for more effective remediation with potentially lower safety implications for connected workloads. Intelligent Assist remediation policy rules are not enabled by default and must be manually enabled by an analyst or administrator after due diligence and verification, providing deliberate control over automated response actions. Objects generated during remediation that encounter errors require manual cleanup in Intelligent Assist.

#### VCF Protection and Recovery (Contributes)

VCF Protection and Recovery (PNR) helps organizations achieve disaster recovery requirements for virtualized workloads by orchestrating virtual machine recovery at a secondary site. Recovery plans can be created with configurable properties to support disaster recovery operations, and replication classes are preconfigured with a Recovery Point Objective (RPO) that defines the acceptable amount of data loss after a disaster. PNR orchestrates both array-based replication and host-based replication.

Recovery plans run under both planned circumstances for migration and unplanned circumstances for disaster recovery. Operators can test recovery plans before using them in production to validate recovery procedures. Multi-region deployments with separate management domains can be designed to contain the impact of a disaster event to one region.

PNR exposes role-based access through specific roles such as SRM Recovery Plans Administrator and SRM Recovery Administrator, and role assignments must be configured on both the primary and secondary sites for consistent access control across the recovery environment. In Protection and Recovery for VCF Automation, Organization Administrators can perform multi-tenant disaster recovery operations on behalf of project administrators and project advanced users.

Operational visibility is provided through VCF Operations dashboards for Protection and Recovery. The Protection Groups dashboard surfaces a critical health status when a serious issue occurs with a protection group or its replication, and PNR classifies health findings into Error, Warning, and Info categories so operators can diagnose, troubleshoot, and remediate issues that affect resilience.

Cyber Recovery, part of the PNR suite, extends resilience to cyber incident scenarios. Integrated CrowdStrike vulnerability analysis applies the Exploitability and Predictive Risk Technology (ExPRT) rating to recommend immediate remediation of Critical vulnerabilities, timely remediation of Medium-severity vulnerabilities, and scheduled remediation of Low-severity findings. vSphere Replication supports point-in-time recovery for cyber resilience.

Recovery sites should be located in a facility that is unlikely to be affected by environmental, infrastructure, or other disturbances that affect the protected site. Decisions about acceptable RPO thresholds, recovery site selection, and operational processes for declaring and executing recovery remain organizational responsibilities outside the product.

#### VMware Data Services Manager (Contributes)

VMware Data Services Manager (DSM) contributes to resilience through technical mechanisms at both the management plane and database levels, addressing both normal operations and adverse conditions such as node failures and site outages.

The DSM Provider Appliance, which hosts the management plane, relies on vSphere High Availability for its own resilience. DSM requires that HA be activated on VMware vCenter clusters hosting database workloads as a prerequisite for infrastructure policy compliance, making HA an enforced platform dependency rather than an optional configuration.

At the database level, DSM PostgreSQL deployments include a monitor node that orchestrates automatic failover. When the primary database node fails, the monitor node promotes the replica to primary without manual intervention. For environments requiring high availability across multiple failure domains, DSM provides a Cross vSphere Cluster HA topology that distributes PostgreSQL instances across multiple vSphere clusters, offering the highest availability and resilience for those configurations.

For cross-site resilience, DSM supports multi-site deployments for PostgreSQL databases. Before establishing a multi-site deployment, administrators must configure remote replication on the primary instance and retrieve the Certificate Authority from the primary instance to add it to the DSM Provider VM that will host the secondary. Users with the DSM User role must manually establish trust between primary and secondary instances. Secondary PostgreSQL instances support read-only connections while replication is active. DSM requires that the values of max_connections, max_worker_processes, max_wal_senders, max_prepared_transactions, and max_locks_per_transaction on the secondary database be equal to or greater than those on the primary. When a site fails, DSM provides a switchover workflow that promotes the secondary instance to primary. DSM also provides a failback workflow that reverses the roles and restores the system to a fully operational state. During a switchover, DSM validates trust of the new primary database certificate before redirecting secondary instances. DSM requires that organizations define disaster recovery requirements, including whether to enable multi-site replication, before creating a PostgreSQL database.

DSM extends high availability to MySQL deployments. DSM supports MySQL HA clusters and read replicas as distinct deployment topologies. A Cross vSphere Cluster HA configuration distributing a primary and two replicas across three vSphere clusters provides the highest availability for MySQL in multi-cluster environments. DSM requires that disaster recovery requirements be defined before creating a MySQL database.

For recovery operations, restoring a PostgreSQL cluster to a different DSM control plane should use resources equal to or greater than those of the source cluster to maintain stability.

DSM's technical mechanisms support but do not substitute for organizational resilience programs. Organizations must define recovery time and recovery point objectives, document and test disaster recovery procedures, and maintain runbooks for failover and failback operations.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides application-layer resilience mechanisms spanning the control plane, data plane, and geographic distribution layers. Organizations can use these mechanisms to satisfy resilience requirements for their application delivery infrastructure.

Control-plane resilience is achieved through the Avi Controller cluster. Production deployments use a Controller cluster that maintains quorum and fault tolerance, allowing the control plane to remain available when one node is unavailable. Controller clusters can be deployed across two availability zones, with documented failure scenarios and recovery actions for each topology. When running a single-node Controller, the Backup and Restore feature must be used for disaster recovery. After a storage failure event, the Controller is restored from a configuration archive, and at least one Service Engine controller IP must match a previous controller IP to enable Service Engines to reconnect to the Controller after restoration. The Controller's backup and restore capability also supports configuration migration across Controller instances.

For cross-site application failover, Avi Load Balancer includes Global Server Load Balancing (GSLB). Avi GSLB provides resilience when loss of a data center or network connection occurs, and supports an active disaster recovery deployment mode in which a geographically remote site receives application traffic when the primary site is unavailable. Where a deployment has only one active site, at least one geographically remote cloud should be designated as the GSLB disaster recovery target.

At the data plane, Service Engine distribution and scaling provide resilience at the workload level. A scaled-out virtual service experiences no more than performance degradation if a single Service Engine in the group fails, making the scaled-out model preferable to legacy high availability modes for resilience. Availability Zones can be configured within each Service Engine Group, with two or three zones recommended per group. Each Availability Zone should be defined around a distinct fault domain associated with shared power supplies, shared networking devices, or other common infrastructure, and maps specific VMware vCenter (vCenter) instances, hosts, and datastores that share that fault domain. In multi-vCenter deployments, this spreads data-plane capacity across multiple infrastructure failure boundaries.

For Kubernetes environments, the Avi Multi-Cluster Kubernetes Operator (AMKO) federation architecture supports designation of a leader cluster and multiple member clusters for disaster recovery and multi-cluster coordination. This extends Avi's resilience model to multi-cluster Kubernetes deployments, allowing application traffic management to continue across cluster failures.

In VCF deployments, the Cloud Console's Central Licensing feature maintains a global capacity pool that removes the need for duplicate licenses in disaster recovery scenarios, reducing licensing barriers to activating DR sites.

Achieving the resilience requirements in this control is an organizational process. The organization must define recovery objectives, validate failover procedures through testing, maintain configuration archives, and coordinate resilience activities across the underlying VCF platform. Avi's control-plane HA, GSLB, Availability Zone configuration, and AMKO multi-cluster federation capabilities directly support that process without substituting for it.

### Control 15.5

> High-risk AI systems shall be resilient against attempts by unauthorised third parties to alter their use, outputs or performance by exploiting system vulnerabilities. The technical solutions aiming to ensure the cybersecurity of high-risk AI systems shall be appropriate to the relevant circumstances and the risks. The technical solutions to address AI specific vulnerabilities shall include, where appropriate, measures to prevent, detect, respond to, resolve and control for attacks trying to manipulate the training data set (data poisoning), or pre-trained components used in training (model poisoning), inputs designed to cause the AI model to make a mistake (adversarial examples or model evasion), confidentiality attacks or model flaws.

**SCF Controls:** AAT-20

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides infrastructure that supports accuracy, robustness, and cybersecurity across the AI workload lifecycle with competent oversight. For development and validation, PAIS publishes catalog items in VCF Automation that include AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, giving data scientists and MLOps engineers consistent environments for prototyping, fine-tuning, and validation on the same GPU-accelerated infrastructure used in production. Models are stored in a Harbor registry service in the Supervisor, and PAIS can also integrate with OCI-compliant registries from other vendors. PAIS retrieves models with authentication and certificate-based trust, and a CA trust bundle is used for secure communication with external services and databases, helping maintain integrity from development through inference.

For consistent performance throughout the lifecycle, PAIS exposes application-level observability that is activated by updating the PAISConfiguration custom resource. The spec.observability.prometheusRuntime section turns on Prometheus metrics collection for PAIS components, and the PAISConfiguration parameters also enable forwarding of LLM traces to an OpenTelemetry (OTel) Collector for request-level tracing. PAIS controller pod metrics are integrated into observability platforms through Telegraf configuration in the Supervisor instance, and DevOps engineers, MLOps engineers, and application developers can visualize health and performance metrics in Grafana and VCF Operations to track the health, quality, and behavior of AI applications. The Prometheus runtime is configured with a storage class policy and a configurable metrics retention period that controls how long metrics are stored. Knowledge base operations record timing metrics including total time for downloading files, generating embeddings, and indexing.

For oversight by competent individuals, PAIS must be activated in organization namespaces by an organization administrator or MLOps engineer after namespace creation, and activation requires coordination with the OIDC provider administrator to set up identity and access management. PAIS provides a UI and API for AI application developers to interact with deployed models and services within their authorized namespaces. For agent-based workloads, PAIS requires examination and approval of MCP server tools and capabilities before use in agents, and the PAIS Agent Builder maintains a list of approved tools for use in AI agents when connecting to MCP servers, supporting human review of capabilities that agents can invoke. Underlying VCF platform mechanisms such as vSphere High Availability, Distributed Resource Scheduler, and vMotion support continuous operation of AI workloads through infrastructure events; identity is provided by VCF SSO and is an inherited platform capability rather than a PAIS-native one.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 16(a)

> Ensure that their high-risk AI systems are compliant with the requirements set out in Section 2.

**SCF Controls:** AAT-20

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides infrastructure that supports accuracy, robustness, and cybersecurity across the AI workload lifecycle with competent oversight. For development and validation, PAIS publishes catalog items in VCF Automation that include AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, giving data scientists and MLOps engineers consistent environments for prototyping, fine-tuning, and validation on the same GPU-accelerated infrastructure used in production. Models are stored in a Harbor registry service in the Supervisor, and PAIS can also integrate with OCI-compliant registries from other vendors. PAIS retrieves models with authentication and certificate-based trust, and a CA trust bundle is used for secure communication with external services and databases, helping maintain integrity from development through inference.

For consistent performance throughout the lifecycle, PAIS exposes application-level observability that is activated by updating the PAISConfiguration custom resource. The spec.observability.prometheusRuntime section turns on Prometheus metrics collection for PAIS components, and the PAISConfiguration parameters also enable forwarding of LLM traces to an OpenTelemetry (OTel) Collector for request-level tracing. PAIS controller pod metrics are integrated into observability platforms through Telegraf configuration in the Supervisor instance, and DevOps engineers, MLOps engineers, and application developers can visualize health and performance metrics in Grafana and VCF Operations to track the health, quality, and behavior of AI applications. The Prometheus runtime is configured with a storage class policy and a configurable metrics retention period that controls how long metrics are stored. Knowledge base operations record timing metrics including total time for downloading files, generating embeddings, and indexing.

For oversight by competent individuals, PAIS must be activated in organization namespaces by an organization administrator or MLOps engineer after namespace creation, and activation requires coordination with the OIDC provider administrator to set up identity and access management. PAIS provides a UI and API for AI application developers to interact with deployed models and services within their authorized namespaces. For agent-based workloads, PAIS requires examination and approval of MCP server tools and capabilities before use in agents, and the PAIS Agent Builder maintains a list of approved tools for use in AI agents when connecting to MCP servers, supporting human review of capabilities that agents can invoke. Underlying VCF platform mechanisms such as vSphere High Availability, Distributed Resource Scheduler, and vMotion support continuous operation of AI workloads through infrastructure events; identity is provided by VCF SSO and is an inherited platform capability rather than a PAIS-native one.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 16(c)

> Have a quality management system in place which complies with Article 17.

**SCF Controls:** GOV-18

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 16(d)

> Keep the documentation referred to in Article 18.

**SCF Controls:** DCH-18

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 16(e)

> When under their control, keep the logs automatically generated by their high-risk AI systems as referred to in Article 19.

**SCF Controls:** AAT-16.8

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

The specific event data elements this control requires, including database query history, matched input data, and the identity of individuals who verified results, are characteristics of AI and autonomous technology applications and must be implemented by those applications. VCF does not operate AI systems or manage AI decision logic directly, so it does not natively record these application-level details. The Consumption layer of VCF, however, provides the audit framework, log collection infrastructure, and forwarding mechanisms that AI workloads running on the platform can use to satisfy the event recording requirements this control specifies.

The Kubernetes API server built into VMware Kubernetes Service (VKS) clusters, managed through the vSphere Supervisor, supports configurable audit logging governed by an audit policy. Each audit event captures the authenticated identity of the requesting user or service account, addressing the control's requirement to identify individuals involved in verification activities. Kubernetes Event objects record the time when events are first observed using the eventTime field with microsecond-level precision, and the API server records requestReceivedTimestamp and stageTimestamp fields in each audit event, addressing the start and end time requirements. Kubernetes audit policy determines which events are recorded and at what detail level, with log-file and webhook backends available for routing structured audit events to external log management systems for retention and analysis.

For application-level log collection, VKS clusters run Fluent Bit as a standard package deployed in the vmware-system-logging namespace. Fluent Bit automatically collects container logs, Kubernetes API audit logs, Linux daemon logs, and Linux authentication logs from every node, and can forward these streams to VCF Log Management over the CFAPI protocol or to external systems including Syslog, HTTP, Elasticsearch, Kafka, and Splunk. For workloads running in vSphere Namespaces, the LogAgentConfiguration Custom Resource enables structured Syslog streaming; each log message automatically includes the namespace name, pod UID, pod name, container name, and ESX host name, giving operators the context needed to correlate events back to specific workloads and requesting identities. Kubernetes also records pod scheduling, image pull operations, and container creation events with timestamps and source information in the event log, providing an infrastructure-level audit trail that complements application-generated records.

Argo CD, when deployed as a Supervisor Service, records application synchronization events including resource creation, sync status, and health status with timestamps, providing an additional audit trail for GitOps-managed AI workload deployments. AI workloads that produce structured event records can write them to standard output or dedicated log streams, which Fluent Bit collects and forwards without requiring additional agent deployment within the workload.

Operators enabling AI workloads on VKS should configure Kubernetes audit policies to capture API interactions at the Request or RequestResponse level, enable Fluent Bit forwarding to a centralized log management system, and apply the LogAgentConfiguration Custom Resource to vSphere Namespaces hosting AI workloads. AI application owners must implement structured logging that captures the four data elements this control requires; the platform supplies the collection, forwarding, and retention infrastructure that makes those records durable and queryable.

VMware Private AI Services (PAIS) provides AI-specific observability and logging mechanisms that partially address the enumerated requirements over and above platform-level logging.

For requirement (1) timestamps, PAIS supports LLM trace collection that sends traces from agents and knowledge base indexing to an OpenTelemetry Collector using HTTP/protobuf or gRPC, capturing timing information for AI service operations. Trace collection is activated by uncommenting the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge base operations record timing metrics including total time for downloading files, total time for generating embeddings, and total time of the index operation. PAIS Controller metrics are exposed at the Prometheus endpoint on the pais-controller-manager service, and observability can be activated through the PAISConfiguration custom resource to enable Prometheus metrics collection with a configurable storage class and retention period. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log. PAIS controller pod metrics can be streamed from the Supervisor cluster to VCF Operations, and PAIS metrics can be visualized in Grafana and VCF Operations. These mechanisms cover timing for inference, indexing, and infrastructure operations, while per-session start and end timestamps for individual agent conversations require additional logging configuration at the AI application layer.

For requirement (2) databases queried, PAIS knowledge bases can be linked to data sources that supply content for retrieval-augmented generation, and indexing operations record timing metrics tied to those configured data sources. Per-query identification of which specific data source returned matching content requires additional instrumentation beyond the indexing record.

For requirement (3) input data matched, knowledge base indexing records aggregate operations across documents but does not record which specific input content matched individual retrieval queries. This requirement is addressed only at aggregate granularity by PAIS itself.

For requirement (4) identification of individuals, PAIS uses VCF SSO and VCF Automation identity for access to deployment and management functions, attributing administrative actions to the authenticated user. Identification of individuals involved in verification of AI results beyond platform identity, such as application-level review and approval workflows, requires additional organizational tooling layered on top of the PAIS platform.

PAIS event logging is strongest for AI service timing and infrastructure observability, partial for data source documentation, and limited for per-query matching and individual verification tracking, which together justify a Contributes rating against this Process-categorized control.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 16(f)

> Ensure that the high-risk AI system undergoes the relevant conformity assessment procedure as referred to in Article 43, prior to its being placed on the market or put into service.

**SCF Controls:** AAT-10, CPL-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 16(g)

> Draw up an EU declaration of conformity in accordance with Article 47.

**SCF Controls:** CPL-01.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 16(i)

> Comply with the registration obligations referred to in Article 49(1).

**SCF Controls:** AAT-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 16(j)

> Take the necessary corrective actions and provide information as required in Article 20.

**SCF Controls:** CPL-01.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 16(k)

> Upon a reasoned request of a national competent authority, demonstrate the conformity of the high-risk AI system with the requirements set out in Section 2.

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

### Control 16(l)

> Ensure that the high-risk AI system complies with accessibility requirements in accordance with Directives (EU) 2016/2102 and (EU) 2019/882.

**SCF Controls:** CPL-01

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1

> Providers of high-risk AI systems shall put a quality management system in place that ensures compliance with this Regulation. That system shall be documented in a systematic and orderly manner in the form of written policies, procedures and instructions, and shall include at least the following aspects:

**SCF Controls:** GOV-18

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1(a)

> A strategy for regulatory compliance, including compliance with conformity assessment procedures and procedures for the management of modifications to the high-risk AI system.

**SCF Controls:** CPL-01

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1(b)

> Techniques, procedures and systematic actions to be used for the design, design control and design verification of the high-risk AI system.

**SCF Controls:** AAT-10, AAT-20

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides infrastructure that supports accuracy, robustness, and cybersecurity across the AI workload lifecycle with competent oversight. For development and validation, PAIS publishes catalog items in VCF Automation that include AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, giving data scientists and MLOps engineers consistent environments for prototyping, fine-tuning, and validation on the same GPU-accelerated infrastructure used in production. Models are stored in a Harbor registry service in the Supervisor, and PAIS can also integrate with OCI-compliant registries from other vendors. PAIS retrieves models with authentication and certificate-based trust, and a CA trust bundle is used for secure communication with external services and databases, helping maintain integrity from development through inference.

For consistent performance throughout the lifecycle, PAIS exposes application-level observability that is activated by updating the PAISConfiguration custom resource. The spec.observability.prometheusRuntime section turns on Prometheus metrics collection for PAIS components, and the PAISConfiguration parameters also enable forwarding of LLM traces to an OpenTelemetry (OTel) Collector for request-level tracing. PAIS controller pod metrics are integrated into observability platforms through Telegraf configuration in the Supervisor instance, and DevOps engineers, MLOps engineers, and application developers can visualize health and performance metrics in Grafana and VCF Operations to track the health, quality, and behavior of AI applications. The Prometheus runtime is configured with a storage class policy and a configurable metrics retention period that controls how long metrics are stored. Knowledge base operations record timing metrics including total time for downloading files, generating embeddings, and indexing.

For oversight by competent individuals, PAIS must be activated in organization namespaces by an organization administrator or MLOps engineer after namespace creation, and activation requires coordination with the OIDC provider administrator to set up identity and access management. PAIS provides a UI and API for AI application developers to interact with deployed models and services within their authorized namespaces. For agent-based workloads, PAIS requires examination and approval of MCP server tools and capabilities before use in agents, and the PAIS Agent Builder maintains a list of approved tools for use in AI agents when connecting to MCP servers, supporting human review of capabilities that agents can invoke. Underlying VCF platform mechanisms such as vSphere High Availability, Distributed Resource Scheduler, and vMotion support continuous operation of AI workloads through infrastructure events; identity is provided by VCF SSO and is an inherited platform capability rather than a PAIS-native one.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1(c)

> Techniques, procedures and systematic actions to be used for the development, quality control and quality assurance of the high-risk AI system.

**SCF Controls:** AAT-01

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1(d)

> Examination, test and validation procedures to be carried out before, during and after the development of the high-risk AI system, and the frequency with which they have to be carried out.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides infrastructure that supports AI Test, Evaluation, Validation and Verification (TEVV) activities throughout the model lifecycle. Deep learning VMs provisioned from PAIS images provide dedicated testing environments for AI prototyping, fine-tuning, validation, and inference workloads. These DL VMs run on the same GPU-accelerated workload domains, vGPU profiles, and VM classes used in production, so TEVV activities occur in conditions comparable to the deployment environment.

The validate-then-publish workflow creates a formal gate for AI deployment. MLOps engineers validate models for inference functionality using the Triton Inference Server and evaluate performance and safety against business use cases, including examination of inference requests for malicious behavior and functional testing. Models must pass this validation before being uploaded to the Model Gallery for production use. Model integrity is verified through hash code validation, and each revision is assigned a unique digest stored as an OCI artifact with an immutable manifest, giving cryptographic verification that the tested model is the same artifact that gets deployed.

The platform also supports TEVV through its monitoring stack. VCF Operations monitors GPU consumption at cluster, host system, and host properties levels. Each DL VM includes a pre-installed DCGM Exporter with Prometheus collection at 5-second scrape intervals and Grafana visualization, supplying performance telemetry during testing and evaluation. The software stack for running AI applications on top of NVIDIA GPUs is validated in advance, and NVIDIA NGC containers are pre-tested and ready to run, reducing variables during TEVV by providing a known-good baseline.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1(e)

> Technical specifications, including standards, to be applied and, where the relevant harmonised standards are not applied in full or do not cover all of the relevant requirements set out in Section 2, the means to be used to ensure that the high-risk AI system complies with those requirements.

**SCF Controls:** AAT-01.1, AAT-02.2, CFG-02, GOV-15.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides secure baseline configurations for all major platform components, consistent with industry-accepted hardening standards. The VCF Security Baseline is a purpose-built document that builds on VCF security fundamentals to address frequently requested compliance standards, regulations, and frameworks. It is designed and validated to tailor security configurations without affecting VCF's ability to meet its design objectives. Organizations can use the VCF Security Baseline to evaluate both default and non-default configurations and to secure their environments in a compliance context.

VCF Operations includes a consolidated out-of-the-box benchmark called the VCF 9 Security Baseline, which provides a ready-to-use compliance profile for evaluating the security posture of a VCF environment. This benchmark enables automated assessment of configurations against the documented baseline, helping maintain a consistent configuration across VCF components. ISO Security Standards compliance benchmarks are also available from the VCF Operations repository as a native pack, giving organizations the ability to measure their environment against internationally recognized hardening standards. Broadcom also provides DISA Security Technical Implementation Guides (STIGs) for VCF components, including vSphere 7.0 and vSphere 8.0 STIGs, which provide detailed instructions for securing and configuring systems to meet specific security requirements.

Individual VCF components have their own security configuration guides that document hardening recommendations. The vSphere Security Configuration Guide provides best practices for securing VMware vCenter, including securing the installation, configuring access and authentication, defining roles and permissions, and enabling auditing and logging. VMware ESX host hardening covers authentication and authorization settings, disabling unnecessary services, enabling security features such as Secure Boot and Trusted Platform Module (TPM), and implementing network security measures. The vSphere Security Configuration Guide documents specific STIG-aligned values for the Security.PasswordQualityControlPwquality setting on ESX hosts, including parameters such as minlen=15, maxrepeat=3, maxclassrepeat=4, difok=4, and enforce_for_root. The NSX Security Configuration Guide provides recommendations for securing NSX components, including NSX nodes, NSX Controllers, and NSX Edge nodes, by configuring strong authentication, implementing role-based access control, and securing administrative access.

VCF Operations also provides a Configure Host Security Config Data workflow that allows selective enforcement of host security hardening rules. Beyond security settings, vSphere Lifecycle Manager maintains a desired-state cluster image that defines the ESX base build, vendor add-ons, and firmware for every host in a cluster, so the software baseline stays consistent across hosts, and VCF Operations runs scheduled drift detection that flags configuration deviations from the desired state for remediation. Administrators can configure individual configuration elements under Enforce Options, enabling granular control over which baseline settings are applied and enforced across the environment. This supports reducing organizational and business risk by maintaining configuration consistency. vSphere Host Profiles provide an additional mechanism for automated and centrally managed host configuration baseline enforcement, capturing a reference host's configuration and applying it consistently across ESX hosts, covering memory, storage, networking, and other configuration aspects.

For containerized workloads, VMware Kubernetes Service (VKS) includes preconfigured security policy templates. The Baseline security template provides a set of constraints that restrict known privilege escalations while maintaining compatibility with common containerized workloads.

DISA STIGs for Supervisor and VKrs are available to guide hardening of the Supervisor control plane and individual VKS cluster releases, providing baseline security guidance at the same standard as the DISA STIGs applied to VCF infrastructure components. The VKS cluster management interface provides out-of-the-box security policy templates that mirror industry-standard Pod Security Standards profiles, including both Baseline and Restricted configurations. Custom VKS Cluster Management Security Policy templates are also available to fine-tune individual security context parameters and support governance controls tailored to specific organizational requirements.

Pod Security Admission (PSA), enabled in VKr 1.25 and later, enforces pod security standards at the namespace level. Three policy profiles are defined: Privileged (unrestricted, for system-level workloads), Baseline (helps prevent known privilege escalations while allowing the default minimally specified pod configuration), and Restricted (heavily restricted, following pod hardening best practices). Three enforcement modes are available: enforce, warn, and audit. The podSecurityStandard field in the ClusterClass API encodes the intended security posture in cluster definitions, accepting these modes with specific policy versions and namespace exemptions so that baseline security configurations are applied consistently across VKS deployments. System namespaces including kube-system, tkg-system, and vmware-system-cloudprovider are excluded from pod security enforcement. The PSA admission controller can also be statically configured with default enforce, audit, and warn levels for unlabeled namespaces, so namespaces created without explicit labels still receive a defined security baseline. To support gradual policy adoption, audit and warn modes can be set to a stricter level such as restricted while enforce remains at baseline, giving administrators visibility into policy violations before full enforcement is applied. VCF Automation IaaS Resource Policies provide an additional enforcement point at the management layer, supporting requirements that Kubernetes clusters operate at a minimum baseline pod security level.

Kubernetes-native kernel security mechanisms provide workload-level baseline hardening options. seccomp restricts the Linux kernel system call surface available inside containers using BPF-based profiles, and the RuntimeDefault seccomp profile provides a strong set of security defaults while preserving workload functionality. AppArmor and SELinux provide further kernel-level restrictions through default configurations that offer foundational protections. Kubernetes default RBAC role bindings should be reviewed as part of establishing a security baseline, as defaults may grant broader access than a hardened configuration requires. Isolating each workload in its own Kubernetes namespace allows tailored security policies to be applied per workload and restricts access to namespace-scoped resources such as ConfigMaps and Secrets.

Harbor Registry, available as a standard package for VKS clusters, supports a controlled baseline for container artifacts entering the environment. Harbor provides vulnerability scanning, content trust, and policy-based replication, along with role-based access control and artifact security policies, supporting controlled management of the container image supply chain. For stand-alone virtual machines deployed in vSphere Supervisor environments, Content Libraries can distribute VM images created with current patches and required security settings that follow corporate security policies.

VMware Private AI Services (PAIS) provides PAIS-specific declarative configuration mechanisms that organizations can use to define and apply baseline settings across the AI infrastructure stack on VCF.

The primary mechanism is the PAISConfiguration custom resource. Private AI Services settings are declared in a YAML file compliant with the PAISConfiguration schema and applied with kubectl, giving administrators a single resource that captures observability, identity, and trust configuration for an organization namespace. Observability includes the spec.observability.prometheusRuntime section for Prometheus metrics collection with a configurable storage class and metrics retention period, and an llmTraces section for routing large language model traces to an OpenTelemetry Collector. The PAISConfiguration custom resource can be patched with kubectl patch and verified with kubectl get paisconfiguration, supporting baseline change control and drift detection at the AI service layer.

Certificate trust is handled through the spec.clientTls.caBundleRefs section, which references ConfigMaps containing CA trust bundles. Private AI Services requires HTTPS trust bundles for the OIDC provider, the Harbor registry, content management systems hosting knowledge database data, and MCP servers that provide tools to models. Trust bundles can be organized per application, with periodic updates required before certificate expiration. Access scope is restricted through the authorizedGroups setting, which limits Private AI Services access to specified OIDC groups.

Harbor registry distribution carries baseline controls for model and image artifacts. Replication rules support configurable filters, target namespace, and trigger mode, including a manual trigger mode, so administrators can align artifact replication with organizational policy for connected and disconnected sites. The Model Gallery uses Harbor project access capabilities to restrict access to sensitive training and tuning data. Air-gapped deployments capture the self-hosted registry URL and registry login credentials as part of the activation flow.

Workload resource baselines are defined through SupervisorNamespaceClassConfig, which specifies per-zone CPU limits, CPU reservations, memory limits, and memory reservations for resource allocation across zones. GPU-capable VM classes can carry GPU reservations and be confined to a single zone or supervisor namespace, supporting isolation of GPU consumption to a specific tenant. A default storage policy selection in the Private AI Services quickstart defines storage placement and resources for the service database.

Deep Learning VM (DL VM) baselines are captured through VCF Automation self-service catalog items that parameterize VM class, data disk size, user password, and optional SSH public key authentication for remote access. The DL VM OVF property config-json accepts a base64-encoded configuration file that controls DCGM Exporter metrics visibility through export_dcgm_to_public and JupyterLab authentication through enable_jupyter_auth, giving operators a consistent surface to define DL VM hardening parameters.

Credentials supplied during Private AI Services activation, including the private container registry password and proxy password, are stored as secrets in VCF Automation rather than as plaintext configuration values, supporting credential hygiene as part of the deployment baseline.

#### VMware vDefend (Contributes)

VMware vDefend contributes to secure baseline configurations within its network security domain by providing structured configuration management capabilities, predefined security profiles and strategies, and configuration integrity controls that align with industry-accepted hardening practices.

vDefend supports draft configuration management with configuration locking to prevent multiple users from simultaneously opening and editing a manual draft, helping maintain configuration integrity and reducing the risk of conflicting changes to firewall policy. Role-Based Access Control (RBAC) in vDefend governs who can create or modify firewall policies, providing control over which administrators can alter the security baseline.

In vDefend, five system-defined VPC Security Strategies are available for establishing security baselines across Virtual Private Clouds (VPCs): VPC Isolation, VPC Isolation with Essential Services, VPC External Connectivity, VPC Secure Connection, and NONE. These strategies are consumed through Security Profiles in VCF Automation, which are predefined configuration templates that define the default security posture for VPCs. VPC Security Strategies provide a declarative, consistent way to apply DFW security baselines across multiple VPCs within a project, and Project Admins are guided to select a pre-defined high-level security posture that enforces Secure by Default principles rather than manually configuring individual firewall rules. Security profiles can be applied to one or more VPCs simultaneously and updated as requirements evolve.

vDefend provides predefined TLS Decryption Action Profiles with four settings: Balanced (default), High Fidelity, High Security, and Custom. These profiles are vendor-defined baseline configurations for TLS inspection behavior, giving organizations a documented starting point aligned with different security postures. TLS Inspection policies also support an Advanced Configuration option to lock policies, preventing multiple users from making concurrent changes to TLS inspection policy baseline settings.

Security Services Platform validates configuration changes before implementation through a deployment wizard that conducts thorough validations to confirm configurations are correct and compatible. The platform enforces initial security policies that cannot be modified through the user interface after they have been published, providing an immutability mechanism for foundational policy baseline elements. Security Services Platform supports backup and restore of configuration data, and certificate consistency between backup and restored environments should be verified to maintain NDR sensor integrity.

Security Services Platform's Bare Metal Security feature extends vDefend policy enforcement to physical servers, applying L3/4 security policies to bare metal infrastructure using the same policy model and management plane as virtualized workloads. Two default DFW rules are created when Bare Metal servers are onboarded to Security Services Platform, providing an immediate baseline posture for physical infrastructure. Security policies are defined, propagated, and enforced across Bare Metal servers with consistent application and monitoring.

vDefend's configuration management capabilities operate within the network security layer. The broader secure baseline configuration program for VCF, including the VCF Security Baseline document, component hardening guides, DISA STIGs, and compliance scanning through VCF Operations, is managed at the platform level. vDefend contributes by maintaining its own secure defaults and configuration controls within the network security domain.

#### VCF Protection and Recovery (Contributes)

VCF Protection and Recovery (PNR) provides configurable security baseline mechanisms for its replication and recovery infrastructure. The PNR appliance includes a security reference section that identifies configuration files containing settings that affect environment security, and PNR documentation establishes that secure operation depends on proper configuration and maintenance of the PNR server. The security reference also documents network port requirements, providing the technical specifications needed to develop and maintain secure baseline configurations for disaster recovery infrastructure.

PNR includes a Configuration Import/Export Tool that captures the complete set of protection and recovery configuration settings, including server version, build number, local and remote site names, inventory mappings, placeholder datastores, advanced settings, and array managers. The tool supports both UI-based and scripted exports and can transfer configuration data without requiring credential entry when using the bundled generated script. This gives organizations a mechanism to document, back up, and restore known-good baseline configurations for their disaster recovery infrastructure. The underlying system configuration is stored in the va-configurator.xml file and is accessible through Advanced Settings on the Site Pair tab in the management interface, providing a defined location for baseline review and modification.

The PNR appliance management interface allows administrators to configure appliance security settings after deployment. The Advanced Settings system provides privileged users with the ability to adjust default values governing protection and recovery features. When modifying the minimum protocol version for TLS, PNR requires that the change be applied consistently across all configuration occurrences in the system, supporting systematic baseline management for transport security settings.

For cyber recovery deployments, PNR documentation recommends using standard VCF topology with separate workload and management domains to achieve better isolation and align with security best practices at the recovery site.

Full compliance with this control requires an organizational baseline configuration management program, documentation practices, version control, and hardening tooling extending beyond what PNR provides directly.

#### VMware Data Services Manager (Contributes)

VMware Data Services Manager (DSM) contributes to secure baseline configuration management through its infrastructure policy framework, data service policy enforcement, and built-in secure defaults for authentication and certificate management.

Infrastructure policies in DSM define the compute, storage, and networking resources for each database deployment, including the list of allowed VM classes and compatible storage policies. These policies are configured by DSM administrators and act as standardized, repeatable deployment baselines that database users must follow. When administrators configure infrastructure policies, they constrain the quality and quantity of resources that users can consume from vSphere clusters, establishing guardrails that support consistent deployments across the environment. Database cluster creation applies both infrastructure policies and storage policies that enforce isolation and resource constraints, reducing the risk of misconfiguration by individual users.

Data service policies extend this baseline enforcement across multi-tenant deployments. DSM administrators can define and configure data service policies for various database services and enforce them across different tenants to maintain a consistent security and compliance posture. Data service policies constrain which infrastructure options can be applied to database instances. When DSM is integrated with VCF Automation, data service policies can be applied consistently across organizational units.

DSM also ships with predefined secure defaults for database authentication. PostgreSQL databases on DSM use scram-sha-256 as the default password-based authentication method, as configured in the default pg_hba.conf entries stored at /pgsql/data/pg_hba.conf. Custom pg_hba.conf entries support scram-sha-256, reject, and cert authentication methods. TLS is enforced by default for database client connections, with an administrator-controlled option to relax enforcement via the postgrescluster-allow-non-ssl-system-users setting in the advanced-system-config ConfigMap within the dsm-system namespace.

Certificate management is integrated into the database creation workflow and validates certificate chains for connections to external systems, including VMware vCenter. DSM introduces a stricter default certificate validation mode, the "latest" mode, that enforces cryptographic and KeyUsage validations for all DSM endpoints, including the Provider VM and data service clusters. Certificates uploaded to DSM are validated against FIPS 140-3 cryptographic standards, and uploads containing unsupported algorithms or parameters are rejected. Custom trusted root certificates must comply with FIPS requirements. DSM also verifies the SHA256 thumbprint of vCenter during initial configuration to confirm the management connection targets the expected endpoint. Custom certificate support allows organizations to replace the default DSM certificate with organization-issued certificates for both the Provider VM and database clusters. For self-service deployments using the DSM Consumption Operator, signature verification confirms package integrity before installation.

DSM validates certificate chains using configured root CA certificates stored in ConfigMaps and supports private container registry configuration with CA certificate validation for air-gapped environments.

Addressing this control fully requires organizational processes beyond what DSM provides directly. DSM does not include tooling to document baseline configurations in a compliance-ready format, map configurations to specific industry hardening standards, or audit deviations from defined baselines over time. Organizations should supplement DSM's policy and defaults framework with configuration management documentation, change tracking processes, and integration with compliance scanning tools to satisfy the full requirements of this control.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer (Avi) provides several built-in mechanisms that support the development and application of secure baseline configurations for the application delivery layer.

The SSL/TLS Profile system gives administrators a documented starting point for cryptographic configuration. Profile Templates define accepted SSL and TLS versions and ciphers in prioritized order, and can be associated with virtual services or the Controller itself. The Standard SSL/TLS Profile is suitable for typical deployments, while the System-Standard profile provides modern cipher suites for backend server re-encryption in Kubernetes environments managed through the Avi Kubernetes Operator (AKO). Avi includes a curated list of cipher suites considered reasonably strong for SSL/TLS configuration, and the documentation notes the trade-offs between security, compatibility, and computational expense when selecting profiles. The Service Engine disables unsafe legacy renegotiation by default, providing a built-in protocol hardening baseline that reduces the risk of protocol downgrade attacks.

The System-Secure-HTTP application profile is a pre-configured baseline for securing HTTP virtual services. It enforces HTTPS, protects cookies, manages client IP handling, and controls protocol behavior, giving administrators a hardened starting point for web application delivery. Administrators can supplement these defaults with more granular settings through policies or DataScripts.

For deployments requiring validated cryptographic modules, Avi Load Balancer implements FIPS 140-3 compliance, providing a cryptographic baseline aligned with the U.S. and Canadian government standard for cryptographic modules.

The Avi Web Application Firewall (WAF) Positive Security model supports application-layer baseline configuration through rules that define allowed application behavior. Each rule supports Enable/Disable control, mode selection between Detection and Enforcement, and configurable Paranoia levels, allowing organizations to tune an application security baseline to their risk posture. The Positive Security Rule Updates feature can be enabled to activate additional configuration options for application security policies. The Cloud Console Application Rules service extends this with rules specifically designed to address known application vulnerabilities, including those with CVEs, and updates them automatically.

For Kubernetes deployments, AKO uses Custom Resource Definitions (CRDs) to enable syntactical validation of configuration objects at creation time, which helps prevent invalid configurations from being deployed. The AKO L4 CRD Rule supports SSL profiles and PKI profiles for securing pool connections, allowing Kubernetes-native expression of Avi's cryptographic baseline settings.

Certificate lifecycle management supports maintaining cryptographic baselines over time. Certificate Management Profiles support automated certificate renewal workflows, and the Trust Protection Platform integration can automatically handle certificate and chain certificate renewals by learning the mapping of virtual service names to their certificates.

The organizational process of developing, documenting, and maintaining baseline configurations across all in-scope technology assets, including selecting appropriate profile settings, applying them consistently, and updating them as software versions and security guidance evolve, remains outside what Avi performs on the organization's behalf.

### Control 17.1(f)

> Systems and procedures for data management, including data acquisition, data collection, data analysis, data labelling, data storage, data filtration, data mining, data aggregation, data retention and any other operation regarding the data that is performed before and for the purpose of the placing on the market or the putting into service of high-risk AI systems.

**SCF Controls:** AAT-12, AAT-12.1, AAT-12.2, DCH-01, DCH-02, DCH-22

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides explicit data source identification and tracking for AI workloads. The Data Indexing and Retrieval service offers a Knowledge Bases interface where users create and manage knowledge bases, and a knowledge base can be linked to up to ten data sources. Each data source is created with a name, description, type, and the required properties for retrieving content from its original location, and a single data source can be linked to multiple knowledge bases. The data source type is fixed at creation. Supported data source types include Microsoft SharePoint sites, Amazon S3 compatible stores, and other enterprise content management systems. Each data source stores the credentials required for retrieval, such as service account key file information when applicable, which creates a documented connection between the AI system and its data origins.

During knowledge base indexing, PAIS tracks document-level detail including crawled documents, new documents found, deleted documents, existing unmodified documents, existing modified documents requiring embedding updates, and skipped documents. It captures size metrics including total megabytes downloaded, new chunks indexed corresponding to inference server invocations for embeddings, and final index size after removal of deleted documents. It records timing metrics for download, embedding generation, and the overall index operation. Document counts returned by retrieval queries are tracked, and counts of documents per media type such as PDF and PPTX are maintained for each knowledge base. Automatic collection and indexing of updates from linked data sources over time keeps these records current.

For runtime visibility, PAIS supports LLM trace collection through an OpenTelemetry Collector by configuring the spec.observability.llmTraces section of the PAISConfiguration custom resource, with traces transmitted over HTTP/protobuf or gRPC. PAIS metrics, including knowledge base activity, can be visualized in third-party observability platforms such as Grafana. The Data Indexing and Retrieval component also implements a Model Context Protocol (MCP) server that exports a set of search tools for each knowledge base, which gives downstream AI applications a documented programmatic surface tied back to specific data sources. PAIS AI catalog items, including AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, are added to the VCF Automation catalog by running the PAIS Quickstart, with required images uploaded in advance to a Harbor registry in disconnected environments.

Organizational decisions about which data sources are approved for AI use, how data lineage is documented outside the platform, and how training data provenance is governed remain the responsibility of the organization. PAIS supplies the technical registration and tracking infrastructure that the organization configures and operates.

#### VMware vDefend (Contributes)

VMware vDefend contributes to protecting the integrity of source data used by AI workloads on VCF through network-level security controls that restrict access to data stores and pipelines and detect malicious activity targeting data repositories.

Distributed Firewall microsegmentation enforces least-privilege network access at the vNIC level, limiting which workloads and users can reach databases, object stores, and data pipelines used for AI training and operation. Attacks that attempt to contaminate or corrupt AI source data require network access to the stores where training data resides; microsegmentation restricts that access to authorized workloads and identities. Security Intelligence provides visibility into traffic flows between workloads, generates firewall rule recommendations, and validates that security policies are enforced. Security Intelligence administrators can monitor for traffic leakage between environments, establish exceptions for authorized communication paths, and implement lockdown protection rules to control unauthorized inter-environment traffic. Gateway Firewall provides an additional enforcement point at the perimeter of network segments containing sensitive data repositories.

vDefend IDS/IPS inspects traffic to and from data repositories for known exploit patterns, command-and-control traffic, lateral movement, and data exfiltration signatures. The IDS/IPS filestore capability stores matched files to disk when a signature rule fires, supporting forensic analysis and post-incident review of suspected data integrity compromises. IDS/IPS signature-based detection also uses file magic inspection, identifying file types by their binary structure via libmagic, to detect misrepresented or malformed files in transit to data repositories.

Malware Prevention intercepts and analyzes files transferred over the network to data repositories. Profiles can be configured to send files to the cloud for detailed analysis or to process them locally without cloud connectivity. Verdict decisions classify files as Benign, Trusted, Highly Trusted, or Malicious. Security Services Platform Malware Prevention collects file analysis data including file hash submissions, assigns an Analyst UUID to each cloud submission for tracking, and records in-memory script buffer inspection details with associated analysis reports. The Security Services Platform also provides backup and restore mechanisms covering hardware malfunctions, software malfunctions, data corruption, and malware incidents, providing a recovery path if SSP itself is compromised.

vDefend contributes to this control because its microsegmentation, threat detection, and file inspection capabilities reduce the attack surface and detection gap for data poisoning attacks targeting AI workloads. Protecting data integrity at the application layer, including content validation, provenance tracking, and checksums within data stores, is outside vDefend's domain and requires organizational processes and additional tooling.

#### VCF Protection and Recovery (Contributes)

VCF Protection and Recovery (PNR) provides replication-based data protection for virtual machine workloads across sites. Protection groups allow administrators to organize virtual machines and datastores under consistent snapshot and replication policies at scale, covering both local recovery via vSAN snapshots and cross-site recovery via vSphere Replication or array-based replication. Protection group membership can be modified after creation, and virtual machines can be automatically enrolled for protection using storage tag selection on designated datastores, reducing manual overhead in maintaining protection coverage across a growing environment.

PNR introduces an immutability mode for protection groups that, when enabled, prevents the data protection group from being modified or deleted. This mechanism allows administrators to safeguard protection configurations against inadvertent or unauthorized changes. PNR Health monitoring provides consolidated visibility into data protection service health, operation issues for local and replication snapshots, storage utilization, and protection group membership changes, giving administrators a current view of protection posture across the environment.

Site Recovery Manager (SRM) integrates with vSphere Replication to provide orchestrated failover with configurable recovery point objectives, giving organizations control over acceptable data loss thresholds for protected workloads. PNR supports additional site topologies, including shared recovery site configurations where protected site resources are mapped to isolated datacenters, networks, folders, and datastores on the recovery site. Inventory mappings allow administrators to define resource configurations once and apply them consistently across protection groups.

vSAN Snapshots and Replication is a native, integrated snapshot-based backup capability for virtual machines running on vSAN datastores, managed through the vSphere Client. It provides VM restore and clone operations from existing snapshots, supporting both rapid recovery from operational failures and ransomware recovery scenarios. Test failover operations allow administrators to validate that recovery configurations are functional before an actual recovery event occurs.

#### VMware Data Services Manager (Contributes)

VMware Data Services Manager (DSM) provides several mechanisms that support data protection for managed database instances, covering PostgreSQL, MySQL, and SQL Server databases.

The most direct contribution is DSM's automated backup framework, which administrators can enable on a per-database basis or through data service policies. When configured, DSM performs scheduled full and incremental backups of database content and stores them in S3-compatible object storage at a configurable backup location. Backup retention is configurable (backup-retention-period), and DSM retains backups of deleted databases until the configured retention period expires, supporting recovery from accidental deletion. For point-in-time recovery, DSM restores a backup to a newly created database VM with a user-specified name and datastore location, and can target the most recent timestamp or a specific point in time. DSM archives binary logs in backup storage as part of its backup protection mechanism. Administrators can also initiate manual on-demand backups of primary PostgreSQL databases to safeguard data before high-impact operations or as immediate protection after major changes. For PostgreSQL multi-site deployments, DSM performs a full backup automatically during a promotion event before resuming the regular schedule.

Data service policies give administrators control over backup behavior across all databases governed by a policy. Policies can require that databases have automated backups enabled, allow users to opt in, or disallow automated backups entirely. The allowed-backup-locations setting in the data service policy restricts users to selecting from approved backup locations, reducing the risk of backup misconfiguration. Policies can be enforced across multiple tenants and across different namespaces and namespace labels, supporting consistent data protection posture in multi-tenant deployments. A Compliance tab on data service policies displays compliance reports and allows administrators to expand each policy violation to view the noncompliant database, data service, and namespace, giving administrators visibility into where data protection requirements are not being met. In 9.1, data service policies extend to SQL Server databases in addition to MySQL and PostgreSQL.

DSM implements role-based access control that separates administrative and user-level database access. DSM Admins can create, monitor, and manage all data services in the environment; DSM Users can only manage and monitor the data services they own. This access model limits who can modify backup configurations and policy settings. Infrastructure policies govern which storage resources are available for database VMs, including CPU, memory, storage policies, IP pool, and VM classes, giving administrators control over the storage environment in which data resides.

Control plane recovery requires that a Provider Backup Repo has been configured at installation time. If the Provider VM fails, the restore-provider command restores it to the latest timestamp. In the VCF Automation context, tenants can perform point-in-time restores directly through the VCF Automation UI, broadening restore access to self-service scenarios.

One limitation applies: if an incremental backup in the backup chain is deleted, DSM cannot restore the full data; a successful restore from an incremental chain requires the last full backup and all following incremental backups. Organizations must protect the integrity of the backup chain through access controls on the backup storage.

DSM provides configurable backup, recovery, and policy enforcement mechanisms for managed database instances. The broader data protection program requires organizational decisions about backup schedules, retention periods, backup storage security, and off-site management that DSM does not prescribe on its own.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer (Avi) provides several application-layer mechanisms that support the implementation of data protection controls within a VCF deployment.

At the transport layer, Avi performs TLS termination with configurable SSL/TLS profiles for connections between clients and virtual services. The SSL/TLS protocol at the Avi proxy secures data in transit by reducing the risk of unauthorized parties reading or modifying information transferred between end users and application workloads. SSL/TLS profiles are configurable through the Avi Controller UI under Templates > Security > SSL/TLS Profile. Management interface access is further restricted through configuration of allowed ciphers and HMACs for management sessions.

Avi integrates with Hardware Security Modules (HSMs), including the Thales Luna (formerly SafeNet Luna) HSM, for cryptographic key storage and management. This allows organizations to store the private keys used in TLS termination and other cryptographic operations within a dedicated hardware key store rather than in software. The Avi Controller also stores sensitive configuration data encrypted in a local database, and backup files can be protected with a passphrase that encrypts the keys included in the backup. Backup and restore operations verify that the FIPS mode of the backup configuration matches the target controller environment.

Avi's Web Application Firewall (WAF) applies both positive and negative security models to inspect and filter HTTP/HTTPS application traffic. WAF policies support ModSecurity rules for application protection and a Positive Security model that learns application behavior to define allowed request patterns. The Application Rules service, available through the Avi Cloud Console, provides WAF rules specifically designed to address known application vulnerabilities including CVE-tracked issues, with automatic updates to keep rules current. WAF configuration is accessible through the Controller UI under Templates > Security > WAF Policy.

Avi DataScript provides a programmable layer for enforcing additional data protection behaviors at the proxy boundary. DataScripts are Lua-based scripted rules that allow inspection and manipulation of client HTTP requests and server HTTP responses, supporting content switching, redirection, header manipulation, and logging. DataScript can be used to enforce cipher suite policies by denying clients connecting with unsupported ciphers. DataScript also supports blocklist-based access control by checking client IP addresses against named IP groups and terminating connections from blocked sources while logging the violation. XML-based DataScript use cases can extract client identifiers from request payloads and compare them against configured string groups to restrict access to authorized clients.

Access to Avi configuration objects is restricted through granular role-based access control (RBAC). Avi supports extended granular RBAC using label-based markers to restrict user permissions to specific resources based on key-value pair matching. The RBAC model differentiates Read and Write access across objects such as SSL/TLS Profiles, PKI Profiles, Authentication Profiles, IP Address Groups, and Health Monitors, allowing organizations to scope access to data protection-relevant configuration to authorized roles only. Roles can also be scoped to tenants through label group associations.

These mechanisms address data protection at the application delivery layer. Broader organizational data protection controls, including data classification policies, data handling procedures, and data-at-rest protection beyond the Avi proxy boundary, require organizational governance and platform-level capabilities that Avi does not provide as an application delivery controller.

### Control 17.1(g)

> The risk management system referred to in Article 9.

**SCF Controls:** AAT-09, RSK-01

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1(h)

> The setting-up, implementation and maintenance of a post-market monitoring system, in accordance with Article 72.

**SCF Controls:** AAT-10.13, AAT-11.2, AAT-16

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to post-deployment monitoring of AI workloads through VCF Operations, which provides continuous health, performance, and capacity monitoring for the infrastructure hosting those workloads. VCF Operations dashboards surface CPU, memory, storage, and network metrics for VMs running AI workloads. VCF Log Management aggregates and analyzes log data from VMware vCenter, VMware ESX, and NSX components. vCenter alarms provide threshold-based alerting for infrastructure conditions that could affect AI workload availability.

For AI workloads running as containerized applications on VMware Kubernetes Service (VKS) clusters, the platform extends infrastructure-level observability to the Kubernetes layer. VKS clusters provisioned with the automated-monitoring label automatically receive monitoring configuration on each new node, integrating cluster telemetry with VCF Operations. The Prometheus standard package, installable on VKS clusters through the Supervisor Management Proxy Service, deploys kube-state-metrics, node-exporter, pushgateway, Prometheus, and Alertmanager as components. The prometheus-kube-state-metrics component monitors node status and capacity, ReplicaSet compliance, pod status, job and CronJob status, and resource requests and limits, providing continuous metric collection that can be directed at AI inference services or training job pods. Telegraf is available as a standard package that deploys as a Deployment component to scrape metrics from kube-state-metrics and node-exporter and forward them to external observability backends. Monitoring and alerting for Kubernetes deployments is also available through the Argo CD Supervisor Service using Grafana Operator and Prometheus.

Kubernetes-native health probes and status tracking support workload condition detection at the pod level. Liveness and readiness probes can be configured on AI workload containers to detect unresponsive or overloaded model serving instances; a readiness probe removes the pod from service routing when it cannot handle requests, and a liveness probe triggers a container restart when the application becomes unresponsive. The Kubernetes Deployment controller continuously monitors running application instances and automatically replaces instances when nodes fail or are removed from service, providing a self-healing mechanism that addresses machine failure or maintenance. Kubernetes DeploymentStatus exposes observedGeneration and conditions fields with type, status, lastTransitionTime, and reason values, allowing operators to detect rollout failures, stuck deployments, or configuration drift from the expected specification. VKS cluster management proactively monitors the cluster estate to verify that assigned policies are enforced correctly, and generates Policy Insights when configuration conflicts or environmental errors are detected.

For organizations using Harness CI/CD on VKS, Dynatrace integration provides full-stack observability including application performance monitoring, infrastructure monitoring, and digital experience monitoring. The Dynatrace operator automates deployment, scaling, and maintenance of the monitoring stack within VKS clusters, and automatically correlates application deployment service metrics with underlying VKS infrastructure including nodes, pods, and the network. The Dynatrace AI engine detects anomalies, identifies root causes, and provides intelligent alerts. Harness SRM monitors deployed services post-deployment to calculate a real-time health score based on transaction success and latency.

The VCF Automation Monitor tab provides deployment health information drawn from VCF Operations, and deployment cards in the self-service catalog surface deployment state, last request status, and operational history for workload deployments. AI-specific behavior monitoring (model accuracy drift, output quality) requires application-level tooling outside VCF's scope.

VMware Private AI Services (PAIS) provides AI-specific monitoring mechanisms that support continuous post-deployment observation of AI workloads on VCF.

At the PAIS layer, observability is activated by updating the PAISConfiguration custom resource with parameters that enable metrics collection and forward large language model traces to an OpenTelemetry Collector. PAIS deploys a Prometheus server pod for metrics collection that must be ready and running for observability to function, configured with a chosen storage class and a configurable metrics retention period. PAIS controller pod metrics are integrated into observability platforms through Telegraf configuration in the Supervisor instance, and the telegraf-user-config ConfigMap in the vmware-system-monitoring namespace manages user-configured monitoring endpoints for PAIS. The PAIS Supervisor Service exposes service-level metrics through pais.vmware.com that VI administrators access to monitor the health of the service.

DevOps engineers visualize PAIS health and performance metrics in observability platforms such as Grafana, where dashboards report pod restart frequency, vGPU licensing status, and idle or underutilized GPU devices in passthrough mode. VI administrators visualize PAIS controller pod operation metrics in VCF Operations using the same metrics pipeline. MLOps engineers and application developers track the health, quality, and behavior of AI applications and the models used in agents through Grafana, supporting continuous observation of inference behavior. Model Endpoint deployment status can be verified using the kubectl get modelendpoints command, which returns the Ready status for each deployed endpoint, and the vcf cluster command-line interface provides cluster provisioning monitoring, registration, and kubeconfig retrieval for VKS clusters that host AI workloads. PAIS deployment leases can be configured to bound how long a deployment can exist, supporting lifecycle oversight of catalog-deployed AI workloads.

Enabling these observability features, defining retention and alerting policy, and acting on monitoring signals are organizational process responsibilities. PAIS provides the monitoring infrastructure and integration points, but continuous post-deployment monitoring as a practice requires the organization to assign operational ownership, review observability data on an ongoing basis, and respond to anomalies in AI workload behavior.

#### VMware vDefend (Contributes)

VMware vDefend (vDefend) contributes to proactive and continuous monitoring of deployed AI workloads running on VCF through multiple layers of ongoing network-level security monitoring.

Security Intelligence continuously monitors for new flows between environments and alerts administrators to unauthorized or unexpected traffic, enabling ongoing policy adjustments as workloads evolve. It also monitors infrastructure services to detect newly deployed servers. A classification cron job runs automatically at 2:00 AM local time and repeats every 24 hours, evaluating traffic flows from the preceding 30 days to classify compute entities providing network infrastructure services. When the Recommendations Monitoring feature is enabled, Security Intelligence checks every hour for changes in the scope of monitored entities, allowing policy recommendations to remain current as AI workloads change. The Security Intelligence Flow Insights Dashboard supports detection and display of MITRE ATT&CK framework tactics and techniques, showing counts of detected suspicious events per tactic and technique during a selected time period.

Segmentation Monitoring provides dedicated views for environment-level traffic flows, accessible through the Monitor & Plan interface. Administrators can monitor traffic between configured environment pairs, view flows related to detected infrastructure servers within specified time intervals, and export all unique flows to a CSV file for offline analysis or compliance evidence. The Environments monitoring window provides assessment of current security posture and enables improvement actions for environment pairs. When no protection policy is configured for an environment pair, Segmentation Monitoring offers a Run Recommendations option to generate policy recommendations, closing monitoring gaps around AI workloads.

The Security Services Platform (SSP) collects metrics to monitor the readiness and performance of vDefend IDS/IPS in the environment. IDS/IPS engine statistics accessible per host include uptime, alert count, suppressed alerts, alert queue overflow status, engine ID, and last reload timestamp. IDS/IPS monitoring dashboards can be scoped to custom projects, displaying events triggered for that project only. For bare metal deployments, Bare Metal Agents stream metrics and detailed host-level telemetry to the SSP. The NDR Sensor periodically checks the status of activated features on the SSP every 15 minutes and updates its configuration accordingly.

Intelligent Assist provides AI-assisted analysis within the NSX Manager UI and SSP UI, displaying on the IDS/IPS, Detections, and Campaigns pages to help administrators interpret monitoring data.

Malware Prevention Service provides deployment status monitoring at the cluster level and per-node level, displaying deployment errors and individual transport node status. Network Detection and Response (NDR) applies behavioral analysis to detect suspicious activity targeting monitored workloads and correlates events into campaigns for investigation.

Monitoring AI system functionality at the application layer, including model performance, output quality, and behavioral drift, is outside vDefend's domain.

Not applicable for this control: VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1(i)

> Procedures related to the reporting of a serious incident in accordance with Article 73.

**SCF Controls:** AAT-11.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1(j)

> The handling of communication with national competent authorities, other relevant authorities, including those providing or supporting the access to data, notified bodies, other operators, customers or other interested parties.

**SCF Controls:** IRO-10, IRO-10.2

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

### Control 17.1(k)

> Systems and procedures for record-keeping of all relevant documentation and information.

**SCF Controls:** TDA-22

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1(l)

> Resource management, including security-of-supply related measures.

**SCF Controls:** PRM-03, RSK-09

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.1(m)

> An accountability framework setting out the responsibilities of the management and other staff with regard to all the aspects listed in this paragraph.

**SCF Controls:** GOV-04, GOV-04.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 17.2

> The implementation of the aspects referred to in paragraph 1 shall be proportionate to the size of the provider’s organisation. Providers shall, in any event, respect the degree of rigour and the level of protection required to ensure the compliance of their high-risk AI systems with this Regulation.

**SCF Controls:** GOV-01, GOV-15

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 18.1

> The provider shall, for a period ending 10 years after the high-risk AI system has been placed on the market or put into service, keep at the disposal of the national competent authorities:

**SCF Controls:** DCH-18

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 18.1(a)

> The technical documentation referred to in Article 11.

**SCF Controls:** DCH-18

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 18.1(b)

> The documentation concerning the quality management system referred to in Article 17.

**SCF Controls:** DCH-18

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 18.1(c)

> The documentation concerning the changes approved by notified bodies, where applicable.

**SCF Controls:** DCH-18

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 18.1(d)

> The decisions and other documents issued by the notified bodies, where applicable.

**SCF Controls:** DCH-18

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 18.1(e)

> The EU declaration of conformity referred to in Article 47.

**SCF Controls:** DCH-18

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 18.3

> Providers that are financial institutions subject to requirements regarding their internal governance, arrangements or processes under Union financial services law shall maintain the technical documentation as part of the documentation kept under the relevant Union financial services law.

**SCF Controls:** DCH-18

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 19.1

> Providers of high-risk AI systems shall keep the logs referred to in Article 12(1), automatically generated by their high-risk AI systems, to the extent such logs are under their control. Without prejudice to applicable Union or national law, the logs shall be kept for a period appropriate to the intended purpose of the high-risk AI system, of at least six months, unless provided otherwise in the applicable Union or national law, in particular in Union law on the protection of personal data.

**SCF Controls:** MON-10

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides configurable event log retention across its component products, allowing organizations to align retention periods with their records retention requirements and support after-the-fact investigations of security incidents.

VCF Automation offers direct control over log history retention through its Activity Log configuration. Administrators can specify the number of days of log history to keep before automatic deletion, or set the value to zero to retain logs indefinitely. This flexibility allows organizations to match retention to their specific statutory, regulatory, or contractual obligations without external tooling.

VCF Log Management is the centralized log aggregation platform and provides configurable data retention periods that govern how long collected audit events remain available for query and analysis. Within VCF Log Management, administrators define log partitions that segregate collected logs by criteria such as source or category, each with its own retention period measured in days, so that security audit records can be retained longer than routine operational logs to match differing records-retention obligations. VCF Log Management removes logs from disk once a partition's retention period is met, and partitions can be archived to external NFS or S3 storage for retention beyond the active log store. VCF Operations surfaces audit events with selectable time ranges of 1, 6, 12, 24, and 48 hours for immediate review, with longer-term availability determined by the retention policy configured in the VCF Log Management instance. When the retention period is set to zero, logs are kept indefinitely and are not automatically removed based on time. VCF Operations for Networks adds its own retention controls, with entity metrics retention configurable from one month to six months. Administrators should back up log files before reducing any retention period, as the change deletes all data older than the newly specified window. Audit logs in VCF Operations for Networks capture administrative actions carried out in the system, including regular CRUD operations and login/logout alerts.

At the host layer, VMware ESX (ESX) provides log file rotation controls that govern how many log files the system maintains locally. When the configured limit is reached, the oldest file is removed. The local syslog directory location is configurable through the Syslog.global.logDir parameter, allowing administrators to point log storage to a volume sized for their retention needs. ESX audit records can be directed to a remote syslog host separately from general syslog messages by enabling the Syslog.global.auditRecord.remote parameter, which works in conjunction with Syslog.global.logHost to specify the destination. ESX and vCenter services maintain separate log files, each with their own rotation and retention behavior.

The Consumption layer of VCF, encompassing VMware Kubernetes Service (VKS) clusters, vSphere Supervisor, and vSphere Namespaces, produces structured audit and operational log data and includes built-in forwarding infrastructure so that organizational retention policies can be applied at external receivers. The Kubernetes API server (kube-apiserver) running on VKS clusters generates audit events conforming to the audit.k8s.io API group. Each event captures the requesting user, timestamp, resource accessed, and the audit level at which it was generated. The --audit-log-path flag directs these events to a file on the node, and the --audit-log-maxage parameter defines the maximum number of days to retain old audit log files based on the timestamp encoded in the filename, providing a direct file-level retention control that can be aligned to statutory or regulatory requirements. Audit policy rules govern which events are recorded at four levels: None (not recorded), Metadata, Request, or RequestResponse. Organizations should note that standard Kubernetes cluster Event objects in the core API group have limited in-cluster retention and should not be relied upon as a compliance log source; the kube-apiserver audit logging subsystem, written to files or forwarded via webhook, is the appropriate mechanism for compliance-relevant event data.

VKS clusters include Fluent Bit logging agents deployed in the vmware-system-logging namespace. These agents collect container logs, Linux daemon logs, Linux authentication logs, and Kubernetes API server audit logs, tagging each category separately to support targeted routing and retention policies at the receiving system. Fluent Bit can forward logs to Syslog servers, HTTP endpoints, Elasticsearch, Kafka, Splunk, and VCF Log Management; a sample configuration for forwarding to VCF Log Management is included in the Fluent Bit standard package available on VKS clusters. For workloads running as vSphere Pods in a vSphere Namespace, applying a LogAgentConfiguration Custom Resource to the namespace directs syslog messages to a remote Syslog server; each message carries metadata fields for namespace name, pod UID, pod name, container name, and ESX host name, supporting forensic traceability after a security incident. Kubernetes handles log rotation for applications writing to standard output to prevent uncontrolled growth on local node storage. VKS clusters generate additional component logs from CAPI, CAPV, VM Operator, and the VKS Controller Manager, which are accessible via kubectl and gathered in support bundles along with containerd journal logs for incident investigation.

The vSphere Supervisor control plane collects its own kube-apiserver audit logs through Fluent Bit, tagging them with the audit.apiserver.* prefix and reading from /var/log/vmware/audit/kube-apiserver.log on the Supervisor nodes. The Supervisor can also be configured to preserve the source IP addresses of authentication and Kubernetes APIServer requests, making them available for inspection in audit logs and supporting forensic reconstruction of access events.

For long-term and centralized retention, VCF supports forwarding event logs from all major components to remote syslog infrastructure. ESX hosts can be configured to send syslog messages to a remote log server using the esxcli system syslog config set command. VMware vCenter can also stream events to a remote syslog server by enabling the vpxd.event.syslog.enabled parameter in the vCenter Management Interface. The vCenter local database is not intended for long-term archival retention: events are deleted at the end of the configured retention period, and extending retention beyond the default requires corresponding database capacity increases. NSX sends audit logs directly to the configured remote syslog server, with NSX Manager audit logging enabled by default and recording security policy changes with request identifiers and timestamps for traceability. VCF Operations integrates its audit log with syslog and supports configuring a syslog collector to gather all audit records. VCF Log Management can also pull tasks, events, and alerts from vCenter instances and receive syslog feeds from ESX hosts through its Log Collections configuration. Log collection from vCenter can be activated directly from VCF Operations when vCenter is integrated. This centralized collection architecture enables organizations to apply retention policies at the aggregation layer that match their compliance requirements, independent of local component retention limits.

The audit events captured across VCF components include administrative actions such as login, logout, object creation and deletion, configuration modifications, capability checks, and security policy changes. NSX audit logs include structured fields for audit flag, component, log level, request ID, and subcomponent, providing the detail needed for forensic analysis. NSX supports logging and auditing capabilities that can be integrated with external logging and monitoring solutions to monitor for security events and anomalies. VCF Operations audit events are designed to facilitate security and compliance audits and provide the detail needed for security forensics investigations.

Defining the retention period required by statute, regulation, contract, and internal policy is an organizational data-governance decision.

#### VMware vDefend (Contributes)

VMware vDefend retains security event data generated by its own features across defined periods. Network Detection and Response (NDR) collects and retains detection events and campaign data for 12 months. For active subscriptions, IDS events, network events, VM identifiers, rules and policies, conversation history, and security profiles are retained for one year, and for 90 days following subscription expiration. Security Services Platform (SSP) stores intrusion events and flow data for 30 days each. The IDS/IPS monitoring view retains detailed logs for the last 14 days. SSP provides the ssp_flow_storage.avg_flow_storage_ratio metric, which gives operators visibility into the ratio of current retention days to predicted full days for flow storage.

For forwarding events to external systems, vDefend Distributed IDS/IPS can be configured to send IDS events to external syslog consumers; this setting is disabled by default and must be explicitly enabled. Syslog messages from vDefend appliances conform to RFC 5424, and messages from ESX hosts conform to RFC 3164. SSP can be configured to collect and transmit log messages to a remote syslog server. Identity Firewall Event Log Sources can be integrated with VCF Log Management for centralized logging and monitoring.

VMware vDefend is not an organization-wide log retention or SIEM solution. Meeting statutory, regulatory, and contractual retention periods requires organizations to forward vDefend events to a dedicated log management or SIEM platform, where custom retention policies can be applied.

#### VCF Protection and Recovery (Contributes)

VCF Protection and Recovery (PNR) generates and preserves multiple categories of operational and security-specific logs that support after-the-fact investigation of recovery-related events.

PNR records operational information into log files that exclude sensitive data such as private keys and passwords. vSphere Replication maintains dedicated security audit logs at `/opt/vmware/support/logs/hms/hms-audit.log` and broker logs at `/opt/vmware/support/logs/hbr` on the appliance and at `/var/run/log` on ESX hosts. Security-relevant events captured in these logs include authorization error messages, certificate verification failures, and session activity such as logout events with timestamps, user identity, source IP address, and operation IDs.

PNR records structured event data across its components, with each event carrying a corresponding alarm that PNR can trigger for health tracking and issue resolution. Protection group activity is logged as typed events: consistency group additions, datastore membership changes, and protection group errors are recorded as Info- or Error-level events, respectively. vSphere Replication generates typed audit events for replication lifecycle transitions, including when virtual machines and hosts are configured or unconfigured for replication. Recovery operations are preserved in a per-plan history log; reprotect operations are included in this log and can be exported as a report, providing a record for post-recovery verification.

The Clean Room Orchestrator records events with a structured schema that includes timestamp, priority level, message content, component name, severity level, configuration ID, component ID, and event type. Snapshot task events are captured upon completion and are accessible through the Snapshot log interface in the event details panel.

For forwarding and long-term retention, the PNR Appliance natively supports forwarding log files to remote syslog servers for log analysis and centralized monitoring. PNR supports forwarding events to VCF Log Management (version 9.0 and above), enabling log data to flow into centralized log management infrastructure. PNR also integrates with Microsoft Azure Log Analytics Workspace for custom log collection using Data Collection Rules (DCR) and Data Collection Endpoints (DCE), providing a cloud-native retention path.

Per-component logging levels can be adjusted through the advanced configuration interface. The `logManager.Persistence` setting controls the logging verbosity for persistence-related events, with a default value of verbose, allowing administrators to tune log volume to match available storage and retention requirements.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer (Avi) maintains an event log system that records system activities, configuration changes, and operational events, with an audit trail that tracks who made configuration changes and when. The Avi Controller preserves a permanent log of the underlying events and metrics that triggered alerts, retaining those records beyond the alert expiry period.

The 9.1 documentation specifies that events raised by Avi Load Balancer components must persist in a secure manner for a minimum of 90 days for audit compliance. The retention policy is configurable: administrators can adjust the periodic interval and the threshold that triggers policy enforcement based on system and infrastructure requirements. The Avi Controller analytics API supports querying event logs for periods of up to one year, and the documentation recommends reviewing event logs over a one-year window to maintain audit trails of configuration changes.

For compliance-grade long-term retention beyond the on-appliance minimum, Avi provides the Syslog-Audit-Persistence feature, configured through the Controller's Alert Actions settings. This feature streams audit compliance events to external syslog servers. The Avi Controller and Service Engine also log audit records for trusted channel initiation, termination, and failures to Events, Syslog, and Splunk destinations. The documentation recommends streaming all logs directly to an external server such as Splunk for assured retention; Avi's Controller Settings allow specification of syslog server destination details.

There are retention constraints that organizations should account for when designing their log retention architecture. Configuring syslog notifications in the Avi Controller forwards alert events to syslog servers but does not directly export virtual service logs; those must be pulled from an external logging system through the API or scripted to be pushed from the Controller to a remote destination. In the absence of active queries, application logs do not leave the Service Engines that collected them. For retention periods beyond the built-in minimum, administrators must configure Syslog-Audit-Persistence or an equivalent export mechanism to an external destination and maintain that destination's storage capacity and retention settings independently.

Not applicable for this control: VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of this product.

### Control 19.2

> Providers that are financial institutions subject to requirements regarding their internal governance, arrangements or processes under Union financial services law shall maintain the logs automatically generated by their high-risk AI systems as part of the documentation kept under the relevant financial services law.

**SCF Controls:** MON-10

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides configurable event log retention across its component products, allowing organizations to align retention periods with their records retention requirements and support after-the-fact investigations of security incidents.

VCF Automation offers direct control over log history retention through its Activity Log configuration. Administrators can specify the number of days of log history to keep before automatic deletion, or set the value to zero to retain logs indefinitely. This flexibility allows organizations to match retention to their specific statutory, regulatory, or contractual obligations without external tooling.

VCF Log Management is the centralized log aggregation platform and provides configurable data retention periods that govern how long collected audit events remain available for query and analysis. Within VCF Log Management, administrators define log partitions that segregate collected logs by criteria such as source or category, each with its own retention period measured in days, so that security audit records can be retained longer than routine operational logs to match differing records-retention obligations. VCF Log Management removes logs from disk once a partition's retention period is met, and partitions can be archived to external NFS or S3 storage for retention beyond the active log store. VCF Operations surfaces audit events with selectable time ranges of 1, 6, 12, 24, and 48 hours for immediate review, with longer-term availability determined by the retention policy configured in the VCF Log Management instance. When the retention period is set to zero, logs are kept indefinitely and are not automatically removed based on time. VCF Operations for Networks adds its own retention controls, with entity metrics retention configurable from one month to six months. Administrators should back up log files before reducing any retention period, as the change deletes all data older than the newly specified window. Audit logs in VCF Operations for Networks capture administrative actions carried out in the system, including regular CRUD operations and login/logout alerts.

At the host layer, VMware ESX (ESX) provides log file rotation controls that govern how many log files the system maintains locally. When the configured limit is reached, the oldest file is removed. The local syslog directory location is configurable through the Syslog.global.logDir parameter, allowing administrators to point log storage to a volume sized for their retention needs. ESX audit records can be directed to a remote syslog host separately from general syslog messages by enabling the Syslog.global.auditRecord.remote parameter, which works in conjunction with Syslog.global.logHost to specify the destination. ESX and vCenter services maintain separate log files, each with their own rotation and retention behavior.

The Consumption layer of VCF, encompassing VMware Kubernetes Service (VKS) clusters, vSphere Supervisor, and vSphere Namespaces, produces structured audit and operational log data and includes built-in forwarding infrastructure so that organizational retention policies can be applied at external receivers. The Kubernetes API server (kube-apiserver) running on VKS clusters generates audit events conforming to the audit.k8s.io API group. Each event captures the requesting user, timestamp, resource accessed, and the audit level at which it was generated. The --audit-log-path flag directs these events to a file on the node, and the --audit-log-maxage parameter defines the maximum number of days to retain old audit log files based on the timestamp encoded in the filename, providing a direct file-level retention control that can be aligned to statutory or regulatory requirements. Audit policy rules govern which events are recorded at four levels: None (not recorded), Metadata, Request, or RequestResponse. Organizations should note that standard Kubernetes cluster Event objects in the core API group have limited in-cluster retention and should not be relied upon as a compliance log source; the kube-apiserver audit logging subsystem, written to files or forwarded via webhook, is the appropriate mechanism for compliance-relevant event data.

VKS clusters include Fluent Bit logging agents deployed in the vmware-system-logging namespace. These agents collect container logs, Linux daemon logs, Linux authentication logs, and Kubernetes API server audit logs, tagging each category separately to support targeted routing and retention policies at the receiving system. Fluent Bit can forward logs to Syslog servers, HTTP endpoints, Elasticsearch, Kafka, Splunk, and VCF Log Management; a sample configuration for forwarding to VCF Log Management is included in the Fluent Bit standard package available on VKS clusters. For workloads running as vSphere Pods in a vSphere Namespace, applying a LogAgentConfiguration Custom Resource to the namespace directs syslog messages to a remote Syslog server; each message carries metadata fields for namespace name, pod UID, pod name, container name, and ESX host name, supporting forensic traceability after a security incident. Kubernetes handles log rotation for applications writing to standard output to prevent uncontrolled growth on local node storage. VKS clusters generate additional component logs from CAPI, CAPV, VM Operator, and the VKS Controller Manager, which are accessible via kubectl and gathered in support bundles along with containerd journal logs for incident investigation.

The vSphere Supervisor control plane collects its own kube-apiserver audit logs through Fluent Bit, tagging them with the audit.apiserver.* prefix and reading from /var/log/vmware/audit/kube-apiserver.log on the Supervisor nodes. The Supervisor can also be configured to preserve the source IP addresses of authentication and Kubernetes APIServer requests, making them available for inspection in audit logs and supporting forensic reconstruction of access events.

For long-term and centralized retention, VCF supports forwarding event logs from all major components to remote syslog infrastructure. ESX hosts can be configured to send syslog messages to a remote log server using the esxcli system syslog config set command. VMware vCenter can also stream events to a remote syslog server by enabling the vpxd.event.syslog.enabled parameter in the vCenter Management Interface. The vCenter local database is not intended for long-term archival retention: events are deleted at the end of the configured retention period, and extending retention beyond the default requires corresponding database capacity increases. NSX sends audit logs directly to the configured remote syslog server, with NSX Manager audit logging enabled by default and recording security policy changes with request identifiers and timestamps for traceability. VCF Operations integrates its audit log with syslog and supports configuring a syslog collector to gather all audit records. VCF Log Management can also pull tasks, events, and alerts from vCenter instances and receive syslog feeds from ESX hosts through its Log Collections configuration. Log collection from vCenter can be activated directly from VCF Operations when vCenter is integrated. This centralized collection architecture enables organizations to apply retention policies at the aggregation layer that match their compliance requirements, independent of local component retention limits.

The audit events captured across VCF components include administrative actions such as login, logout, object creation and deletion, configuration modifications, capability checks, and security policy changes. NSX audit logs include structured fields for audit flag, component, log level, request ID, and subcomponent, providing the detail needed for forensic analysis. NSX supports logging and auditing capabilities that can be integrated with external logging and monitoring solutions to monitor for security events and anomalies. VCF Operations audit events are designed to facilitate security and compliance audits and provide the detail needed for security forensics investigations.

Defining the retention period required by statute, regulation, contract, and internal policy is an organizational data-governance decision.

#### VMware vDefend (Contributes)

VMware vDefend retains security event data generated by its own features across defined periods. Network Detection and Response (NDR) collects and retains detection events and campaign data for 12 months. For active subscriptions, IDS events, network events, VM identifiers, rules and policies, conversation history, and security profiles are retained for one year, and for 90 days following subscription expiration. Security Services Platform (SSP) stores intrusion events and flow data for 30 days each. The IDS/IPS monitoring view retains detailed logs for the last 14 days. SSP provides the ssp_flow_storage.avg_flow_storage_ratio metric, which gives operators visibility into the ratio of current retention days to predicted full days for flow storage.

For forwarding events to external systems, vDefend Distributed IDS/IPS can be configured to send IDS events to external syslog consumers; this setting is disabled by default and must be explicitly enabled. Syslog messages from vDefend appliances conform to RFC 5424, and messages from ESX hosts conform to RFC 3164. SSP can be configured to collect and transmit log messages to a remote syslog server. Identity Firewall Event Log Sources can be integrated with VCF Log Management for centralized logging and monitoring.

VMware vDefend is not an organization-wide log retention or SIEM solution. Meeting statutory, regulatory, and contractual retention periods requires organizations to forward vDefend events to a dedicated log management or SIEM platform, where custom retention policies can be applied.

#### VCF Protection and Recovery (Contributes)

VCF Protection and Recovery (PNR) generates and preserves multiple categories of operational and security-specific logs that support after-the-fact investigation of recovery-related events.

PNR records operational information into log files that exclude sensitive data such as private keys and passwords. vSphere Replication maintains dedicated security audit logs at `/opt/vmware/support/logs/hms/hms-audit.log` and broker logs at `/opt/vmware/support/logs/hbr` on the appliance and at `/var/run/log` on ESX hosts. Security-relevant events captured in these logs include authorization error messages, certificate verification failures, and session activity such as logout events with timestamps, user identity, source IP address, and operation IDs.

PNR records structured event data across its components, with each event carrying a corresponding alarm that PNR can trigger for health tracking and issue resolution. Protection group activity is logged as typed events: consistency group additions, datastore membership changes, and protection group errors are recorded as Info- or Error-level events, respectively. vSphere Replication generates typed audit events for replication lifecycle transitions, including when virtual machines and hosts are configured or unconfigured for replication. Recovery operations are preserved in a per-plan history log; reprotect operations are included in this log and can be exported as a report, providing a record for post-recovery verification.

The Clean Room Orchestrator records events with a structured schema that includes timestamp, priority level, message content, component name, severity level, configuration ID, component ID, and event type. Snapshot task events are captured upon completion and are accessible through the Snapshot log interface in the event details panel.

For forwarding and long-term retention, the PNR Appliance natively supports forwarding log files to remote syslog servers for log analysis and centralized monitoring. PNR supports forwarding events to VCF Log Management (version 9.0 and above), enabling log data to flow into centralized log management infrastructure. PNR also integrates with Microsoft Azure Log Analytics Workspace for custom log collection using Data Collection Rules (DCR) and Data Collection Endpoints (DCE), providing a cloud-native retention path.

Per-component logging levels can be adjusted through the advanced configuration interface. The `logManager.Persistence` setting controls the logging verbosity for persistence-related events, with a default value of verbose, allowing administrators to tune log volume to match available storage and retention requirements.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer (Avi) maintains an event log system that records system activities, configuration changes, and operational events, with an audit trail that tracks who made configuration changes and when. The Avi Controller preserves a permanent log of the underlying events and metrics that triggered alerts, retaining those records beyond the alert expiry period.

The 9.1 documentation specifies that events raised by Avi Load Balancer components must persist in a secure manner for a minimum of 90 days for audit compliance. The retention policy is configurable: administrators can adjust the periodic interval and the threshold that triggers policy enforcement based on system and infrastructure requirements. The Avi Controller analytics API supports querying event logs for periods of up to one year, and the documentation recommends reviewing event logs over a one-year window to maintain audit trails of configuration changes.

For compliance-grade long-term retention beyond the on-appliance minimum, Avi provides the Syslog-Audit-Persistence feature, configured through the Controller's Alert Actions settings. This feature streams audit compliance events to external syslog servers. The Avi Controller and Service Engine also log audit records for trusted channel initiation, termination, and failures to Events, Syslog, and Splunk destinations. The documentation recommends streaming all logs directly to an external server such as Splunk for assured retention; Avi's Controller Settings allow specification of syslog server destination details.

There are retention constraints that organizations should account for when designing their log retention architecture. Configuring syslog notifications in the Avi Controller forwards alert events to syslog servers but does not directly export virtual service logs; those must be pulled from an external logging system through the API or scripted to be pushed from the Controller to a remote destination. In the absence of active queries, application logs do not leave the Service Engines that collected them. For retention periods beyond the built-in minimum, administrators must configure Syslog-Audit-Persistence or an equivalent export mechanism to an external destination and maintain that destination's storage capacity and retention settings independently.

Not applicable for this control: VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of this product.

### Control 20.1

> Providers of high-risk AI systems which consider or have reason to consider that a high-risk AI system that they have placed on the market or put into service is not in conformity with this Regulation shall immediately take the necessary corrective actions to bring that system into conformity, to withdraw it, to disable it, or to recall it, as appropriate. They shall inform the distributors of the high-risk AI system concerned and, where applicable, the deployers, the authorised representative and importers accordingly.

**SCF Controls:** CPL-01.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 20.2

> Where the high-risk AI system presents a risk within the meaning of Article 79(1) and the provider becomes aware of that risk, it shall immediately investigate the causes, in collaboration with the reporting deployer, where applicable, and inform the market surveillance authorities competent for the high-risk AI system concerned and, where applicable, the notified body that issued a certificate for that high-risk AI system in accordance with Article 44, in particular, of the nature of the non-compliance and of any relevant corrective action taken.

**SCF Controls:** AAT-17.3, AAT-18, AAT-18.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 21.1

> Providers of high-risk AI systems shall, upon a reasoned request by a competent authority, provide that authority all the information and documentation necessary to demonstrate the conformity of the high-risk AI system with the requirements set out in Section 2, in a language which can be easily understood by the authority in one of the official languages of the institutions of the Union as indicated by the Member State concerned.

**SCF Controls:** CPL-01.3, CPL-05

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

### Control 21.2

> Upon a reasoned request by a competent authority, providers shall also give the requesting competent authority, as applicable, access to the automatically generated logs of the high-risk AI system referred to in Article 12(1), to the extent such logs are under their control.

**SCF Controls:** CPL-05.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides a layered role-based access control (RBAC) framework across its components that enables organizations to provision investigators with tightly scoped, least-privilege access to only the assets required for an investigation.

VMware vCenter supports the creation of custom roles with granular privilege assignment and permission propagation to vSphere objects. Administrators can define investigation-specific roles containing only the minimum set of required privileges and apply them at any level of the inventory hierarchy. Several built-in roles support read-only and restricted access patterns suitable for investigative work. The Read Only role grants only three system-defined privileges (System.Anonymous, System.View, and System.Read), providing a baseline for investigators who need visibility without modification capability. The operator role is the most restricted authorization level, allowing users to view information about vCenter but restricting them from altering its configuration. The No Access role can be used to explicitly deny access to specific objects, restricting an investigator's visibility to only the areas relevant to the investigation. New users and groups are assigned the No Access role by default in vCenter, establishing a deny-by-default posture that requires explicit role assignment before an investigator account gains any access. The No Cryptography Administrator role supports all Administrator privileges except for Cryptographic Operations privileges, allowing sensitive capabilities to be carved out from otherwise broad roles when provisioning investigator access. The SystemConfiguration.ReadOnly privilege, available through VCF SSO identity source configuration, can be granted to allow investigators read-only access to vCenter appliance management operations without broader administrative rights.

VCF Operations and VCF Automation have additional role-based controls that support scoped investigative access. The VCF Operations ReadOnly role restricts users from performing write actions such as create, update, or delete. VCF Operations also supports scope-based access control, where defined scopes associate user accounts and user groups with specific objects and object hierarchies. This restricts users without appropriate privileges from viewing collected data for objects outside their assigned scope, allowing administrators to limit an investigator's visibility to a specific subset of monitored infrastructure. Per-permission role construction under Administration > Control Panel > Roles allows further tailoring. The Auditor role in VCF Operations for Networks similarly restricts users to read-only access, blocking all create, add, edit, or delete actions.

In VCF Automation, the Project Auditor role is restricted to read-only access, and the Organization Auditor role can view policy enforcements. Project-scoped access through roles such as Project Admin, Security Admin, Network Admin, Security Operator, and Network Operator means users assigned to specific projects can view only the projects they have access to. This project-level scoping enables administrators to restrict an investigator's access to a specific subset of the infrastructure rather than granting broad visibility. Custom user roles can also be created to further tailor permissions, expanding or restricting access to match the exact scope of an investigation.

Identity provider federation allows investigator accounts to be provisioned through the organization's identity provider, keeping lifecycle management centralized. Token-based authentication through the federated identity provider reduces the risk of credential exposure during an investigation. Custom roles can be time-bounded through the identity provider's policies, so investigator access is automatically revoked when the engagement concludes.

VCF Operations user activity auditing records investigator actions during the engagement, providing traceability of user activities including logging in, actions on clusters and nodes, changes to system passwords, activating certificates, and logging out. The audit log can be sent to an external syslog server for independent retention. Audit logs can also be downloaded in PDF or XLS format. VCF Operations for Networks integrates its audit log with syslog, and the syslog collector can be configured to collect all audit logs. Event auditing across VCF provides visibility into platform interaction changes and access events, supporting accountability and traceability during investigations.

Defining the specific scope of investigator access, the procedures governing provisioning and deprovisioning of investigator accounts, and the organizational policies that authorize and oversee official investigations remain organizational responsibilities. VCF provides the technical controls to enforce least privilege and least functionality, but the administrative framework around when and how those controls are applied requires organizational processes.

VMware Private AI Services (PAIS) provides several access control mechanisms that can be configured to limit investigators to the specific AI infrastructure assets needed for an official investigation.

Model Gallery access is enforced through Harbor project access capabilities, which restrict who can read or write the machine learning models and tuning data stored in the gallery. Harbor projects support per-project permission grants, and read-only access is separable from read-write access. An administrator can grant an investigator read access only to the project containing the models or training data relevant to the investigation, without exposing other projects in the registry.

PAIS access is controlled through OIDC group-based authorization configured via the authorizedGroups setting (also exposed as oidc-authorized-groups in the VCF Automation UI). Accounts that are not members of an authorized group cannot access PAIS in a namespace. An administrator can create an investigator-specific OIDC group and add it to the authorized groups list only for the namespaces that fall within the investigation scope, restricting the investigator to those specific services. Configuring this requires coordination with an OIDC provider administrator to provision group memberships and update authorized group lists.

When PAIS is deployed with VCF Automation, project-based permissions govern which PAIS catalog items an account can request or deploy. Organization administrators must explicitly grant permissions before any account can request AI catalog items, and catalog items are shared with selected project members. This scopes an investigator to only the catalog items relevant to the investigation, with no path to access or modify workloads outside the defined project membership.

For Knowledge Base and Data Indexing and Retrieval access in PAIS, data sources are linked to knowledge bases at the namespace level, and external data sources such as Microsoft SharePoint and Google Drive folders are reached under service-account credentials with view-only sharing for Google Drive folders. This allows an administrator to give an investigator visibility into a specific knowledge base without granting broader access to the underlying data repositories. The MCP integration in PAIS displays available tools in a tool gallery for namespace-level examination and approval before use in agents, so an investigator-scoped namespace is limited to an approved tool set.

For observability access, PAIS integrates with Grafana for metrics visualization using OIDC provider authentication, and the grafana-oidc-role-mapping setting can automatically assign the Admin role to a subset of OIDC users and the Viewer role to the remaining users based on group membership. Administrators can configure investigator accounts to receive the Viewer role rather than the Admin role, limiting access to read-only metric and log review. PAIS can also send LLM traces to an OpenTelemetry Collector and expose Prometheus metrics, providing an auditable record of agent execution flow and knowledge base indexing activity that can be reviewed during an investigation.

#### VMware vDefend (Contributes)

VMware vDefend contributes to supporting official investigations through role-based access control that can provision accounts with appropriately scoped, read-only visibility into security data and policy artifacts.

The Security Services Platform, vDefend's control-plane component for analytics and detection services, defines five distinct roles with differentiated permissions: Enterprise Admin, Auditor, Security Engineer, Security Operator, and Support Bundle Collector. The Auditor role is designed for read-only observation: it holds Read permission for deployment, management, upgrade, authentication configuration, and Security Intelligence activation; Full Access to view Rule Analysis results and download reports; and Restricted access for export operations and data collection configuration. This structure allows organizations to provision investigative accounts that can review security posture and policy artifacts without the ability to modify them.

Role-level isolation extends to individual vDefend services. Within Network Detection and Response (NDR), the Auditor role provides Read access to view detections, campaigns, and SIEM configuration, while Full Access for triage operations and SIEM configuration editing is reserved for the NDR Enterprise Admin role. Within the Malware Prevention Service, the Auditor role provides Read access to view generated events, cloud analysis reports, and SIEM configuration, with no access to service activation, prechecks, or exclusion management.

Security Intelligence, integrated within the Security Services Platform, provides filtering mechanisms in the Flow Details view that allow investigators to narrow the set of flows displayed for focused analysis.

Provisioning external government investigators with tailored least-functionality access requires organizational processes and identity management controls beyond what vDefend provides natively. vDefend's built-in roles are designed for operational security personnel; mapping those roles to the specific scope constraints of a government investigation is an organizational responsibility.

#### VCF Protection and Recovery (Contributes)

VCF Protection and Recovery (PNR) provides role-based access control frameworks that support provisioning investigator accounts with appropriately scoped access to disaster recovery and recovery operations.

PNR restricts login to VMware vCenter administrators by default; other users must be explicitly granted access by an administrator. This default-restrict posture means investigator accounts must be deliberately provisioned rather than inheriting access. PNR augments vCenter roles and permissions with its own permission layer, providing detailed control over PNR-specific tasks and operations. Users assigned a PNR role who are not vCenter administrators do not automatically receive vSphere Replication privileges; the two permission domains are independent. Investigators requiring access to both PNR and vSphere Replication operations should be added to separate user groups for each component to avoid inadvertent escalation to vCenter administrator-level privilege.

PNR defines predefined roles with progressively narrower privilege sets. The SRM Administrator role permits full configuration and administration operations. The Protection Groups Administrator role restricts access to protection group management. The Remote User role grants the minimum set of privileges needed for cross-site PNR operations, including datastore browsing, low-level file operations, and virtual machine file and metadata updates. Roles that permit command execution on the PNR Server are assigned to trusted administrator-level users only. PNR uses these roles to restrict each user's access to the resources relevant to their assigned scope and to prevent access to resources belonging to other users.

When PNR is deployed with VCF Automation, access is managed through an organizational hierarchy. Provider Administrators hold the system administrator role and manage the installation, region pairing, and organization-level access grants. Organization Administrators and Project Administrators have progressively narrower scopes. Project Advanced Users have the most restricted access. Provider Administrators also control which replication classes each organization can access, limiting what recovery configurations are visible to non-administrator users. Investigator accounts can be provisioned at the appropriate tier within this hierarchy to limit visibility to the project or organization under investigation.

In shared recovery site configurations, vCenter administrators manage PNR permissions so that each user has sufficient privileges to configure and use PNR within their assigned scope, but no user has access to resources belonging to other users or organizations. PNR enforces this by restricting users from renaming, moving, or deleting data centers or hosts in shared configurations. PNR also verifies permissions on the remote vCenter instance as part of access control validation, so cross-site access is subject to permission checks at both ends.

The Clean Room Orchestrator component, used for ransomware recovery workflows, restricts connections to only IP addresses or IP address ranges explicitly added to a configured access list. The management access list for the Clean Room Orchestrator interface must specify allowed public IP addresses and ranges, limiting which systems can connect to the isolated recovery environment. This IP-based restriction allows administrators to scope investigator access to the clean room environment to specific authorized endpoints.

PNR records events with timestamp, priority level, message content, component name, severity level, configuration ID, component ID, and event type for audit trail purposes. Operational log files record activity and do not contain sensitive information such as private keys or passwords. These records provide an evidence trail of investigator access and actions taken during an engagement.

The organizational processes governing investigation management, including defining the scope of investigator access, establishing provisioning and deprovisioning procedures, and coordinating with legal or regulatory authorities, remain outside the product's scope.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer provides a role-based access control (RBAC) framework that administrators can use to create purpose-built investigator accounts scoped to the minimum set of resources and data required for an official investigation.

The Avi Controller supports creation of custom roles with granular, per-resource access configuration. Three permission levels are available for each resource type: Full Access (create, read, update, and delete), Read (view only), and None (no access). An administrator can define a role that grants read-only access to application logs, WAF analytics, virtual service configurations, and the Application Security Report, while setting no-access permissions on administrative functions such as cloud configuration, service engine management, or policy modification. The RBAC framework enforces these boundaries so that users can access only what their assigned role permits.

In addition to custom roles, the Avi Controller includes a built-in Auditor role that has read-only access to view deployment information, upgrade status, and authentication and authorization configuration without the ability to make changes. This role provides a ready-made least-privilege account template for investigation use cases. Extended granular RBAC allows access control to be applied and enforced on cloud objects using label-based permissions, enabling an investigator account to be further scoped to only the specific application objects within the investigation's scope.

Role assignments are scoped to specific tenants, so an investigator account can be provisioned within only the tenant or tenants corresponding to the applications under investigation, blocking lateral access to other application environments managed through the same Avi Controller. Role-to-tenant mapping can be automated through TACACS+ authentication profile rules, which assign users to tenants and roles based on TACACS+ attribute values returned at login. Integration with external identity sources such as OpenLDAP through ISE TACACS+ allows investigator accounts to be provisioned and deprovisioned through the organization's directory infrastructure without creating long-lived local credentials on the Avi Controller.

The Application Security Report provides records of WAF data, statistics, and security posture information, making application-layer traffic data accessible to investigators through the reporting interface rather than requiring direct access to live traffic or lower-level system components. Read-only RBAC grants can be scoped to specific object types including Analytics Profiles, SSL/TLS Profiles, PKI Profiles, and Health Monitor data, narrowing what an investigator account can view to the data relevant to the investigation.

Not applicable for this control: VMware Data Services Manager. This control addresses an end user activity or process, a design decision, or activity outside the scope of this product.

### Control 21.3

> Any information obtained by a competent authority pursuant to this Article shall be treated in accordance with the confidentiality obligations set out in Article 78.

**SCF Controls:** CPL-01

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 22.1

> Prior to making their high-risk AI systems available on the Union market, providers established in third countries shall, by written mandate, appoint an authorised representative which is established in the Union.

**SCF Controls:** CPL-08

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 22.2

> The provider shall enable its authorised representative to perform the tasks specified in the mandate received from the provider.

**SCF Controls:** CPL-08

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 22.3

> The authorised representative shall perform the tasks specified in the mandate received from the provider. It shall provide a copy of the mandate to the market surveillance authorities upon request, in one of the official languages of the institutions of the Union, as indicated by the competent authority. For the purposes of this Regulation, the mandate shall empower the authorised representative to carry out the following tasks:

**SCF Controls:** CPL-01.3, CPL-08

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

### Control 22.3(a)

> Verify that the EU declaration of conformity referred to in Article 47 and the technical documentation referred to in Article 11 have been drawn up and that an appropriate conformity assessment procedure has been carried out by the provider.

**SCF Controls:** CPL-01.3

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 22.3(c)

> Provide a competent authority, upon a reasoned request, with all the information and documentation, including that referred to in point (b) of this subparagraph, necessary to demonstrate the conformity of a high-risk AI system with the requirements set out in Section 2, including access to the logs, as referred to in Article 12(1), automatically generated by the high-risk AI system, to the extent such logs are under the control of the provider.

**SCF Controls:** CPL-05

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 22.3(d)

> Cooperate with competent authorities, upon a reasoned request, in any action the latter take in relation to the high-risk AI system, in particular to reduce and mitigate the risks posed by the high-risk AI system.

**SCF Controls:** CPL-05

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 22.3(e)

> Where applicable, comply with the registration obligations referred to in Article 49(1), or, if the registration is carried out by the provider itself, ensure that the information referred to in point 3 of Section A of Annex VIII is correct.

**SCF Controls:** AAT-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 23.1

> Before placing a high-risk AI system on the market, importers shall ensure that the system is in conformity with this Regulation by verifying that:

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 23.1(a)

> The relevant conformity assessment procedure referred to in Article 43 has been carried out by the provider of the high-risk AI system.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 23.1(b)

> The provider has drawn up the technical documentation in accordance with Article 11 and Annex IV.

**SCF Controls:** TDA-22

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 23.1(c)

> The system bears the required CE marking and is accompanied by the EU declaration of conformity referred to in Article 47 and instructions for use.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 23.1(d)

> The provider has appointed an authorised representative in accordance with Article 22(1).

**SCF Controls:** CPL-08

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 23.2

> Where an importer has sufficient reason to consider that a high-risk AI system is not in conformity with this Regulation, or is falsified, or accompanied by falsified documentation, it shall not place the system on the market until it has been brought into conformity. Where the high-risk AI system presents a risk within the meaning of Article 79(1), the importer shall inform the provider of the system, the authorised representative and the market surveillance authorities to that effect.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 23.3

> Importers shall indicate their name, registered trade name or registered trade mark, and the address at which they can be contacted on the high-risk AI system and on its packaging or its accompanying documentation, where applicable.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 23.4

> Importers shall ensure that, while a high-risk AI system is under their responsibility, storage or transport conditions, where applicable, do not jeopardise its compliance with the requirements set out in Section 2.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 23.5

> Importers shall keep, for a period of 10 years after the high-risk AI system has been placed on the market or put into service, a copy of the certificate issued by the notified body, where applicable, of the instructions for use, and of the EU declaration of conformity referred to in Article 47.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 23.6

> Importers shall provide the relevant competent authorities, upon a reasoned request, with all the necessary information and documentation, including that referred to in paragraph 5, to demonstrate the conformity of a high-risk AI system with the requirements set out in Section 2 in a language which can be easily understood by them. For this purpose, they shall also ensure that the technical documentation can be made available to those authorities.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 23.7

> Importers shall cooperate with the relevant competent authorities in any action those authorities take in relation to a high-risk AI system placed on the market by the importers, in particular to reduce and mitigate the risks posed by it.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 24.1

> Before making a high-risk AI system available on the market, distributors shall verify that it bears the required CE marking, that it is accompanied by a copy of the EU declaration of conformity referred to in Article 47 and instructions for use, and that the provider and the importer of that system, as applicable, have complied with their respective obligations as laid down in Article 16, points (b) and (c) and Article 23(3).

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 24.2

> Where a distributor considers or has reason to consider, on the basis of the information in its possession, that a high-risk AI system is not in conformity with the requirements set out in Section 2, it shall not make the high-risk AI system available on the market until the system has been brought into conformity with those requirements. Furthermore, where the high-risk AI system presents a risk within the meaning of Article 79(1), the distributor shall inform the provider or the importer of the system, as applicable, to that effect.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 24.3

> Distributors shall ensure that, while a high-risk AI system is under their responsibility, storage or transport conditions, where applicable, do not jeopardise the compliance of the system with the requirements set out in Section 2.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 24.4

> A distributor that considers or has reason to consider, on the basis of the information in its possession, a high-risk AI system which it has made available on the market not to be in conformity with the requirements set out in Section 2, shall take the corrective actions necessary to bring that system into conformity with those requirements, to withdraw it or recall it, or shall ensure that the provider, the importer or any relevant operator, as appropriate, takes those corrective actions. Where the high-risk AI system presents a risk within the meaning of Article 79(1), the distributor shall immediately inform the provider or importer of the system and the authorities competent for the high-risk AI system concerned, giving details, in particular, of the non-compliance and of any corrective actions taken.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 24.5

> Upon a reasoned request from a relevant competent authority, distributors of a high-risk AI system shall provide that authority with all the information and documentation regarding their actions pursuant to paragraphs 1 to 4 necessary to demonstrate the conformity of that system with the requirements set out in Section 2.

**SCF Controls:** CPL-05

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 24.6

> Distributors shall cooperate with the relevant competent authorities in any action those authorities take in relation to a high-risk AI system made available on the market by the distributors, in particular to reduce or mitigate the risk posed by it.

**SCF Controls:** CPL-05

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 25.1

> Any distributor, importer, deployer or other third-party shall be considered to be a provider of a high-risk AI system for the purposes of this Regulation and shall be subject to the obligations of the provider under Article 16, in any of the following circumstances:

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 25.1(a)

> They put their name or trademark on a high-risk AI system already placed on the market or put into service, without prejudice to contractual arrangements stipulating that the obligations are otherwise allocated.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 25.1(b)

> They make a substantial modification to a high-risk AI system that has already been placed on the market or has already been put into service in such a way that it remains a high-risk AI system pursuant to Article 6.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 25.1(c)

> They modify the intended purpose of an AI system, including a general-purpose AI system, which has not been classified as high-risk and has already been placed on the market or put into service in such a way that the AI system concerned becomes a high-risk AI system in accordance with Article 6.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 25.2

> Where the circumstances referred to in paragraph 1 occur, the provider that initially placed the AI system on the market or put it into service shall no longer be considered to be a provider of that specific AI system for the purposes of this Regulation. That initial provider shall closely cooperate with new providers and shall make available the necessary information and provide the reasonably expected technical access and other assistance that are required for the fulfilment of the obligations set out in this Regulation, in particular regarding the compliance with the conformity assessment of high-risk AI systems. This paragraph shall not apply in cases where the initial provider has clearly specified that its AI system is not to be changed into a high-risk AI system and therefore does not fall under the obligation to hand over the documentation.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 25.4

> The provider of a high-risk AI system and the third party that supplies an AI system, tools, services, components, or processes that are used or integrated in a high-risk AI system shall, by written agreement, specify the necessary information, capabilities, technical access and other assistance based on the generally acknowledged state of the art, in order to enable the provider of the high-risk AI system to fully comply with the obligations set out in this Regulation. This paragraph shall not apply to third parties making accessible to the public tools, services, processes, or components, other than general-purpose AI models, under a free and open-source licence. The AI Office may develop and recommend voluntary model terms for contracts between providers of high-risk AI systems and third parties that supply tools, services, components or processes that are used for or integrated into high-risk AI systems. When developing those voluntary model terms, the AI Office shall take into account possible contractual requirements applicable in specific sectors or business cases. The voluntary model terms shall be published and be available free of charge in an easily usable electronic format.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 26.1

> Deployers of high-risk AI systems shall take appropriate technical and organisational measures to ensure they use such systems in accordance with the instructions for use accompanying the systems, pursuant to paragraphs 3 and 6.

**SCF Controls:** AAT-22

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides a structured deployment workflow on VCF that enforces prerequisite gates aligned with developer-provided instructions. PAIS exposes a UI and an API for AI application developers to interact with deployed models and services, and a Harbor registry (or another OCI-compliant registry) is required so model images are staged before deployment. A Harbor administrator must create a project for PAIS in the private Harbor registry as part of the deployment workflow, and AI catalog items must be added to VCF Automation through the Private AI Services Quickstart before workloads can be provisioned. Models are uploaded to the Harbor model gallery using the vcf pais models push CLI command, with name, location, and tag specified, and a model image must exist in the gallery before an endpoint can be deployed. Model endpoints are deployed as Kubernetes resources in namespace-scoped environments, configured through the Model Runtime tab in VCF Automation by entering the model URL and selecting the appropriate saved secret. A completion model endpoint must be running before an agent can be deployed in Agent Builder. This sequenced workflow enforces the operational dependencies that model developers define.

PAIS supports both connected and disconnected (air-gapped) deployment modes, configured according to environment Internet connectivity. In a physically disconnected environment, deployment requires two host machines (a Bastion host with download access and an Admin host running Linux), along with a setup machine that has Docker and Helm installed. VCF Automation must be deployed before PAIS can be configured in either mode. PAIS must be activated in each organization namespace by an organization administrator or MLOps engineer after namespace creation, and activation requires prior completion of the Setup Workflows for Private AI Services. As part of activation, the API, ingress, rex worker, and Prometheus server pods must be verified as ready and running before PAISConfiguration is considered active. Deployment leases can be created to bound how long an AI deployment can exist, giving administrators a mechanism to control workload lifecycle.

VCF Automation's Quickstart wizard creates predefined catalog items from PAIS blueprints, establishing standardized deployment procedures that can be customized to meet organization-specific needs. Custom forms allow administrators to control which inputs users can modify at request time, constraining deployment parameters to values consistent with developer instructions. Org admins must explicitly grant permissions before project members can request AI catalog items, providing an administrative gate that controls who can deploy AI workloads on VMware Kubernetes Service (VKS) clusters. After the Quickstart completes, administrators should verify that Private AI catalog items are available to members of the selected project and monitor the provisioning process to confirm successful deployment.

Role separation supports organizational deployment controls. MLOps engineers distribute ML models across Deep Learning VMs, VKS clusters, and RAG applications through a central Harbor registry. Data scientists and DevOps engineers deploy workloads from self-service catalog items within their assigned projects and namespaces. Agent Builder provides an Add Instructions setting that allows deployers to configure system messages and prefixes, constraining the agent's behavior in accordance with intended use. Deployment automation is supported through YAML code generation for kubectl commands and REST API access to deployed model endpoints, enabling reproducible deployments that follow documented procedures. Cloud-init script logs for Deep Learning VM deployments are written to /var/log/dl.log, providing an audit trail of deployment activities.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 26.2

> Deployers shall assign human oversight to natural persons who have the necessary competence, training and authority, as well as the necessary support.

**SCF Controls:** AAT-22.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 26.4

> Without prejudice to paragraphs 1 and 2, to the extent the deployer exercises control over the input data, that deployer shall ensure that input data is relevant and sufficiently representative in view of the intended purpose of the high-risk AI system.

**SCF Controls:** AAT-22.5

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides several mechanisms that help organizations scope the input to AI workloads so it is relevant to the intended purpose of the AI or AAT system.

The Data Indexing and Retrieval service allows data scientists to connect to and index data from multiple sources for use in knowledge bases that supply contextual content to RAG applications. Each knowledge base is assembled from deliberately selected data sources that an authorized user adds by specifying a name, description, data source type, and required properties. A knowledge base can be linked to a maximum of ten data sources, and a single data source can be linked to multiple knowledge bases. The data source type is fixed at creation and cannot be changed afterward, so the connection between a knowledge base and a particular content store is established through a deliberate configuration step rather than implicit ingestion. PAIS supports linked data sources hosted in external content management systems, including Microsoft SharePoint sites and Amazon S3 compatible stores, and the service can automatically collect and index updates from linked sources over time, allowing organizations to keep knowledge bases current with the source of record. Service-account-keyed data sources require the corresponding service account credential at data source creation time, which keeps source access bound to a specific identity rather than ambient platform credentials.

The RAG architecture reinforces input relevance at query time. Indexing a knowledge base splits content into text chunks and generates embeddings using an embedding model endpoint, and at query time the service returns semantically relevant chunks from the curated knowledge base to the completion model as context. This retrieval step acts as a relevance filter, selecting input content that is contextually appropriate for the user's query within the boundaries of the curated data sources. Knowledge base operations track document counts (crawled, new, deleted, unmodified, modified, skipped) and per-media-type counts, which gives administrators visibility into what is actually being ingested and indexed for retrieval.

For tool-augmented agents, PAIS integrates with MCP servers and the Data Indexing and Retrieval service, with the available tools displayed in a tool gallery for namespace-level examination and approval. This gives an administrator a deliberate review point before tools that can supply external context to a model are exposed to consumers in a namespace.

Catalog items in VCF Automation, including AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, are scoped to selected namespaces, and custom forms on the underlying blueprints can be modified to control user inputs at request time. Activation of PAIS in a namespace is configured through a PAISConfiguration custom resource and is coordinated with the OIDC provider for identity and access management, so the set of users who can deploy AI workloads and configure knowledge bases or data sources is bounded by identity and namespace-level role assignments inherited from the platform.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 26.5

> Deployers shall monitor the operation of the high-risk AI system on the basis of the instructions for use and, where relevant, inform providers in accordance with Article 72. Where deployers have reason to consider that the use of the high-risk AI system in accordance with the instructions may result in that AI system presenting a risk within the meaning of Article 79(1), they shall, without undue delay, inform the provider or distributor and the relevant market surveillance authority, and shall suspend the use of that system. Where deployers have identified a serious incident, they shall also immediately inform first the provider, and then the importer or distributor and the relevant market surveillance authorities of that incident. If the deployer is not able to reach the provider, Article 73 shall apply mutatis mutandis . This obligation shall not cover sensitive operational data of deployers of AI systems which are law enforcement authorities. For deployers that are financial institutions subject to requirements regarding their internal governance, arrangements or processes under Union financial services law, the monitoring obligation set out in the first subparagraph shall be deemed to be fulfilled by complying with the rules on internal governance arrangements, processes and mechanisms pursuant to the relevant financial service law.

**SCF Controls:** AAT-22.6

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 26.6

> Deployers of high-risk AI systems shall keep the logs automatically generated by that high-risk AI system to the extent such logs are under their control, for a period appropriate to the intended purpose of the high-risk AI system, of at least six months, unless provided otherwise in applicable Union or national law, in particular in Union law on the protection of personal data. Deployers that are financial institutions subject to requirements regarding their internal governance, arrangements or processes under Union financial services law shall maintain the logs as part of the documentation kept pursuant to the relevant Union financial service law.

**SCF Controls:** AAT-16.8

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

The specific event data elements this control requires, including database query history, matched input data, and the identity of individuals who verified results, are characteristics of AI and autonomous technology applications and must be implemented by those applications. VCF does not operate AI systems or manage AI decision logic directly, so it does not natively record these application-level details. The Consumption layer of VCF, however, provides the audit framework, log collection infrastructure, and forwarding mechanisms that AI workloads running on the platform can use to satisfy the event recording requirements this control specifies.

The Kubernetes API server built into VMware Kubernetes Service (VKS) clusters, managed through the vSphere Supervisor, supports configurable audit logging governed by an audit policy. Each audit event captures the authenticated identity of the requesting user or service account, addressing the control's requirement to identify individuals involved in verification activities. Kubernetes Event objects record the time when events are first observed using the eventTime field with microsecond-level precision, and the API server records requestReceivedTimestamp and stageTimestamp fields in each audit event, addressing the start and end time requirements. Kubernetes audit policy determines which events are recorded and at what detail level, with log-file and webhook backends available for routing structured audit events to external log management systems for retention and analysis.

For application-level log collection, VKS clusters run Fluent Bit as a standard package deployed in the vmware-system-logging namespace. Fluent Bit automatically collects container logs, Kubernetes API audit logs, Linux daemon logs, and Linux authentication logs from every node, and can forward these streams to VCF Log Management over the CFAPI protocol or to external systems including Syslog, HTTP, Elasticsearch, Kafka, and Splunk. For workloads running in vSphere Namespaces, the LogAgentConfiguration Custom Resource enables structured Syslog streaming; each log message automatically includes the namespace name, pod UID, pod name, container name, and ESX host name, giving operators the context needed to correlate events back to specific workloads and requesting identities. Kubernetes also records pod scheduling, image pull operations, and container creation events with timestamps and source information in the event log, providing an infrastructure-level audit trail that complements application-generated records.

Argo CD, when deployed as a Supervisor Service, records application synchronization events including resource creation, sync status, and health status with timestamps, providing an additional audit trail for GitOps-managed AI workload deployments. AI workloads that produce structured event records can write them to standard output or dedicated log streams, which Fluent Bit collects and forwards without requiring additional agent deployment within the workload.

Operators enabling AI workloads on VKS should configure Kubernetes audit policies to capture API interactions at the Request or RequestResponse level, enable Fluent Bit forwarding to a centralized log management system, and apply the LogAgentConfiguration Custom Resource to vSphere Namespaces hosting AI workloads. AI application owners must implement structured logging that captures the four data elements this control requires; the platform supplies the collection, forwarding, and retention infrastructure that makes those records durable and queryable.

VMware Private AI Services (PAIS) provides AI-specific observability and logging mechanisms that partially address the enumerated requirements over and above platform-level logging.

For requirement (1) timestamps, PAIS supports LLM trace collection that sends traces from agents and knowledge base indexing to an OpenTelemetry Collector using HTTP/protobuf or gRPC, capturing timing information for AI service operations. Trace collection is activated by uncommenting the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge base operations record timing metrics including total time for downloading files, total time for generating embeddings, and total time of the index operation. PAIS Controller metrics are exposed at the Prometheus endpoint on the pais-controller-manager service, and observability can be activated through the PAISConfiguration custom resource to enable Prometheus metrics collection with a configurable storage class and retention period. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log. PAIS controller pod metrics can be streamed from the Supervisor cluster to VCF Operations, and PAIS metrics can be visualized in Grafana and VCF Operations. These mechanisms cover timing for inference, indexing, and infrastructure operations, while per-session start and end timestamps for individual agent conversations require additional logging configuration at the AI application layer.

For requirement (2) databases queried, PAIS knowledge bases can be linked to data sources that supply content for retrieval-augmented generation, and indexing operations record timing metrics tied to those configured data sources. Per-query identification of which specific data source returned matching content requires additional instrumentation beyond the indexing record.

For requirement (3) input data matched, knowledge base indexing records aggregate operations across documents but does not record which specific input content matched individual retrieval queries. This requirement is addressed only at aggregate granularity by PAIS itself.

For requirement (4) identification of individuals, PAIS uses VCF SSO and VCF Automation identity for access to deployment and management functions, attributing administrative actions to the authenticated user. Identification of individuals involved in verification of AI results beyond platform identity, such as application-level review and approval workflows, requires additional organizational tooling layered on top of the PAIS platform.

PAIS event logging is strongest for AI service timing and infrastructure observability, partial for data source documentation, and limited for per-query matching and individual verification tracking, which together justify a Contributes rating against this Process-categorized control.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 26.7

> Before putting into service or using a high-risk AI system at the workplace, deployers who are employers shall inform workers’ representatives and the affected workers that they will be subject to the use of the high-risk AI system. This information shall be provided, where applicable, in accordance with the rules and procedures laid down in Union and national law and practice on information of workers and their representatives.

**SCF Controls:** AAT-22.7

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 26.8

> Deployers of high-risk AI systems that are public authorities, or Union institutions, bodies, offices or agencies shall comply with the registration obligations referred to in Article 49. When such deployers find that the high-risk AI system that they envisage using has not been registered in the EU database referred to in Article 71, they shall not use that system and shall inform the provider or the distributor.

**SCF Controls:** AAT-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 26.9

> Where applicable, deployers of high-risk AI systems shall use the information provided under Article 13 of this Regulation to comply with their obligation to carry out a data protection impact assessment under Article 35 of Regulation (EU) 2016/679 or Article 27 of Directive (EU) 2016/680.

**SCF Controls:** RSK-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 26.11

> Without prejudice to Article 50 of this Regulation, deployers of high-risk AI systems referred to in Annex III that make decisions or assist in making decisions related to natural persons shall inform the natural persons that they are subject to the use of the high-risk AI system. For high-risk AI systems used for law enforcement purposes Article 13 of Directive (EU) 2016/680 shall apply.

**SCF Controls:** AAT-22.8

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 27.1

> Prior to deploying a high-risk AI system referred to in Article 6(2), with the exception of high-risk AI systems intended to be used in the area listed in point 2 of Annex III, deployers that are bodies governed by public law, or are private entities providing public services, and deployers of high-risk AI systems referred to in points 5 (b) and (c) of Annex III, shall perform an assessment of the impact on fundamental rights that the use of such system may produce. For that purpose, deployers shall perform an assessment consisting of:

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 27.1(a)

> A description of the deployer’s processes in which the high-risk AI system will be used in line with its intended purpose.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 27.1(b)

> A description of the period of time within which, and the frequency with which, each high-risk AI system is intended to be used.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 27.1(c)

> The categories of natural persons and groups likely to be affected by its use in the specific context.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 27.1(d)

> The specific risks of harm likely to have an impact on the categories of natural persons or groups of persons identified pursuant to point (c) of this paragraph, taking into account the information given by the provider pursuant to Article 13.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 27.1(e)

> A description of the implementation of human oversight measures, according to the instructions for use.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 27.1(f)

> The measures to be taken in the case of the materialisation of those risks, including the arrangements for internal governance and complaint mechanisms.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 27.2

> The obligation laid down in paragraph 1 applies to the first use of the high-risk AI system. The deployer may, in similar cases, rely on previously conducted fundamental rights impact assessments or existing impact assessments carried out by provider. If, during the use of the high-risk AI system, the deployer considers that any of the elements listed in paragraph 1 has changed or is no longer up to date, the deployer shall take the necessary steps to update the information.

**SCF Controls:** AAT-07.1, AAT-10

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides infrastructure that supports AI Test, Evaluation, Validation and Verification (TEVV) activities throughout the model lifecycle. Deep learning VMs provisioned from PAIS images provide dedicated testing environments for AI prototyping, fine-tuning, validation, and inference workloads. These DL VMs run on the same GPU-accelerated workload domains, vGPU profiles, and VM classes used in production, so TEVV activities occur in conditions comparable to the deployment environment.

The validate-then-publish workflow creates a formal gate for AI deployment. MLOps engineers validate models for inference functionality using the Triton Inference Server and evaluate performance and safety against business use cases, including examination of inference requests for malicious behavior and functional testing. Models must pass this validation before being uploaded to the Model Gallery for production use. Model integrity is verified through hash code validation, and each revision is assigned a unique digest stored as an OCI artifact with an immutable manifest, giving cryptographic verification that the tested model is the same artifact that gets deployed.

The platform also supports TEVV through its monitoring stack. VCF Operations monitors GPU consumption at cluster, host system, and host properties levels. Each DL VM includes a pre-installed DCGM Exporter with Prometheus collection at 5-second scrape intervals and Grafana visualization, supplying performance telemetry during testing and evaluation. The software stack for running AI applications on top of NVIDIA GPUs is validated in advance, and NVIDIA NGC containers are pre-tested and ready to run, reducing variables during TEVV by providing a known-good baseline.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 27.3

> Once the assessment referred to in paragraph 1 of this Article has been performed, the deployer shall notify the market surveillance authority of its results, submitting the filled-out template referred to in paragraph 5 of this Article as part of the notification. In the case referred to in Article 46(1), deployers may be exempt from that obligation to notify.

**SCF Controls:** AAT-10.15

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 27.4

> If any of the obligations laid down in this Article is already met through the data protection impact assessment conducted pursuant to Article 35 of Regulation (EU) 2016/679 or Article 27 of Directive (EU) 2016/680, the fundamental rights impact assessment referred to in paragraph 1 of this Article shall complement that data protection impact assessment.

**SCF Controls:** AAT-07.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 40.1

> High-risk AI systems or general-purpose AI models which are in conformity with harmonised standards or parts thereof the references of which have been published in the Official Journal of the European Union in accordance with Regulation (EU) No 1025/2012 shall be presumed to be in conformity with the requirements set out in Section 2 of this Chapter or, as applicable, with the obligations set out in of Chapter V, Sections 2 and 3, of this Regulation, to the extent that those standards cover those requirements or obligations.

**SCF Controls:** CPL-01

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 41.5

> Where providers of high-risk AI systems or general-purpose AI models do not comply with the common specifications referred to in paragraph 1, they shall duly justify that they have adopted technical solutions that meet the requirements referred to in Section 2 of this Chapter or, as applicable, comply with the obligations set out in Sections 2 and 3 of Chapter V to a level at least equivalent thereto.

**SCF Controls:** CPL-01.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 43.1

> For high-risk AI systems listed in point 1 of Annex III, where, in demonstrating the compliance of a high-risk AI system with the requirements set out in Section 2, the provider has applied harmonised standards referred to in Article 40, or, where applicable, common specifications referred to in Article 41, the provider shall opt for one of the following conformity assessment procedures based on:

**SCF Controls:** CPL-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 43.1(a)

> The internal control referred to in Annex VI.

**SCF Controls:** CPL-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 43.1(b)(a)

> Harmonised standards referred to in Article 40 do not exist, and common specifications referred to in Article 41 are not available.

**SCF Controls:** CPL-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 43.1(b)(b)

> The provider has not applied, or has applied only part of, the harmonised standard.

**SCF Controls:** CPL-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 43.1(b)(c)

> The common specifications referred to in point (a) exist, but the provider has not applied them.

**SCF Controls:** CPL-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 43.1(b)(d)

> One or more of the harmonised standards referred to in point (a) has been published with a restriction, and only on the part of the standard that was restricted.

**SCF Controls:** CPL-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 43.2

> For high-risk AI systems referred to in points 2 to 8 of Annex III, providers shall follow the conformity assessment procedure based on internal control as referred to in Annex VI, which does not provide for the involvement of a notified body.

**SCF Controls:** CPL-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 43.3

> For high-risk AI systems covered by the Union harmonisation legislation listed in Section A of Annex I, the provider shall follow the relevant conformity assessment procedure as required under those legal acts. The requirements set out in Section 2 of this Chapter shall apply to those high-risk AI systems and shall be part of that assessment. Points 4.3., 4.4., 4.5. and the fifth paragraph of point 4.6 of Annex VII shall also apply. For the purposes of that assessment, notified bodies which have been notified under those legal acts shall be entitled to control the conformity of the high-risk AI systems with the requirements set out in Section 2, provided that the compliance of those notified bodies with requirements laid down in Article 31(4), (5), (10) and (11) has been assessed in the context of the notification procedure under those legal acts. Where a legal act listed in Section A of Annex I enables the product manufacturer to opt out from a third-party conformity assessment, provided that that manufacturer has applied all harmonised standards covering all the relevant requirements, that manufacturer may use that option only if it has also applied harmonised standards or, where applicable, common specifications referred to in Article 41, covering all requirements set out in Section 2 of this Chapter.

**SCF Controls:** CPL-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 43.4

> High-risk AI systems that have already been subject to a conformity assessment procedure shall undergo a new conformity assessment procedure in the event of a substantial modification, regardless of whether the modified system is intended to be further distributed or continues to be used by the current deployer. For high-risk AI systems that continue to learn after being placed on the market or put into service, changes to the high-risk AI system and its performance that have been pre-determined by the provider at the moment of the initial conformity assessment and are part of the information contained in the technical documentation referred to in point 2(f) of Annex IV, shall not constitute a substantial modification.

**SCF Controls:** CPL-01.4

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 47.1

> The provider shall draw up a written machine readable, physical or electronically signed EU declaration of conformity for each high-risk AI system, and keep it at the disposal of the national competent authorities for 10 years after the high-risk AI system has been placed on the market or put into service. The EU declaration of conformity shall identify the high-risk AI system for which it has been drawn up. A copy of the EU declaration of conformity shall be submitted to the relevant national competent authorities upon request.

**SCF Controls:** CPL-01.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 47.2

> The EU declaration of conformity shall state that the high-risk AI system concerned meets the requirements set out in Section 2. The EU declaration of conformity shall contain the information set out in Annex V, and shall be translated into a language that can be easily understood by the national competent authorities of the Member States in which the high-risk AI system is placed on the market or made available.

**SCF Controls:** CPL-01.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 47.3

> Where high-risk AI systems are subject to other Union harmonisation legislation which also requires an EU declaration of conformity, a single EU declaration of conformity shall be drawn up in respect of all Union law applicable to the high-risk AI system. The declaration shall contain all the information required to identify the Union harmonisation legislation to which the declaration relates.

**SCF Controls:** CPL-01.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 47.4

> By drawing up the EU declaration of conformity, the provider shall assume responsibility for compliance with the requirements set out in Section 2. The provider shall keep the EU declaration of conformity up-to-date as appropriate.

**SCF Controls:** CPL-01.5

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 48.1

> The CE marking shall be subject to the general principles set out in Article 30 of Regulation (EC) No 765/2008.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 48.2

> For high-risk AI systems provided digitally, a digital CE marking shall be used, only if it can easily be accessed via the interface from which that system is accessed or via an easily accessible machine-readable code or other electronic means.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 48.3

> The CE marking shall be affixed visibly, legibly and indelibly for high-risk AI systems. Where that is not possible or not warranted on account of the nature of the high-risk AI system, it shall be affixed to the packaging or to the accompanying documentation, as appropriate.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 48.4

> Where applicable, the CE marking shall be followed by the identification number of the notified body responsible for the conformity assessment procedures set out in Article 43. The identification number of the notified body shall be affixed by the body itself or, under its instructions, by the provider or by the provider’s authorised representative. The identification number shall also be indicated in any promotional material which mentions that the high-risk AI system fulfils the requirements for CE marking.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 48.5

> Where high-risk AI systems are subject to other Union law which also provides for the affixing of the CE marking, the CE marking shall indicate that the high-risk AI system also fulfil the requirements of that other law.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 49.1

> Before placing on the market or putting into service a high-risk AI system listed in Annex III, with the exception of high-risk AI systems referred to in point 2 of Annex III, the provider or, where applicable, the authorised representative shall register themselves and their system in the EU database referred to in Article 71.

**SCF Controls:** AAT-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 49.2

> Before placing on the market or putting into service an AI system for which the provider has concluded that it is not high-risk according to Article 6(3), that provider or, where applicable, the authorised representative shall register themselves and that system in the EU database referred to in Article 71.

**SCF Controls:** AAT-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 49.3

> Before putting into service or using a high-risk AI system listed in Annex III, with the exception of high-risk AI systems listed in point 2 of Annex III, deployers that are public authorities, Union institutions, bodies, offices or agencies or persons acting on their behalf shall register themselves, select the system and register its use in the EU database referred to in Article 71.

**SCF Controls:** AAT-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 50.1

> Providers shall ensure that AI systems intended to interact directly with natural persons are designed and developed in such a way that the natural persons concerned are informed that they are interacting with an AI system, unless this is obvious from the point of view of a natural person who is reasonably well-informed, observant and circumspect, taking into account the circumstances and the context of use. This obligation shall not apply to AI systems authorised by law to detect, prevent, investigate or prosecute criminal offences, subject to appropriate safeguards for the rights and freedoms of third parties, unless those systems are available for the public to report a criminal offence.

**SCF Controls:** AAT-22.8

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 50.2

> Providers of AI systems, including general-purpose AI systems, generating synthetic audio, image, video or text content, shall ensure that the outputs of the AI system are marked in a machine-readable format and detectable as artificially generated or manipulated. Providers shall ensure their technical solutions are effective, interoperable, robust and reliable as far as this is technically feasible, taking into account the specificities and limitations of various types of content, the costs of implementation and the generally acknowledged state of the art, as may be reflected in relevant technical standards. This obligation shall not apply to the extent the AI systems perform an assistive function for standard editing or do not substantially alter the input data provided by the deployer or the semantics thereof, or where authorised by law to detect, prevent, investigate or prosecute criminal offences.

**SCF Controls:** AAT-23

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 50.3

> Deployers of an emotion recognition system or a biometric categorisation system shall inform the natural persons exposed thereto of the operation of the system, and shall process the personal data in accordance with Regulations (EU) 2016/679 and (EU) 2018/1725 and Directive (EU) 2016/680, as applicable. This obligation shall not apply to AI systems used for biometric categorisation and emotion recognition, which are permitted by law to detect, prevent or investigate criminal offences, subject to appropriate safeguards for the rights and freedoms of third parties, and in accordance with Union law.

**SCF Controls:** AAT-22.8

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 50.4

> Deployers of an AI system that generates or manipulates image, audio or video content constituting a deep fake, shall disclose that the content has been artificially generated or manipulated. This obligation shall not apply where the use is authorised by law to detect, prevent, investigate or prosecute criminal offence. Where the content forms part of an evidently artistic, creative, satirical, fictional or analogous work or programme, the transparency obligations set out in this paragraph are limited to disclosure of the existence of such generated or manipulated content in an appropriate manner that does not hamper the display or enjoyment of the work. Deployers of an AI system that generates or manipulates text which is published with the purpose of informing the public on matters of public interest shall disclose that the text has been artificially generated or manipulated. This obligation shall not apply where the use is authorised by law to detect, prevent, investigate or prosecute criminal offences or where the AI-generated content has undergone a process of human review or editorial control and where a natural or legal person holds editorial responsibility for the publication of the content.

**SCF Controls:** AAT-23

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 50.5

> The information referred to in paragraphs 1 to 4 shall be provided to the natural persons concerned in a clear and distinguishable manner at the latest at the time of the first interaction or exposure. The information shall conform to the applicable accessibility requirements.

**SCF Controls:** AAT-22.8

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 51.1

> A general-purpose AI model shall be classified as a general-purpose AI model with systemic risk if it meets any of the following conditions:

**SCF Controls:** AAT-09.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 51.1(a)

> It has high impact capabilities evaluated on the basis of appropriate technical tools and methodologies, including indicators and benchmarks.

**SCF Controls:** AAT-09.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 51.2

> A general-purpose AI model shall be presumed to have high impact capabilities pursuant to paragraph 1, point (a), when the cumulative amount of computation used for its training measured in floating point operations is greater than 10 25 .

**SCF Controls:** AAT-09.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 52.1

> Where a general-purpose AI model meets the condition referred to in Article 51(1), point (a), the relevant provider shall notify the Commission without delay and in any event within two weeks after that requirement is met or it becomes known that it will be met. That notification shall include the information necessary to demonstrate that the relevant requirement has been met. If the Commission becomes aware of a general-purpose AI model presenting systemic risks of which it has not been notified, it may decide to designate it as a model with systemic risk.

**SCF Controls:** AAT-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 52.2

> The provider of a general-purpose AI model that meets the condition referred to in Article 51(1), point (a), may present, with its notification, sufficiently substantiated arguments to demonstrate that, exceptionally, although it meets that requirement, the general-purpose AI model does not present, due to its specific characteristics, systemic risks and therefore should not be classified as a general-purpose AI model with systemic risk.

**SCF Controls:** AAT-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 53.1(a)

> Draw up and keep up-to-date the technical documentation of the model, including its training and testing process and the results of its evaluation, which shall contain, at a minimum, the information set out in Annex XI for the purpose of providing it, upon request, to the AI Office and the national competent authorities.

**SCF Controls:** TDA-22

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 53.1(b)

> Draw up, keep up-to-date and make available information and documentation to providers of AI systems who intend to integrate the general-purpose AI model into their AI systems. Without prejudice to the need to observe and protect intellectual property rights and confidential business information or trade secrets in accordance with Union and national law, the information and documentation shall:.

**SCF Controls:** AAT-20.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to AI implementation documentation by providing documented compute and hardware resource requirements, event log collection mechanisms, and infrastructure configuration references that support the documentation of AI deployment environments. VCF's compatibility guides document supported hardware, VCF Operations tracks infrastructure configuration, and VCF Log Management documents the event collection architecture.

Documenting AI model architecture, training methodology, and decision logic is outside VCF's scope.

VMware Private AI Services (PAIS), formerly Private AI Services, provides documentation and platform features that address several of the listed implementation documentation requirements. For computational and hardware resource requirements (item 6), the platform documents the system architecture of PAIS deployments, including GPU-accelerated workload domain requirements, vGPU profile configurations, VM class definitions for AI workloads, and the NVIDIA GPU and driver compatibility requirements. VI administrators configure vGPU-based VM classes that define the GPU resource allocations available to AI workloads. The PAIS catalog items in VCF Automation, including AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, document the components users can provision in selected namespaces, and the deployment Overview tab summarizes the installed software and the access points for the application, services, and workstation VM. PAIS setup is documented for both connected and disconnected (air-gapped) deployment models, with a Harbor registry in the Supervisor or another OCI-compliant registry used to store validated ML models.

For event logging mechanisms (item 8), the platform documents multiple logging and telemetry capabilities. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log, and they provide JupyterLab instances and console logs for verifying component installation and operation. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. PAIS Controller pod metrics are exposed at a Prometheus endpoint on the pais-controller-manager service and are integrated into observability platforms through Telegraf configuration in the Supervisor instance, with VCF Operations as the documented consuming platform. Deep Learning VMs also expose vGPU performance metrics through Prometheus. PAIS supports LLM traces collection in an OpenTelemetry Collector by configuring the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge Base operations track crawled documents, new documents found, deleted documents, modified documents requiring embeddings updates, and skipped documents, and record timing metrics for download, embedding generation, and the overall index operation.

For human oversight measures (item 5) and for interpreting outputs (items 4 and 5), MLOps engineers analyze LLM traces and Prometheus metrics to inspect agent execution flow across components and knowledge base indexing. The PAIS Agent Builder maintains a list of approved tools for use in AI agents and requires examination and approval of MCP server tools and capabilities before they are used by agents. Knowledge Bases are created with linked data sources such as Microsoft SharePoint sites and Amazon S3-compatible stores, which gives implementers a documented data lineage for retrieval-augmented generation outputs. Access to PAIS is controlled through OIDC authorized groups, where user accounts must be members of specified groups to consume the service, and personal access tokens generated from user account settings provide programmatic access to Knowledge Bases and data sources.

Requirements 1 (provider contact details), 2 (characteristics, capabilities, and limitations of the AI system), 3 (errata from initial conformity assessment), and 7 (projected useable lifetime) are documentation obligations carried by model vendors and the deploying organization rather than by the infrastructure platform. PAIS supplies registry and catalog mechanisms that organizations can attach revision and provenance metadata to, but the substantive documentation content for those items is outside the platform's scope.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 53.1(b)(i)

> Enable providers of AI systems to have a good understanding of the capabilities and limitations of the general-purpose AI model and to comply with their obligations pursuant to this Regulation.

**SCF Controls:** AAT-20.2

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to AI implementation documentation by providing documented compute and hardware resource requirements, event log collection mechanisms, and infrastructure configuration references that support the documentation of AI deployment environments. VCF's compatibility guides document supported hardware, VCF Operations tracks infrastructure configuration, and VCF Log Management documents the event collection architecture.

Documenting AI model architecture, training methodology, and decision logic is outside VCF's scope.

VMware Private AI Services (PAIS), formerly Private AI Services, provides documentation and platform features that address several of the listed implementation documentation requirements. For computational and hardware resource requirements (item 6), the platform documents the system architecture of PAIS deployments, including GPU-accelerated workload domain requirements, vGPU profile configurations, VM class definitions for AI workloads, and the NVIDIA GPU and driver compatibility requirements. VI administrators configure vGPU-based VM classes that define the GPU resource allocations available to AI workloads. The PAIS catalog items in VCF Automation, including AI Workstation, DSM Database, Triton Inferencing Server, and AI Kubernetes Cluster, document the components users can provision in selected namespaces, and the deployment Overview tab summarizes the installed software and the access points for the application, services, and workstation VM. PAIS setup is documented for both connected and disconnected (air-gapped) deployment models, with a Harbor registry in the Supervisor or another OCI-compliant registry used to store validated ML models.

For event logging mechanisms (item 8), the platform documents multiple logging and telemetry capabilities. Deep Learning VMs record cloud-init script logs in /var/log/dl.log and GPU driver installation logs in /var/log/gpu-install.log, and they provide JupyterLab instances and console logs for verifying component installation and operation. The vLLM inference server logging level is configurable through the VLLM_LOGGING_LEVEL environment variable. PAIS Controller pod metrics are exposed at a Prometheus endpoint on the pais-controller-manager service and are integrated into observability platforms through Telegraf configuration in the Supervisor instance, with VCF Operations as the documented consuming platform. Deep Learning VMs also expose vGPU performance metrics through Prometheus. PAIS supports LLM traces collection in an OpenTelemetry Collector by configuring the spec.observability.llmTraces section of the PAISConfiguration custom resource. Knowledge Base operations track crawled documents, new documents found, deleted documents, modified documents requiring embeddings updates, and skipped documents, and record timing metrics for download, embedding generation, and the overall index operation.

For human oversight measures (item 5) and for interpreting outputs (items 4 and 5), MLOps engineers analyze LLM traces and Prometheus metrics to inspect agent execution flow across components and knowledge base indexing. The PAIS Agent Builder maintains a list of approved tools for use in AI agents and requires examination and approval of MCP server tools and capabilities before they are used by agents. Knowledge Bases are created with linked data sources such as Microsoft SharePoint sites and Amazon S3-compatible stores, which gives implementers a documented data lineage for retrieval-augmented generation outputs. Access to PAIS is controlled through OIDC authorized groups, where user accounts must be members of specified groups to consume the service, and personal access tokens generated from user account settings provide programmatic access to Knowledge Bases and data sources.

Requirements 1 (provider contact details), 2 (characteristics, capabilities, and limitations of the AI system), 3 (errata from initial conformity assessment), and 7 (projected useable lifetime) are documentation obligations carried by model vendors and the deploying organization rather than by the infrastructure platform. PAIS supplies registry and catalog mechanisms that organizations can attach revision and provenance metadata to, but the substantive documentation content for those items is outside the platform's scope.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 53.1(b)(ii)

> Contain, at a minimum, the elements set out in Annex XII.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 53.1(c)

> Put in place a policy to comply with Union law on copyright and related rights, and in particular to identify and comply with, including through state-of-the-art technologies, a reservation of rights expressed pursuant to Article 4(3) of Directive (EU) 2019/790.

**SCF Controls:** AAT-12, TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 53.1(d)

> Draw up and make publicly available a sufficiently detailed summary about the content used for training of the general-purpose AI model, according to a template provided by the AI Office.

**SCF Controls:** AAT-12.3

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 54.1

> Prior to placing a general-purpose AI model on the Union market, providers established in third countries shall, by written mandate, appoint an authorised representative which is established in the Union.

**SCF Controls:** CPL-08

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 54.2

> The provider shall enable its authorised representative to perform the tasks specified in the mandate received from the provider.

**SCF Controls:** CPL-08.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 54.3

> The authorised representative shall perform the tasks specified in the mandate received from the provider. It shall provide a copy of the mandate to the AI Office upon request, in one of the official languages of the institutions of the Union. For the purposes of this Regulation, the mandate shall empower the authorised representative to carry out the following tasks:

**SCF Controls:** CPL-08.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 54.3(a)

> Verify that the technical documentation specified in Annex XI has been drawn up and all obligations referred to in Article 53 and, where applicable, Article 55 have been fulfilled by the provider.

**SCF Controls:** CPL-08.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 54.3(b)

> Keep a copy of the technical documentation specified in Annex XI at the disposal of the AI Office and national competent authorities, for a period of 10 years after the general-purpose AI model has been placed on the market, and the contact details of the provider that appointed the authorised representative.

**SCF Controls:** CPL-08.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 54.3(c)

> Provide the AI Office, upon a reasoned request, with all the information and documentation, including that referred to in point (b), necessary to demonstrate compliance with the obligations in this Chapter.

**SCF Controls:** CPL-08.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 54.3(d)

> Cooperate with the AI Office and competent authorities, upon a reasoned request, in any action they take in relation to the general-purpose AI model, including when the model is integrated into AI systems placed on the market or put into service in the Union.

**SCF Controls:** CPL-08.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 54.4

> The mandate shall empower the authorised representative to be addressed, in addition to or instead of the provider, by the AI Office or the competent authorities, on all issues related to ensuring compliance with this Regulation.

**SCF Controls:** CPL-08.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 54.5

> The authorised representative shall terminate the mandate if it considers or has reason to consider the provider to be acting contrary to its obligations pursuant to this Regulation. In such a case, it shall also immediately inform the AI Office about the termination of the mandate and the reasons therefor.

**SCF Controls:** CPL-08.1

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 55.1(a)

> Perform model evaluation in accordance with standardised protocols and tools reflecting the state of the art, including conducting and documenting adversarial testing of the model with a view to identifying and mitigating systemic risks.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides infrastructure that supports AI Test, Evaluation, Validation and Verification (TEVV) activities throughout the model lifecycle. Deep learning VMs provisioned from PAIS images provide dedicated testing environments for AI prototyping, fine-tuning, validation, and inference workloads. These DL VMs run on the same GPU-accelerated workload domains, vGPU profiles, and VM classes used in production, so TEVV activities occur in conditions comparable to the deployment environment.

The validate-then-publish workflow creates a formal gate for AI deployment. MLOps engineers validate models for inference functionality using the Triton Inference Server and evaluate performance and safety against business use cases, including examination of inference requests for malicious behavior and functional testing. Models must pass this validation before being uploaded to the Model Gallery for production use. Model integrity is verified through hash code validation, and each revision is assigned a unique digest stored as an OCI artifact with an immutable manifest, giving cryptographic verification that the tested model is the same artifact that gets deployed.

The platform also supports TEVV through its monitoring stack. VCF Operations monitors GPU consumption at cluster, host system, and host properties levels. Each DL VM includes a pre-installed DCGM Exporter with Prometheus collection at 5-second scrape intervals and Grafana visualization, supplying performance telemetry during testing and evaluation. The software stack for running AI applications on top of NVIDIA GPUs is validated in advance, and NVIDIA NGC containers are pre-tested and ready to run, reducing variables during TEVV by providing a known-good baseline.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 55.1(b)

> Assess and mitigate possible systemic risks at Union level, including their sources, that may stem from the development, the placing on the market, or the use of general-purpose AI models with systemic risk.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides infrastructure that supports AI Test, Evaluation, Validation and Verification (TEVV) activities throughout the model lifecycle. Deep learning VMs provisioned from PAIS images provide dedicated testing environments for AI prototyping, fine-tuning, validation, and inference workloads. These DL VMs run on the same GPU-accelerated workload domains, vGPU profiles, and VM classes used in production, so TEVV activities occur in conditions comparable to the deployment environment.

The validate-then-publish workflow creates a formal gate for AI deployment. MLOps engineers validate models for inference functionality using the Triton Inference Server and evaluate performance and safety against business use cases, including examination of inference requests for malicious behavior and functional testing. Models must pass this validation before being uploaded to the Model Gallery for production use. Model integrity is verified through hash code validation, and each revision is assigned a unique digest stored as an OCI artifact with an immutable manifest, giving cryptographic verification that the tested model is the same artifact that gets deployed.

The platform also supports TEVV through its monitoring stack. VCF Operations monitors GPU consumption at cluster, host system, and host properties levels. Each DL VM includes a pre-installed DCGM Exporter with Prometheus collection at 5-second scrape intervals and Grafana visualization, supplying performance telemetry during testing and evaluation. The software stack for running AI applications on top of NVIDIA GPUs is validated in advance, and NVIDIA NGC containers are pre-tested and ready to run, reducing variables during TEVV by providing a known-good baseline.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 55.1(c)

> Keep track of, document, and report, without undue delay, to the AI Office and, as appropriate, to national competent authorities, relevant information about serious incidents and possible corrective measures to address them.

**SCF Controls:** AAT-16.9

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 55.1(d)

> Ensure an adequate level of cybersecurity protection for the general-purpose AI model with systemic risk and the physical infrastructure of the model.

**SCF Controls:** AAT-02.3

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides the security and resilience infrastructure that protects AI and autonomous technology workloads running on the platform. VCF's layered security model includes VMware vCenter RBAC with granular roles and permissions that control who can manage AI workload VMs, VCF SSO for centralized authentication, ESX Secure Boot and TPM for host integrity, VM encryption and vSAN encryption at rest for data protection, and VDS/NSX network segmentation for workload isolation. VCF Operations provides continuous monitoring with compliance dashboards that assess the security posture of the infrastructure hosting AI workloads. VCF Operations also monitors Kubernetes-specific health metrics for Supervisor-managed clusters, including node status and kubelet status. vSphere HA and DRS provide compute resilience, and vSAN fault domains provide storage resilience. VKS clusters support MachineHealthCheck, a Kubernetes Cluster API resource that monitors defined node health conditions and triggers automatic machine remediation when worker nodes become unhealthy, providing a cluster-native resilience mechanism for AI workload infrastructure.

The Consumption layer of VCF, delivered through VMware Kubernetes Service (VKS) and the vSphere Supervisor, extends these protections to containerized AI and machine learning workloads. VKS requires the Ubuntu VKr node operating system for AI/ML workloads, establishing a defined and consistent runtime configuration to which security policy can be applied. Pod Security Admission (PSA) is enforced at the namespace level and supports three modes (warn, audit, and enforce) combined with three profiles (privileged, baseline, and restricted). The restricted profile disallows privileged containers, limits Linux capabilities, requires non-root execution contexts, and restricts volume types. The podSecurityStandard variable in VKS cluster configuration sets the cluster-wide default pod security policy, with per-namespace exemptions defined where workload requirements justify them. VKS cluster management provides out-of-the-box security policy templates for the baseline and restricted profiles, letting operators match the level of restriction to each workload's assessed risk without manual policy authoring.

VKS clusters enforce Kubernetes NetworkPolicy objects that restrict ingress and egress traffic at the pod and namespace level, allowing AI/ML workloads to be deployed in dedicated namespaces with rules that limit communication to authorized services. The Antrea AntreaPolicy feature gate enables fine-grained network policy enforcement through the Antrea CNI. The Istio CNI plugin can be enabled on VKS clusters to manage pod network interfaces and apply service mesh policies without requiring privileged containers, supporting AI inference pipelines that need encrypted inter-service communication and fine-grained traffic routing.

Kubernetes Deployments and ReplicaSets apply an immutable infrastructure pattern in which containers are replaced rather than modified in place, making unauthorized persistent changes to AI/ML workloads visible and reducing the risk of persistent compromise. More broadly, Kubernetes workload resources including Deployments, StatefulSets, and DaemonSets provide self-healing capabilities that automatically replace failed containers and reschedule workloads to available nodes when machines become unavailable. Liveness probes detect and remedy broken application states by restarting containers that fail health checks, supporting continuity of AI/ML workload operation without operator intervention. Harbor, available as a Supervisor Service and deployable as a standard package on VKS clusters, provides a private container image registry scoped by vSphere Namespace. Integrating workload deployments with a governed Harbor registry restricts AI/ML containers to images sourced from a controlled registry, reducing supply chain risk. In air-gapped environments, Harbor Supervisor Service serves as the private registry from which VKS images and upgrade packages are pulled. Content libraries in the Supervisor environment support creation of VM images with current patches and required security settings following organizational security policies.

VCF Automation Organizations provide centralized access control and establish secure boundaries between organizational units consuming VKS clusters, supporting delegation of cluster management with enforced separation. VKS cluster management policies enable governance of the operational consistency and security posture of the cluster estate through policy-driven automation, covering both baseline and restricted security configurations.

Kubernetes documentation in the Consumption layer addresses cloud-native security practices applicable to AI/ML workloads, including threat modeling during the Develop lifecycle phase to identify trust boundaries and risks, and applying cryptographic protections for audit logs in high-assurance environments. Confidential virtual machines are available for workloads requiring additional hardware-level isolation.

AI-specific risk assessment and the alignment of protections to AI threat models are organizational responsibilities. VCF provides the infrastructure and platform mechanisms that those assessments direct, including the ability to calibrate pod security profile stringency, network segmentation scope, and image provenance controls to the assessed risk of each AI workload. Fully satisfying this control requires organizational processes to define acceptable risk thresholds and deliberately select the appropriate policy configuration based on each workload's risk assessment.

This control asks whether the organization ensures AI and autonomous technologies include reasonable security, compliance, and resilience protections commensurate with assessed risks and threats. The control is categorized as Process under NIST CSF Govern, which evaluates organizational risk assessment and governance practice rather than platform capability. VMware Private AI Services (PAIS) supplies technical mechanisms that the organization can configure when planning AI workload protections, including MLOps-driven validation of ML models against organizational security, privacy, and technical requirements before onboarding, examination and approval workflows for Model Context Protocol (MCP) server tools and capabilities before agents use them, CA trust bundle configuration for secure communication with external services and databases, Harbor and OCI-compliant registry integration with certificate-based trust for model retrieval, observability through Prometheus and Grafana for monitoring AI model health, quality, and behavior, and support for air-gapped deployment models for environments with strict isolation requirements. Determining which protections are commensurate with the organization's assessed risks and threats, and governing AI initiatives under an enterprise risk program, are organizational activities that PAIS does not perform.

#### VMware vDefend (Contributes)

VMware vDefend contributes to ensuring AI workloads running on VCF include reasonable cybersecurity protections commensurate with assessed risks and threats.

The vDefend distributed firewall and microsegmentation capabilities enforce network-level protections that can be scaled proportionally to each AI workload's risk profile. Security Intelligence monitors traffic flows, generates firewall rule recommendations, and validates security policies for the Distributed Firewall, providing Infrastructure, Environment, and Application Monitoring across the deployment. Security Intelligence generates policy recommendations for environment pairs based on observed inter-VM traffic patterns, and these recommendations can be published as firewall policies applied to environment category pairs. The Recommendation engine selects inter-environment traffic that hits protection rules or default category rules, producing granular application-level rules that allow only authorized traffic between environments. Administrators can identify all inter-environment flows and secure them with specific policies before enforcing strict block rules between environments.

Security Services Platform Environment Protection evaluates whether workloads are protected by environment-specific segmentation policies such as Dev, Prod, and Test. Security Intelligence provides metrics for monitoring firewall rule effectiveness and proactive threat detection. Comparing the ratio of detected versus prevented events provides a means to assess how effectively security controls are protecting infrastructure, giving administrators insight into whether current protections are proportionate to AI workload risk. Security Intelligence also collects IDS policies, rules, and security profiles created by Intelligent Assist as part of remediation operations, enabling policy adjustments in response to detected threats.

IDS/IPS inspects traffic to and from AI workloads for exploit attempts, command-and-control traffic, lateral movement, and exfiltration patterns. Malware Prevention analyzes files entering the environment for malicious content. vDefend rules can enforce isolation between projects, denying all inter-project communication except for required infrastructure protocols such as DHCP, DNS, NTP, and ICMP.

vDefend contributes to this control because its Distributed Firewall, IDS/IPS, Malware Prevention, and Security Intelligence capabilities provide network-layer protections that can be scaled to each AI workload's assessed risk level. However, ensuring adequate protections across all dimensions of AI risk, including application security, data governance, model integrity, and operational resilience, extends beyond the network security domain that vDefend addresses.

#### VCF Protection and Recovery (Contributes)

VCF Protection and Recovery (PNR) contributes to the security and resilience protections for AI and autonomous technology workloads through replication, failover orchestration, and isolated recovery capabilities. When AI workloads run on VCF infrastructure, PNR protects them with configurable replication intervals, automated recovery plans, and tested failover procedures. Protection and Recovery organizes virtual machines into protection groups as the basis for cross-site replication and failover, and recovery plans can be tested in quarantined test networks that have no lasting effects on either the protected site or the recovery site.

Cyber Recovery extends protection with vulnerability analysis and clean room recovery capabilities. The Integrated Security and Vulnerability Analysis with CrowdStrike assigns vulnerability risk scores on a scale from 0 (no risk) to 10.0 (maximum risk), assessing the risk associated with vulnerabilities based on exploitability likelihood and predicted potential impact on virtual machines in the recovery environment. Cyber Recovery implements a "Quarantined + Analysis" isolation level that restricts virtual machine connectivity to integrated security and vulnerability servers, providing a controlled environment for analyzing workloads before returning them to production. Periodic security scans of virtual machines in the clean room region support compliance validation prior to production restoration.

The broader requirements of this control, including AI-specific risk assessment, threat identification, and alignment of protections to assessed risk levels, are organizational responsibilities outside PNR's scope.

#### VMware Data Services Manager (Contributes)

VMware Data Services Manager (DSM) contributes to the security and resilience protections for AI workloads that store data in DSM-managed databases. DSM provides role-based access control with Admin and User roles that restrict who can administer the environment and who can manage databases, and namespace-scoped restrictions that allow a Cloud Administrator to control which InfrastructurePolicies and BackupLocations are available in each user namespace. Infrastructure policies act as guardrails that restrict the quality and quantity of resources DSM users can consume from vSphere clusters, covering CPU, memory, storage policies, IP pool, VM classes, and related resources, and the Infrastructure Policies view in the DSM administrator UI gives administrators a single place to review available policies and the databases associated with them.

Data service policies can be defined for MySQL, PostgreSQL, and SQL Server and configured to enforce consistent security and compliance posture across tenants. Each policy can require, allow, or disallow automated backups, and when backups are required at least one backup location must be configured with a trusted root certificate. Resilience for database workloads is supported through high-availability topologies; for workloads that need both data protection and high read throughput, a three-node HA cluster can be deployed with multiple read replicas, where the primary node synchronously replicates to failover nodes and asynchronously replicates to read replicas. DSM generates infrastructure policy compliance alerts, including INFRASTRUCTURE_POLICY_CLUSTER_COMPLIANT and INVALID_SUPERVISOR_INFRASTRUCTURE_POLICY_STATUS, that monitor cluster configuration and Supervisor infrastructure policy state so administrators can detect drift from defined policy.

The broader requirements of this control, including AI-specific risk assessment and alignment of protections to assessed risk levels, are organizational responsibilities outside DSM's scope.

#### VMware Avi Load Balancer (Contributes)

VMware Avi Load Balancer (Avi) provides application-layer security mechanisms that organizations can use to protect AI and autonomous technology workloads running behind Avi virtual services. These capabilities address the security and resilience dimensions of this control at the application delivery layer.

Avi's Web Application Firewall (WAF) supports a positive security model through WAF Positive Security rules, which define allowed application behavior as an allowlist of expected request patterns. WAF Positive Security Groups can be created and configured within a WAF Policy to define allowed request patterns and enforce positive security models. Avi WAF Policies attach a Positive Security group to apply learned data for security and to define hit and miss actions. Administrators can enable Application Insights to analyze known-good traffic and generate a Positive Security group for ongoing enforcement. For AI API endpoints where expected request structures can be defined, this provides a mechanism to enforce consistent application-layer access controls.

The Avi Cloud Console Application Rules Service allows organizations to protect their applications from vulnerabilities by enabling the service on their Avi Controllers, providing a cloud-delivered mechanism for rule-based protection of AI application endpoints.

Avi's Bot Management capability detects and classifies automated traffic, including bots and autonomous agents, and applies enforcement actions based on classification results. The Avi Cloud Console BOT Management Service can allow, deny, or rate-limit bad bots, and supports User Agent Database Sync to receive updated user agent signatures for threat detection. Bot detection policies are created using the configure botdetectionpolicy CLI command or through HTTP security policy rules. WAF HTTP Security policies support Bot Management as a match condition, allowing administrators to select specific bot classifications and assign enforcement actions such as allow, deny, or rate limiting. The BOT Management Service requires the IP Reputation service to be enabled for full coverage of bad bot traffic. A System-BotDetectionPolicy can be bound to virtual services to enforce bot detection rules across AI workload endpoints. For AI workloads that interact with automated clients, this gives administrators visibility and control over which automated systems are permitted access.

In Kubernetes deployments using the Avi Kubernetes Operator (AKO), the L7Rule custom resource definition supports a botPolicyRef parameter to reference a bot policy for bot detection and mitigation on individual ingress routes. Virtual services can also reference a SecurityPolicy to perform DDoS attack mitigation on traffic flowing through the virtual service, giving platform teams a Kubernetes-native path to apply Avi security capabilities to AI workloads running in clusters.

Avi Service Engines automatically defend against DDoS attacks by implementing TCP SYN cookies, idle connection reaping, and protocol validation. The Service Engine data-plane architecture isolates attacks on the data plane from management interfaces, so a volumetric attack against a backend AI service does not affect Controller management. Service Engines detect and mitigate a wide range of Layer 4-7 network attacks to protect application traffic.

Avi's Network Security Policy supports creation of rules that match on IP address and apply IP Groups to control access, providing a mechanism to restrict which sources can reach AI application endpoints.

Avi supports role-based access control for administrative access to the Controller. Administrators can restrict administrative access by source IP address range and use RBAC to limit access levels, scoping the administrative attack surface for Avi infrastructure that fronts AI workloads.

### Control 55.2

> Providers of general-purpose AI models with systemic risk may rely on codes of practice within the meaning of Article 56 to demonstrate compliance with the obligations set out in paragraph 1 of this Article, until a harmonised standard is published. Compliance with European harmonised standards grants providers the presumption of conformity to the extent that those standards cover those obligations. Providers of general-purpose AI models with systemic risks who do not adhere to an approved code of practice or do not comply with a European harmonised standard shall demonstrate alternative adequate means of compliance for assessment by the Commission.

**SCF Controls:** AAT-02.3

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 60.1

> Testing of high-risk AI systems in real world conditions outside AI regulatory sandboxes may be conducted by providers or prospective providers of high-risk AI systems listed in Annex III, in accordance with this Article and the real-world testing plan referred to in this Article, without prejudice to the prohibitions under Article 5. The Commission shall, by means of implementing acts, specify the detailed elements of the real-world testing plan. Those implementing acts shall be adopted in accordance with the examination procedure referred to in Article 98(2). This paragraph shall be without prejudice to Union or national law on the testing in real world conditions of high-risk AI systems related to products covered by Union harmonisation legislation listed in Annex I.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 60.2

> Providers or prospective providers may conduct testing of high-risk AI systems referred to in Annex III in real world conditions at any time before the placing on the market or the putting into service of the AI system on their own or in partnership with one or more deployers or prospective deployers.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VMware Private AI Services (PAIS) provides infrastructure that supports AI Test, Evaluation, Validation and Verification (TEVV) activities throughout the model lifecycle. Deep learning VMs provisioned from PAIS images provide dedicated testing environments for AI prototyping, fine-tuning, validation, and inference workloads. These DL VMs run on the same GPU-accelerated workload domains, vGPU profiles, and VM classes used in production, so TEVV activities occur in conditions comparable to the deployment environment.

The validate-then-publish workflow creates a formal gate for AI deployment. MLOps engineers validate models for inference functionality using the Triton Inference Server and evaluate performance and safety against business use cases, including examination of inference requests for malicious behavior and functional testing. Models must pass this validation before being uploaded to the Model Gallery for production use. Model integrity is verified through hash code validation, and each revision is assigned a unique digest stored as an OCI artifact with an immutable manifest, giving cryptographic verification that the tested model is the same artifact that gets deployed.

The platform also supports TEVV through its monitoring stack. VCF Operations monitors GPU consumption at cluster, host system, and host properties levels. Each DL VM includes a pre-installed DCGM Exporter with Prometheus collection at 5-second scrape intervals and Grafana visualization, supplying performance telemetry during testing and evaluation. The software stack for running AI applications on top of NVIDIA GPUs is validated in advance, and NVIDIA NGC containers are pre-tested and ready to run, reducing variables during TEVV by providing a known-good baseline.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 60.3

> The testing of high-risk AI systems in real world conditions under this Article shall be without prejudice to any ethical review that is required by Union or national law.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 60.4(a)

> The provider or prospective provider has drawn up a real-world testing plan and submitted it to the market surveillance authority in the Member State where the testing in real world conditions is to be conducted.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 60.4(b)

> The market surveillance authority in the Member State where the testing in real world conditions is to be conducted has approved the testing in real world conditions and the real-world testing plan; where the market surveillance authority has not provided an answer within 30 days, the testing in real world conditions and the real-world testing plan shall be understood to have been approved; where national law does not provide for a tacit approval, the testing in real world conditions shall remain subject to an authorisation.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 60.4(c)

> The provider or prospective provider, with the exception of providers or prospective providers of high-risk AI systems referred to in points 1, 6 and 7 of Annex III in the areas of law enforcement, migration, asylum and border control management, and high-risk AI systems referred to in point 2 of Annex III has registered the testing in real world conditions in accordance with Article 71(4) with a Union-wide unique single identification number and with the information specified in Annex IX; the provider or prospective provider of high-risk AI systems referred to in points 1, 6 and 7 of Annex III in the areas of law enforcement, migration, asylum and border control management, has registered the testing in real-world conditions in the secure non-public section of the EU database according to Article 49(4), point (d), with a Union-wide unique single identification number and with the information specified therein; the provider or prospective provider of high-risk AI systems referred to in point 2 of Annex III has registered the testing in real-world conditions in accordance with Article 49(5).

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 60.4(d)

> The provider or prospective provider conducting the testing in real world conditions is established in the Union or has appointed a legal representative who is established in the Union.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 60.4(e)

> Data collected and processed for the purpose of the testing in real world conditions shall be transferred to third countries only provided that appropriate and applicable safeguards under Union law are implemented.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 60.4(f)

> The testing in real world conditions does not last longer than necessary to achieve its objectives and in any case not longer than six months, which may be extended for an additional period of six months, subject to prior notification by the provider or prospective provider to the market surveillance authority, accompanied by an explanation of the need for such an extension.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 60.4(g)

> The subjects of the testing in real world conditions who are persons belonging to vulnerable groups due to their age or disability, are appropriately protected.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 60.4(h)

> Where a provider or prospective provider organises the testing in real world conditions in cooperation with one or more deployers or prospective deployers, the latter have been informed of all aspects of the testing that are relevant to their decision to participate, and given the relevant instructions for use of the AI system referred to in Article 13; the provider or prospective provider and the deployer or prospective deployer shall conclude an agreement specifying their roles and responsibilities with a view to ensuring compliance with the provisions for testing in real world conditions under this Regulation and under other applicable Union and national law.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 60.4(i)

> The subjects of the testing in real world conditions have given informed consent in accordance with Article 61, or in the case of law enforcement, where the seeking of informed consent would prevent the AI system from being tested, the testing itself and the outcome of the testing in the real world conditions shall not have any negative effect on the subjects, and their personal data shall be deleted after the test is performed.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 60.4(j)

> The testing in real world conditions is effectively overseen by the provider or prospective provider, as well as by deployers or prospective deployers through persons who are suitably qualified in the relevant field and have the necessary capacity, training and authority to perform their tasks.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 60.4(k)

> The predictions, recommendations or decisions of the AI system can be effectively reversed and disregarded.

**SCF Controls:** AAT-10

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 60.7

> Any serious incident identified in the course of the testing in real world conditions shall be reported to the national market surveillance authority in accordance with Article 73. The provider or prospective provider shall adopt immediate mitigation measures or, failing that, shall suspend the testing in real world conditions until such mitigation takes place, or otherwise terminate it. The provider or prospective provider shall establish a procedure for the prompt recall of the AI system upon such termination of the testing in real world conditions.

**SCF Controls:** AAT-10.15, AAT-16.9

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 60.8

> Providers or prospective providers shall notify the national market surveillance authority in the Member State where the testing in real world conditions is to be conducted of the suspension or termination of the testing in real world conditions and of the final outcomes.

**SCF Controls:** AAT-10.15

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 61.1

> For the purpose of testing in real world conditions under Article 60, freely-given informed consent shall be obtained from the subjects of testing prior to their participation in such testing and after their having been duly informed with concise, clear, relevant, and understandable information regarding:

**SCF Controls:** AAT-24

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 61.1(a)

> The nature and objectives of the testing in real world conditions and the possible inconvenience that may be linked to their participation.

**SCF Controls:** AAT-24

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 61.1(b)

> The conditions under which the testing in real world conditions is to be conducted, including the expected duration of the subject or subjects’ participation.

**SCF Controls:** AAT-24

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 61.1(c)

> Their rights, and the guarantees regarding their participation, in particular their right to refuse to participate in, and the right to withdraw from, testing in real world conditions at any time without any resulting detriment and without having to provide any justification.

**SCF Controls:** AAT-24

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 61.1(d)

> The arrangements for requesting the reversal or the disregarding of the predictions, recommendations or decisions of the AI system.

**SCF Controls:** AAT-24

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 61.1(e)

> The Union-wide unique single identification number of the testing in real world conditions in accordance with Article 60(4) point (c), and the contact details of the provider or its legal representative from whom further information can be obtained.

**SCF Controls:** AAT-24

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 61.2

> The informed consent shall be dated and documented and a copy shall be given to the subjects of testing or their legal representative.

**SCF Controls:** AAT-24

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 72.1

> Providers shall establish and document a post-market monitoring system in a manner that is proportionate to the nature of the AI technologies and the risks of the high-risk AI system.

**SCF Controls:** AAT-16

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to monitoring deployed AI workloads through VCF Operations, which provides continuous visibility into the health, performance, and capacity of the infrastructure those workloads run on. VCF Operations dashboards display real-time and historical metrics for compute, storage, and networking resources consumed by AI VMs. VCF Log Management aggregates log data across the stack. VMware vCenter alarms trigger on configurable thresholds for CPU, memory, disk, and network conditions.

For AI and autonomous technology workloads deployed as containerized applications on VMware Kubernetes Service (VKS) clusters, the platform provides a layered observability stack. The Prometheus Standard Package, available for deployment on VKS clusters, collects metrics from configured targets at defined intervals, evaluates alerting rules, and forwards alerts to Alertmanager. The package includes prometheus-server, which handles scraping, rule processing, and alerting, as well as prometheus-kube-state-metrics for tracking node status, replica-set compliance, pod and job status, and resource requests and limits across namespaces. For batch inference or training jobs that cannot be scraped directly, Prometheus Pushgateway accepts pushed metrics. Grafana Operator pairs with Prometheus to provide dashboards and configurable alert thresholds, enabling operators to define visual representations of AI workload metrics and receive notifications when behavior deviates from expected patterns.

Monitoring agents for Kubernetes device plugin resources, including GPUs commonly consumed by AI inference and training workloads, can be deployed as DaemonSets on worker nodes to track resource utilization and associate metrics with specific containers. The Kubernetes Node Problem Detector can be extended with custom monitoring scripts written in any language, which allows AI-specific health checks to be added without modifying core Kubernetes components. Kubernetes also provides built-in auditing capabilities for monitoring and recording cluster activities.

Istio, available as a Standard Package for VKS clusters, provides mechanisms to secure, connect, and monitor services. For AI inference services that expose APIs, Istio supplies request rate, latency, and error rate metrics without requiring application-level instrumentation.

Deployments using the Harness CI/CD Supervisor Service can integrate Dynatrace, which automatically instruments applications and infrastructure upon deployment and collects metrics, logs, and traces. The Dynatrace AI engine detects anomalies, identifies root causes, and generates intelligent alerts. The Dynatrace operator automates the deployment, scaling, and maintenance of the monitoring stack within the VKS cluster. Harness Service Reliability Management monitors deployed services post-deployment to calculate a real-time health score based on transaction success and latency.

VKS cluster management proactively monitors the VKS cluster estate to confirm assigned policies are enforced correctly, and generates Policy Insights when configuration conflicts or environmental errors are detected.

Monitoring AI model behavior at the application level, including model drift, inference accuracy, and data distribution shifts, requires organization-defined monitoring logic implemented using these platform tools. VCF and its Kubernetes consumption layer provide the collection, storage, and alerting infrastructure, but the organization must configure the signals to collect, define thresholds for AI-specific behavioral anomalies, and establish processes for reviewing and responding to monitoring data.

VMware Private AI Services (PAIS) provides production monitoring for deployed AI workloads through metrics collection, telemetry, and integration with observability platforms. The Private AI Services controller exposes a Prometheus metrics endpoint on the pais-controller-manager service, and Private AI Services deployments include a Prometheus server pod that collects metrics for observability platforms. DevOps engineers visualize health and performance metrics for Private AI Services components running in a VCF Automation namespace using observability platforms such as Grafana.

Observability is activated by updating the PAISConfiguration custom resource with parameters that enable metrics collection for observability platforms and LLM traces for the OpenTelemetry (OTel) Collector. When LLM traces collection is activated, MLOps engineers can analyze traces from agents and knowledge base indexing in the OpenTelemetry Collector, supporting observation of model behavior and application health in agentic workflows. Private AI Services supports sending traces to an OpenTelemetry collector over HTTP/protobuf or gRPC.

Operators can monitor Private AI Services deployments in Grafana for pod restart frequency, vGPU licensing status, and idle or underutilized GPU devices in passthrough mode. Private AI Services controller pod metrics are integrated into observability platforms through Telegraf configuration in the Supervisor instance, which allows VCF Operations to ingest PAIS controller metrics alongside the broader infrastructure telemetry it already collects for GPU-enabled workload domains. Deployment health is verified through Kubernetes pod state of the API, ingress, rex worker, and Prometheus server pods.

MLOps engineers and application developers can perform monitoring and diagnostics of models used in agents through observability platforms like Grafana to track the health, quality, and behavior of AI applications.

#### VMware vDefend (Contributes)

VMware vDefend contributes to monitoring the functionality and behavior of deployed AI workloads running on VCF by providing continuous network-level behavioral monitoring, threat detection, and AI-assisted security analysis around those workloads.

Security Intelligence, running on the Security Services Platform, provides continuous network-level behavioral monitoring that detects new traffic flows, unauthorized communications, and anomalous activity around deployed systems, including AI workloads. It continuously monitors for new flows between environments and alerts administrators to unauthorized or unexpected traffic, supporting ongoing policy adjustments. The Segmentation Monitoring Dashboard provides dedicated views for monitoring environment-level traffic flows; when monitoring identifies an environment pair without a configured protection policy, it offers a Run Recommendations option to generate policy recommendations based on observed traffic. Security Intelligence provides Infrastructure, Environment, and Application Monitoring capabilities. The application monitoring view within the Segmentation Monitoring Dashboard surfaces metrics including unprotected flows and applications with unprotected rule hits, providing targeted visibility into workloads, including AI systems, that lack active firewall policy coverage. The Policy Recommendations monitoring capability checks for changes in monitored entity scope every hour when enabled. Security Intelligence also runs a scheduled daily classification job, automatically categorizing compute entities based on traffic flows observed over the prior 30 days.

Intelligent Assist is an AI-assisted analysis feature accessible through the NSX Manager UI and Security Services Platform UI. It provides contextual analysis support on the IDS/IPS, Detections, and Campaigns pages, enabling administrators to investigate security events affecting deployed workloads with AI-driven guidance.

IDS/IPS provides ongoing threat detection through monitoring dashboards scoped to both distributed and gateway deployments. Project-scoped dashboards display events triggered for specific projects, allowing targeted monitoring of AI workload deployments. Network Detection and Response (NDR) applies behavioral analysis to identify suspicious activity targeting monitored workloads. The NDR Sensor periodically checks the status of activated features on the Security Services Platform every 15 minutes and updates its configuration accordingly.

Monitoring AI system functionality at the application layer, including model performance, output quality, and behavioral drift, is outside vDefend's domain and requires additional tooling.

Not applicable for this control: VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 72.2

> The post-market monitoring system shall actively and systematically collect, document and analyse relevant data which may be provided by deployers or which may be collected through other sources on the performance of high-risk AI systems throughout their lifetime, and which allow the provider to evaluate the continuous compliance of AI systems with the requirements set out in Chapter III, Section 2. Where relevant, post-market monitoring shall include an analysis of the interaction with other AI systems. This obligation shall not cover sensitive operational data of deployers which are law-enforcement authorities.

**SCF Controls:** AAT-16

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF contributes to monitoring deployed AI workloads through VCF Operations, which provides continuous visibility into the health, performance, and capacity of the infrastructure those workloads run on. VCF Operations dashboards display real-time and historical metrics for compute, storage, and networking resources consumed by AI VMs. VCF Log Management aggregates log data across the stack. VMware vCenter alarms trigger on configurable thresholds for CPU, memory, disk, and network conditions.

For AI and autonomous technology workloads deployed as containerized applications on VMware Kubernetes Service (VKS) clusters, the platform provides a layered observability stack. The Prometheus Standard Package, available for deployment on VKS clusters, collects metrics from configured targets at defined intervals, evaluates alerting rules, and forwards alerts to Alertmanager. The package includes prometheus-server, which handles scraping, rule processing, and alerting, as well as prometheus-kube-state-metrics for tracking node status, replica-set compliance, pod and job status, and resource requests and limits across namespaces. For batch inference or training jobs that cannot be scraped directly, Prometheus Pushgateway accepts pushed metrics. Grafana Operator pairs with Prometheus to provide dashboards and configurable alert thresholds, enabling operators to define visual representations of AI workload metrics and receive notifications when behavior deviates from expected patterns.

Monitoring agents for Kubernetes device plugin resources, including GPUs commonly consumed by AI inference and training workloads, can be deployed as DaemonSets on worker nodes to track resource utilization and associate metrics with specific containers. The Kubernetes Node Problem Detector can be extended with custom monitoring scripts written in any language, which allows AI-specific health checks to be added without modifying core Kubernetes components. Kubernetes also provides built-in auditing capabilities for monitoring and recording cluster activities.

Istio, available as a Standard Package for VKS clusters, provides mechanisms to secure, connect, and monitor services. For AI inference services that expose APIs, Istio supplies request rate, latency, and error rate metrics without requiring application-level instrumentation.

Deployments using the Harness CI/CD Supervisor Service can integrate Dynatrace, which automatically instruments applications and infrastructure upon deployment and collects metrics, logs, and traces. The Dynatrace AI engine detects anomalies, identifies root causes, and generates intelligent alerts. The Dynatrace operator automates the deployment, scaling, and maintenance of the monitoring stack within the VKS cluster. Harness Service Reliability Management monitors deployed services post-deployment to calculate a real-time health score based on transaction success and latency.

VKS cluster management proactively monitors the VKS cluster estate to confirm assigned policies are enforced correctly, and generates Policy Insights when configuration conflicts or environmental errors are detected.

Monitoring AI model behavior at the application level, including model drift, inference accuracy, and data distribution shifts, requires organization-defined monitoring logic implemented using these platform tools. VCF and its Kubernetes consumption layer provide the collection, storage, and alerting infrastructure, but the organization must configure the signals to collect, define thresholds for AI-specific behavioral anomalies, and establish processes for reviewing and responding to monitoring data.

VMware Private AI Services (PAIS) provides production monitoring for deployed AI workloads through metrics collection, telemetry, and integration with observability platforms. The Private AI Services controller exposes a Prometheus metrics endpoint on the pais-controller-manager service, and Private AI Services deployments include a Prometheus server pod that collects metrics for observability platforms. DevOps engineers visualize health and performance metrics for Private AI Services components running in a VCF Automation namespace using observability platforms such as Grafana.

Observability is activated by updating the PAISConfiguration custom resource with parameters that enable metrics collection for observability platforms and LLM traces for the OpenTelemetry (OTel) Collector. When LLM traces collection is activated, MLOps engineers can analyze traces from agents and knowledge base indexing in the OpenTelemetry Collector, supporting observation of model behavior and application health in agentic workflows. Private AI Services supports sending traces to an OpenTelemetry collector over HTTP/protobuf or gRPC.

Operators can monitor Private AI Services deployments in Grafana for pod restart frequency, vGPU licensing status, and idle or underutilized GPU devices in passthrough mode. Private AI Services controller pod metrics are integrated into observability platforms through Telegraf configuration in the Supervisor instance, which allows VCF Operations to ingest PAIS controller metrics alongside the broader infrastructure telemetry it already collects for GPU-enabled workload domains. Deployment health is verified through Kubernetes pod state of the API, ingress, rex worker, and Prometheus server pods.

MLOps engineers and application developers can perform monitoring and diagnostics of models used in agents through observability platforms like Grafana to track the health, quality, and behavior of AI applications.

#### VMware vDefend (Contributes)

VMware vDefend contributes to monitoring the functionality and behavior of deployed AI workloads running on VCF by providing continuous network-level behavioral monitoring, threat detection, and AI-assisted security analysis around those workloads.

Security Intelligence, running on the Security Services Platform, provides continuous network-level behavioral monitoring that detects new traffic flows, unauthorized communications, and anomalous activity around deployed systems, including AI workloads. It continuously monitors for new flows between environments and alerts administrators to unauthorized or unexpected traffic, supporting ongoing policy adjustments. The Segmentation Monitoring Dashboard provides dedicated views for monitoring environment-level traffic flows; when monitoring identifies an environment pair without a configured protection policy, it offers a Run Recommendations option to generate policy recommendations based on observed traffic. Security Intelligence provides Infrastructure, Environment, and Application Monitoring capabilities. The application monitoring view within the Segmentation Monitoring Dashboard surfaces metrics including unprotected flows and applications with unprotected rule hits, providing targeted visibility into workloads, including AI systems, that lack active firewall policy coverage. The Policy Recommendations monitoring capability checks for changes in monitored entity scope every hour when enabled. Security Intelligence also runs a scheduled daily classification job, automatically categorizing compute entities based on traffic flows observed over the prior 30 days.

Intelligent Assist is an AI-assisted analysis feature accessible through the NSX Manager UI and Security Services Platform UI. It provides contextual analysis support on the IDS/IPS, Detections, and Campaigns pages, enabling administrators to investigate security events affecting deployed workloads with AI-driven guidance.

IDS/IPS provides ongoing threat detection through monitoring dashboards scoped to both distributed and gateway deployments. Project-scoped dashboards display events triggered for specific projects, allowing targeted monitoring of AI workload deployments. Network Detection and Response (NDR) applies behavioral analysis to identify suspicious activity targeting monitored workloads. The NDR Sensor periodically checks the status of activated features on the Security Services Platform every 15 minutes and updates its configuration accordingly.

Monitoring AI system functionality at the application layer, including model performance, output quality, and behavioral drift, is outside vDefend's domain and requires additional tooling.

Not applicable for this control: VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 72.3

> The post-market monitoring system shall be based on a post-market monitoring plan. The post-market monitoring plan shall be part of the technical documentation referred to in Annex IV. The Commission shall adopt an implementing act laying down detailed provisions establishing a template for the post-market monitoring plan and the list of elements to be included in the plan by 2 February 2026. That implementing act shall be adopted in accordance with the examination procedure referred to in Article 98(2).

**SCF Controls:** AAT-16

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 72.4

> For high-risk AI systems covered by the Union harmonisation legislation listed in Section A of Annex I, where a post-market monitoring system and plan are already established under that legislation, in order to ensure consistency, avoid duplications and minimise additional burdens, providers shall have a choice of integrating, as appropriate, the necessary elements described in paragraphs 1, 2 and 3 using the template referred in paragraph 3 into systems and plans already existing under that legislation, provided that it achieves an equivalent level of protection. The first subparagraph of this paragraph shall also apply to high-risk AI systems referred to in point 5 of Annex III placed on the market or put into service by financial institutions that are subject to requirements under Union financial services law regarding their internal governance, arrangements or processes.

**SCF Controls:** AAT-16

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 73.1

> Providers of high-risk AI systems placed on the Union market shall report any serious incident to the market surveillance authorities of the Member States where that incident occurred.

**SCF Controls:** AAT-16.9

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 73.2

> The report referred to in paragraph 1 shall be made immediately after the provider has established a causal link between the AI system and the serious incident or the reasonable likelihood of such a link, and, in any event, not later than 15 days after the provider or, where applicable, the deployer, becomes aware of the serious incident. The period for the reporting referred to in the first subparagraph shall take account of the severity of the serious incident.

**SCF Controls:** AAT-16.9

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 73.3

> Notwithstanding paragraph 2 of this Article, in the event of a widespread infringement or a serious incident as defined in Article 3, point (49)(b), the report referred to in paragraph 1 of this Article shall be provided immediately, and not later than two days after the provider or, where applicable, the deployer becomes aware of that incident.

**SCF Controls:** AAT-16.9

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 73.4

> Notwithstanding paragraph 2, in the event of the death of a person, the report shall be provided immediately after the provider or the deployer has established, or as soon as it suspects, a causal relationship between the high-risk AI system and the serious incident, but not later than 10 days after the date on which the provider or, where applicable, the deployer becomes aware of the serious incident.

**SCF Controls:** AAT-16.9

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 73.5

> Where necessary to ensure timely reporting, the provider or, where applicable, the deployer, may submit an initial report that is incomplete, followed by a complete report.

**SCF Controls:** AAT-16.9

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 73.6

> Following the reporting of a serious incident pursuant to paragraph 1, the provider shall, without delay, perform the necessary investigations in relation to the serious incident and the AI system concerned. This shall include a risk assessment of the incident, and corrective action. The provider shall cooperate with the competent authorities, and where relevant with the notified body concerned, during the investigations referred to in the first subparagraph, and shall not perform any investigation which involves altering the AI system concerned in a way which may affect any subsequent evaluation of the causes of the incident, prior to informing the competent authorities of such action.

**SCF Controls:** AAT-16.10

**Aggregate Coverage:** Contributes

#### VMware vDefend (Contributes)

VMware vDefend contributes investigative data that can support a serious incident Root Cause Analysis involving AI or autonomous technologies, but the RCA process, risk assessment documentation, and corrective action planning are organizational governance activities outside vDefend's scope.

Security teams can investigate individual threat events and correlated campaigns through the Security Services Platform interface to assess impact, identify root causes, and take appropriate mitigation actions. The Security Services Platform Campaign feature presents a Blueprint tab that visualizes correlated security events and key actors for security incident investigation, helping analysts understand the full scope of an attack chain. Network Detection and Response (NDR) collects key abnormal activity or malicious events from every activated event source in the environment, and its detection capabilities enable threat triage and investigation by presenting analysis of all threat events regardless of type.

Security Intelligence supports detection and display of tactics and techniques from the MITRE ATT&CK framework, showing the number of detected suspicious events that used each tactic or technique during the selected time period, which supports structured documentation of attack methods in an RCA. Security Intelligence also categorizes detected suspicious traffic events by impact type (Critical, High, Medium, and Low) to help prioritize response actions, and the blast radius view identifies lateral movement patterns and assesses the true scope of a security incident, including which communication paths have been affected. Security Intelligence collects IDS events across source and destination hosts to connect relevant events and provide a more complete picture of an attack.

Malware Prevention generates file analysis reports that include an ATT&CK TECHNIQUES field documenting observed malicious actions and tools, along with a Description field and activity classifications covering categories such as Autostart, Evasion, File, Memory, Network, Reputation, Signature, and Stealth. Malware Prevention Service event logs include verdict and score fields that record analysis results and numeric risk assessments, as well as analysisStatus and errorCode fields for tracking analysis completion.

The formal documentation of root cause, risk rating, and corrective actions must be managed through the organization's incident response and governance processes.

Not applicable for this control: VCF, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 79.4

> The operator shall ensure that all appropriate corrective action is taken in respect of all the AI systems concerned that it has made available on the Union market.

**SCF Controls:** CPL-02.3

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides technical capabilities that support an organization's corrective action processes for addressing non-conformity with compliance obligations, though the broader process of managing statutory, regulatory, and contractual compliance requires organizational governance.

VCF Operations includes a compliance management subsystem that continuously monitors infrastructure components against industry standards and custom policies. Monitored objects include VMware vCenter instances, VMware ESX hosts, virtual machines, distributed port groups, and distributed switches. When VCF Operations detects violations, it highlights risk areas and provides actionable remediation recommendations. Each object receives a compliance score based on the most critical of the violated standards, which helps administrators prioritize corrective efforts. Depending on the severity of the non-compliance, the platform can generate alerts or notifications to responsible personnel. Administrators can review non-compliant objects and associated violations from the Security and Compliance page in VCF Operations, then take targeted remedial action. For more severe non-compliance, automated remediation actions can be configured to bring objects back into a compliant state without manual intervention. VCF Operations defines compliance as a measurement that the objects in an environment meet industrial, governmental, regulatory, or internal standards, and provides regulatory compliance benchmarks against which organizations can assess their level of conformity.

On the host layer, vSphere Configuration Profiles and vSphere Lifecycle Manager enforce desired-state configuration for ESX hosts and clusters. These tools detect drift from the configured desired state and can remediate hosts to restore conformity with that state. When the desired state profile is built to match a regulatory baseline, this drift remediation becomes the mechanism by which regulatory non-conformity is corrected at the host layer. The Configuration Drifts feature in VCF Operations provides proactive monitoring of configuration changes across vCenter instances and vSphere clusters, and vSphere Lifecycle Manager can check the compliance of a cluster or host against the desired state and determine whether additional remediation steps are required, with a default global remediation policy applied during remediation operations.

VCF also exposes compliance remediation data programmatically. The ComplianceImpact data structure, accessible through the vSphere API via the ClusterCompliance and HostCompliance interfaces, contains information about the specific steps required to remediate a non-compliant cluster or standalone host. The vSphere Lifecycle Manager API provides equivalent programmatic access for remediation operations. This programmatic access allows organizations to integrate compliance remediation workflows into their broader governance processes or automation tooling.

NSX, the networking component of VCF, provides its own compliance reporting capability. The NSX compliance report identifies non-compliant configurations by non-compliance code, description, compliance standard violated, affected resource name or ID, and resource type. This structured reporting supports systematic tracking and resolution of networking-related compliance gaps.

These capabilities address technical configuration conformity within the VCF-managed infrastructure. Corrective action for broader statutory, regulatory, or contractual obligations requires organizational processes for tracking non-conformity, assigning ownership, establishing timelines, and verifying that corrective measures have been completed.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 80.4

> The provider shall ensure that all necessary action is taken to bring the AI system into compliance with the requirements and obligations laid down in this Regulation. Where the provider of an AI system concerned does not bring the AI system into compliance with those requirements and obligations within the period referred to in paragraph 2 of this Article, the provider shall be subject to fines in accordance with Article 99.

**SCF Controls:** CPL-02.3

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 80.5

> The provider shall ensure that all appropriate corrective action is taken in respect of all the AI systems concerned that it has made available on the Union market.

**SCF Controls:** CPL-02.3

**Aggregate Coverage:** Contributes

#### VCF (Contributes)

VCF provides technical capabilities that support an organization's corrective action processes for addressing non-conformity with compliance obligations, though the broader process of managing statutory, regulatory, and contractual compliance requires organizational governance.

VCF Operations includes a compliance management subsystem that continuously monitors infrastructure components against industry standards and custom policies. Monitored objects include VMware vCenter instances, VMware ESX hosts, virtual machines, distributed port groups, and distributed switches. When VCF Operations detects violations, it highlights risk areas and provides actionable remediation recommendations. Each object receives a compliance score based on the most critical of the violated standards, which helps administrators prioritize corrective efforts. Depending on the severity of the non-compliance, the platform can generate alerts or notifications to responsible personnel. Administrators can review non-compliant objects and associated violations from the Security and Compliance page in VCF Operations, then take targeted remedial action. For more severe non-compliance, automated remediation actions can be configured to bring objects back into a compliant state without manual intervention. VCF Operations defines compliance as a measurement that the objects in an environment meet industrial, governmental, regulatory, or internal standards, and provides regulatory compliance benchmarks against which organizations can assess their level of conformity.

On the host layer, vSphere Configuration Profiles and vSphere Lifecycle Manager enforce desired-state configuration for ESX hosts and clusters. These tools detect drift from the configured desired state and can remediate hosts to restore conformity with that state. When the desired state profile is built to match a regulatory baseline, this drift remediation becomes the mechanism by which regulatory non-conformity is corrected at the host layer. The Configuration Drifts feature in VCF Operations provides proactive monitoring of configuration changes across vCenter instances and vSphere clusters, and vSphere Lifecycle Manager can check the compliance of a cluster or host against the desired state and determine whether additional remediation steps are required, with a default global remediation policy applied during remediation operations.

VCF also exposes compliance remediation data programmatically. The ComplianceImpact data structure, accessible through the vSphere API via the ClusterCompliance and HostCompliance interfaces, contains information about the specific steps required to remediate a non-compliant cluster or standalone host. The vSphere Lifecycle Manager API provides equivalent programmatic access for remediation operations. This programmatic access allows organizations to integrate compliance remediation workflows into their broader governance processes or automation tooling.

NSX, the networking component of VCF, provides its own compliance reporting capability. The NSX compliance report identifies non-compliant configurations by non-compliance code, description, compliance standard violated, affected resource name or ID, and resource type. This structured reporting supports systematic tracking and resolution of networking-related compliance gaps.

These capabilities address technical configuration conformity within the VCF-managed infrastructure. Corrective action for broader statutory, regulatory, or contractual obligations requires organizational processes for tracking non-conformity, assigning ownership, establishing timelines, and verifying that corrective measures have been completed.

Not applicable for this control: VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 82.2

> The provider or other relevant operator shall ensure that corrective action is taken in respect of all the AI systems concerned that it has made available on the Union market within the timeline prescribed by the market surveillance authority of the Member State referred to in paragraph 1.

**SCF Controls:** CPL-02.3

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 91.4

> The request for information shall state the legal basis and the purpose of the request, specify what information is required, set a period within which the information is to be provided, and indicate the fines provided for in Article 101 for supplying incorrect, incomplete or misleading information.

**SCF Controls:** CPL-05

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 91.5

> The provider of the general-purpose AI model concerned, or its representative shall supply the information requested. In the case of legal persons, companies or firms, or where the provider has no legal personality, the persons authorised to represent them by law or by their statutes, shall supply the information requested on behalf of the provider of the general-purpose AI model concerned. Lawyers duly authorised to act may supply information on behalf of their clients. The clients shall nevertheless remain fully responsible if the information supplied is incomplete, incorrect or misleading.

**SCF Controls:** CPL-05

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 92.4

> The request for access shall state the legal basis, the purpose and reasons of the request and set the period within which the access is to be provided, and the fines provided for in Article 101 for failure to provide access.

**SCF Controls:** CPL-05

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 92.5

> The providers of the general-purpose AI model concerned or its representative shall supply the information requested. In the case of legal persons, companies or firms, or where the provider has no legal personality, the persons authorised to represent them by law or by their statutes, shall provide the access requested on behalf of the provider of the general-purpose AI model concerned.

**SCF Controls:** CPL-05

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 93.1(a)

> Take appropriate measures to comply with the obligations set out in Articles 53 and 54.

**SCF Controls:** CPL-02.3

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 93.1(b)

> Implement mitigation measures, where the evaluation carried out in accordance with Article 92 has given rise to serious and substantiated concern of a systemic risk at Union level.

**SCF Controls:** CPL-02.3

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 93.1(c)

> Restrict the making available on the market, withdraw or recall the model.

**SCF Controls:** CPL-02.3

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.

### Control 111.3

> Providers of general-purpose AI models that have been placed on the market before 2 August 2025 shall take the necessary steps in order to comply with the obligations laid down in this Regulation by 2 August 2027.

**SCF Controls:** TDA-21

**Aggregate Coverage:** Not Applicable

Not applicable for this control: VCF, VMware vDefend, VCF Protection and Recovery, VMware Data Services Manager, VMware Avi Load Balancer. This control addresses an end user activity or process, a design decision, or activity outside the scope of these products.
