variable "ingress-rules" {
  type = list(number)
  default = [22,8080,80,443,2049]
}

variable "egress-rules" {
  type = list(number)
  default = [22,8080,80,443,2049]
}
variable "ec2_instance_config" {
  type = map(any)  
  default = {
    "web" = {
      instance_type = "t2.micro"
      ami           =  "ami-08b5b3a93ed654d19"
      key_name      = "remote"
      availability_zone = "us-east-1a"
    }
  }
}
