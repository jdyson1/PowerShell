<#
    PowerShell Profile Bootstrap

	This script should be placed wherever $profile references (i.e., C:\Users\<username>\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1)

	Load my source controlled profile script from my home drive.
#>

# Look for PowerShell\profile.ps1 in the user's profile directory
$MyProfileFileName = "profile.ps1"
$MyProfileFolderSearchList = @("~\PowerShell","~\Documents\PowerShell","$HOME\PowerShell","$HOME")
$MyProfileFound = $FALSE
$MyProfile = [string]::Empty

Foreach ($currentProfilePath in $MyProfileSearchList)
{
    $currentMyProfile = Join-Path $currentProfilePath $MyProfileFileName

    Write-Verbose "Checking if $currentMyProfile exists"

    If (Test-Path -Path $currentMyProfile)
    {
        Write-Verbose "Found $currentMyProfile"
        
        $myProfileFound = $TRUE
        $MyProfile = $currentMyProfile 
               
        # We found the profile, no need to look further
        break
    }
    Else
    {
        Write-Verbose "profile.ps1 was not found in ~\PowerShell"
    }
}

If ($MyProfileFound -eq $TRUE)
{
    Write-Verbose "Executing $MyProfile"

    . $MyProfile
} else
{
    Write-Warning "$MyProfileFileName was not found."   
}


# SIG # Begin signature block
# MIIHQAYJKoZIhvcNAQcCoIIHMTCCBy0CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU8tODAjD0jX0h0LsadBChTQsU
# HX2gggU7MIIFNzCCBB+gAwIBAgITHQAAAgVCmNIR9HPPiQAEAAACBTANBgkqhkiG
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
# CSqGSIb3DQEJBDEWBBRHqETIKvAobZ82mVnchhRfjQGLozANBgkqhkiG9w0BAQEF
# AASBgGo1cv+W/0IeHlq1dIrU9e261MrOhBqVaqva46iHwvt7GWIBll579HPRzH6v
# aDxUNS70PAAf54CfnspmSPv4DXjE4RXZSzIGCwc7t5d7K4JY9x7Sur/ht/t7d2d6
# OY2EAR7SRPmrHFZ6aLviST6IZpIPryGeoLlaYDwNs1JHY33I
# SIG # End signature block
