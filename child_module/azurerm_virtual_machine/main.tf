variable "machine" {}
data "azurerm_subnet" "subnet" {
  for_each            = var.machine
    name                = each.value.subnet_name
    resource_group_name = each.value.resource_group_name
    virtual_network_name = each.value.virtual_network_name
}
data "azurerm_public_ip" "pip" {
  for_each            = var.machine
    name                = each.value.pip_name
    resource_group_name = each.value.resource_group_name
}
resource "azurerm_network_interface" "nic" {
  for_each            = var.machine
    name                = each.value.nic_name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name
    ip_configuration {
      name                          = each.value.ip_configuration_name
      subnet_id                     = data.azurerm_subnet.subnet[each.key].id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
    }
}
resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.machine
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size

  admin_username = each.value.admin_username
  admin_password = each.value.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = "latest"
  }
}