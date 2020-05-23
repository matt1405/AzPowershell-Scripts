#Create Service Proinciple 
$cred= New-Object Microsoft.Azure.Commands.ActiveDirectory.PSADPasswordCredential -Property @{ StartDate=Get-Date; EndDate=Get-Date -Year 2030; Password= 'SetP@ssword'}
$sp = New-AzureRmADServicePrincipal -DisplayName WhatYouWant -PasswordCredential $cred
Write-Output $sp

#Sign in with Service priciple 
$u = 'user/appID'
$p = ConvertTo-SecureString 'YourPassword' -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ($u, $P)

#Connect to Account 
Connect-AzureRmAccount -ServicePrincipal -Credential $cred -Tenant 'TenantID'

