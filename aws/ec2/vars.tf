variable "ec2-map" {
  type = map(string)
  description = "Map of ec2 instances with environmnet as key"
   default={
    web_dev = "t2.micro"
    web_prod = "t2.nano"
  }
}

variable "count-of-ec2" {
  type = number
  description = "Number if ec2 instances to be created"
  default = 2
}


variable "ec2-name" {
  type = string
  description = "Name of the ec2 instance"
  default = "tf-instance"
}

variable "ec2-list" {
  type = list(string)
  description = "List of the ec2 instances"
  default = ["tf1", "tf2"]
}

