module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 6.5.0"
  name    = "my-vpc"
  cidr    = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.0.0/17"] #Range 10.0.0.1 - 10.0.127.254
  public_subnets = ["10.0.128.0/17"] #Range 10.0.128.1 - 10.0.255.254
  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] 
}

resource "aws_instance" "bation_host" {
  subnet_id     = module.vpc.public_subnets[0]
  instance_type = "t3.micro"
  ami           = data.aws_ami.ubuntu.id
  tags = {
    Name = "Bastion-Host"
  }
}

# Security Group to allow SSH inbound and HTTP/HTTPS outbound
resource "aws_security_group" "allow_ssh" {
  name        = "SSH & HHTP/S"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.default_vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound HTTP (80) to Internet
  egress {
    description = "HTTP to internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound HTTPS (443) to Internet
  egress {
    description = "HTTPS to internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/17"]
  }

}