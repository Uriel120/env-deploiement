
@description('Location for all resources.')
param location string = 'eastus'

@description('Name of the Storage Account.')
@minLength(3)
@maxLength(24)
param storageAccountName string 

@description('SKU Name for the Storage Account.')
@allowed([
  'Standard_LRS'
  'Standard_GRS'
])
param skuName string


@description('Kind of the Storage Account.')
param kind string = 'StorageV2'

var properties = {
  minimumTlsVersion: 'TLS1_2'
  allowBlobPublicAccess: false
  supportsHttpsTrafficOnly: true
}


resource ressourcegrp 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: skuName
  }
  kind: kind
  properties: properties
}

output storageAccountId string = ressourcegrp.id
output storageAccountName string = ressourcegrp.name
output storageAccountLocation string = ressourcegrp.location
