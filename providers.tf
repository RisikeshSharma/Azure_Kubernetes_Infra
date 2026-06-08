terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
  backend "azurerm" {
    # Backend details provided by user
    resource_group_name  = "Vaishno-RG"
    storage_account_name = "vaishnostg1219"
    container_name       = "vaishnocontainer"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}