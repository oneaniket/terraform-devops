#############################################################################################
## To import already existing resouces, create a block for that resource 
## Run below command to import the resource
## terraform import (reource_name) (logical name) (path_of_the_resource)
## terraform import google_compute_instance.docker planar-maxim-304714/us-central1-f/docker
#############################################################################################

resource "google_compute_instance" "docker" {
  name         = "docker"
  machine_type = "e2-medium"
  zone         = "us-central1-f"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "projects/planar-maxim-304714/global/image/docker"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
