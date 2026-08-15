provider "azurerm" {
  features {}


  use_oidc = true
}
terraform {
  backend "azurerm" {
    resource_group_name  = "rg_ball"
    storage_account_name = "ballstg"
    container_name       = "mycontainer2"
    key                  = "mycontainer.tfstate"
  }
}
