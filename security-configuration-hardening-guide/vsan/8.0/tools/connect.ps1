<#
    Script Name: VMware vSphere Bulk Connect Script
    Copyright (C) 2024 Broadcom, Inc. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
#>

Param (
    # vCenter Server
    [Parameter(Mandatory=$true)]
    [string]$vCenter,
    # Username
    [Parameter(Mandatory=$true)]
    [string]$User
)

$password = Read-Host -Prompt "Enter your password" -AsSecureString

$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password)
$plainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

Connect-VIServer -Server $vCenter -User $User -Password $plainPassword
Connect-CisServer -Server $vCenter -User $User -Password $plainPassword
Connect-SsoAdminServer -Server $vCenter -User $User -Password $plainPassword -SkipCertificateCheck