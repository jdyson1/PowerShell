Write-Host "Loading $($MyInvocation.MyCommand.Name)..."

# Add the PowerShell scripts folder to my path
$env:path = "$env:path;$home\PowerShell"

# Add PowerShell folder in home directory to path
$HomeDirectoryPowerShellFolder = (Get-ChildItem env:USERPROFILE).Value + "\PowerShell"

If (Test-Path -Path $HomeDirectoryPowerShellFolder) {
	Write-Verbose "Found PowerShell folder in profile folder; adding to path"

	$env:path = "$env:path;$HomeDirectoryPowerShellFolder"
} Else {
	Write-Information "PowerShell folder not found in user profile folder.  It will not be added to the path."
}

# Add PowerShell folder on home drive to path
$HomeDrivePowerShellFolder = (Get-ChildItem env:HOMEDRIVE).Value + "\PowerShell"

If (Test-Path -Path $HomeDrivePowerShellFolder) {
	Write-Verbose "Adding PowerShell folder in HOMEDRIVE to path"
	$env:path = "$env:path;$HomeDrivePowerShellFolder"
} Else {
	Write-Information "PowerShell folder not found in HOMEDRIVE.  It will not be added to the path."
}

try {
	Import-Module posh-git
} catch {
	Write-Host "Module posh-git is not loaded."
}

. (Join-Path -Path $HomeDrivePowerShellFolder -ChildPath $(switch($HOST.UI.RawUI.BackgroundColor.ToString()){'White'{'cmd-colors-solarized/Set-SolarizedLightColorDefaults.ps1'}'Black'{'cmd-colors-solarized/Set-SolarizedDarkColorDefaults.ps1'}default{return}}))

# Update help files
#. Update-Help

function Get-ProcessByName {
	param([string]$string)
	Get-Process | Where-Object { $_.ProcessName -like $string }
}

# Customize posh-git prompt
if (Get-Module -ListAvailable -Name posh-git) {
	$GitPromptSettings.DefaultPromptPrefix = "PS [$((Get-ChildItem Env:\COMPUTERNAME).Value)] "
}

# Customize the prompt
#function prompt
#{
#	$GitPromptSettings.DefaultPromptWriteStatusFirst = $true
#	$prompt = Write-Prompt "PS "
#	$prompt += & $GitPromptScriptBlock
#	
#	if ($prompt) { $prompt } else { " " }
#
#
#	$PromptData = "PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1))"
#}

function Sign-Script {
	param([string]$filename)
	$cert = (Get-ChildItem Cert:\CurrentUser\My\ -CodeSigningCert)
	Set-AuthenticodeSignature -Certificate $cert $filename
}

Write-Information "Profile loaded."

# SIG # Begin signature block
# MIIHQAYJKoZIhvcNAQcCoIIHMTCCBy0CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUuix0KZ0x/0O3aOJvRJm0RPve
# AKmgggU7MIIFNzCCBB+gAwIBAgITHQAAAcXvt74tMkri3gAEAAABxTANBgkqhkiG
# 9w0BAQsFADA4MRMwEQYKCZImiZPyLGQBGRYDY29tMRMwEQYKCZImiZPyLGQBGRYD
# YWhjMQwwCgYDVQQDEwNEQzEwHhcNMTgwMjI4MjEzNDM1WhcNMTkwMjI4MjEzNDM1
# WjBQMRMwEQYKCZImiZPyLGQBGRYDY29tMRMwEQYKCZImiZPyLGQBGRYDYWhjMQ4w
# DAYDVQQDEwVVc2VyczEUMBIGA1UEAxMLSmVzc2UgRHlzb24wgZ8wDQYJKoZIhvcN
# AQEBBQADgY0AMIGJAoGBAK+dbS3v7pFAc3S70X3x9GOSD71EDIWZpQOyAOIhEpMx
# BOUw7z294ybnljVxr9UV3VD3Nx8l6ThB69y8TM3c+Vm/VQDg0BjGMD696iAf6dXN
# Pd9UYcOb6bJbt6xBc0da+WUwUWaIJCNt1VkcHIDwsIOxaRt7fzHYQ1HlZgL9LSHH
# AgMBAAGjggKkMIICoDAlBgkrBgEEAYI3FAIEGB4WAEMAbwBkAGUAUwBpAGcAbgBp
# AG4AZzATBgNVHSUEDDAKBggrBgEFBQcDAzALBgNVHQ8EBAMCB4AwHQYDVR0OBBYE
# FCZmHv+ZeUriaevr9Wm7OPePoy7SMB8GA1UdIwQYMBaAFAdsf7rwI0TdTBUSbvvU
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
# dmhvbWVjYXJlLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAkg0uwNNCrExOMaZUAPSW
# X2qG1SsDp+/fVmNrWYiGBTq6TOz61OMHEN6Nfj2g6419u4zzog7QoAza/7RAxPtJ
# 9OOj3jTxjsm46612Y+nJltXtY1bTZUhPmRLkAA+3VyxeKHOBRPtSO8KUKWChfcO7
# f/dEUnIuGnvzn+MII4XnmnIdj7lmO0dl0jakFFqRq2Nz9c5OH9UC3nW6cU0tfUji
# OJkvOFeVBVrMEoDoNNZlZKM8zWNcvhibPpDf12aSuGadgvJSxM3rPh9/g9y87FPB
# u4gfjWNGUJoHcnKpp4JgRqU8b6QSTjDUKc8+4LfDSUbTU0L1weOP1MY8QmUe70Qu
# vDGCAW8wggFrAgEBME8wODETMBEGCgmSJomT8ixkARkWA2NvbTETMBEGCgmSJomT
# 8ixkARkWA2FoYzEMMAoGA1UEAxMDREMxAhMdAAABxe+3vi0ySuLeAAQAAAHFMAkG
# BSsOAwIaBQCgeDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAAMBkGCSqGSIb3DQEJ
# AzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEVMCMG
# CSqGSIb3DQEJBDEWBBRHzci3qJGfDpoav5liZFqMiaMPYTANBgkqhkiG9w0BAQEF
# AASBgCb/yN5uA2INSWwk3jkLVKnVyzf5LRAMoyDSQcL7jNcI8fzDNLibViqRhsvR
# VjQ0mrhljS0zcATovpu9bkw+BL0v2vdcherW+bJyx219pRiKjpHNHTdVQ96y9I8l
# cItJs7xE1yaE4CKhikjmFxrtZOUwk7ditJdn8uKuSaQLJbv2
# SIG # End signature block
