variable "ingress-rules" {
  type = list(number)
  default = [22,8080,80,443,2049]
}

variable "egress-rules" {
  type = list(number)
  default = [22,8080,80,443,2049]
}

variable "server_configs" {        
  description = "A map of server configurations"                                                 
  type = map(object({
    name          = string
    ami           = string
    keyname       = string
    ami           = string
    instance_type = string
    availability_zone = string
  
  }))
  default = {
      name          = "instance-1"
      ami           = "ami-08b5b3a93ed654d19"
      instance_type = "t2.micro"
      key_name       = "remote" 
      availability_zone = "us-east-1a"   
    }
}
