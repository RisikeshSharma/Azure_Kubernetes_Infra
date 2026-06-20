variable "aks_cluster" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
    kubernetes_version   = number

    node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })

  }))

}
