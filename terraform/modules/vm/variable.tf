variable "prefix" {
  type        = string
  description = "prefix"
  default     = "codeonline"
}

variable "inventory_path" {
  type        = string
  description = "inventory path"
  default     = "~./"
}

variable "zone" {
  type        = string
  description = "gcp zone"
  default     = "us-central1-a"
}

variable "project" {
  type        = string
  description = "project id"
  default     = "devops-world-409303"
}

# boot disk

variable "bootdisk_size" {
  type        = number
  description = "boot disk size"
  default     = 10
}

variable "bootdisk_type" {
  type        = string
  description = "boot disk type"
  default     = "pd-ssd"
}

variable "bootdisk_image" {
  type        = string
  description = "image"
  default     = "debian-cloud/debian-11"
}

variable "inventory" {
  type        = string
  description = "inventory path"
}
