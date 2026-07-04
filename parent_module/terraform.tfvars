resource_group = {
  rg = {
    name     = "aks-RG"
    location = "East US"

  }
}
aks_cluster = {
  dev = {
    name                = "dev-aks-cluster"
    location            = "Central US"
    resource_group_name = "aks-RG"
    dns_prefix          = "devaks"

    kubernetes_version  = "1.36"

    node_pool = {
      name      = "system"
      vm_size   = "Standard_D2s_v3"
      min_count = 1
      max_count = 3
    }
  }
}


acr = {

  dev = {

    name = "rishidevacr2026"

    resource_group_name = "aks-RG"

    location = "East US"

    sku = "Standard"

    admin_enabled = false

  }

}
