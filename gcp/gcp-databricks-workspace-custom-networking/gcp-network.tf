resource "google_compute_network" "vpc" {
  project                 = var.gcp_project_id
  name                    = "${local.prefix}-vpc"
  auto_create_subnetworks = false

}

resource "google_compute_subnetwork" "private_subnet" {
  name                     = "${local.prefix}-private-subnet"
  ip_cidr_range            = var.gcp_vpc_cidr_range
  region                   = var.gcp_region
  network                  = google_compute_network.vpc.id
  private_ip_google_access = true
}

resource "google_compute_router" "router" {
  name    = "${local.prefix}-router"
  region  = google_compute_subnetwork.private_subnet.region
  network = google_compute_network.vpc.id

}

resource "google_compute_router_nat" "nat" {
  name                               = "${local.prefix}-router-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

}
