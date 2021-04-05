resource "aws_instance" "myfirstec2_import" {
  ami = "ami-04b1ddd35fd71475a"
  instance_type = "t2.micro"
  subnet_id = "subnet-8b7ea8e3"
  security_groups = ["default"]
}


provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}
