provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "example" {
  name                     = "mystorageaccount"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

data "azurerm_storage_account_key" "example" {
  storage_account_name = azurerm_storage_account.example.name
  key_name             = "key1"
}

output "storage_account_connection_string" {
  value = azurerm_storage_account.example.primary_connection_string
}

output "storage_account_access_key" {
  value = data.azurerm_storage_account_key.example.value
}
