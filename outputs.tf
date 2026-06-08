output "resource_group_names" {
  value = { for k, v in module.resource_groups : k => v.name }
}

output "acr_login_servers" {
  value = { for k, v in module.registries : k => v.login_server }
}

output "aks_cluster_names" {
  value = { for k, v in module.clusters : k => v.name }
}
