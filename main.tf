provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = var.tags
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

resource "azurerm_linux_function_app" "example" {
  name                            = var.function_app_name
  location                        = azurerm_resource_group.example.location
  resource_group_name             = azurerm_resource_group.example.name
  storage_account_name            = azurerm_storage_account.example.name
  tags                            = var.tags
}
