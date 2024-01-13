data "google_compute_image" "react_img" {
  most_recent = true
  filter {
    name   = "name"
    values = "react-deploy-img"
  }
}

output "latest_jenkins_user_image" {
  value = sort(data.google_compute_images.react_img.images, attribute = "creation_date")[0].name
}