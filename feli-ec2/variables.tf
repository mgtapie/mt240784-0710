variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "default"
}

variable "CIDR" {
  default = "172.16.0.0/16"
}

variable "subnet" {
  default = "172.16.2.0/24"
}

output "dns-publico" {
  value = aws_instance.feli-EC2.public_dns
}