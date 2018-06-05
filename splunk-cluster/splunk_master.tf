resource "google_compute_instance" "splunk-master" {
  name         = "${var.master_name}"
  machine_type = "${var.master_machine_type}"
  zone         = "${var.instances_zone}"
  tags = ["${var.master_tags}"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
  }

  network_interface {
    network = "${google_compute_network.splunk_net.name}"

    access_config {
      // Ephemeral IP
    }
  }

  metadata {
    foo = "bar"
  }
  metadata_startup_script = "${file("${path.module}/scripts/splunk-sh.sh")}"
}

