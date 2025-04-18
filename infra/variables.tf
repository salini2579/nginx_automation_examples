# Variables.tf
variable "project_prefix" {
  type        = string
#  default     = "demo"
  description = "This value is inserted at the beginning of each AWS object (alpha-numeric, no special character)"
}

variable "AWS_REGION" {
  description = "aws region"
  type        = string
  default     = ""
}

variable "AWS_S3_BUCKET_NAME" {
  description = "aws s3 bucket name"
  type        = string
  default     = ""
}

# variable "aws_region" {
#   description = "aws region"
#   type        = string
#   default     = "ap-south-1"
# }

variable "resource_owner" {
  type        = string
  description = "owner of the deployment, for tagging purposes"
  default     = "myName"
}

variable "cidr" {
  description = "The CIDR block for the Virtual Private Cloud (VPC) of the deployment"
  default     = "10.0.0.0/16"  # Updated to a larger CIDR block
  type        = string
  validation {
    condition     = can(regex("^([0-9]{1,3}.){3}[0-9]{1,3}($|/(15|16|24))$", var.cidr))
    error_message = "The value must conform to a CIDR block format."
  }
}

# variable "azs" {
#   description = "Availability Zones"
#   type        = list
# }

locals {
  azs = ["${var.AWS_REGION}a", "${var.AWS_REGION}b"]
}

variable "create_nat_gateway" {
  type        = bool
  default     = false
  description = "Set to true if a NGW is needed"
}
variable "admin_src_addr" {
  type        = string
  description = "Allowed Admin source IP prefix"
  default     = "0.0.0.0/0"
}
variable "mgmt_address_prefixes" {
  type        = list(any)
  default     = ["10.1.1.0/24", "10.1.100.0/24"]
  description = "Management subnet address prefixes"
}
variable "ext_address_prefixes" {
  type        = list(any)
  default     = ["10.1.10.0/24", "10.1.110.0/24"]
  description = "External subnet address prefixes"
}
variable "int_address_prefixes" {
  type        = list(any)
  default     = ["10.1.20.0/24", "10.1.120.0/24"]
  description = "Internal subnet address prefixes"
}


