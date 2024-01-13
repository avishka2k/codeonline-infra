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
  default     = "../modules/codeonline-gcp.json"
}

variable "project" {
  type        = string
  description = "project id"
  default     = "devops-world-409303"
}

variable "inventory" {
  type        = string
  description = "inventory path"
}