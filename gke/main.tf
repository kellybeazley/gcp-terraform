// Configure GCP Provider
provider "google" {
  credentials = "${file("../path to your credentials.json")}"
  project     = "kelly-gcp"
  region      = "europe-west2"
}

resource "google_container_cluster" "primary" {
  name   = "${var.cluster_name}"
  region = "europe-west2"
  remove_default_node_pool = "true"
  initial_node_count = "${var.node_count}"

  master_auth {
     username = "${var.username}"
     password = "${var.password}"

 }
   node_config {
   oauth_scopes = [
     "https://www.googleapis.com/auth/compute",
     "https://www.googleapis.com/auth/devstorage.read_only",
     "https://www.googleapis.com/auth/logging.write",
     "https://www.googleapis.com/auth/monitoring",
   ]
 }

     timeouts {
      create = "30m"
      update = "40m"
    }
  }

  resource "google_container_node_pool" "nodes" {
  name       = "my-node-pool"
  location   = "europe-west4"
  cluster    = google_container_cluster.primary.name
  node_count = ${var.node_count}

  node_config {
    preemptible  = true
    machine_type = "type"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

