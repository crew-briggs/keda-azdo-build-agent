targetScope = 'subscription'

param resourcePrefix string

var resourceGroupName = '${resourcePrefix}-rg'
param resourceGroupLocation string = deployment().location

var acrName = '${resourcePrefix}-acr'
var aksName = '${resourcePrefix}-aks'


param commonTags object = {
  project: 'keda-azdo-build-agent'

}

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
  tags: commonTags
}

module container 'container.bicep' = {
  scope: rg
  name: '${resourcePrefix}-container-deploy'
  params: {
    resourceGroupLocation: resourceGroupLocation
    acrName: acrName
    commonTags: commonTags
    aksName: aksName
  }
}

