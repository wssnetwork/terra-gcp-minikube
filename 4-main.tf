resource "google_compute_instance" "minikube" {
  name         = var.proj_name
  machine_type = "n1-highmem-4"
  tags         = ["ssh"]
  # tags         = ["ssh", "http"]
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network    = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.vpc-subnet.name
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.svc-acc.email
    scopes = ["cloud-platform"]
  }

  metadata_startup_script = file("${path.module}/setup/setup.sh")

  # metadata = {
  #     ssh-keys = "${var.ssh_user}:${var.ssh_pub_key}"
  # }
}