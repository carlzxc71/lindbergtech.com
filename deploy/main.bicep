param location string

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


module appServiceDeployment 'modules/appService.bicep' = {
  name: 'appServiceDeployment'
  params: {
    location: location
    appServiceConfiguration: appServiceConfiguration
    appServicePlanConfiguration: appServicePlanConfiguration
    tagValues: tagValues
  }
}
