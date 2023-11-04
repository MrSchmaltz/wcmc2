resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = var.tags
}

resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "example" {
  name                = var.function_app_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  app_service_plan_id = azurerm_app_service_plan.example.id

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "node"
  }

  storage_account_name       = "storage_account_name"
  storage_account_access_key = "storage_account_access_key"
}
