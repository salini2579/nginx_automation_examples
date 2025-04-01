provider "azurerm" {
  features {}
  subscription_id = jsondecode(var.azure_credentials)["subscriptionId"]
  client_id       = jsondecode(var.azure_credentials)["clientId"]
  client_secret   = jsondecode(var.azure_credentials)["clientSecret"]
  tenant_id       = jsondecode(var.azure_credentials)["tenantId"]
#  subscription_id = var.subscription_id
#  client_id = var.client_id
#  client_secret = var.client_secret
#  tenant_id = var.tenant_id
}
