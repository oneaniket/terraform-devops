variable "instance_name_list" {
  default = ["prod", "dev","qa"]
  type = list(string)
  description = "name of the instance"
}


variable "instance_name_map" {
  default = {
      "prod" = "n1-standard-2",
      "dev" = "n1-standard-1"
  }
  type = map
  description = "name of the instance"
}
