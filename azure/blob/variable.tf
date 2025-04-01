variable "subscriptionId" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "tenantId" {
  description = "Azure Tenant ID"
  type        = string
  sensitive   = true
}

variable "clientId" {
  description = "Azure Client ID"
  type        = string
  sensitive   = true
}

variable "clientSecret" {
  description = "Azure Client Secret"
  type      = string
  sensitive = true
}

variable "azure_region" {
  description = "Azure Region"
  type = string
}
