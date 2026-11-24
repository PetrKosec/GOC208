#### Hyper-V Host
```
Get-VMHost | fl -Property EnableEnhancedSessionMode
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
Set-VMHost -EnableEnhancedSessionMode $True 
Set-VMHost -VirtualMachinePath E:\Hyper-V 
Set-VMHost -VirtualHardDiskPath E:\Hyper-V
```

#### New VMs
```
New-VM -Name "VM01-26H2-PRO" -MemoryStartupBytes 8GB -NewVHDPath E:\Hyper-V\VM01-OS.vhdx -NewVHDSizeBytes 60GB -Generation 2 -SwitchName "HYD-CorpNet"
Enable-VMTPM -VMName "VM01-26H2-PRO"

New-VM -Name "Win11VM" -MemoryStartupBytes 4GB -Generation 2 -SwitchName "HYD-CorpNet" -NewVHDPath "E:\Hyper-V\Win11VM.vhdx" -NewVHDSizeBytes 50GB
Set-VMProcessor -VMName "Win11VM" -Count 8
Set-VMKeyProtector -VMName "Win11VM" -NewLocalKeyProtector
Enable-VMTPM -VMName "Win11VM"
Set-VMDvdDrive -VMName "Win11VM" -Path "E:\SOURCES\ISO\Win11_26H2_English_x64.iso"
Start-VM -Name "Win11VM"
```
#### VM02
```
$oldVM = Get-VM "VM01-24H2-PRO"
$memory = (Get-VMMemory -VMName $oldVM.name).Startup
$switch = (Get-VMNetworkAdapter -VMName $oldVM.name).SwitchName
New-VM -Name "VM02-24H2-ENT" -Generation $oldVM.Generation -MemoryStartupBytes $memory -SwitchName $switch
```
