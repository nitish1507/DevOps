variable "loadbalancer" {}



resource "azurerm_public_ip" "lb_pip" {
  for_each = var.loadbalancer
  name                = each.value.public_ip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"
}
resource "azurerm_lb" "lb" {
  for_each = var.loadbalancer
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {

    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_pip[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {

  for_each = var.loadbalancer

  loadbalancer_id = azurerm_lb.lb[each.key].id

  name = "backendpool"
}
resource "azurerm_lb_probe" "probe" {

  for_each = var.loadbalancer

  loadbalancer_id = azurerm_lb.lb[each.key].id

  name = "http-probe"

  protocol = "Tcp"

  port = 80
}
resource "azurerm_lb_rule" "rule" {

  for_each = var.loadbalancer

  loadbalancer_id = azurerm_lb.lb[each.key].id

  name = "http-rule"

  protocol = "Tcp"

  frontend_port = 80

  backend_port = 80

  frontend_ip_configuration_name = "PublicIPAddress"

  backend_address_pool_ids = [
    azurerm_lb_backend_address_pool.backend_pool[each.key].id
  ]

  probe_id = azurerm_lb_probe.probe[each.key].id
}

