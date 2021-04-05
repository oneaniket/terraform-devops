variable "instance_name_map" {
  default = {
      "prod" = "n1-standard-2",
      "dev" = "n1-standard-1"
  }
  type = map
  description = "name of the instance"
}

variable "env" {
    type = string
    description = "Enter env"
} 