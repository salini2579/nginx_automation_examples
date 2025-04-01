provider "azurerm" {
  features {}
#  subscription_id = jsondecode(var.azure_credentials)["subscriptionId"]
#  client_id       = jsondecode(var.azure_credentials)["clientId"]
#  client_secret   = jsondecode(var.azure_credentials)["clientSecret"]
#  tenant_id       = jsondecode(var.azure_credentials)["tenantId"]
  subscription_id = var.subscription-id
  client_id = var.client-id
  client_secret = var.client-secret
  tenant_id = var.tenant-id
}
