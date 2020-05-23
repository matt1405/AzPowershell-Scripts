#DSC Architechture Example 
<#
-Author ps1 Script 
-Compile ps1 script to .mof
-Push/pull to target node
-Apply config 
#>
Configuration NameofFunction
{
    #One can evaluate expressions to get the node list 
    # E.g  $AllNodes.Where("Role -eq Web").NodeName 
    node ('localhost')
    {
        #Call resource provide eg windows feature name
        WindowsFeature WebServerRole
        {
            Ensure = "Present"
            Name = "Feature Name"
        }
    WindowsFeature IISManagement 
    {
        Ensure = "Present"
        Name = "Web-Mgment-Console"
        DependsOn = "[WindowsFeature]WebServerRole"
    }    
   }

}

#Run script and find.mof file in terminal
#Start-DScConfiguration -Path .\server -wait -verbose 
#wait and verbose will let you see what it's doing