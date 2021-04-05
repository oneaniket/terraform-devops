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


//creating instance with different size with lookup function
resource "aws_instance" "myfirstec2_lookup" {
  count = 2 
  ami = data.aws_ami.amazon.id
  instance_type = lookup(var.ec2-map, var.env)
   
  tags = {
    Name = element(var.instance_tag,count.index)
  }
}

