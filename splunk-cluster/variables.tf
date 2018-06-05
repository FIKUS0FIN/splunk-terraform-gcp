#########Splunk_Master#########
variable "master_machine_type" {}
variable "master_name" {}
variable "instances_zone" {}
variable "master_tags" {}
#########Splunk_network##########
variable "network_name" {}
variable "network_ipv4_range" {}
variable "network_routing_mode" {}
#########Splunk_peers_Template_Group##########
variable "template_name" {}
variable "peer_tags" {}
variable "base_instance_name" {}
variable "target_size" {}
variable "peer_machine_type" {}