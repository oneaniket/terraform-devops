variable "ec2-map" {
  type = map(string)
  description = "Map of ec2 instances with environmnet as key"
   default={
    web_dev = "t2.micro"
    web_prod = "t2.nano"
  }
}

variable "env" {
  type = string
  description = "Name of the environment"
  default = "web_dev"
}

variable "instance_tag" {
  type = list
  description = "Tags for instanaces"
  default = ["firsttag","secondtag"]
}
