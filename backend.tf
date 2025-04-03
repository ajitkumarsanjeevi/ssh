terraform {
  backend "s3" { 
    bucket = "my-ansible-iam"
    key    = "statefile/terraform.tfstate" 
    region = "ap-south-1"
    
  }
}
