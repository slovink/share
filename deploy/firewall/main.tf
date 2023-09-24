

locals {
  networkName = "${var.platformName}-network-${var.projectName}"
  firewallName = "${var.platformName}-firewall"
}


data "google_compute_network" "network" {
  name = local.networkName
}



############################################
#     Google firewall                      #
############################################

module "firewall" {

    source = "git@github.com:slovink/terraform-google-firewall.git"

        name                            = local.firewallName
        module_enabled                  = true
        google_compute_firewall_enabled = true
        project_id                      = var.projectId
        network                         = data.google_compute_network.network.id
        description                     = "Creates firewall rule targeting tagged instances."
        protocol                        = "TCP"
        ports                           = ["80", "4440", "443", "22"]
        source_ranges                   = ["0.0.0.0/0"]   
  
}
