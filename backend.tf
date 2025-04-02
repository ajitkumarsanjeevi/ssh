terraform {
  backend "s3" {
    bucket = "my-terraform-remote"
    key    = "my-terraform-state"
    region = "us-east-1"
  }
}
