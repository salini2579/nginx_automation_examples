variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
  default     = null
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  sensitive   = true
  default     = null
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
  sensitive   = true
  default     = null
}

variable "client_secret" {
  description = "Azure Client Secret"
  type      = string
  sensitive = true
  default   = null
}

variable "azure_region" {
  type = string
}