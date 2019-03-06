#Configure GCP Provider
provider "google" {
  credentials = "${file("kelly-gcp-sa.json")}"
  project     = "kelly-gcp"
  region      = "europe-west2"
}

// A single Google Cloud Engine instance
resource "google_compute_instance" "default" {
 name         = "kelly-cats"
 machine_type = "g1-small"
 zone = "europe-west2-a"
 allow_stopping_for_update = "true"
 boot_disk {
   initialize_params {
     image = "ubuntu-os-cloud/ubuntu-1804-lts"
   }
 }

// Install nginx
 metadata_startup_script = "sudo apt-get update; sudo apt-get install nginx; service start nginx"

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
}
