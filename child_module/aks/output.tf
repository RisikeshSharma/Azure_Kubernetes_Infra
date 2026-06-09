output "aks_cluster" {

  value = {
    for key, aks in azurerm_kubernetes_cluster.aks :

    key => {

      id   = aks.id
      name = aks.name

      kube_config = aks.kube_config_raw
    }
  }

  sensitive = true
}