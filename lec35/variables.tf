variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "subnets" {
  type = map(any)
  default = {
    subnet1 = {
      cidr_block = "10.0.0.0/24"
      az         = "us-east-1a"
    }
  }
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}
