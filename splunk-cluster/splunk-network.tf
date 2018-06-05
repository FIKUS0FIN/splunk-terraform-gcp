resource "google_compute_network" "splunk_net" {
  name                    = "${var.network_name}"
  auto_create_subnetworks = "false"
  ipv4_range              = "${var.network_ipv4_range}"
  routing_mode            = "${var.network_routing_mode}"
}

resource "google_compute_firewall" "splunk-net-fire" {
  name = "${var.network_name}-fireval"
  network = "${google_compute_network.splunk_net.name}"
 
  
  
  allow {
    protocol = "all"
  }
}

#output "network_name" {
#  value = "${google_compute_network.splunk_net.name}"
#}