Example on how to execute:

```bash

module "gke" {
  source               = "git@github.com:kellybeazley/gcp-terraform//gke?ref=0.1.0.9"
  project              = data.google_project.project.project_id
  cluster_name         = "your cluster name"
  node_count           = 1
  username             = "USERNAME"
  password             = "16 CHARACTER PASSWORD"
  node_pool_node_count = "4"
}

```
