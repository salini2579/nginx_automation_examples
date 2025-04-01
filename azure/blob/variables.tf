variable "azure_credentials" {
  description = "Azure credentials as a JSON string"
  type = string
}

variable "azure_region" {
  description = "Azure region for resources"
  type        = string
}

variable "project_prefix" {
  description = "unique name to identify resources"
  type = string
}