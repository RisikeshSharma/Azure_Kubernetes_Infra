terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    # Values should be provided via -backend-config or environment variables in CI/CD
    # resource_group_name  = "tfstate-rg"
    # storage_account_name = "tfstateaccount"
    # container_name       = "tfstate"
    # key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
