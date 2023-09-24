############################################
#     Google Network                       #
############################################

locals {
  networkName = "${var.platformName}-network"
}

module "network" {
  
  source = "https://github.com/slovink/terraform-google-network.git"

        name        = local.networkName
        environment = var.environment
        label_order = var.label_order

        google_compute_network_enabled  = true
        project_id                      = var.projectId
        auto_create_subnetworks         = false
        routing_mode                    = "REGIONAL"
        mtu                             = 1460
        delete_default_routes_on_create = true
        enable_ula_internal_ipv6        = false
}

