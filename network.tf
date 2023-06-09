# create VPC
resource "google_compute_network" "vpc" {
    name                    = "${var.proj_name}-vpc"
    auto_create_subnetworks = "false" 
    routing_mode            = "GLOBAL"
}

# create private subnet
resource "google_compute_subnetwork" "vpc-subnet" {
    name            = "${var.proj_name}-vpc-subnet"
    ip_cidr_range   = var.vpc_cidr
    network         = google_compute_network.vpc.name
}

# create cloud router
module "cloud_router" {
    source  = "terraform-google-modules/cloud-router/google"
    version = "~> 5.0"
    project = var.project
    region  = var.region
    name    = "${var.proj_name}-cloud-router"
    network = google_compute_network.vpc.name
    

    nats = [{
        name = "${var.proj_name}-nat-gateway"
    }]
}

# # create a public ip for nat service
# resource "google_compute_address" "nat-ip" {
#     name = "${var.proj_name}-nat-ip"
# }

# # create a nat to allow private instances connect to internet
# resource "google_compute_router" "nat-router" {
#     name    = "${var.proj_name}-nat-router"
#     network = google_compute_network.vpc.id
# }

# resource "google_compute_router_nat" "nat-gateway" {
#     name                                = "${var.proj_name}-nat-gateway"
#     router                              = google_compute_router.nat-router.name
#     nat_ip_allocate_option              = "MANUAL_ONLY"
#     nat_ips                             = [google_compute_address.nat-ip.self_link]
#     source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES" 
#     depends_on                          = [google_compute_address.nat-ip]
# }