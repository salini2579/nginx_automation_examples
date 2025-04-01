variable "subscription-id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "tenant-id" {
  description = "Azure Tenant ID"
  type        = string
  sensitive   = true
}

variable "client-id" {
  description = "Azure Client ID"
  type        = string
  sensitive   = true
}

variable "client-secret" {
  description = "Azure Client Secret"
  type      = string
  sensitive = true
}

variable "azure_region" {
  description = "Azure Region"
  type = string
}
