## GOC208: WDS (RemoteInstall)

Install-WindowsFeature -Name WDS -IncludeManagementTools  
net start wdsserver  

NE! DHCP Authorization: Authorize this Windows Deployment Services server in DHCP  

DC-PRAHA1.gopas.virtual 10.10.0.11  
SRV-AUTH.gopas.virtual 10.10.0.15  

Nelze s Windows 11 25H2 boot.wim  

Troubleshooting: DHCP Discovery  
	• PXE-E51: No DHCP or proxyDHCP offers were received.  
	• PXE-E52: proxyDHCP offers were received. No DHCP offers were received.  
	• PXE-E53: No boot filename received.  
	• PXE-E55: proxyDHCP service did not reply to request on port 4011.  
	• PXE-E77 bad or missing discovery server list.  
	• PXE-E78: Could not locate boot server  

Troubleshooting: TFTP Transfer  
	• PXE-E32: TFTP open timeout  
	• PXE-E35: TFTP read timeout  
	• PXE-E36: Error received from TFTP server  
	• PXE-E3F: TFTP packet size is invalid  
	• PXE-E3B: TFTP Error - File not Found  
	• PXE-T04: Access Violation  

E11  
E38  

Troubleshooting: Client:  
	• dism /online /enable-feature /featurename:TFTP  
	• tftp -i 10.10.0.15 GET \boot\x64\wdsmgfw.efi  

hdlscom1.com
