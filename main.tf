locals {
  loc_ai_notebook = flatten([
    for nb_key, ai_nbobj in var.ai_notebook : [
      for nb in ai_nbobj.notebook : {
        project_id          = ai_nbobj.project_id
        location            = ai_nbobj.location
        network             = ai_nbobj.network
        ai_notebook_name    = nb.ai_notebook_name
        machine_type        = nb.machine_type 
        imgage_faily_project_id=nb.imgage_faily_project_id   
        image_family        = nb.image_family
        instance_owners     = nb.instance_owners
        service_account     = nb.service_account
        install_gpu_driver  = nb.install_gpu_driver
        boot_disk_type      = nb.boot_disk_type
        boot_disk_size_gb   = nb.boot_disk_size_gb
        no_public_ip        = nb.no_public_ip
        no_proxy_access     = nb.no_proxy_access
        extensions_install  = nb.extensions_install
      }
    ]
  ])
}


output name {
  value       = local.loc_ai_notebook
}


module "ai_notebook"{
  for_each = { for n in local.loc_ai_notebook : n.ai_notebook_name => n if upper(n.project_id) == upper("groovy-works-307303")}
  source              = "./Ai/notebook"
  project_id          = each.value.project_id
  location            = each.value.location
  network             = each.value.network
  ai_notebook_name    = each.value.ai_notebook_name
  machine_type        = each.value.machine_type   
  imgage_faily_project_id=each.value.imgage_faily_project_id 
  image_family        = each.value.image_family
  instance_owners     = each.value.instance_owners
  service_account     = each.value.service_account
  install_gpu_driver  = each.value.install_gpu_driver
  boot_disk_type      = each.value.boot_disk_type
  boot_disk_size_gb   = each.value.boot_disk_size_gb
  no_public_ip        = each.value.no_public_ip
  no_proxy_access     = each.value.no_proxy_access
  extensions_install  = each.value.extensions_install
}
