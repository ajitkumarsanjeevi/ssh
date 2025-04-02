terraform {
  backend "s3" {
    bucket = "my-terrafom-remote"
    key    = "my-terraformproject"
    region = "us-east-1"
  }
}
