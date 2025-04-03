terraform {
  backend "s3" { 
    bucket = "my-ansible-iam-bucket"
    key    = "my-terraform-state"
    region = "us-east-1"
    dynamodb_table = "my-terraform-lock"
  }
}
