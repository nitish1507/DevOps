module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgn    = var.rgn
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_virtual_network"
  vnet       = var.vnet
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/azurerm_subnet"
  subnet     = var.subnet
}

module "virtual_machine" {
  depends_on = [module.subnet]
  source     = "../../modules/azurerm_virtual_machine"
  machine    = var.machine
}

module "network_security_group" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_network_security_group"

  nsg       = var.nsg
  nsg_rules = var.nsg_rules
}

module "bastion" {
  depends_on = [module.resource_group, module.subnet]
  source     = "../../modules/azurerm_bastion"
  bastion    = var.bastion
}

module "keyvault" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_key_vault"
  keyvault   = var.keyvault
}

module "loadbalancer" {
  depends_on   = [module.resource_group]
  source       = "../../modules/azurerm_load_balancer"
  loadbalancer = var.loadbalancer
}
