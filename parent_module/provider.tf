provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "Rgbackend"
    storage_account_name = "stgbackendaccount"
    container_name       = "mycontainer2"
    key                  = "mycontainer.tfstate"
  }
}