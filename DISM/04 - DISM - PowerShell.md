#### DISM PowerShell Cmdlets
```
Import-Module "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\DISM"

Mount-WindowsImage -ImagePath E:\Winpe64\Media\Sources\Boot.wim -Index 1 -Path E:\Winpe64\Mount

Add-WindowsDriver -Path E:\winpe64\mount -Driver E:\Software\Drivers\HyperVx64 -Recurse -ForceUnsigned

CD "C:\Program Files (x86)\Windows Kits\10\Assessment and deployment kit\Windows PreInstallation Environment\amd64\WinPE_OCs"

Add-WindowsPackage ñPath E:\winpe64\mount -PackagePath .\WinPE-NetFX.cab
Add-WindowsPackage ñPath E:\winpe64\mount -PackagePath .\WinPE-Scripting.cab
Add-WindowsPackage ñPath E:\winpe64\mount -PackagePath .\WinPE-WMI.cab
Add-WindowsPackage ñPath E:\winpe64\mount -PackagePath .\WinPE-PowerShell.cab
Add-WindowsPackage ñPath E:\winpe64\mount -PackagePath .\WinPE-DismCmdlets.cab

Dismount-WindowsImage -Path E:\winpe64\mount -Save
```
