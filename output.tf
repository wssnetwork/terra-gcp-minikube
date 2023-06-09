# output "nat_ip_address" {
#     value = google_compute_address.nat-ip.address
# }

output "minikube-name" {
    value = google_compute_instance.minikube.name
}

output "minikube-internal-ip" {
    value = google_compute_instance.minikube.network_interface.0.network_ip
}
