output "resource_group_name" {
  value = azurerm_resource_group.parent.name
}

output "aks_cluster_names" {
  value = { for k, v in module.aks : k => v.cluster_name }
}

output "acr_login_servers" {
  value = { for k, v in module.acr : k => v.login_server }
}
