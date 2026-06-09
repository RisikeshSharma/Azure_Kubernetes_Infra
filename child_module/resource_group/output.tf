output "resource_group" {
  value = {
    for key, rg in azurerm_resource_group.aks-rg :
    key => {
      id       = rg.id
      name     = rg.name
      location = rg.location
    }
  }
}