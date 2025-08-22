terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.8.0"
    }
  }
  required_version = ">=1.3.7"
}

provider "azurerm" {
  features {}
  subscription_id = "b1f922a0-3de4-4c1f-bfe4-26c679ab2c65"
}


resource "azurerm_resource_group" "example_rg" {
  name     = "storagerg"
  location = "UK South"
}

resource "azurerm_storage_account" "ex_storage" {
  name                     = "cloudtechstorage"
  resource_group_name      = azurerm_resource_group.example_rg.name
  location                 = azurerm_resource_group.example_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
