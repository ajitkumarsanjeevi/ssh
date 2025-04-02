terraform {
  backend "s3" {
    bucket = "my-terraformproject"
    key    = "my-terraform-state"
    region = "us-east-1"
  }
}
