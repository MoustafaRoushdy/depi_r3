# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

resource "local_file" "foo" {
  content  = "Hello World!"
  filename = "${path.module}/file.txt"
}