output "resource_group" {
  value = module.resource_group.resource_group
}

output "aks_cluster" {
  value = module.aks.aks_cluster

  sensitive = true
}

output "acr" {

  value = module.acr.acr

}