variable "resource_group" {
  description = "resource_group_details"
  type = map(object({
    name     = string
    location = string
  }))
}
variable "aks_cluster" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
    kubernetes_version = number

    node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })

  }))

}
variable "acr" {

  type = map(object({

    name                = string
    resource_group_name = string
    location            = string

    sku           = string
    admin_enabled = bool

  }))

}
