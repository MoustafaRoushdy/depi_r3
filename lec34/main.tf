# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}


resource "aws_subnet" "my_subnets" {
  for_each          = var.subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az
  tags = {
    Name = each.key
  }
}


resource "aws_subnet" "my_subnets2" {
  for_each          = var.subnets2
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  tags = {
    Name = each.key
  }
  
}
# resource "aws_subnet" "sunbet1" {
#   vpc_id            = aws_vpc.example.id
#   cidr_block        = var.subnets["subnet1"]["cidr_block"]
#   availability_zone = var.subnets["subnet1"]["az"]
#   tags = {
#     Name = "subnet1"
#   }
# }

# resource "aws_subnet" "sunbet2" {
#   vpc_id            = aws_vpc.example.id
#   cidr_block        = var.subnets.subnet2.cidr_block
#   availability_zone = var.subnets.subnet2.az
#   tags = {
#     Name = "subnet2"
#   }
# }

resource "aws_instance" "web_server" {
  for_each = toset(var.azs)
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"
  availability_zone = each.value
  # depends_on    = [aws_db_instance.default]
}

resource "local_file" "foo" {
  content  = "Hello World!"
  filename = "${path.module}/file.txt"
}

# resource "aws_db_instance" "default" {
#   allocated_storage    = 20
#   db_name              = "mydb"
#   engine               = "mysql"
#   engine_version       = "8.0"
#   instance_class       = "db.t3.micro"
#   username             = var.db_name
#   password             = var.db_pass
#   parameter_group_name = "default.mysql8.0"
#   skip_final_snapshot  = true
#   lifecycle {
#     prevent_destroy = true
#   }
# }


resource "aws_security_group" "allow_ec2_allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group" "allow_db_allow_mysql" {
  name        = "allow_mysql"
  description = "Allow mysql inbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "RDS MySQL SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_db_allow_mysql.id
  referenced_security_group_id = aws_security_group.allow_ec2_allow_tls.id
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
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

#sg1 -> sg2 
#sg1 -> sg3 