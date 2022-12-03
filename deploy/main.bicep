targetScope = 'subscription'

param location string
param resourceGroupName string

param appServicePlanConfiguration object
param appServiceConfiguration object

param env string
param currentDate string = utcNow('yyyy-MM-dd')
param product string 

var tagValues = {
  createdBy: 'lindbergtech-cicd'
  environment: env
  deploymentDate: currentDate
  product: product
}

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

module appServiceDeployment 'modules/appService.bicep' = {
  scope: resourceGroup
  name: 'appServiceDeployment'
  params: {
    location: location
    appServiceConfiguration: appServiceConfiguration
    appServicePlanConfiguration: appServicePlanConfiguration
    tagValues: tagValues
  }
}
