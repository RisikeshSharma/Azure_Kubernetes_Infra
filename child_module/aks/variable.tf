variable "aks_cluster" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
    kubernetes_version  = string

    node_pool = object({
      name       = string
      vm_size    = string

      min_count  = number
      max_count  = number
    })

  }))
}