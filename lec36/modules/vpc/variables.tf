variable "vpc_cidr_block" {
  description = ""
  default = "10.0.0.0/16"
}

variable "subnets" {
  type = map
    description = "A map of subnet configurations"
    default = {
      subnet1 = {
        cidr_block = "10.0.0.0/24"
        az         = "us-east-1a"
        public_ip_on_launch = true
        }
        subnet2 = {
        cidr_block = "10.0.1.0/24"
        az         = "us-east-1b"
        public_ip_on_launch = false
        }
    }
}