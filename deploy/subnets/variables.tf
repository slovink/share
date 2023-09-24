############################################
#     Google Project                #
############################################

variable "platformName" {
  default = "alferd"
  type = string
  description = "GCP project identifier"
}

variable "projectId" {
  default = "development-392815"
  type = string
  description = "GCP project identifier"
}

variable "projectName" {
  default = "development"
  type = string
  description = "GCP project identifier"
}

variable "GCP_SERVICE_ACCOUNT_KEY" {
  default = ""
  type = string
  description = "GCP project identifier"
}


variable "region" {
    default = "us-central1"
    type = string
    description = "GCP Project region"
  
}

variable "zone" {
    default = "us-central1"
    type = string
    description = "GCP Project zone"
  
}

variable "environment" {
    default = "development"
    type = string
    description = "Define the environment"

}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`,`application`."
}

############################################
#     Google Network                       #
############################################

variable "ip_cidr_range" {
  type        = string
  default     = "10.2.0.0/16"
  description = "(Required) The range of internal addresses that are owned by this subnetwork. Provide this property when you create the subnetwork. For example, 10.0.0.0/8 or 192.168.0.0/16. Ranges must be unique and non-overlapping within a network. Only IPv4 is supported."
}




############################################
#     Google Kubernetes                    #
############################################


