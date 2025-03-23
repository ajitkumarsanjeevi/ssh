variable "ingress-rules" {
  type = list(number)
  default = [22,8080,80,443,2049]
}

variable "egress-rules" {
  type = list(number)
  default = [22,8080,80,443,2049]
}
