resource "azurerm_public_ip" "PublicIPForLB" {
    
  name                ="ipforlb"
  location            = "eastus"
  resource_group_name = "munna"
  allocation_method   = "Static"
  sku                 = "Standard"
}
resource "azurerm_lb" "lb234" {
  name                = "TestLoadBalancer"
  location            = "eastus"
  resource_group_name = "munna"
  sku = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.PublicIPForLB.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend234" {
  loadbalancer_id = azurerm_lb.lb234.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_backend_address_pool_address" "backendnginx01" {
  name                    = "backendnginx01"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend234.id
  virtual_network_id      = data.azurerm_virtual_network.VMVNET.id
  ip_address              = "10.0.2.4"
}

resource "azurerm_lb_backend_address_pool_address" "backendnginx02" {
  name                    = "backendnginx02"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend234.id
  virtual_network_id      = data.azurerm_virtual_network.VMVNET.id
  ip_address              = "10.0.3.4"
}
  resource "azurerm_lb_probe" "nginxprobe" {
  loadbalancer_id = azurerm_lb.lb234.id
  name            = "http-port"
  port            = 80
}
resource "azurerm_lb_rule" "example" {
  loadbalancer_id                = azurerm_lb.lb234.id
  name                           = "NginxRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend234.id]
  probe_id                       = azurerm_lb_probe.nginxprobe.id
}