module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "~> 6.5.0"
  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
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

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "bation_host" {  
    subnet_id = module.vpc.public_subnets[0]
    instance_type = "t3.micro"
    ami = data.aws_ami.ubuntu.id

}

# edit this module parameters to create the public subnets in 10.0.0.0/17 
# write a comment demonstrate the range of IPs allowed in this subnet

# edit this module parameters to create the private subnets in 10.0.128.0/17 
# write a comment demonstrate the range of IPs allowed in this subnet

# create a security group for the bation host to allow only ssh inbound connection from every where
# and outbount connection to all private subnets (ssh)
# allow outbount connection to the internet "0.0.0.0/0" port 80,445

# Create a PR with screenshots 

