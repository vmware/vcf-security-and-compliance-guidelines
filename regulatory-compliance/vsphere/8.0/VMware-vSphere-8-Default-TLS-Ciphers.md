# VMware vSphere 8 Default SSL/TLS Cipher Suites

Customers periodically inquire about which TLS cipher suites are supported by VMware vSphere. This resource outlines the default TLS settings, as verified experimentally with testssl.sh 3.0.8 using OpenSSL 3.0.8 (“testssl.sh -E host.name.com:443”). Ports & services using TLS were identified with nmap 7.70 (“nmap -p1-65535 -sT host.name.com”) and verified with OpenSSL (“openssl s\_client -connect host.name.com:443”). Products tested were in their default configurations with no additional hardening or configuration against their configured management IP address. The tested vCenter Server was version 8.0.3, and the tested VMware ESXi was 8.0.3.

Beginning with vSphere 8.0.3, the cipher suites can be configured with TLS profiles. The vSphere product documentation covers the supported cipher suites and how to configure them:

- [vSphere TLS Configuration](https://docs.vmware.com/en/VMware-vSphere/8.0/vsphere-security/GUID-82028A21-8AB5-4E2E-90B8-A01D1FAD77B1.html)
- [Managing vSphere TLS](https://docs.vmware.com/en/VMware-vSphere/8.0/vsphere-security/GUID-A5FBEA1A-3680-4562-970C-58F419BDCDC8.html#GUID-A5FBEA1A-3680-4562-970C-58F419BDCDC8)

While we strive for accuracy this is not a comprehensive list of ports and protocols, nor a comprehensive list of ports that are TLS-enabled. It is also limited to ingress/incoming connections to vSphere. Configurations and feature enablement differ between implementations and enabling certain features will enable additional listening network ports. For descriptions of ports & protocols please use ports.broadcom.com or the [vSphere Firewalling Helper](https://github.com/vmware/vcf-security-and-compliance-guidelines/tree/main/security-configuration-hardening-guide/vsphere/8.0) found as part of our security baseline. The sample commands above were given so that interested people may be able to replicate these tests in their own environment. We encourage customers to take an active role in their security and compliance needs.

## How do I get better TLS ciphers on vSphere 8?

If you're looking to improve the cipher selections for vSphere, and your environment is compatible with the modern ciphers, you can use the NIST_2024 profile.

1.  [Enable FIPS mode on your vCenter](https://docs.vmware.com/en/VMware-vSphere/8.0/vsphere-security/GUID-1DA131BC-CAAD-4B6C-BF66-CDFFFF63588B.html). This will cause your vCenter  to restart.
2.  [Enable the NIST_2024 profile on vCenter](https://docs.vmware.com/en/VMware-vSphere/8.0/vsphere-security/GUID-A5FBEA1A-3680-4562-970C-58F419BDCDC8.html#GUID-A5FBEA1A-3680-4562-970C-58F419BDCDC8). This will cause your vCenter to restart again.
3.  [Enable the NIST_2024 profile on ESXi](https://docs.vmware.com/en/VMware-vSphere/8.0/vsphere-security/GUID-A5FBEA1A-3680-4562-970C-58F419BDCDC8.html#GUID-A5FBEA1A-3680-4562-970C-58F419BDCDC8). This will require a reboot of your ESXi hosts.

It is not recommended to use the MANUAL profiles; your scanner should be fine with the NIST_2024 cipher suites.

If you encounter issues you can always turn these profiles off and use the COMPATIBLE profile, which will use the legacy cipher suites. Issues would come in the form of network connection failures between systems, especially connections from older clients.

## What about HSTS and port 9080/tcp?

If you are here because your compliance scanner is flagging HSTS, you may be interested in the [HSTS information found in our Scanning FAQ](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/regulatory-compliance/compliance-vulnerability-scanning-faq.md#my-scanner-says-it-found-web-servers-that-dont-use-hsts-am-i-vulnerable). In short, HSTS is a browser trust mechanism that is inapplicable to most vSphere ports.

There are other entries in the Scanning FAQ that may be of interest to you, including ["My scanner says it found insecure TLS ciphers. Am I vulnerable?"](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/regulatory-compliance/compliance-vulnerability-scanning-faq.md#my-scanner-says-it-found-insecure-tls-ciphers-am-i-vulnerable).

As you see below, vSphere TLS 1.2 implementations do not contain ciphers known to be insecure (DES, RC4, etc.), or ciphers less than 128 bits, and meet all current regulatory & compliance framework requirements. We routinely suggest to organizations that the relative risk of the default cipher settings be assessed in context with the overall security of the environment when organizations decide how to spend their limited staff time in pursuit of better security.

Services that are meant to be internal to vSphere have had their cipher lists condensed as part of our ongoing effort to improve security and reduce attack surface while retaining compatibility with supported versions of vSphere. Other services have cipher suites that are chosen specifically to maximize security while retaining necessary compatibility with the larger infrastructure ecosystem. While many TLS "best practices" guides often specify more limited sets of ciphers, real-world constraints and context always factor into deployments. All of the ciphers included in vSphere 8 are considered to be secure at this time.

## Disclaimer

This document is intended to provide general guidance for organizations that are considering Broadcom solutions. The information contained in this document is for educational and informational purposes only. This  repository and the documents contained in it are not intended to provide advice and are provided “AS IS.” Broadcom makes no claims, promises, or guarantees about the accuracy, completeness, or adequacy of the information contained herein. Organizations should engage appropriate legal, business, technical, and audit expertise within their specific organization for review of requirements and effectiveness of implementations.

## VMware vCenter Server 8.0.3 running the COMPATIBLE profile

### 443/tcp:

```
TLS 1.2

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc014   ECDHE-RSA-AES256-SHA              ECDH 256   AES         256      TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA                 
x9d     AES256-GCM-SHA384                 RSA        AESGCM      256      TLS_RSA_WITH_AES_256_GCM_SHA384                    
x35     AES256-SHA                        RSA        AES         256      TLS_RSA_WITH_AES_256_CBC_SHA                       
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256              
xc013   ECDHE-RSA-AES128-SHA              ECDH 256   AES         128      TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA                 
x9c     AES128-GCM-SHA256                 RSA        AESGCM      128      TLS_RSA_WITH_AES_128_GCM_SHA256                    
x2f     AES128-SHA                        RSA        AES         128      TLS_RSA_WITH_AES_128_CBC_SHA    
```

### 636/tcp:

```
TLS 1.2

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc014   ECDHE-RSA-AES256-SHA              ECDH 256   AES         256      TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA                 
x9d     AES256-GCM-SHA384                 RSA        AESGCM      256      TLS_RSA_WITH_AES_256_GCM_SHA384                    
x35     AES256-SHA                        RSA        AES         256      TLS_RSA_WITH_AES_256_CBC_SHA                       
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256              
xc013   ECDHE-RSA-AES128-SHA              ECDH 256   AES         128      TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA                 
x9c     AES128-GCM-SHA256                 RSA        AESGCM      128      TLS_RSA_WITH_AES_128_GCM_SHA256                    
x2f     AES128-SHA                        RSA        AES         128      TLS_RSA_WITH_AES_128_CBC_SHA               

TLS 1.3  

x1302   TLS_AES_256_GCM_SHA384            ECDH 256   AESGCM      256      TLS_AES_256_GCM_SHA384                             
x1301   TLS_AES_128_GCM_SHA256            ECDH 256   AESGCM      128      TLS_AES_128_GCM_SHA256
```

### 1514/tcp:

```
TLS 1.2  

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc014   ECDHE-RSA-AES256-SHA              ECDH 256   AES         256      TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA                 
x9d     AES256-GCM-SHA384                 RSA        AESGCM      256      TLS_RSA_WITH_AES_256_GCM_SHA384                    
x35     AES256-SHA                        RSA        AES         256      TLS_RSA_WITH_AES_256_CBC_SHA                       
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256              
xc013   ECDHE-RSA-AES128-SHA              ECDH 256   AES         128      TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA                 
x9c     AES128-GCM-SHA256                 RSA        AESGCM      128      TLS_RSA_WITH_AES_128_GCM_SHA256                    
x2f     AES128-SHA                        RSA        AES         128      TLS_RSA_WITH_AES_128_CBC_SHA                       

TLS 1.3  

x1302   TLS_AES_256_GCM_SHA384            ECDH 256   AESGCM      256      TLS_AES_256_GCM_SHA384                             
x1301   TLS_AES_128_GCM_SHA256            ECDH 256   AESGCM      128      TLS_AES_128_GCM_SHA256
```

### 5480/tcp:

```
TLS 1.2

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc014   ECDHE-RSA-AES256-SHA              ECDH 256   AES         256      TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA                 
x9d     AES256-GCM-SHA384                 RSA        AESGCM      256      TLS_RSA_WITH_AES_256_GCM_SHA384                    
x35     AES256-SHA                        RSA        AES         256      TLS_RSA_WITH_AES_256_CBC_SHA                       
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256              
xc013   ECDHE-RSA-AES128-SHA              ECDH 256   AES         128      TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA                 
x9c     AES128-GCM-SHA256                 RSA        AESGCM      128      TLS_RSA_WITH_AES_128_GCM_SHA256                    
x2f     AES128-SHA                        RSA        AES         128      TLS_RSA_WITH_AES_128_CBC_SHA                       

TLS 1.3  

x1302   TLS_AES_256_GCM_SHA384            ECDH 256   AESGCM      256      TLS_AES_256_GCM_SHA384                             
x1301   TLS_AES_128_GCM_SHA256            ECDH 256   AESGCM      128      TLS_AES_128_GCM_SHA256
```

### 5580/tcp:

```
TLS 1.2  

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc014   ECDHE-RSA-AES256-SHA              ECDH 256   AES         256      TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA                 
x9d     AES256-GCM-SHA384                 RSA        AESGCM      256      TLS_RSA_WITH_AES_256_GCM_SHA384                    
x35     AES256-SHA                        RSA        AES         256      TLS_RSA_WITH_AES_256_CBC_SHA                       
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256              
xc013   ECDHE-RSA-AES128-SHA              ECDH 256   AES         128      TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA                 
x9c     AES128-GCM-SHA256                 RSA        AESGCM      128      TLS_RSA_WITH_AES_128_GCM_SHA256                    
x2f     AES128-SHA                        RSA        AES         128      TLS_RSA_WITH_AES_128_CBC_SHA    
```

### 8084/tcp:

```
TLS 1.2

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc014   ECDHE-RSA-AES256-SHA              ECDH 256   AES         256      TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA                 
x9d     AES256-GCM-SHA384                 RSA        AESGCM      256      TLS_RSA_WITH_AES_256_GCM_SHA384                    
x35     AES256-SHA                        RSA        AES         256      TLS_RSA_WITH_AES_256_CBC_SHA                       
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256              
xc013   ECDHE-RSA-AES128-SHA              ECDH 256   AES         128      TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA                 
x9c     AES128-GCM-SHA256                 RSA        AESGCM      128      TLS_RSA_WITH_AES_128_GCM_SHA256                    
x2f     AES128-SHA                        RSA        AES         128      TLS_RSA_WITH_AES_128_CBC_SHA 
```

### 9087/tcp:

```
TLS 1.2

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc014   ECDHE-RSA-AES256-SHA              ECDH 256   AES         256      TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA                 
x9d     AES256-GCM-SHA384                 RSA        AESGCM      256      TLS_RSA_WITH_AES_256_GCM_SHA384                    
x35     AES256-SHA                        RSA        AES         256      TLS_RSA_WITH_AES_256_CBC_SHA                       
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256              
xc013   ECDHE-RSA-AES128-SHA              ECDH 256   AES         128      TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA                 
x9c     AES128-GCM-SHA256                 RSA        AESGCM      128      TLS_RSA_WITH_AES_128_GCM_SHA256                    
x2f     AES128-SHA                        RSA        AES         128      TLS_RSA_WITH_AES_128_CBC_SHA
```

## VMware vCenter Server 8.0.3 running the NIST_2024 profile with FIPS mode enabled

### 443/tcp:

```
TLS 1.2

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
```

### 636/tcp:

```
TLS 1.2

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256            

TLS 1.3  

x1302   TLS_AES_256_GCM_SHA384            ECDH 256   AESGCM      256      TLS_AES_256_GCM_SHA384                             
x1301   TLS_AES_128_GCM_SHA256            ECDH 256   AESGCM      128      TLS_AES_128_GCM_SHA256
```

### 1514/tcp:

```
TLS 1.2  

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256                       

TLS 1.3  

x1302   TLS_AES_256_GCM_SHA384            ECDH 256   AESGCM      256      TLS_AES_256_GCM_SHA384                             
x1301   TLS_AES_128_GCM_SHA256            ECDH 256   AESGCM      128      TLS_AES_128_GCM_SHA256
```

### 5480/tcp:

```
TLS 1.2

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256                           

TLS 1.3  

x1302   TLS_AES_256_GCM_SHA384            ECDH 256   AESGCM      256      TLS_AES_256_GCM_SHA384                             
x1301   TLS_AES_128_GCM_SHA256            ECDH 256   AESGCM      128      TLS_AES_128_GCM_SHA256
```

### 5580/tcp:

```
TLS 1.2  

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256     
```

### 8084/tcp:

```
TLS 1.2

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256     
```

### 9087/tcp:

```
TLS 1.2

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256     
```

## VMware ESXi 8.0.3 running the COMPATIBLE profile

### 443/tcp:

```
TLS 1.2

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc014   ECDHE-RSA-AES256-SHA              ECDH 256   AES         256      TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA                 
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256              
xc013   ECDHE-RSA-AES128-SHA              ECDH 256   AES         128      TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA
```

### 2379/tcp:

```
TLS 1.2

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256             
```

### 9080/tcp:

```
TLS 1.2

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc028   ECDHE-RSA-AES256-SHA384           ECDH 256   AES         256      TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384              
xc014   ECDHE-RSA-AES256-SHA              ECDH 256   AES         256      TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA                 
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256              
xc027   ECDHE-RSA-AES128-SHA256           ECDH 256   AES         128      TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256              
xc013   ECDHE-RSA-AES128-SHA              ECDH 256   AES         128      TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA                                  

TLS 1.3

x1302   TLS_AES_256_GCM_SHA384            ECDH 256   AESGCM      256      TLS_AES_256_GCM_SHA384                             
x1301   TLS_AES_128_GCM_SHA256            ECDH 256   AESGCM      128      TLS_AES_128_GCM_SHA256
```

## VMware ESXi 8.0.3 running the NIST_2024 profile

### 443/tcp:

```
TLS 1.2

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256  
```

### 2379/tcp:

```
TLS 1.2

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256             
```

### 9080/tcp:

```
TLS 1.2

xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384              
xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256                               

TLS 1.3

x1302   TLS_AES_256_GCM_SHA384            ECDH 256   AESGCM      256      TLS_AES_256_GCM_SHA384                             
x1301   TLS_AES_128_GCM_SHA256            ECDH 256   AESGCM      128      TLS_AES_128_GCM_SHA256
```

## HSTS
----
See the [HSTS information found in our Scanning FAQ](https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/regulatory-compliance/compliance-vulnerability-scanning-faq.md#my-scanner-says-it-found-web-servers-that-dont-use-hsts-am-i-vulnerable). Port 9080/tcp does not send HTTP Strict Transport Security (HSTS) headers because it is not a web server, does not support browser connections, and does not support unencrypted communications. Consequently, HSTS checks are irrelevant for this port.