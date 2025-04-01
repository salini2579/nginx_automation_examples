resource "azurerm_resource_group" "rg" {
  name     = format("%s-rg", var.project_prefix)
  location = var.azure_region
}

resource "azurerm_storage_account" "storage_account" {
  name                     = format("%snicnap", var.project_prefix)
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
#  allow_blob_public_access = true

}

resource "azurerm_storage_container" "storage_container" {
  name                  = format("%s-container", var.project_prefix)
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "blob"
}