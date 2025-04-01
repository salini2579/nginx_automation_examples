output "resource_group_name" {
  value       = format("%s-rg", var.project_prefix)
  description = "Azure Resource Group Name"
}

output "vnet_name" {
  value       = format("%s-vnet", var.project_prefix)
  description = "Azure Virtual Network Name"
}

output "subnet_name" {
  value       = format("%s-subnet", var.project_prefix)
  description = "Azure Subnet Name"
}

output "vnet_id" {
  value       = azurerm_virtual_network.az_vnet.id
  description = "Azure Vnet ID"
}

output "subnet_id" {
  value       = azurerm_subnet.az_subnet.id
  description = "Azure Subnet ID"
}