resource "azurerm_kubernetes_cluster" "aks" {

  for_each = var.aks_cluster

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  kubernetes_version = each.value.kubernetes_version

  default_node_pool {
    name                = each.value.node_pool.name
    vm_size             = each.value.node_pool.vm_size

    auto_scaling_enabled = true

    min_count           = each.value.node_pool.min_count
    max_count           = each.value.node_pool.max_count

    os_disk_size_gb = 128
    type            = "VirtualMachineScaleSets"

    upgrade_settings {
      max_surge = "10%"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
    load_balancer_sku = "standard"
  }

  role_based_access_control_enabled = true

  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  tags = local.tags
}

locals {
  tags = {
    account = "devops-App"
    team    = "Billing"
  }
}