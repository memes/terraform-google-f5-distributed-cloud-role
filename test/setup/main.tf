terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.53, < 5.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.4"
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

resource "local_file" "harness" {
  filename             = format("%s/harness.tfvars", path.module)
  file_permission      = "0640"
  directory_permission = "0755"
  content              = <<-EOC
  # This is a dummy file to indicate that setup is complete
  EOC

  depends_on = [
    module.sa,
  ]
}
