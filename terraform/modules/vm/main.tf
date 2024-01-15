resource "google_compute_instance" "gcp_vm" {
  name         = join("-", [var.prefix, random_id.random.hex, "gci"])
  machine_type = "e2-medium"
  zone         = var.zone
  project      = var.project

  boot_disk {
    device_name = join("-", [var.prefix, random_id.random.hex, "bootdisk"])
    auto_delete = true
    initialize_params {
      size  = var.bootdisk_size
      type  = var.bootdisk_type
      image = var.bootdisk_image
    }
  }

  network_interface {
    network = google_compute_network.default.name
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }
  tags = ["http-server", "https-server"]

  metadata = {
    ssh-keys = "avishkaprabathg:${file("/home/avishkaprabathg/.ssh/id_rsa.pub")}"
  }
}

resource "google_compute_firewall" "default" {
  name    = join("-", [var.prefix, random_id.random.hex, "firewall"])
  network = google_compute_network.default.name
  project = google_compute_instance.gcp_vm.project

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "443", "22", "6080","5901", 5000, 5050]
  }

  allow {
    protocol = "icmp"
  }
  
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_network" "default" {
  name = join("-", [var.prefix, random_id.random.hex, "network"])
}

resource "google_compute_address" "static" {
  name = join("-", [var.prefix, random_id.random.hex, "ipv4"])
}

resource "random_id" "random" {
  byte_length = 4
}