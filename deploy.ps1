# Variables that need to be set

# The subscriptionId
$subscriptionId = ''
# Root path to script, template and parameters.  All have to be in the same folder.
$rootPath = 'C:\Users\makolo\Documents\GitHub\azure-sql-server-templates' # Replace with $PSScriptRoot if you want to run it as a script.
# Name of the resource group
$resourceGroupName = 'azure-sql-rg'
# Resource Group Location 
$resourceGroupLocation = 'East US 2' # Run <Get-AzureLocation> to find out azure locations; EXAMPLE: 'East US 2'
# Name of the deployment
$deploymentName = 'StructuredQueryLanguage'

Login-AzureRmAccount

Get-AzureSubscription

Select-AzureSubscription -SubscriptionId $subscriptionId

# Create the new Azure Resource Group
New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation

# Run the below to test the ARM template
Test-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "$rootPath\azuredeploy.json" -TemplateParameterFile "$rootPath\azuredeploy.parameters.json"

# Use parameter file
New-AzureRmResourceGroupDeployment -Mode Incremental -Name $deploymentName -ResourceGroupName $resourceGroupName -TemplateFile "$rootPath\azuredeploy.json" -TemplateParameterFile "$rootPath\azuredeploy.parameters.json"

# Input parameters manually via CLI
New-AzureRmResourceGroupDeployment -Mode Incremental -Name $deploymentName -ResourceGroupName $resourceGroupName -TemplateFile "$rootPath\azuredeploy.json"

# Delete the deployment
Remove-AzureRmResourceGroup $resourceGroupName