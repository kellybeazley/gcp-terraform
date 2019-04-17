provider "google" {
  credentials = "${var.gcp_credentials_json}"
  project     = "${var.my_gcp_project}"
  region      = "${var.region}"
}

