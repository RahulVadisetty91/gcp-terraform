ai_notebook={
    notebooks_01={
        project_id  = "groovy-works-307303"
        location    = "us-central1-a"
        network     ={
                        vnet_name   = "default"
                        subnet_name = "default"
                        project_id  = "groovy-works-307303"
                        region      = "us-central1"
                      }
        notebook = [
                    {
                        ai_notebook_name= "ainb-001"
                        machine_type    = "n1-standard-4"
                        imgage_faily_project_id= "ml-images"
                        image_family    = "common-dl-gpu-debian-10"
                        instance_owners = ["biradarbasavaraj340@gmail.com"]
                        service_account = "terraform@groovy-works-307303.iam.gserviceaccount.com"
                        install_gpu_driver = true
                        boot_disk_type  = "PD_SSD"
                        boot_disk_size_gb = 110
                        no_public_ip    = false
                        no_proxy_access = false
                        extensions_install= {
                            install = true
                            installed-extensions="jupyterlab_gcsfilebrowser-latest.tar.gz,jupyterlab_bigquery-latest.tar.gz,jupyterlab_vizier-latest.tar.gz"
                        }                    
                    }
        ]        
    }
}