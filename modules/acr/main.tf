resource "azurerm_container_registry" "acr" {
  # Clean up name to be alphanumeric
  name                = replace(var.name, "-", "")
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = false
}

output "id" {
  value = azurerm_container_registry.acr.id
}
