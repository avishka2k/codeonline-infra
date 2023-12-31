data "template_file" "host" {
  template = file("inventory.tpl")
  vars = {
    host_ip = "module.gcp_vm"
  }
}