#&nbsp;since these variables are re-used - a locals block makes this more maintainable
variable "network_name" {
    description = "network name to use"
    default = "demo-vnet"
}

locals {
  backend_address_pool_name      = "${var.network_name}-beap"
  frontend_port_name             = "${var.network_name}-feport"
  frontend_ip_configuration_name = "${var.network_name}-feip"
  http_setting_name              = "${var.network_name}-be-htst"
  listener_name                  = "${var.network_name}-httplstn"
  request_routing_rule_name      = "${var.network_name}-rqrt"
  redirect_configuration_name    = "${var.network_name}-rdrcfg"
}

resource "azurerm_application_gateway" "main" {
  name                = "test-appgw-2"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  sku {
    name     = "Standard_Small"
    tier     = "Standard"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "gateway-ip-config"
    subnet_id = azurerm_subnet.gateway.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.main.id
  }

  probe {
    name                = "probe"
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
    pick_host_name_from_backend_http_settings = true
  }

  backend_address_pool {
    name = local.backend_address_pool_name
    fqdns = [ azurerm_linux_web_app.primary.default_hostname, azurerm_linux_web_app.secondary.default_hostname]
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
    pick_host_name_from_backend_address = true
    probe_name = "probe"
    
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
}
