output "vm_name" {
  value = google_compute_instance.gcp_vm.name
}

output "vm_internal_ip" {
  value = google_compute_instance.gcp_vm.network_interface[0].network_ip
}

output "vm_external_ip" {
  value = google_compute_address.static.address
}