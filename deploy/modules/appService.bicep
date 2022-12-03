param location string

param appServicePlanConfiguration object
param appServiceConfiguration object

param tagValues object

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanConfiguration.appServicePlanName
  location: location
  tags: tagValues
  sku: {
    tier: appServicePlanConfiguration.tier
    name: appServicePlanConfiguration.name
  }
}

resource appService 'Microsoft.Web/sites@2022-03-01' = {
  name: appServiceConfiguration.appServiceName
  location: location
  dependsOn: [
    appServicePlan
  ]
  tags: tagValues
  properties: {
    httpsOnly: appServiceConfiguration.httpsOnly
  }
}
