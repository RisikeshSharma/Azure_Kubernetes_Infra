module "resource_groups" {
  source   = "./modules/resource_group"
  for_each = var.resource_groups

  name     = each.key
  location = each.value.location
  tags     = each.value.tags
}

module "registries" {
  source   = "./modules/acr"
  for_each = var.registries

  name                = each.key
  resource_group_name = module.resource_groups[each.value.resource_group_key].name
  location            = module.resource_groups[each.value.resource_group_key].location
  sku                 = each.value.sku
  admin_enabled       = each.value.admin_enabled
  tags                = each.value.tags
}

module "clusters" {
  source   = "./modules/aks"
  for_each = var.clusters

  name                = each.key
  resource_group_name = module.resource_groups[each.value.resource_group_key].name
  location            = module.resource_groups[each.value.resource_group_key].location
  dns_prefix          = each.value.dns_prefix
  kubernetes_version  = each.value.kubernetes_version

  default_node_pool = {
    name       = "default"
    node_count = each.value.node_count
    vm_size    = each.value.vm_size
    tags       = each.value.tags
  }

  acr_id = each.value.acr_key != null ? module.registries[each.value.acr_key].id : null
  tags   = each.value.tags
}
