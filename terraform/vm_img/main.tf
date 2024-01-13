provider "google" {
  credentials = var.credentials
  project     = var.project
  region      = var.region
  zone        = var.zone
}

resource "google_compute_instance_from_machine_image" "tpl" {
  name     = "instance-from-machine-image"
  zone     = var.zone

  source_machine_image = "projects/${var.project}/global/machineImages/jenkins-server-image"

}
