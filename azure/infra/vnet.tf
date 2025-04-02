resource "azurerm_virtual_network" "az_vnet" {
  name                = format("%s-vnet", var.project_prefix)
  address_space       = var.azure_vnet_cidr
  location            = var.azure_region
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "az_subnet" {
  name                 = format("%s-subnet", var.project_prefix)
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.az_vnet.name
  address_prefixes     = var.azure_subnet_cidr
}