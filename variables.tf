variable "resource_groups" {
  description = "A map of resource groups to create"
  type = map(object({
    location = optional(string, "westeurope")
    tags     = optional(map(string), {})
  }))
}

variable "registries" {
  description = "A map of container registries to create"
  type = map(object({
    resource_group_key = string
    sku                = optional(string, "Standard")
    admin_enabled      = optional(bool, false)
    tags               = optional(map(string), {})
  }))
}

variable "clusters" {
  description = "A map of AKS clusters to create"
  type = map(object({
    resource_group_key = string
    dns_prefix         = string
    kubernetes_version = optional(string)
    node_count         = optional(number, 1)
    vm_size            = optional(string, "Standard_DS2_v2")
    acr_key            = optional(string) # Key from the registries map
    tags               = optional(map(string), {})
  }))
}
