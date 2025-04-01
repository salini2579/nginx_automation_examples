terraform {
  backend "azurerm" {
    resource_group_name   = format("%s-rg", var.project_prefix)          # Resource group where storage account is located
    storage_account_name  = format("%snicnap", var.project_prefix)       # Storage account name
    container_name        = format("%s-container", var.project_prefix)   # Blob container for storing tfstate
    key                   = "terraform.tfstate"
  }
}