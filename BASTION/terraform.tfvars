vmbastion = {
bastionname  ={ 
 name = "AZ_HOST"
  location            = "eastus"
  resource_group_name = "dharm1"

pip-bastion-name                = "PIP_BASTION"
  sku                 = "Standard"
  bastion-subnetname                 = "AzureBastionSubnet"
  virtual_network_name = "seeta_vnet"
  address_prefixes     = ["10.0.1.0/24"]
  allocation_method   = "Static"
}
}