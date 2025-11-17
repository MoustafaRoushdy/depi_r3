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
    subnet2 = {
      cidr_block = "10.0.1.0/24"
      az         = "us-east-1b"
    }
    subnet3 = {
      cidr_block = "10.0.2.0/24"
      az         = "us-east-1c"
    }

  }
}


variable "subnets2" {
 default =  {
      cidr_block1 = "10.1.3.0/24"
      cidr_block2 = "10.1.4.0/24"
 }

}
variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
  
}
// x[0]  x["us-east-1a"]
// toset(azs) => {"us-east-1a", "us-east-1b"}
// { "us-east-1a"= "us-east-1a"} 
// "us-east-1b" , "us-east-1b" }
variable "db_pass" {

}

variable "db_name" {

}