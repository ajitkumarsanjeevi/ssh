terraform {
  backend "s3" { 
    bucket = "my-ansible-iam-bucket"
    key    = "my-terraform-state"
    region = "ap-south-1"
    use_lockfile = "my-terraform-lock" 
  }
}
