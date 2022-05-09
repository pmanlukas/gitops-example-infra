// General Variables
variable "linux_admin_username" {
    type        = string
    description = "User name for authentication to the Kubernetes linux agent virtual machines in the cluster."
    default     = "admin"
}
variable "linux_admin_password" {
    type = string
    description = "The password for the Linux admin account."
}
// GCP Variables
variable "gcp_cluster_count" {
    type = number
    description = "Count of cluster instances to start."
    default = 1
}
variable "cluster_name" {
    type = string
    description = "Cluster name for the GCP Cluster."
}

variable "gcp_project_name" {
    type = string
    description = "GCP project name."
    default = "ianmiell-project-1"
}

variable "gcp_project_region" {
    type = string
    description = "GCP Region for this project."
    default = "us-west-1"
}

variable "node_locations" {
    type = list
    description = "Node locations for your cluster."
    default = ["us-west1-b", "us-west1-c"]
}

variable "cluster_cp_location" {
    type = string
    description = "Location for the cluster control plane."
    default = "us-west1-a"
}

variable "service-account-id" {
    type = string
    description = "Service Account id for cluster SA."
}

variable "min_node_count" {
    type = number
    description = "min number of nodes for autoscaling."
    default = 3
}

variable "max_node_count" {
    type = number
    description = "max number of nodes for autoscaling."
    default = 8
}

variable "machine_disk_size" {
    type = number
    description = "Storage in GB for nodes in cluster."
    default = 100
}
variable "machine_type_node" {
    type = string
    description = "Machine type used for worker nodes."
    default = "e2-standard-4"
}