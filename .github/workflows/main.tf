provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "test" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "test" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.test.name
  location                 = azurerm_resource_group.test.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
