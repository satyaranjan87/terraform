provider "google" {
  project = "ansible-318616" 
  region  = "us-central1"
  zone    = "us-central1-c"
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraformdemoinstance"
  machine_type = "f1-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
 network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
}
