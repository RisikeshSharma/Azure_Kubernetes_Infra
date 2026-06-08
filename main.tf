resource "azurerm_resource_group" "parent" {
  name     = var.resource_group_name
  location = var.location
}

module "acr" {
  source   = "./modules/acr"
  for_each = var.registries

  name                = "acr${each.key}${azurerm_resource_group.parent.name}"
  resource_group_name = azurerm_resource_group.parent.name
  location            = azurerm_resource_group.parent.location
  sku                 = each.value.sku
}

module "aks" {
  source   = "./modules/aks"
  for_each = var.clusters

  cluster_name        = "aks-${each.key}"
  location            = azurerm_resource_group.parent.location
  resource_group_name = azurerm_resource_group.parent.name
  dns_prefix          = each.value.dns_prefix
  node_count          = each.value.node_count
  vm_size             = each.value.vm_size

  # Link to the first ACR created for simplicity
  acr_id = module.acr["main"].id
}
