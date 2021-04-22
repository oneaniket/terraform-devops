
resource "google_compute_address" "static" {
  name = "terraform-static-ip"
}

resource "google_compute_instance" "my_vm" {
  name         = "test-vm"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
      }
    }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

  metadata = {
    sshKeys = "aniket:${file("${path.root}/pubkey")}"
   }

   provisioner "remote-exec" {
     inline = [
       "sudo apt update -y",
       "sudo apt install apache2 -y",
       "sudo systemctl start apache2",
       "sudo apt install net-tools"
     ]

     connection {
         host     = "${google_compute_instance.my_vm.network_interface.0.access_config.0.nat_ip}"#google_compute_address.static.address
         type     = "ssh"
         user     = "aniket"
         agent    = false
         private_key = file("./aniket-pem.pem")#file("${path.root}/aniket-pem.pem")
         timeout  = "3m"
       }
   }  

  labels = {
    enable-osconfig = "true"
  }

  deletion_protection       = false
  allow_stopping_for_update = true
}
