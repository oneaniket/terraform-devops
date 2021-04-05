##########################################################################################
## Use locals to evaluate expresstion and use it in a block to avoid repetition of code ##
##########################################################################################

locals {
  env_value = var.env == "prod" ? 3 : 0
}

resource "google_compute_instance" "default_prod" {
  count = local.env_value
  name         = "${var.instance_name}-${count.index}"
  machine_type = lookup(var.instance_name_map,var.env)
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