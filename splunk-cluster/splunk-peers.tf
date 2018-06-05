resource "google_compute_instance_template" "splunk-peers-template" {
  name        = "${var.template_name}"
  description = "Made for splunk cluster"

  tags = ["${var.peer_tags}","splunk"]

  labels = {
    environment = "splunk"
  }

  instance_description = "description assigned to instances"
  machine_type = "${var.peer_machine_type}"
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }
  

  // Create a new boot disk from an image
  disk {
    source_image = "ubuntu-os-cloud/ubuntu-1604-lts"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = "${google_compute_network.splunk_net.name}"

    access_config {
      // Ephemeral IP
    }
  }
  
  metadata {
    splunk = "${google_compute_instance.splunk-master.name}"
  }
  metadata_startup_script = "${file("${path.module}/scripts/splunk-peer-temp.sh")}"
}

resource "google_compute_instance_group_manager" "instance_group_manager" {
  name               = "splunk-peers"
  instance_template  = "${google_compute_instance_template.splunk-peers-template.self_link}"
  base_instance_name = "${var.base_instance_name}"
  zone         = "${var.instances_zone}"
  target_size        = "${var.target_size}"
}
