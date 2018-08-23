Write-Verbose "Loading $($MyInvocation.MyCommand.Name)..."

Function global:Add-Path()
{
[Cmdletbinding()]
param
(
    [parameter(Mandatory = $True, ValueFromPipeline = $True, Position = 0)][String[]]$path)

    $oldPath = $env:Path

    If (!$path)
    {
        Write-Error "No folder provided."
        
        Return
     }

     If ($oldPath | Select-String -SimpleMatch $path)
     {
        Write-Warning "Folder already in path, not adding."

        Return
     }

     # Check if the folder exists
     If (!(Test-Path -Path $path))
     {
        Write-Error "Folder does not exist, not adding."
        Return
     }

     Write-Information "Adding $path to path"

     $newPath = $oldPath + ";" + $path

     $env:Path = $newPath

     Return $newPath
}

# TODO: Script to configure solarized colors for PowerShell window

# Import posh-git and configure it
If (Get-Module -ListAvailable -Name "posh-git")
{
    $module = Get-Module -Name "posh-git"

    Write-Information "$module.Name $module.Version is installed"

    try
    {
        Import-Module -Name "posh-git"
    } catch
    {
        Write-Warning "posh-git module could not be imported."
    }  
}
else
{
    Write-Warning "posh-git module is not installed. To install it, start Windows PowerShell with the ''Run as administrator'' option and run ''Install-Module posh-git''."
}

# Update help files
#. Update-Help

function Get-ProcessByName {
	param([string]$string)
	Get-Process | Where-Object { $_.ProcessName -like $string }
}

function global:Sign-Script {
[Cmdletbinding()]
	param([string]$filename)
	$cert = (Get-ChildItem Cert:\CurrentUser\My\ -CodeSigningCert)
	Set-AuthenticodeSignature -Certificate $cert $filename
}

function Touch-File
{
	$file = $args[0]

	if ($file -eq $null)
	{
		throw "No filename supplied"
	}

	if(Test-Path $file)
	{
		(Get-ChildItem $file).LastWriteTime = Get-Date
	}
	else
	{
		echo $null > $file
	}
}

Set-Alias touch Touch-File
Write-Information "Profile loaded."

# SIG # Begin signature block
# MIIHQAYJKoZIhvcNAQcCoIIHMTCCBy0CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUqfz954fu8piYIW4Nn5JlX3gb
# /dCgggU7MIIFNzCCBB+gAwIBAgITHQAAAgVCmNIR9HPPiQAEAAACBTANBgkqhkiG
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
# CSqGSIb3DQEJBDEWBBQlt8wDd2t1VSNSx1ooSCFCyZZ55TANBgkqhkiG9w0BAQEF
# AASBgHHFzXrhZgsDpN5uC15qWXYvmE2QGkp8t+XceeEQpnWhWQJmw21jLtvZABgE
# pRoeH9W/IWRaX/FvFTwr/1JV+2ZUFaHofPBW0moDssbq6jTtGjC+4cSlU4+B88Nt
# JHfNn4UHtEYCgehejL9jc8eGjSyWjSU3eWIF+VV7EkWngJuj
# SIG # End signature block
