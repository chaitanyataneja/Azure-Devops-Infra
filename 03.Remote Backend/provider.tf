terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.73.0"
    }

  }
    backend "azurerm" {
        storage_account_name = "mystorageaccount8732"
        resource_group_name = "rg_bhakua"
        container_name = "container1"
        key = "test.tfstate"
      
    }

}
provider "azurerm" {
  features {}

}