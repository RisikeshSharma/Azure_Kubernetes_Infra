variable "resource_group_name" {
  type        = string
  description = "Name of the parent Resource Group"
  default     = "rg-aks-infra"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "East US"
}

variable "clusters" {
  type = map(object({
    dns_prefix = string
    node_count = number
    vm_size    = string
  }))
  description = "Map of AKS clusters to provision"
  default = {
    "dev" = {
      dns_prefix = "dev-aks"
      node_count = 1
      vm_size    = "Standard_DS2_v2"
    }
  }
}

variable "registries" {
  type = map(object({
    sku = string
  }))
  description = "Map of ACRs to provision"
  default = {
    "main" = {
      sku = "Standard"
    }
  }
}
