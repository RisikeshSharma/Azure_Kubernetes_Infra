resource "azurerm_resource_group" "parent" {
  name     = var.resource_group_name
  location = var.location
}

module "acr" {
  source   = "./modules/acr"
  for_each = var.registries

  name                = "acr${each.key}${replace(azurerm_resource_group.parent.name, "-", "")}"
  resource_group_name = azurerm_resource_group.parent.name
  location            = azurerm_resource_group.parent.location
  sku                 = each.value.sku
}

module "aks" {
  source   = "../modules/aks"
  for_each = var.clusters

  cluster_name        = "aks-${each.key}"
  location            = azurerm_resource_group.parent.location
  resource_group_name = azurerm_resource_group.parent.name
  dns_prefix          = "${each.value.dns_prefix}-${each.key}"
  node_count          = each.value.node_count
  vm_size             = each.value.vm_size

  # Dynamically link to the corresponding ACR if keys match, 
  # otherwise fall back to the first available ACR
  acr_id = contains(keys(module.acr), each.key) ? module.acr[each.key].id : values(module.acr)[0].id
}
