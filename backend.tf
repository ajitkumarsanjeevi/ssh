terraform {
  backend "s3" {
    bucket = "my-terrafomproject"
    key    = "my-terraform-state"
    region = "us-east-1"
  }
}
