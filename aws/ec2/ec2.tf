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

output "ami_id"{
  description = "IP address of the instance"
  value = data.aws_ami.amazon.id
}



resource "aws_instance" "myfirstec2" {
  count = 1
  ami = data.aws_ami.amazon.id
  instance_type = "t2.micro"
   
  tags = {
    Name = "HelloWorld"
  }
}

output "ip"{
  description = "IP address of the instance"
  value = aws_instance.myfirstec2[*].public_ip
}


