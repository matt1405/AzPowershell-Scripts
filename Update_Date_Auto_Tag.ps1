#Use Tags to auto update change dates
Get-AzResource -name resource |
Set-AzResource -Tag @{Updated=(Get-Date).ToLongDateString()} 

Get-AzResource -TagName Updated -TagValue ((Get-Date).ToLongDateString())
