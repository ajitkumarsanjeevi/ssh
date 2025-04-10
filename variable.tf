
variable "is_enabled" {
 type = bool
 default = true
}

variable "availability_zones" {
type = list(string)
default = ["ap-south-1a", "ap-south-1b"] 
}

variable "ingress-rules" {
  type = list(number)
  default = [22,8080,80,443,2049]
}

variable "egress-rules" { 
  type = list(number)
  default = [22,8080,80,443,2049]
}
variable "subnet_ids" {
  type    = list(string)

  default = ["subnet-0c847ba2112e16310", "subnet-07d1742f3544a89c7"]
}
variable instance_names
type = list(string)
default = ["instance-1, "instance-2", "instance-3"]



  
