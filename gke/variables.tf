variable "project" {
  description = "Your GCP Project name"
}

variable "location" {
  description = "The region for subnetworks in the network"
  type        = string
}

variable "cluster_name" {
  description = "your cluster name"
}

variable "node_count" {
  description = "how many nodes"
}

variable "username" {
  description = "linux username"
}

variable "password" {
  description = "linux password"
}

variable "node_pool_node_count" {
  description = "how many nodes"
}
