resource "azurerm_virtual_network" "VMVNET" {
    for_each=var.vmlinuxvnet_name
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = ["10.0.0.0/16"]  
  dns_servers         = ["10.0.0.4"]
}
