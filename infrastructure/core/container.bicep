param resourceGroupLocation string = resourceGroup().location
param acrName string
param aksName string
param commonTags object

resource acr 'Microsoft.ContainerRegistry/registries@2022-12-01' = {
  name: acrName
  location: resourceGroupLocation
  tags: commonTags
  sku: {
    name: 'Standard'
  }
  properties: {
    adminUserEnabled: true
  }
}

resource aks 'Microsoft.ContainerService/managedClusters@2022-09-02-preview' = {
  name: aksName
  location: resourceGroupLocation
  tags: commonTags
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    agentPoolProfiles: [
      {
        count: 3
        enableAutoScaling: true
        maxCount: 5
        minCount: 3
        name: 'default'
        vmSize: 'Standard_D2_v3'
        mode: 'System'
      }
    ]
    dnsPrefix: 'string'
    networkProfile: {
      loadBalancerSku: 'standard'
      networkPlugin: 'kubenet'
    }
    workloadAutoScalerProfile: {
      keda: {
        enabled: true
      }
    }
  }
}
