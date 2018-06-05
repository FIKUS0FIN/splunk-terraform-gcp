
module "splunk" {
    source = "./splunk-cluster"
    ######################################
    ####### Networking
    network_name = "splunk-net"
    network_ipv4_range = "10.10.10.10/24"
    network_routing_mode = "REGIONAL"
    #####################################
    ####### Splunk master config
    master_machine_type = "n1-standard-1"
    master_name = "splunk-sh"
    instances_zone = "europe-west3-a"
    master_tags = "splunk-master"
    ####################################
    ###### instance template config 
    template_name = "splunk-peer"
    peer_tags = "splunk-peer"
    base_instance_name = "splunk-peer"
    target_size = "4"
    peer_machine_type = "n1-standard-1"
    ####################################
}
