resource "google_compute_instance" "tpl" {
  name         = "instance-from-machine-image"
  machine_type = "your-machine-type"  
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/${var.project}/global/machineImages/jenkins-server-image"
    }
  }
}

