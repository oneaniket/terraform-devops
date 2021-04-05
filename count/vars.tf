variable "instance_name" {
  default = "tfinstnace"
  type = string
  description = "name of the instance"
}



variable "instance_name_list" {
  default = ["prod", "dev","qa"]
  type = list(string)
  description = "name of the instance"
}
