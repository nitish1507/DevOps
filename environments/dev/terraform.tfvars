rgn = {
  rg1 = {
    name     = "git-rg1"
    location = "Central India"
  }

  rg2 = {
    name     = "git-rg2"
    location = "Central India"
  }
}
vnet = {
  vnet1 = {
    name                = "git-vnet1"
    address_space       = ["10.0.0.0/16"]
    location            = "Central India"
    resource_group_name = "git-rg1"
  }
}
subnet = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "git-rg1"
    virtual_network_name = "git-vnet1"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "git-rg1"
    virtual_network_name = "git-vnet1"
    address_prefixes     = ["10.0.2.0/24"]
  }

  subnet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "git-rg1"
    virtual_network_name = "git-vnet1"
    address_prefixes     = ["10.0.4.0/26"]
  }
}


machine = {
  vm1 = {
    vm_name               = "frontend-vm"
    location              = "Central India"
    resource_group_name   = "git-rg1"
    size                  = "Standard_D2ads_v5"
    admin_username        = "azureuser"
    admin_password        = "DevOps@12345"
    subnet_name           = "frontend-subnet"
    virtual_network_name  = "git-vnet1"
    nic_name              = "git-nic1"
    ip_configuration_name = "ipconfig1"
    image_publisher       = "Canonical"
    image_offer           = "UbuntuServer"
    image_sku             = "18.04-LTS"
  }
  vm2 = {
    vm_name               = "backend-vm"
    location              = "Central India"
    resource_group_name   = "git-rg1"
    size                  = "Standard_D2ads_v5"
    admin_username        = "azureuser"
    admin_password        = "DevOps@12345"
    subnet_name           = "backend-subnet"
    virtual_network_name  = "git-vnet1"
    nic_name              = "git-nic2"
    ip_configuration_name = "ipconfig2"
    image_publisher       = "Canonical"
    image_offer           = "UbuntuServer"
    image_sku             = "18.04-LTS"
  }

}

nsg = {

  nsg1 = {
    name                = "frontend-nsg"
    location            = "Central India"
    resource_group_name = "git-rg1"
  }

  nsg2 = {
    name                = "backend-nsg"
    location            = "Central India"
    resource_group_name = "git-rg1"
  }


}

nsg_rules = {

  ssh = {

    name      = "AllowSSH"
    priority  = 100
    direction = "Inbound"
    access    = "Allow"
    protocol  = "Tcp"

    source_port_range      = "*"
    destination_port_range = "22"

    source_address_prefix      = "*"
    destination_address_prefix = "*"

    resource_group_name = "git-rg1"

    nsg_key = "nsg1"

  }

}
bastion = {
  bastion1 = {
    name                 = "git-bastion"
    public_ip_name       = "git-bastion-pip"
    location             = "Central India"
    resource_group_name  = "git-rg1"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "git-vnet1"
  }

}

keyvault = {

  kv1 = {
    name                = "gitkeyvault2026nitish"
    location            = "Central India"
    resource_group_name = "git-rg1"
  }

}


loadbalancer = {

  lb1 = {
    name                  = "git-lb"
    public_ip_name        = "git-lb-pip"
    location              = "Central India"
    resource_group_name   = "git-rg1"
    nic_name              = "git-nic1"
    ip_configuration_name = "ipconfig1"
  }

}
