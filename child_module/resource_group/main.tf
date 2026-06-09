resource "azurerm_resource_group" "aks-rg"{
  for_each = var.resource_group
name = each.value.name
location = each.value.location
tags = local.tags
}

locals  {
  tags = {
    account = "devops-App"
    team = "Billing"
  }
}