variable "ingress-rules" {
  type = list(number)
  default = [22,8080,80,443,2049]
}

variable "egress-rules" {
  type = list(number)
  default = [22,8080,80,443,2049]
}
variable "ec2_instance_config" {
  description = "Map of EC2 instance configurations"
  type = map(any)  # This allows any value type in the map
  default = {
    "web" = {
      instance_type = "t2.micro"
      ami           = "ami-0c55b159cbfafe1f0"  
      key_name      = "remote"
      availabilityzone = "us-east-1a
    }
  }
}
