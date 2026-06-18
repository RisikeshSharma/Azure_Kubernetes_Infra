resource_group = {
  rg = {
    name     = "aks-RG"
    location = "South India"

  }
}
aks_cluster = {

  dev = {

    name                = "dev-aks-cluster"
    location            = "centralindia"
    resource_group_name = "aks-RG"

    dns_prefix = "devaks"

    node_pool = {

      name       = "system"
      node_count = 2
      vm_size    = "Standard_D2s_v3"

    }

  }

}

acr = {

  dev = {

    name = "rishidevacr2026"

    resource_group_name = "aks-RG"

    location = "centralindia"

    sku = "Standard"

    admin_enabled = false

  }

}
