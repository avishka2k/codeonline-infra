terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.10.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }

    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.4.1"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }
  }
}

provider "google" {
  credentials = var.credentials
  project     = var.project
  region      = var.region
  zone        = var.zone
}