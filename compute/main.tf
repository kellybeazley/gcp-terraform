// Configure GCP Provider
provider "google" {
  credentials = "${file("kelly-gcp-sa.json")}"
  project     = "kelly-gcp"
  region      = "europe-west2"
}


// A single Google Cloud Engine instance
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
 metadata {
  ssh-keys = "root:${file("~/.ssh/id_rsa.pub")}"
}

connection {
  type = "ssh"
  user = "root"
  private_key = "${file("~/.ssh/id_rsa")}"
  }

 provisioner "file" {
    source = "/Users/kelly.beazley/Documents/cats"
    destination = "/tmp/cats"
}

provisioner "file" {
   source = "index.html"
   destination = "/var/www/html"
 }


// Install nginx
 metadata_startup_script = "sudo apt-get update -y; sudo apt-get install -y apache2; service apache2 start; sudo mkdir /tmp/cats"

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
  }
 }
tags = [
      "http-server"
    ]

}

//Create Bucket

resource "google_storage_bucket" "image-store" {
  name = "kelly-cats-bucket"
  location = "${var.bucket_location}"
  storage_class = "${var.storage_class}"
  }



//Upload cat pics to Bucket
//resource "google_storage_bucket_object" "picture"
//  name = "cats"
//  source = "/Users/kelly.beazley/Documents/cats/IMG_20181007_194914_820.jpg"
// bucket = "kelly-cats-bucket"
//
