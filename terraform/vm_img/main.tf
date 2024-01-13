provider "google" {
  credentials = var.credentials
  project     = var.project
  region      = var.region
  zone        = var.zone
}

module "gcp_vm" {
  source    = "../modules/c_i"
}
