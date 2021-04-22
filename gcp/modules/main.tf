module "vpc_mod" {
  source = "./vpc"
}

module "ce" {
  source = "./ce"
  mod_vpc = module.vpc_mod.vpc_name
}


variable "vpc_name" {
  default = "aniket"
}