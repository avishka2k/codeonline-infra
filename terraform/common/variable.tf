variable "zone" {
  type        = string
  description = "gcp zone"
  default     = "us-central1-a"
}

variable "region" {
  type        = string
  description = "gcp region"
  default     = "us-central1"
}

variable "credentials" {
  type        = string
  description = "credentials"
  default     = "../auth/devops-world-409303-08f785158830.json"
}

variable "project" {
  type        = string
  description = "project id"
  default     = "devops-world-409303"
}