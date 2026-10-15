terraform {
  required_version = ">= 1.8.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # Remote State Backend (Azure Blob Storage)
  # Uncomment and configure with pre-provisioned state storage details:
  # backend "azurerm" {
  #   resource_group_name  = "rg-terraform-state"
  #   storage_account_name = "stwmmhtfstate"
  #   container_name       = "tfstate"
  #   key                  = "wmmh.prod.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
}
