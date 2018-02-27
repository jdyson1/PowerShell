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

#function Get-LastBoot ([string]$Hostname = $env:computername) {
#  return Get-WmiObject Win32_OperatingSystem -ComputerName $Hostname | Select-Object csname,@{ LABEL = 'LastBootUpTime'; expression = { $_.ConverttoDateTime($_.lastbootuptime) } }
#}

try {
	Import-Module posh-git
} catch {
	Write-Host "Module posh-git is not loaded."
}


# Update help files
. Update-Help
