terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0" # major.minor.patch
    }
  }
  backend "s3" {
    bucket = "abdelrahman-hussein-s3-backend-22334455"
    key    = "tfstate"
    region = "us-east-1"
    use_lockfile = true
    profile = "terraform"
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}



