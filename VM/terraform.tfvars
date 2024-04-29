linux_vms = {
   VM1 = {
  pip_name            = "rohanpip"
  resource_group_name = "munna"
  location            = "eastus"
  nic_name            = "powernic1"
  vm_name             = "vmdoli1"
  vm_size             = "Standard_F2"
  vm_username         = "RUDRA1"
  vm_password         = "Deepu1122@"
  subnet_name          = "deepu1"
    virtual_network_name = "geeta_vnet"
  }
  VM2 = {
    pip_name            = "rohanpip2"
    resource_group_name = "munna"
    location            = "eastus"
    nic_name            = "powernic2"
    vm_name             = "vmdoli2"
    vm_size             = "Standard_F2"
    vm_username         = "RUDRA1"
    vm_password         = "Deepu1122@"
    subnet_name          = "deepu2"
    virtual_network_name = "geeta_vnet"
  }
}