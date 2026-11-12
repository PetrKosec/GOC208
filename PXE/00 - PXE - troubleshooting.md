## PXE
### PXE boot in Configuration Manager - Configuration Manager | Microsoft Learn

You must make sure that the DHCP (67 and 68), TFTP (69) and BINL (4011) ports are open between the client computer, the DHCP server and the PXE enabled DP.  

From <https://learn.microsoft.com/en-us/troubleshoot/mem/configmgr/os-deployment/understand-pxe-boot>  

Error 8007274d = No connection could be made because the target machine actively refused it.  
Error 80072efd = A connection with the server could not be established  

From <https://www.prajwaldesai.com/sccm-osd-error-socket-connect-failed-8007274d/>  

### PXE 
https://learn.microsoft.com/en-us/troubleshoot/mem/configmgr/troubleshoot-pxe-boot-issues  
UDP ports - 67, 68, 4011  
For OS - 69  
PXE Responder:  
SMSBoot\SCC00005\x64\wdsnbp.com  
SMSBoot\SCC00005\x64\wdsmgfw.efi  
