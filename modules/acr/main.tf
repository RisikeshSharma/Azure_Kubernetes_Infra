terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

resource "azurerm_container_registry" "acr" {
  name                = replace(var.name, "-", "")
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = false
}

output "id" {
  value = azurerm_container_registry.acr.id
}

output "login_server" {
  value = azurerm_container_registry.acr.login_server
}
