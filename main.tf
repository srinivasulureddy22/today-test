terraform {
  required_version = ">=1.9.0"
}

provider "azurerm" {
  features {}
  use_cli = true   # Reuse Azure CLI login from Azure DevOps pipeline
}

resource "azurerm_resource_group" "rg" {
  name     = "tf-demo-rg"
  location = "East US"
}

resource "azurerm_storage_account" "sa" {
  name                     = "tfdemostorageacct123"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
