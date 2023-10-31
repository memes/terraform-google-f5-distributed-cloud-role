terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.53, < 6.0"
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

resource "google_service_account" "test" {
  project      = var.project_id
  account_id   = format("%s-test", random_pet.prefix.id)
  display_name = "Kitchen-terraform"
  description  = "Automated test service account"
}

resource "local_file" "harness" {
  filename             = format("%s/harness.tfvars", path.module)
  file_permission      = "0640"
  directory_permission = "0755"
  content              = <<-EOC
  # This is a dummy file to indicate that setup is complete
  EOC

  depends_on = [
    google_service_account.test,
  ]
}
