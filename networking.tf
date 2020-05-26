#creacion de vpc
resource "google_compute_network" "vpc_network" {
  name = "vpc-network"
}
#creacion de gateway
resource "google_compute_network" "default" {
  name = "compute-network"
}
#creacion de subnet
data "google_compute_subnetwork" "my-subnetwork" {
  name   = "default-us-central1"
  region = "us-central1"
}



#creacion de security group
resource "google_compute_security_policy" "policy" {
  name = "my-policy"
  rule {
    action   = "deny(403)"
    priority = "1000"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["9.9.9.0/24"]
      }
    }
    description = "Deny access to IPs in 9.9.9.0/24"
  }
  rule {
    action   = "allow"
    priority = "2147483647"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "default rule"
  }
}

#MLB

module "gce-lb-fr" {
  source       = "github.com/GoogleCloudPlatform/terraform-google-lb"
  region       = var.main_region
  name         = "group1-lb"
  service_port = 80
  
}

#firewall 
resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.default.name
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }
  source_tags = ["web"]
}
#direccion ip publica
resource "google_compute_address" "ip_address" {
  name = "my-address"
}
