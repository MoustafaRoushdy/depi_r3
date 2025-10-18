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


resource "local_file" "foo" {
  content  = "Hello World!"
  filename = "${path.module}/file.txt"
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_name
  password             = var.db_pass
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
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