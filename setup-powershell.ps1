<#
    Setup PowerShell Environment
#>

# Check if we're running as Administrator, if not, warn


# Run git to get latest updates

# Install profile bootstrap
Copy-Item $PSScriptRoot\Microsoft.PowerShell_profile.ps1 -Destination $profile -Force

# Install profile boostrap for ISE


# Install profile for cmder
If (Test-Path -Path "$env:CMDER_ROOT")
{
    Write-Information "Found Cmder at $env:CMDER_ROOT"
    Copy-Item "$PSScriptRoot\user-profile.ps1" -Destination "$env:CMDER_ROOT)\config" -Force
}


# Install posh-git

# Install Sql modules

# Install Active Directory modules
