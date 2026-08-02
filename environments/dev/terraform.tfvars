rgn = {
  rg1 = {
    name     = "nir-rg1"
    location = "japaneast"
  }
}
vnet = {
  vnet1 = {
    name                = "nir-vnet1"
    address_space       = ["10.0.0.0/16"]
    location            = "japaneast"
    resource_group_name = "nir-rg1"
  }
}
subnet = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "nir-rg1"
    virtual_network_name = "nir-vnet1"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "nir-rg1"
    virtual_network_name = "nir-vnet1"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    name                 = "database-subnet"
    resource_group_name  = "nir-rg1"
    virtual_network_name = "nir-vnet1"
    address_prefixes     = ["10.0.3.0/24"]
  }
  subnet4 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "nir-rg1"
    virtual_network_name = "nir-vnet1"
    address_prefixes     = ["10.0.4.0/26"]
  }
  subnet5 = {
    name                 = "test-subnet"
    resource_group_name  = "nir-rg1"
    virtual_network_name = "nir-vnet1"
    address_prefixes     = ["10.0.4.0/26"]
  }
}
pip = {
  pip1 = {
    name                = "nir-pip1"
    location            = "japaneast"
    resource_group_name = "nir-rg1"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip2 = {
    name                = "nir-pip2"
    location            = "japaneast"
    resource_group_name = "nir-rg1"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip3 = {
    name                = "nir-pip3"
    location            = "japaneast"
    resource_group_name = "nir-rg1"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}
machine = {
  vm1 = {
    vm_name               = "frontend-vm"
    location              = "japaneast"
    resource_group_name   = "nir-rg1"
    size                  = "Standard_D2s_v3"
    admin_username        = "azureuser"
    admin_password        = "DevOps@12345"
    subnet_name           = "frontend-subnet"
    virtual_network_name  = "nir-vnet1"
    pip_name              = "nir-pip1"
    nic_name              = "nir-nic1"
    ip_configuration_name = "ipconfig1"
    image_publisher       = "Canonical"
    image_offer           = "UbuntuServer"
    image_sku             = "18.04-LTS"
  }
  vm2 = {
    vm_name               = "backend-vm"
    location              = "japaneast"
    resource_group_name   = "nir-rg1"
    size                  = "Standard_D2s_v3"
    admin_username        = "azureuser"
    admin_password        = "DevOps@12345"
    subnet_name           = "backend-subnet"
    virtual_network_name  = "nir-vnet1"
    pip_name              = "nir-pip2"
    nic_name              = "nir-nic2"
    ip_configuration_name = "ipconfig2"
    image_publisher       = "Canonical"
    image_offer           = "UbuntuServer"
    image_sku             = "18.04-LTS"
  }
  vm3 = {
    vm_name               = "database-vm"
    location              = "japaneast"
    resource_group_name   = "nir-rg1"
    size                  = "Standard_D2s_v3"
    admin_username        = "azureuser"
    admin_password        = "DevOps@12345"
    subnet_name           = "database-subnet"
    virtual_network_name  = "nir-vnet1"
    pip_name              = "nir-pip3"
    nic_name              = "nir-nic3"
    ip_configuration_name = "ipconfig3"
    image_publisher       = "Canonical"
    image_offer           = "UbuntuServer"
    image_sku             = "18.04-LTS"
  }
}

nsg = {

  nsg1 = {
    name                = "frontend-nsg"
    location            = "japaneast"
    resource_group_name = "nir-rg1"
  }

  nsg2 = {
    name                = "backend-nsg"
    location            = "japaneast"
    resource_group_name = "nir-rg1"
  }

  nsg3 = {
    name                = "database-nsg"
    location            = "japaneast"
    resource_group_name = "nir-rg1"
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

    resource_group_name = "nir-rg1"

    nsg_key = "nsg1"

  }

}
bastion = {
  bastion1 = {
    name                 = "nir-bastion"
    public_ip_name       = "nir-bastion-pip"
    location             = "japaneast"
    resource_group_name  = "nir-rg1"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "nir-vnet1"
  }

}

keyvault = {

  kv1 = {
    name                = "nirkeyvault2026nitish"
    location            = "japaneast"
    resource_group_name = "nir-rg1"
  }

}


loadbalancer = {

  lb1 = {
    name                  = "nir-lb"
    public_ip_name        = "nir-lb-pip"
    location              = "japaneast"
    resource_group_name   = "nir-rg1"
    nic_name              = "nir-nic1"
    ip_configuration_name = "ipconfig1"
  }

}