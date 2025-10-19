vpc_cidr_block = "10.1.0.0/16"
subnets = {
  subnet1 = {
    cidr_block = "10.1.0.0/24"
    az         = "us-east-1a"
  }
  subnet2 = {
    cidr_block = "10.1.1.0/24"
    az         = "us-east-1b"
  }
}
db_name = "foo"
db_pass = "kalsghpuoj"