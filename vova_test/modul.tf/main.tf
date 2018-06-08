provider "google" {
  credentials = "${file("${path.module}/../../credentials/account.json")}"
  project     = "gcp-lab-epam"
  region      = "us-central1"
}

variable "gcp_network" {}

resource "google_compute_network" "inst_net" {
  name                    = "${var.gcp_network}"
  auto_create_subnetworks = "false"
  ipv4_range              = "10.10.10.10/24"
}

resource "google_compute_firewall" "fire" {
  name    = "somemane"
  network = "${google_compute_network.inst_net.name}"

  allow {
    protocol = "all"
  }
}
