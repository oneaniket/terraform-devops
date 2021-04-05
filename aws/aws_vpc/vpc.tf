provider "aws" {
  region     = "ap-south-1"
  access_key = "access_key"
  secret_key = "secret_key"
}

resource "aws_vpc" "my_aws_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-vpc"
  }
}

resource "aws_subnet" "my_aws_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "tf-subnet"
  }
}