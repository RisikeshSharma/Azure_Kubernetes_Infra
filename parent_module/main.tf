module "resource_group" {
  source         = "../child_module/resource_group"
  resource_group = var.resource_group

}

module "aks" {

  source = "../child_module/aks"

  aks_cluster = var.aks_cluster
  depends_on = [ module.resource_group ]

}

module "acr" {

  source = "../child_module/acr"

  acr = var.acr
  depends_on = [ module.resource_group ]

}