#AzVM Properties 
#Select Properties
Get-AzVM -Name VMName | 
Select-Object Name,VMID,ProvisioningState

#Selecting Custom Properties 
GetAzVM | Select-Object Name, @{Name="DataDiskCount"; Expression={$_.StorageProfile.DataDisks.count}}

#Filtering results 
Get-AzVM | 
Where-Object{$_.StorageProfile.OSDisk.OSType -eq 'Linux'} | 
Select-Object Name,VMID,ProvisioningState

#Filtering based on Status 
Get-AzVM -Status
Get-AzVM -Status |
 Where-Object powerstate -eq deallocated 

