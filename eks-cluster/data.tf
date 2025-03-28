data "terraform_remote_state" "infra" {
  backend = "s3"
  config = {
    bucket =  "salini-nginx"       # Your S3 bucket name
    key    = "infra/terraform.tfstate"       # Path to infra's state file
    region = "ap-south-1"                     # AWS region
  }
}

