# TLS and Cipher Suites in VMware vSphere and VMware Cloud Foundation

> [!NOTE] This is a stub page for future content.

## How to Get Started

## Documentation

- [vSphere Security](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security-8-0.html) 

## Questions & Answers

### How can I control the TLS ciphers used by vSphere?

### Several KB articles say that the default ciphers in vSphere are not considered insecure, but my infosec group says otherwise. Who is right?
Both groups are. The default ciphers in vSphere are selected for backwards-compatibility. The concern about some of those ciphers, specifically static ciphers, is that there are a number of largely-theoretical attacks against them, and while they are not insecure, per se, with better options available we should all use those. VMware infrastructure products support this through the use of TLS Profiles, and you can choose the "NIST_2024" (in 8.0 and 9.0) and "NIST_2024_TLS_13_ONLY" (in 9.0) to satisfy these requirements.

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This  repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.