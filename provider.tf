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

data "azurerm_storage_account" "example" {
  name                     = azurerm_storage_account.example.name
  resource_group_name      = azurerm_storage_account.example.resource_group_name
}

output "storage_account_connection_string" {
  value = data.azurerm_storage_account.example.primary_connection_string
  sensitive = true
}

output "storage_account_access_key" {
  value = split(";", data.azurerm_storage_account.example.primary_connection_string)[2]
}
