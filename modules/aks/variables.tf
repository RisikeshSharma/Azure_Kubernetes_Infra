variable "name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix specified when creating the managed cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Version of Kubernetes specified when creating the AKS cluster"
  type        = string
  default     = null
}

variable "default_node_pool" {
  description = "Configuration for the default node pool"
  type = object({
    name       = string
    node_count = number
    vm_size    = string
    tags       = optional(map(string), {})
  })
}

variable "identity_type" {
  description = "The type of identity used for the managed cluster"
  type        = string
  default     = "SystemAssigned"
}

variable "acr_id" {
  description = "The ID of the Azure Container Registry to allow the AKS cluster to pull from"
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
