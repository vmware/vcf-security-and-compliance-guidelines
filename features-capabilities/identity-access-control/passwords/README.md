# Password Management in VMware vSphere and VMware Cloud Foundation

> [!NOTE] This is a stub page for future content.

## How to Get Started

## Documentation

- [vSphere Security](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/vsphere-security-8-0.html) 

## Questions & Answers

###  If we enable Secure Boot, TPM, and we end up locking the root account by typing it incorrectly 5 times, how can we get it unlocked?
The configuration data for ESX is encrypted, and that encryption key is stored in the host TPM 2.0. If you lock your account you could lose access to the host, depending on how you have the host configured. This is a legitimate concern in some organizations because of unreliable KVM mechanisms which drop or repeat characters, bad keyboards, typing inaccuracies under stress, and so on.

The lockout controls in any authentication mechanism help prevent brute-force password guessing and techniques like "password spraying" by slowing the attacker down. The controls for this are configurable, depending on your tolerance for risk. If you are monitoring for, and alerting on, failed login attempts, you might be able to reduce the restrictiveness of these policies while still maintaining the ability to detect and respond to breaches in progress. However, this is up to you.

On ESX, two parameters govern the local account lockout:

- Security.AccountLockFailures: governs how many failed logins cause an account lockout.
- Security.AccountUnlockTime: governs how long the account stays locked out. This is the main control for slowing an attacker down.

Security.AccountUnlockTime cannot be set to zero or -1 to disable it, but it can be set to a large value like its maximum of 999999999 seconds (almost 32 years). If you are concerned about inadvertent lockouts you might set it to something like 900, which is what many compliance frameworks require, as a compromise between annoying legitimate administrators versus deterring attackers.

If ESX is connected to vCenter, SDDC Manager, or VCF Operations there may be paths to resetting the root password or creating alternate administrator accounts, too.

When VCF components are joined to other identity sources those other identity sources enforce these types of controls, too. Ensure that all administrator access to all components is audited for consistency.

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This  repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.