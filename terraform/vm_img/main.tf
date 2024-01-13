provider "google" {
  credentials = var.credentials
  project     = var.project
  region      = var.region
  zone        = var.zone
}

data "google_compute_image" "react_img" {
  most_recent = true
  filter {
    name   = "name"
    values = "react-deploy-img"
  }
}

output "latest_jenkins_user_image" {
  value = google_compute_image.react_img.values
}