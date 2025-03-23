terraform {
  backend "s3" {
    bucket = "my-terraform-remote"
    key    = "statefile/terraform.tfstate"
    region = "us-east-1"
  }
}
