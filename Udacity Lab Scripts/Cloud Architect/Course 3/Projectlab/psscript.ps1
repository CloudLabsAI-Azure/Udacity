#Install AZ Module
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
Install-Module AzureAD -Force

#Provide the below values
$AzureUserName="Provide the Azure UserName here"
$AzurePassword="Provide the Azure Password here"
$AzureSubscriptionID="Provide the subscription ID here"
$domainName = "Provide the tenant name here"

#Connect to the user account
$userName = $AzureUserName
$password = $AzurePassword
$securePassword = $password | ConvertTo-SecureString -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $userName, $SecurePassword

Connect-AzAccount -Credential $cred
Connect-AzureAD -Credential $cred 

Set-AzContext -SubscriptionId $AzureSubscriptionID

New-AzResourceGroup -Name 'rg-core' -Location 'Central US'
New-AzResourceGroup -Name 'rg-prod' -Location 'Central US'
New-AzResourceGroup -Name 'rg-hrlegal' -Location 'Central US'
New-AzResourceGroup -Name 'rg-operations' -Location 'Central US'
New-AzResourceGroup -Name 'rg-data' -Location 'Central US'
New-AzResourceGroup -Name 'rg-dev' -Location 'Central US'
New-AzResourceGroup -Name 'rg-devdata' -Location 'Central US'

New-AzResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName rg-core `
  -TemplateUri 'https://raw.githubusercontent.com/CloudLabsAI-Azure/Udacity/main/Udacity%20Lab%20Scripts/Cloud%20Architect/Course%203/Projectlab/deploy-vnetcore.json' `
  -Location 'Central US'

New-AzResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName rg-prod `
  -TemplateUri 'https://raw.githubusercontent.com/CloudLabsAI-Azure/Udacity/main/Udacity%20Lab%20Scripts/Cloud%20Architect/Course%203/Projectlab/deploy-vnetprod.json' `
  -Location 'Central US'

New-AzResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName rg-hrlegal `
  -TemplateUri 'https://raw.githubusercontent.com/CloudLabsAI-Azure/Udacity/main/Udacity%20Lab%20Scripts/Cloud%20Architect/Course%203/Projectlab/deploy-01.json' `
  -TemplateParameterUri 'https://raw.githubusercontent.com/CloudLabsAI-Azure/Udacity/main/Udacity%20Lab%20Scripts/Cloud%20Architect/Course%203/Projectlab/deployvm.parameters.json'

New-AzResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName rg-operations `
  -TemplateUri 'https://raw.githubusercontent.com/CloudLabsAI-Azure/Udacity/main/Udacity%20Lab%20Scripts/Cloud%20Architect/Course%203/Projectlab/deploy-07.json' `
  -TemplateParameterUri 'https://raw.githubusercontent.com/CloudLabsAI-Azure/Udacity/main/Udacity%20Lab%20Scripts/Cloud%20Architect/Course%203/Projectlab/deployvm.parameters.json' 

New-AzResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName rg-data `
  -TemplateUri 'https://raw.githubusercontent.com/CloudLabsAI-Azure/Udacity/main/Udacity%20Lab%20Scripts/Cloud%20Architect/Course%203/Projectlab/deploy-02.json' `
  -TemplateParameterUri 'https://raw.githubusercontent.com/CloudLabsAI-Azure/Udacity/main/Udacity%20Lab%20Scripts/Cloud%20Architect/Course%203/Projectlab/deploysql.parameters.json' 

New-AzResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName rg-dev `
  -TemplateUri 'https://raw.githubusercontent.com/CloudLabsAI-Azure/Udacity/main/Udacity%20Lab%20Scripts/Cloud%20Architect/Course%203/Projectlab/deploy-03.json' `
  -TemplateParameterUri 'https://raw.githubusercontent.com/CloudLabsAI-Azure/Udacity/main/Udacity%20Lab%20Scripts/Cloud%20Architect/Course%203/Projectlab/deployvm.parameters.json' 
 

New-AzResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName rg-devdata `
  -TemplateUri 'https://raw.githubusercontent.com/CloudLabsAI-Azure/Udacity/main/Udacity%20Lab%20Scripts/Cloud%20Architect/Course%203/Projectlab/deploy-04.json' `
  -TemplateParameterUri 'https://raw.githubusercontent.com/CloudLabsAI-Azure/Udacity/main/Udacity%20Lab%20Scripts/Cloud%20Architect/Course%203/Projectlab/deploysql.parameters.json' 

