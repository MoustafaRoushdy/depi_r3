# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "sunbet1" {
    vpc_id = aws_vpc.example.id
    cidr_block = var.subnets["subnet1"]["cidr_block"]
    availability_zone = var.subnets["subnet1"]["az"]
}

resource "aws_subnet" "sunbet2" {
    vpc_id = aws_vpc.example.id
    cidr_block = var.subnets.subnet2.cidr_block
    availability_zone = var.subnets.subnet2.az
}

# variable "subnets" {
#   type = list
#   default = ["10.0.0.0/24","10.0.1.0/24"]
# }

variable "subnets" {
  type = map
  default = {
   subnet1 =  {
    cidr_block = "10.0.0.0/24"
    az = "us-east-1a"
   } 
   subnet2 = {
    cidr_block = "10.0.1.0/24"
    az = "us-east-1b"
   }
    
  }    
}

resource "local_file" "foo" {
  content  = "Hello World!"
  filename = "${path.module}/file.txt"
}



# String 
# number 
# boolean => true, false
# list  => ["banana","orange","mango","orange"]  , x[0], x[1]
# set   => ["banana","orange","mango"]
# map  x => { 
#     name = "ahmed"     
#     age = 15
#     }

#     x["name"] 
#     x["age"]


#    object =>  {
#         x = 
#         y = 
#     }