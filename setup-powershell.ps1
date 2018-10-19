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

# Add the PowerShell scripts folder to my path
if (Test-Path -Path "$PSScriptRoot")
{
    Add-Path "$home\PowerShell"
    #$env:Path = "$env:path;$home\PowerShell"
}

# Add PowerShell folder in home directory to path
#$HomeDirectoryPowerShellFolder = (Get-ChildItem env:USERPROFILE).Value + "\PowerShell"

#If (Test-Path -Path $HomeDirectoryPowerShellFolder) {
#	Write-Verbose "Found PowerShell folder in profile folder; adding to path"
#
#	$env:path = "$env:path;$HomeDirectoryPowerShellFolder"
#} Else {
#	Write-Information "PowerShell folder not found in user profile folder.  It will not be added to the path."
#}

# Add PowerShell folder on home drive to path
#$HomeDrivePowerShellFolder = (Get-ChildItem env:HOMEDRIVE).Value + "\PowerShell"

#If (Test-Path -Path $HomeDrivePowerShellFolder) {
#	Write-Verbose "Adding PowerShell folder in HOMEDRIVE to path"
#	$env:path = "$env:path;$HomeDrivePowerShellFolder"
#} Else {
#	Write-Information "PowerShell folder not found in HOMEDRIVE.  It will not be added to the path."
#}

# Copy the profile to the default location if it has been updated




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

# SIG # Begin signature block
# MIIHQAYJKoZIhvcNAQcCoIIHMTCCBy0CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUJB9C9QbrR7x3TjOZYMen4EL8
# B+WgggU7MIIFNzCCBB+gAwIBAgITHQAAAgVCmNIR9HPPiQAEAAACBTANBgkqhkiG
# 9w0BAQsFADA4MRMwEQYKCZImiZPyLGQBGRYDY29tMRMwEQYKCZImiZPyLGQBGRYD
# YWhjMQwwCgYDVQQDEwNEQzEwHhcNMTgwNjExMTUxMjI3WhcNMTkwNjExMTUxMjI3
# WjBQMRMwEQYKCZImiZPyLGQBGRYDY29tMRMwEQYKCZImiZPyLGQBGRYDYWhjMQ4w
# DAYDVQQDEwVVc2VyczEUMBIGA1UEAxMLSmVzc2UgRHlzb24wgZ8wDQYJKoZIhvcN
# AQEBBQADgY0AMIGJAoGBAN8JC03ZWfgue9xrbt83DL7fwjY27r1Ki4SL23nLOlVh
# KueDDv6Ljouy6wTZwM/qr0FGftRWKY8SStXyA7btLwd9pgwhXXYWtH0MLNYoIMr+
# zF2S9PEtBcFVU8g6DgMKKGR3DwZF1N4K0lQ9eQoBSUzjohC5UNB5LXJ+HngQWkI1
# AgMBAAGjggKkMIICoDAlBgkrBgEEAYI3FAIEGB4WAEMAbwBkAGUAUwBpAGcAbgBp
# AG4AZzATBgNVHSUEDDAKBggrBgEFBQcDAzALBgNVHQ8EBAMCB4AwHQYDVR0OBBYE
# FORgZ0gU9UmgOHotujrnJ+dGCGeOMB8GA1UdIwQYMBaAFAdsf7rwI0TdTBUSbvvU
# yU92uK5eMIHmBgNVHR8Egd4wgdswgdiggdWggdKGgaVsZGFwOi8vL0NOPURDMSg0
# KSxDTj1kYzEsQ049Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNl
# cnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9YWhjLERDPWNvbT9jZXJ0aWZpY2F0
# ZVJldm9jYXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9u
# UG9pbnSGKGh0dHA6Ly9kYzEuYWhjLmNvbS9DZXJ0RW5yb2xsL0RDMSg0KS5jcmww
# gfMGCCsGAQUFBwEBBIHmMIHjMIGeBggrBgEFBQcwAoaBkWxkYXA6Ly8vQ049REMx
# LENOPUFJQSxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxD
# Tj1Db25maWd1cmF0aW9uLERDPWFoYyxEQz1jb20/Y0FDZXJ0aWZpY2F0ZT9iYXNl
# P29iamVjdENsYXNzPWNlcnRpZmljYXRpb25BdXRob3JpdHkwQAYIKwYBBQUHMAKG
# NGh0dHA6Ly9kYzEuYWhjLmNvbS9DZXJ0RW5yb2xsL2RjMS5haGMuY29tX0RDMSg0
# KS5jcnQwNgYDVR0RBC8wLaArBgorBgEEAYI3FAIDoB0MG0plc3NlLkR5c29uQGFk
# dmhvbWVjYXJlLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAIzvjteBMdbHd423T7OYr
# f8B7EdLOyzNbFC4jpdXdBsWwRdbRykMI6RFgyNOGzZDNfmSaXUNR/URAKBxUTUT9
# NdwgddFpBtsC9VpEL1wQzsp9AaSkwynGzo8GLlm6+8IMKe6xWRn2QVGb39y/gffX
# FxpLcCuC6lRs5YICx+SY0N4X2bTWmhzTwTlgnxFD+FDCz6CuwKfFn0zjYefxeN8J
# JwLZ6V8YJug797y0pWu0EO5GfH0K25K9dy0V3q/DA2dhiGlMs6C6WcUW8h+3CevO
# 8c2FIDjPCH+MFweW7/xvUx7I2RnrsaNJeclxpqw6DbOPTzALlsml2vgkhpf+rhLu
# TTGCAW8wggFrAgEBME8wODETMBEGCgmSJomT8ixkARkWA2NvbTETMBEGCgmSJomT
# 8ixkARkWA2FoYzEMMAoGA1UEAxMDREMxAhMdAAACBUKY0hH0c8+JAAQAAAIFMAkG
# BSsOAwIaBQCgeDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAAMBkGCSqGSIb3DQEJ
# AzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEVMCMG
# CSqGSIb3DQEJBDEWBBSiESgTVdkgzqeHS60BfBiUM96AKTANBgkqhkiG9w0BAQEF
# AASBgMRe+a6J7XQcXvdpShwXKfVMpFWNAEqPX7IPmhF61sPD31A6/zJ2krfHdDln
# GcvyHu28NDXH1PsZKdOP9KpANp7X/Nm3WcfwohukoGUF2PUK23AujbAg0RQgkH5F
# FMZos4Fu9lIKxLPQG1hWaQvSlTQi90tbsEE3yxVaZPU4tRjZ
# SIG # End signature block
