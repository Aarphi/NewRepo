param location string 
param sqldbname string
param storageaccname string
param sqlservername string
param vnetname string

resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: sqlservername
  location:location
  properties:{

    administratorLogin:'sqladmin'
    administratorLoginPassword:'Password@123'
  }
}

resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: sqlServer
  name: sqldbname
  location: location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'S1'
    maxSizeBytes: '2147483648'
    requestedServiceObjectiveName: 'S1'
  }
}

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageaccname
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}


resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: vnetname
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'Subnet-1'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'Subnet-2'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

