resource "azurerm_resource_group" "main" {
  name     = "rg-${var.workload}-${var.environment}-${var.location}"
  location = var.location
}

resource "azurerm_service_plan" "main" {
  name                = "asp-${var.workload}-${var.environment}-${var.location}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "primary" {
  name                = "app-${var.workload}-${var.environment}-${var.location}-primary"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_service_plan.main.location
  service_plan_id     = azurerm_service_plan.main.id


  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.main.instrumentation_key
  }
  site_config {
    application_stack {
      python_version = 3.8
    }
  }
}

resource "azurerm_linux_web_app" "secondary" {
  name                = "app-${var.workload}-${var.environment}-${var.location}-secondary"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_service_plan.main.location
  service_plan_id     = azurerm_service_plan.main.id


  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.main.instrumentation_key
  }
  site_config {
    application_stack {
      python_version = 3.8
    }
  }
}

resource "azurerm_application_insights" "main" {
  name                = "appi-${var.workload}-${var.environment}-${var.location}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  application_type    = "web"
}