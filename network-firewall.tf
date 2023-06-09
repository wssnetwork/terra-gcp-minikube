# allow http traffic
resource "google_compute_firewall" "allow-http" {
    name    = "${var.proj_name}-fw-allow-http"
    network = google_compute_network.vpc.name
    allow {
        protocol = "tcp"
        ports    = ["80"]
    }
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["http"]
}

# allow https traffic
resource "google_compute_firewall" "allow-https" {
    name    = "${var.proj_name}-fw-allow-https"
    network = google_compute_network.vpc.name
    allow {
        protocol = "tcp"
        ports    = ["443"]
    }
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["https"]
}

# allow ssh traffic
resource "google_compute_firewall" "allow-ssh" {
    name    = "${var.proj_name}-fw-allow-ssh"
    network = google_compute_network.vpc.name
    allow {
        protocol = "tcp"
        ports    = ["22"]
    }
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["ssh"]
}