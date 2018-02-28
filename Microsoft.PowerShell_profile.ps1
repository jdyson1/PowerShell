
<#
	This script should be placed wherever $profile references (i.e., C:\Users\<username>\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1)

	Load my source controlled profile script from my home drive.
#>


# Load profile script from home directory
Write-Information "Loading base profile from home drive..."

$myprofile = (Get-ChildItem env:HOMEDRIVE).Value + "\PowerShell\profile.ps1"

# Check for existence
If (Test-Path -Path $myprofile) {
	Write-Verbose "Profile found"
	. $myprofile
}
Else {
	Write-Warning "Profile script $($myprofile) not found."
}	
