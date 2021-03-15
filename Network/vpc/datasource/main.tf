data "google_compute_network" "my_network" {
  name    = var.vnet_name
  project = var.project_id
}

data "google_compute_subnetwork" "my_subnetwork" {
  name   = var.subnet_name
  region = var.region
}