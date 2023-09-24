provider "google" {
  project     = var.projectId
  region      = var.region
  zone        = var.zone
  # credentials = "file("development.json")"
}