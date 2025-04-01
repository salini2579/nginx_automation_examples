resource "azurerm_resource_group" "rg" {
  name     = "tfstate"
  location = "southeastasia"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "tfstate-storage-account"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
#  allow_blob_public_access = true

}

resource "azurerm_storage_container" "storage_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "blob"
}