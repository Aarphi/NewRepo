param location string = resourceGroup().location
param sqldbname string
param storageaccname string
param sqlservername string
param vnetname string

module resource 'resources.bicep' = {

  name:'resource'
  params:{
    location:location
    sqldbname:sqldbname
    storageaccname:storageaccname
    sqlservername:sqlservername
    vnetname:vnetname
  }
}
