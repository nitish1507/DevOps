provider "azurerm" {
  features {}

  subscription_id = "0b3701d7-b87c-4c64-ba31-5ff3f5843d15"
  tenant_id       = "4eda09ca-f09f-4db9-86ae-c6b2e0ffc6ce"
  client_id       = "40b8856d-bd00-4955-8c7a-5213539c12bd"

  use_oidc = true
}
