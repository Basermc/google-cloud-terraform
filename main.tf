#proveedor
provider "google" {
  credentials = file("account.json")
  project     = "prueba-278019"
  region      = var . main_region
}

#creacion de claves privadas para ssh
resource "tls_private_key" "example" {
  algorithm = "ECDSA"
}
#creacion de ami 
data "google_compute_image" "my_image" {
  family  = "debian-9"
  project = "debian-cloud"
}
#creacion de instancia
resource "google_compute_instance" "default" {
  name         = "test1"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  tags = ["foo", "bar"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
  metadata = {
    foo = "bar"
  }
  metadata_startup_script = "sudo apt-get -y update; sudo apt-get -y dist-upgrade; sudo apt-get -y install nginx"
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}


  
