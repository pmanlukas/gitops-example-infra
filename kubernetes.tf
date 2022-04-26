resource "google_service_account" "default" {
  account_id   = "service-account-id"
  display_name = "Service Account"
}

resource "google_container_cluster" "dev-test" {
    name               = var.cluster_name
    location           = var.cluster_cp_location
    
    
    remove_default_node_pool = true
    initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = var.cluster_cp_location
  cluster    = google_container_cluster.dev-test.name
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "e2-standard-2"
    tags = ["gcp-test-nodes"]

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  management {
    auto_repair = true
    auto_upgrade = true
  }
}