provider "aws" {
  region     = "ap-south-1"
  access_key = "access_key"
  secret_key = "secret_key"
}

data "aws_ami" "amazon" {
   most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*"]
  }
}


resource "aws_instance" "myfirstec2_ha" {
  count = var.HA == true ? 1 :0
  ami = data.aws_ami.amazon.id
  instance_type = "t2.micro"
   
  tags = {
    Name = "HelloWorld"
  }
}


resource "aws_instance" "myfirstec2-nonha" {
  count = var.HA == true ? 0 :1
  ami = data.aws_ami.amazon.id
  instance_type = "t2.nano"
   
  tags = {
    Name = "HelloWorld"
  }
}