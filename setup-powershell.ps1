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

#
# posh-git
#

# Check if posh-git is installed; if not install it
#If (-not(Get-Module -ListAvailable -Name "post-git"))
#{
#    Write-Information "posh-git is not installed."
#    
#    if (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
#    {      
#        
#        
#        Write-Information "Installing posh-git"
#        
#        try
#        {
#            Install-Module posh-git
#        }
#        catch
#        {
#            Write-Error "An error occurred while attempting to install posh-git"
#        }
#    }
#    else
#    {
#        Write-Warning "This script must be run with administrator rights in order to install posh-git"
#    }
#}

# Install Sql modules

# Install Active Directory modules


git config user.email "9710616+jdyson1@users.noreply.github.com"


Install-Module PowerLine

Install-Module ReportingServicesTools 
