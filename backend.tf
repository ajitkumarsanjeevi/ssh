terraform {
  backend "s3" {
    bucket = "my-terrafom-remote"
    key    = "statefile/terraform.tfstate"
    region = "us-east-1"
  }
}
