terraform {
  backend "s3" {
    bucket = "my-ansible-bucket2"
    key    = "my-terraform-state"
    region = "us-east-1"
  }
}
