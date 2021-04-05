#################################################
## For_each with list. Convert list with toset ##
#################################################

resource "google_compute_instance" "default" {
  for_each = toset(var.instance_name_list)
  name         = each.value
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


########################
## For_each with map  ##
########################

resource "google_compute_instance" "default" {
  for_each = var.instance_name_map
  name         = each.key
  machine_type = each.value
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