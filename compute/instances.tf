resource "google_compute_instance" "default" {
 name         = "${var.name}"
 machine_type = "${var.machine_type}"
 zone = "${var.zone}"
 allow_stopping_for_update = "true"
 
 boot_disk {
   initialize_params {
     image = "${var.image}"
   }
 }
 
   network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config = {
    }
  }
 }
