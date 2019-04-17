variable "my_gcp_project" {
  description = "Your GCP Project name"
}

variable "gcp_credentials_json" {
  description = "The path of your GCP Credentials"
}

variable "region" {
  description = "GCP Region"
}

variable "name" {
  description = "Instance name"
}

variable "machine_type" {
  description = "your instance size"
}

variable "image" {
  description = "your image name"
}

variable "zone" {
  description = "your instance zone"
}
