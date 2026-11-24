### Exercise 1: Configure a custom Windows PE environment (30 minutes)
#### Task 1: Set up the Windows PE environment
```
Copype amd64 E:\Winpe64
```
#### Task 2: Mount the base Windows PE image
```
Import-Module "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\DISM"

Mount-WindowsImage –ImagePath E:\Winpe64\Media\Sources\Boot.wim –Index 1 –Path E:\Winpe64\Mount
```
#### Task 3: Add drivers and optional components to the Windows PE image
```
Add-WindowsDriver –Path E:\winpe64\mount –Driver E:\Software\Drivers\HyperVx64 -Recurse -ForceUnsigned

CD “C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment kit\Windows preInstallation Environment\amd64\WinPE_OCs”
Add-WindowsPackage –Path E:\winpe64\mount –PackagePath .\WinPE-NetFX.cab
Add-WindowsPackage –Path E:\winpe64\mount –PackagePath .\WinPE-Scripting.cab
Add-WindowsPackage –Path E:\winpe64\mount –PackagePath .\WinPE-WMI.cab
Add-WindowsPackage –Path E:\winpe64\mount –PackagePath .\WinPE-PowerShell.cab
Add-WindowsPackage –Path E:\winpe64\mount –PackagePath .\WinPE-DismCmdlets.cab
```
#### Task 4: Save changes and dismount the image
```
Dismount-WindowsImage –Path E:\winpe64\mount –Save
```
#### Task 5: Create Windows PE Media
```
MD E:\BootISO
MakeWinpeMedia /iso E:\Winpe64 E:\BootISO\WinPEx64.iso
```
