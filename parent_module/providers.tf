terraform {

  required_version = ">= 1.8.0"

  required_providers {

    azurerm = {

      source  = "hashicorp/azurerm"
      version = "~>4.0"

    }

  }
  backend "azurerm" {
    resource_group_name  = "Vaishno-RG"
    storage_account_name = "vaishnostg1218"
    container_name       = "vaishnocontainer"
    key                  = "terraform.tfstate"
  }

}
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
  use_cli         = false
  subscription_id = "ef92bd07-6174-4c69-bd96-a45068ac3d8c"
}
