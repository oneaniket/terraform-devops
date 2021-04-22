resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = var.mod_vpc

    access_config {
      // Ephemeral IP
    }
  }
}

variable "mod_vpc" {
  default = "abcvpc"
}