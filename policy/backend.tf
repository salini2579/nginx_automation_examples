terraform {
  backend "s3" {
    bucket         = "salini-ngx"         # Replace with your actual bucket name
    key            = "policy/terraform.tfstate"       # Path to state file
    region         = "ap-south-1"                     # AWS region
    dynamodb_table = "terraform-lock-table"          # DynamoDB table for state locking
    encrypt        = true                            # Encrypt state file at rest
  }
}
