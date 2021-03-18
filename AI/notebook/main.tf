module "data_network"{
  source      = "./../../Network/vpc/datasource"
  project_id  = var.network.project_id
  vnet_name   = var.network.vnet_name
  subnet_name = var.network.subnet_name
  region      = var.network.region
}

resource "google_notebooks_instance" "instance" {
  name                = var.ai_notebook_name
  location            = var.location
  machine_type        = var.machine_type

  vm_image {
    project      = var.imgage_faily_project_id
    image_family = var.image_family
  }
  instance_owners = var.instance_owners
  service_account = var.service_account

  install_gpu_driver  = var.install_gpu_driver
  boot_disk_type      = var.boot_disk_type
  boot_disk_size_gb   = var.boot_disk_size_gb

  no_public_ip        = var.no_public_ip
  no_proxy_access     = var.no_proxy_access

  network = module.data_network.vnet_id
  subnet  = module.data_network.subnet_id

  labels = {
    "developer" = "basav"
  }

  metadata = var.metadata
}