#creating azure ad users


$tomusername = 'Tom@'+$domainName
$andrew = 'Andrew@'+$domainName
$srinadh = 'Srinadh@'+$domainName
$neelima = 'Neelima@'+$domainName
$Rajiv = 'Rajiv@'+$domainName
$Debora = 'Debora@'+$domainName
$Neha = 'Neha@'+$domainName
$Sean = 'Sean@'+$domainName
$Doug = 'Doug@'+$domainName
$Igor = 'Igor@'+$domainName
$Chris = 'Chris@'+$domainName
$Karl = 'Karl@'+$domainName
$Garrett = 'Garrett@'+$domainName
$Sherrie = 'Sherrie@'+$domainName
$Allison = 'Allison@'+$domainName
$Kaitlyn = 'Kaitlyn@'+$domainName
$Seth = 'Seth@'+$domainName
$Lora = 'Lora@'+$domainName
$Winifred = 'Winifred@'+$domainName
$Michael = 'Michael@'+$domainName


$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "Pass123!"
$PasswordProfile.ForceChangePasswordNextLogin = $FALSE

New-AzureADUser -AccountEnabled $True -DisplayName "Tom" -PasswordProfile $PasswordProfile -MailNickName "tom-IT" -UserPrincipalName "$tomusername" -JobTitle "IT engineer" -Department "IT" -City "Detroit"

New-AzureADUser -AccountEnabled $True -DisplayName "Andrew" -PasswordProfile $PasswordProfile -MailNickName "Andrew-IT" -UserPrincipalName "$andrew" -JobTitle "IT engineer" -Department "IT" -City "Charlotte"

New-AzureADUser -AccountEnabled $True -DisplayName "Srinadh" -PasswordProfile $PasswordProfile -MailNickName "Srinadh-IT" -UserPrincipalName "$srinadh" -JobTitle "DBA" -Department "IT" -City "Detroit"

New-AzureADUser -AccountEnabled $True -DisplayName "Neelima" -PasswordProfile $PasswordProfile -MailNickName "Neelima-IT" -UserPrincipalName "$neelima" -JobTitle "Dev Team Lead" -Department "IT" -City "Detroit"

New-AzureADUser -AccountEnabled $True -DisplayName "Rajiv" -PasswordProfile $PasswordProfile -MailNickName "Rajiv-IT" -UserPrincipalName "$Rajiv" -JobTitle "Developer" -Department "IT" -City "Phoenix"

New-AzureADUser -AccountEnabled $True -DisplayName "Debora" -PasswordProfile $PasswordProfile -MailNickName "Debora-IT" -UserPrincipalName "$Debora" -JobTitle "HR Operations Lead" -Department "IT" -City "Phoenix"

New-AzureADUser -AccountEnabled $True -DisplayName "Neha" -PasswordProfile $PasswordProfile -MailNickName "Neha-IT" -UserPrincipalName "$Neha" -JobTitle "Dev DBA" -Department "IT" -City "Phoenix"

New-AzureADUser -AccountEnabled $True -DisplayName "Sean" -PasswordProfile $PasswordProfile -MailNickName "Sean-IT" -UserPrincipalName "$Sean" -JobTitle "Web Designer" -Department "IT" -City "Detroit"

New-AzureADUser -AccountEnabled $True -DisplayName "Doug" -PasswordProfile $PasswordProfile -MailNickName "Doug-IT" -UserPrincipalName "$Doug" -JobTitle "QA Tester" -Department "IT" -City "Remote"

New-AzureADUser -AccountEnabled $True -DisplayName "Igor" -PasswordProfile $PasswordProfile -MailNickName "Igor" -UserPrincipalName "$Igor" -JobTitle "Financial Analyst" -Department "Finance" -City "Tampa"

New-AzureADUser -AccountEnabled $True -DisplayName "Chris" -PasswordProfile $PasswordProfile -MailNickName "Chris" -UserPrincipalName "$Chris" -JobTitle "CIO" -Department "Executive Staff" -City "Charlotte"


New-AzureADUser -AccountEnabled $True -DisplayName "Karl" -PasswordProfile $PasswordProfile -MailNickName "Karl" -UserPrincipalName "$Karl" -JobTitle "COO" -Department "Executive Staff" -City "Charlotte"

