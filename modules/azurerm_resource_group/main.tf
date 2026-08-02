variable "rgn" {}

resource "azurerm_resource_group" "rg" {
for_each = var.rgn
  name     = each.value.name
  location = each.value.location
}
