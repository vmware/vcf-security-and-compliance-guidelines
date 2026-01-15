<#
.SYNOPSIS
    Audits vSphere permissions to identify over-privileged accounts.

.DESCRIPTION
    BRICKSTORM relies on compromised credentials with elevated privileges.
    This script audits all vSphere permissions and identifies:
    - Accounts with Administrator role
    - Accounts with Cryptographer privileges (can access encrypted VMs)
    - Service accounts with excessive permissions
    - Permissions granted at root level (propagate everywhere)

.PARAMETER ExportPath
    Optional path to export results as CSV.

.PARAMETER ShowAdminOnly
    Only show accounts with Administrator role.

.EXAMPLE
    # Full permission audit
    .\Get-VSpherePermissions.ps1

.EXAMPLE
    # Export to CSV
    .\Get-VSpherePermissions.ps1 -ExportPath "permissions.csv"

.EXAMPLE
    # Show only administrator accounts
    .\Get-VSpherePermissions.ps1 -ShowAdminOnly

.NOTES
    Reference: BRICKSTORM Defense Guide - Access Control Implementation
    Requirements: VMware PowerCLI, Connection to vCenter

    Review accounts with Administrator role and Cryptographer privileges.
    Remove excessive permissions; implement least-privilege access.
#>

[CmdletBinding()]
param (
    [Parameter()]
    [string]$ExportPath,

    [Parameter()]
    [switch]$ShowAdminOnly
)

begin {
    Write-Host "Auditing vSphere Permissions..." -ForegroundColor Cyan
    $Results = @()
    $AdminCount = 0
    $RootLevelCount = 0
}

process {
    # Get all permissions
    $AllPermissions = Get-VIPermission

    # Get roles with their privileges for reference
    $Roles = Get-VIRole

    # Identify roles with Cryptographer privilege
    $CryptoRoles = @()
    foreach ($Role in $Roles) {
        $Privs = Get-VIPrivilege -Role $Role -ErrorAction SilentlyContinue
        if ($Privs.Id -contains "Cryptographer.*" -or $Role.Name -eq "Administrator") {
            $CryptoRoles += $Role.Name
        }
    }

    foreach ($Perm in $AllPermissions) {
        $Flags = @()

        # Check for Administrator role
        if ($Perm.Role -eq "Administrator" -or $Perm.Role -eq "Admin") {
            $Flags += "ADMIN"
            $AdminCount++
        }

        # Check for Cryptographer access
        if ($Perm.Role -in $CryptoRoles) {
            $Flags += "CRYPTO"
        }

        # Check for root-level permissions
        if ($Perm.Entity.Name -eq "Datacenters" -or $Perm.Entity -is [VMware.VimAutomation.ViCore.Impl.V1.RootFolderImpl]) {
            $Flags += "ROOT-LEVEL"
            $RootLevelCount++
        }

        # Check for propagating permissions
        if ($Perm.Propagate) {
            $Flags += "PROPAGATE"
        }

        # Check for service accounts (common patterns)
        if ($Perm.Principal -like "*svc*" -or $Perm.Principal -like "*service*" -or $Perm.Principal -like "*backup*") {
            $Flags += "SERVICE-ACCT"
        }

        $Status = if ($Flags.Count -gt 0) { $Flags -join "," } else { "OK" }

        # Apply filter if ShowAdminOnly
        if ($ShowAdminOnly -and "ADMIN" -notin $Flags) {
            continue
        }

        $Result = [PSCustomObject]@{
            Status     = $Status
            Principal  = $Perm.Principal
            Role       = $Perm.Role
            Entity     = $Perm.Entity.Name
            EntityType = $Perm.Entity.GetType().Name
            Propagate  = $Perm.Propagate
            IsGroup    = $Perm.IsGroup
        }
        $Results += $Result
    }
}

end {
    Write-Host ""
    Write-Host "Permission Audit Summary" -ForegroundColor Cyan
    Write-Host "========================" -ForegroundColor Cyan
    Write-Host "Total permissions:      $($AllPermissions.Count)"
    Write-Host "Administrator role:     $AdminCount" -ForegroundColor $(if ($AdminCount -gt 3) { "Yellow" } else { "Green" })
    Write-Host "Root-level grants:      $RootLevelCount" -ForegroundColor $(if ($RootLevelCount -gt 2) { "Yellow" } else { "Green" })
    Write-Host ""

    if ($AdminCount -gt 3) {
        Write-Host "Consider reducing accounts with Administrator role." -ForegroundColor Yellow
        Write-Host "Use role-based access with minimum required permissions." -ForegroundColor Yellow
    }

    # Export if path specified
    if ($ExportPath) {
        $Results | Export-Csv -Path $ExportPath -NoTypeInformation
        Write-Host "Results exported to: $ExportPath" -ForegroundColor Green
    }

    $Results
}
