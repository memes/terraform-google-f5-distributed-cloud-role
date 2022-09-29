terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.53, < 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4"
    }
  }
}

resource "random_pet" "prefix" {
  length = 1
  prefix = "kitchen"
  keepers = {
    project = var.project_id
  }
}

module "sa" {
  source     = "terraform-google-modules/service-accounts/google"
  version    = "4.1.1"
  project_id = var.project_id
  prefix     = random_pet.prefix.id
  names      = ["test"]
  descriptions = [
    "Automated test service account",
  ]
  project_roles = []
  generate_keys = false
}
