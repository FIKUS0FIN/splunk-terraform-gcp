variable "private_key" {}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "europe-west3-a"
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
} 

  provisioner "file" {
    source      = "./variebles.tf"
    destination   = "/variebles.tf"

    connection {
      type        = "ssh"
      user        = "dmytro_symonenko"
      private_key = "${var.private_key}"
    }
  }

}




