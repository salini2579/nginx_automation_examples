variable "tf_state_bucket" {
  type        = string
  description = "S3 bucket for Terraform state"
  default     = var.s3_bucket_name
}
variable "create_iam_resources" {
  description = "Whether to create IAM resources (role and policy)."
  type        = bool
  default     = false
}

variable "aws_region" {
  description = "aws region"
  type        = string
}
variable "s3_bucket_name" {
  type = string
}