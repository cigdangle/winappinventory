# Set Variable for Export File Path and Name - Defaults to Desktop
$InvFile = [Environment]::GetFolderPath("Desktop") + "\SoftwareInventory.csv"
# Looks at list of files that can be uninstalled as shown in Add/Remove Programs
$InstalledApps = Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall"
# Grab the the Display name, verison, and installation date of each app
$List = foreach($obj in $InstalledApps){$obj.GetValue('DisplayName') + "," + $obj.GetValue('DisplayVersion') + "," + $obj.GetValue('InstallDate')}
# Dump info to Export File
$List | Out-File -FilePath $InvFile
# Dump info to screen
Write-Host $List
