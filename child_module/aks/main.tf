resource "azurerm_kubernetes_cluster" "aks" {

  for_each = var.aks_cluster

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = each.value.node_pool.name
    node_count = each.value.node_pool.node_count
    vm_size    = each.value.node_pool.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "cilium"
  }

  tags = local.tags
}

locals {
  tags = {
    account = "devops-App"
    team    = "Billing"
  }
}

