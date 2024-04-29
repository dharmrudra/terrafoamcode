resource "azurerm_subnet" "AZSUBNET" {
  for_each = var.vmbastion
  name                 = each.value.bastion-subnetname
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_public_ip" "PIPBASTION" {
  for_each = var.vmbastion
  name                = each.value.pip-bastion-name 
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}

resource "azurerm_bastion_host" "azbastionhost" {
for_each = var.vmbastion
  name                = each.value.name 
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.AZSUBNET[each.key].id
    public_ip_address_id = azurerm_public_ip.PIPBASTION[each.key].id
  }
}