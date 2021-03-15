output "vnet_id"{
    value = data.google_compute_network.my_network.id
}

output "subnet_id"{
    value = data.google_compute_subnetwork.my_subnetwork.id
}