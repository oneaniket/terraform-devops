provider "google" {
  #credentials = file("kelly-prod.json")
  project     = "planar-maxim-304714"
  region      = "us-central1"
  zone        = "us-central1-a"
}

variable "zone"{
  default = "us-central1-a"  
}

variable "machine_type"{
  default = "n1-standard-1"
}

##################################################
## Create 3 instnaces, Limitation on the naming ##
##################################################

resource "google_compute_instance" "default" {
  count = 3  
  name         = "${var.instance_name}-${count.index}"
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}



####################################################################################
## Multiple instances with dynamic count value and reading the name from the list ##
####################################################################################

# resource "google_compute_instance" "default" {
#   count = length(var.instance_name_list)  
#   name         = var.instance_name_list[count.index]
#   machine_type = var.machine_type
#   zone         = var.zone

#   tags = ["foo", "bar"]

#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-9"
#     }
#   }

#   network_interface {
#     network = "default"

#     access_config {
#       // Ephemeral IP
#     }
#   }
# }