New-AzureADUser -AccountEnabled $True -DisplayName "Garrett" -PasswordProfile $PasswordProfile -MailNickName "Garrett" -UserPrincipalName "$Garrett" -JobTitle "Driver" -Department "Service Management" -City "Remote"

New-AzureADUser -AccountEnabled $True -DisplayName "Sherrie" -PasswordProfile $PasswordProfile -MailNickName "Sherrie" -UserPrincipalName "$Sherrie" -JobTitle "Salesperson" -Department "Sales" -City "Remote"

New-AzureADUser -AccountEnabled $True -DisplayName "Allison" -PasswordProfile $PasswordProfile -MailNickName "Allison" -UserPrincipalName "$Allison" -JobTitle "Legal Researcher" -Department "Legal" -City "Phoenix"

New-AzureADUser -AccountEnabled $True -DisplayName "Kaitlyn" -PasswordProfile $PasswordProfile -MailNickName "Kaitlyn" -UserPrincipalName "$Kaitlyn" -JobTitle "HR Admin" -Department "Human Resources" -City "Tampa"

New-AzureADUser -AccountEnabled $True -DisplayName "Lora" -PasswordProfile $PasswordProfile -MailNickName "Lora" -UserPrincipalName "$Lora" -JobTitle "HR Manager" -Department "Human Resources" -City "Charlotte"

New-AzureADUser -AccountEnabled $True -DisplayName "Seth" -PasswordProfile $PasswordProfile -MailNickName "Seth" -UserPrincipalName "$Seth" -JobTitle "Azure Architect" -Department "IT" -City "Charlotte"

New-AzureADUser -AccountEnabled $True -DisplayName "Winifred" -PasswordProfile $PasswordProfile -MailNickName "Winifred" -UserPrincipalName "$Winifred" -JobTitle "Support Desk Manager" -Department "IT" -City "Charlotte"

New-AzureADUser -AccountEnabled $True -DisplayName "Michael" -PasswordProfile $PasswordProfile -MailNickName "Michael" -UserPrincipalName "$Michael" -JobTitle "Support Desk Admin" -Department "IT" -City "Detroit"

Start-Sleep -s 60

#Downsizing Backup storage redundancy


#$rgdataDB="DB-operations-"+$DeploymentID
#$rgdataDBServer="sql-proddata-"+$DeploymentID
#$rgdevdataDB="DB-development-"+$DeploymentID
#$rgdevdataDBServer="sql-devdata-"+$DeploymentID


#Set-AzSqlDatabase -ResourceGroupName "rg-data" -DatabaseName $rgdataDB -ServerName $rgdataDBServer -BackupStorageRedundancy Local

#Set-AzSqlDatabase -ResourceGroupName "rg-devdata" -DatabaseName $rgdevdataDB -ServerName $rgdevdataDBServer -BackupStorageRedundancy Local


$rgName1='rg-core'

$rgname2='rg-prod'

$rgname3='rg-dev'



$vnet1name='VNet-core'
$vnet2name='VNet-prod'
$vnet3name='VNet-dev'



$vnet1= Get-AzVirtualNetwork -Name $vnet1name -ResourceGroupName $rgName1


$vnet2= Get-AzVirtualNetwork -Name $vnet2name -ResourceGroupName $rgName2

$vnet3= Get-AzVirtualNetwork -Name $vnet3name -ResourceGroupName $rgName3


# Peer VNet1 to VNet2.
Add-AzVirtualNetworkPeering -Name 'LinkVnet-coreToVnet-prod' -VirtualNetwork $vnet1 -RemoteVirtualNetworkId $vnet2.Id

# Peer VNet2 to VNet1.
Add-AzVirtualNetworkPeering -Name 'LinkVnet-prodToVnet-core' -VirtualNetwork $vnet2 -RemoteVirtualNetworkId $vnet1.Id

# Peer VNet1 to VNet3.
Add-AzVirtualNetworkPeering -Name 'LinkVnet-coreToVnet-dev' -VirtualNetwork $vnet1 -RemoteVirtualNetworkId $vnet3.Id

# Peer VNet3 to VNet1.
Add-AzVirtualNetworkPeering -Name 'LinkVnet-devToVnet-core' -VirtualNetwork $vnet3 -RemoteVirtualNetworkId $vnet1.Id


