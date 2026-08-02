
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
}
resource "azurerm_resource_group" "navi" {
  name     = "navi-rg"
  location = "West Europe"
}

resource "azurerm_resource_group" "humana" {
  name     = "humana-rg"
  location = "West Europe"
}

