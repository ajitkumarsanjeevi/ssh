terraform {
  backend "s3" { 
    bucket = "my-ansible-iam"
    key    = "my-terraform-state"
    region = "ap-south-1"
    dynamodb_table="my-terraform-lock"
  }
}
