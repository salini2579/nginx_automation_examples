variable "azure_credentials" {
  description = "Azure credentials as a JSON string"
  type = string
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
  default = jsondecode(var.azure_credentials)["subscriptionId"]
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  sensitive   = true
  default = jsondecode(var.azure_credentials)["tenantId"]
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
  sensitive   = true
  default = jsondecode(var.azure_credentials)["clientId"]
}

variable "client_secret" {
  description = "Azure Client Secret"
  type      = string
  sensitive = true
  default = jsondecode(var.azure_credentials)["clientSecret"]
}

variable "azure_region" {
  description = "Azure region for resources"
  type        = string
}

variable "project_prefix" {
  description = "unique name to identify resources"
  type = string
}

variable "azure_vnet_cidr" {
  type        = list(string)
  default     = ["192.168.0.0/16"]
  description = "CIDR block for Vnet"
}

variable "azure_subnet_cidr" {
  type        = list(string)
  default     = ["192.168.1.0/24"]
  description = "CIDR block for Subnet"
}