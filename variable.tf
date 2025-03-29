
variable "is_enabled" {
 type = bool
 default = true
}

variable "availability_zones" {
type = list(string)
default = ["us-east-1a", "us-east-1b"] 
}

variable "ingress-rules" {
  type = list(number)
  default = [22,8080,80,443,2049]
}

variable "egress-rules" { 
  type = list(number)
  default = [22,8080,80,443,2049]
}




  
