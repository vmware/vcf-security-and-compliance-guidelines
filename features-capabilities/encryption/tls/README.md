# TLS and Cipher Suites in VMware vSphere and VMware Cloud Foundation

## Documentation

- [vSphere Security](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/9-0/vsphere-security.html) 

## Questions & Answers

### How can I control the TLS ciphers used by vSphere?

Use TLS Profiles. vSphere 8.0 Update 3 and newer have selectable TLS profiles, such as COMPATIBLE and NIST_2024, that control the protocol versions and cipher suites used by vSphere management interfaces, with NIST_2024_TLS_13_ONLY available in VCF 9.0 and newer. The Security Configuration Guide tls-ciphers controls include audit and remediation examples for both ESX and vCenter.

### Several KB articles say that the default ciphers in vSphere are not considered insecure, but my infosec group says otherwise. Who is right?
Both groups are. The default ciphers in vSphere are selected for backwards-compatibility. Some of those ciphers, specifically the static-key ciphers, have known but largely theoretical attacks against them. They are not insecure, per se, but better options exist, and NIST recommends using them. TLS Profiles let you switch to those better ciphers: choose the "NIST_2024" profile (in vSphere 8.0 Update 3 and newer) or "NIST_2024_TLS_13_ONLY" (in 9.0 and newer) to satisfy these requirements.

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.