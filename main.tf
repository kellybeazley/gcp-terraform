#Configure GCP Provider
provider "google" {
  credentials = "${file("kelly-gcp-sa.json")}"
  project     = "kelly-gcp"
  region      = "europe-west1"
}

// A single Google Cloud Engine instance
resource "google_compute_instance" "default" {
 name         = "kelly-cats"
 machine_type = "f1-micro"
 zone = "europe-west1-b"

 boot_disk {
   initialize_params {
     image = "ubuntu-os-cloud/ubuntu-1804-lts"
   }
 }

// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
}
