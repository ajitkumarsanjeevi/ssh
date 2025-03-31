terraform {
  backend "s3" {
    bucket = "my-terrafom-eks"
    key    = "statefile/terraform.tfstate"
    region = "us-east-1"
  }
}
