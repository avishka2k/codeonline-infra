data "template_file" "host" {
  template = file("inventory.tpl")
  vars = {
    host_ip = google_compute_address.static.address
  }
}