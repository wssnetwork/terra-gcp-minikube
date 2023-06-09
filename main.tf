resource "google_compute_instance" "minikube" {
    name            = var.proj_name
    machine_type    = "n1-highmem-4"
    tags            = ["ssh","http"]
    
    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-2204-lts"
        }
    }
    
    network_interface {
        network     = google_compute_network.vpc.name
        subnetwork  = google_compute_subnetwork.vpc-subnet.name
    } 

    # metadata = {
    #     ssh-keys = "${var.ssh_user}:${var.ssh_pub_key}"
    # }
}