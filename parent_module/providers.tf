terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.76.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Vaishno-RG"
    storage_account_name = "vaishnostg1219"
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
   use_cli = false
  subscription_id = "fc500898-8f61-4a51-b6d7-e98f57afda6d"
}