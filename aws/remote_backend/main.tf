provider "aws" {
  region     = "ap-south-1"
  access_key = "access_key"
  secret_key = "secret_key"
}

terraform {
  backend "s3" {
    bucket = "tfstate-demo-bucket"
    key    = "tfstate-demo.tfstate"
    region = "ap-south-1"
    access_key = ""
    secret_key = ""
    //dynamodb_table = "tfstate"   //create a table first with this name in dynamodb and primary key name should be "LockID"
  }
}

data "aws_ami" "amazon" {
   most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*"]
  }
}


resource "aws_instance" "myfirstec2" {
  count = 2 
  ami = data.aws_ami.amazon.id
  instance_type = "t2.micro"
   
  tags = {
    Name = "firstec2"
  }
}

