data "template_file" "inventory" {
  template = file("inventory.tpl")
  vars = {
    host_ip = "module.gcp_vm"
  }
}

resource "null_resource" "update_inventory" {
  triggers = {
    template = data.template_file.inventory.rendered
  }

  provisioner "local-exec" {
    command = "echo '${data.template_file.inventory.rendered}' > inventory.ini"
  }
}