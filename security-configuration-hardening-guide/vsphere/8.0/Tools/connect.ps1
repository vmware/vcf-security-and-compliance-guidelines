<#
    Script Name: VMware vSphere Bulk Connect Script
    Copyright (C) 2026 Broadcom, Inc. All rights reserved.
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
$credential = New-Object System.Management.Automation.PSCredential($User, $password)

try {
    Connect-VIServer -Server $vCenter -Credential $credential -ErrorAction Stop
    Write-Host "Connected to vCenter Server: $vCenter" -ForegroundColor Green
} catch {
    Write-Host "Failed to connect to vCenter Server: $_" -ForegroundColor Red
    exit 1
}

try {
    Connect-CisServer -Server $vCenter -Credential $credential -ErrorAction Stop
    Write-Host "Connected to CIS Server: $vCenter" -ForegroundColor Green
} catch {
    Write-Host "Failed to connect to CIS Server: $_" -ForegroundColor Red
}

try {
    Connect-SsoAdminServer -Server $vCenter -Credential $credential -SkipCertificateCheck -ErrorAction Stop
    Write-Host "Connected to SSO Admin Server: $vCenter" -ForegroundColor Green
} catch {
    Write-Host "Failed to connect to SSO Admin Server: $_" -ForegroundColor Red
}