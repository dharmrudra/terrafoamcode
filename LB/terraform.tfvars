#  lbbasic = {
#  name                = "PublicIPForLB"
#   location            = "eastus"
#   resource_group_name = "munna"
#   name1                   = "backendnginx01"
#   backend_address_pool_id = azurerm_lb_backend_address_pool.BackEndAddressPool.id
#   virtual_network_id      = data.azurerm_virtual_network.lb-demo.id
#   ip_address              = data.azurerm_virtual_machine.nginxvm01.private_ip_address
#  }