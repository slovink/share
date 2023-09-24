locals {
  networkName = "${var.platformName}-network-${var.projectName}"
  firewallName = "${var.platformName}-firewall"
  serviceAcoountName = "${var.platformName}"
  clusterName = "${var.platformName}-${var.projectName}-cluster"
  subnetName = "${var.platformName}-subnet-${var.projectName}"
}


data "google_compute_network" "network" {
  name = local.networkName
}

data "google_compute_subnetwork" "subnet" {
  name = local.subnetName
}


module "Service-account" {
  source  = "https://github.com/slovink/terraform-google-kubernetes.git"


  name        = local.serviceAcoountName
  environment = var.environment
  label_order = var.label_order

  service_account_enabled = true
}

module "gke" {
  source = "git@github.com:slovink/terraform-google-kubernetes.git"

  name                               = local.clusterName
  environment                        = var.environment
  label_order                        = var.label_order

  network                            = data.google_compute_network.network.id
  subnetwork                         = data.google_compute_subnetwork.subnet.id
  module_enabled                     = true
  google_container_cluster_enabled   = true
  location                           = "us-central1-a"
  remove_default_node_pool           = true
  gke_version                        = "1.27.3-gke.1700"
  initial_node_count                 = 1
  google_container_node_pool_enabled = true
  node_count                         = 1
  cluster_name                       = local.clusterName
  project_id                         = var.projectId
  region                             = "us-central1"
  service_account                    = module.Service-account.id
  disk_type                          = "pd-standard"
  disk_size_gb                       = 30
  machine_type                       = "e2-medium"
  preemptible                        = true
}
