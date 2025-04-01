variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  sensitive   = true
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Azure Client Secret"
  type      = string
  sensitive = true
}

variable "azure_region" {
  description = "Azure region for resources"
  type        = string
}

#variable "azure_credentials" {
##  description = "Azure credentials as a JSON string"
#  type = string
#}

#variable "subscription_id" {
#  description = "The Azure subscription ID"
#  type        = string
#}