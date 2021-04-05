#################################################
## Lookup and condition based on users unput ##
#################################################

resource "google_compute_instance" "default_dev" {
  count = var.env == "dev" ? 1 : 0
  name         = var.instance_name
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