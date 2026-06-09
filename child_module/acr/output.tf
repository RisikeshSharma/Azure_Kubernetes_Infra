output "acr" {

  value = {

    for key, acr in azurerm_container_registry.acr :

    key => {

      id           = acr.id
      name         = acr.name
      login_server = acr.login_server

    }

  }

}