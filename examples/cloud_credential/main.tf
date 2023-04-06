# Example Terraform to create an F5 XC Cloud Credential for GCP VPC Sites, with
# a service account assigned to the custom F5 XC role at the project level.

# Only supported on Terraform 1.0+
terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.58"
    }
    volterra = {
      source  = "volterraedge/volterra"
      version = ">= 0.11"
    }
  }
}

resource "google_service_account" "sa" {
  project      = var.project_id
  account_id   = var.name
  display_name = "F5 XC"
  description  = "Service account for F5 XC GCP VPC management"
}

resource "google_service_account_key" "sa" {
  service_account_id = google_service_account.sa.id
  key_algorithm      = "KEY_ALG_RSA_2048"
  private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"
  keepers = {
    name = google_service_account.sa.name
  }
}

module "role" {
  source           = "memes/f5-distributed-cloud-role/google"
  version          = "1.0.2"
  target_id        = var.project_id
  random_id_prefix = replace(var.name, "/[^a-z0-9_.]/", "_")
}

resource "google_project_iam_member" "sa" {
  project = var.project_id
  role    = module.role.qualified_role_id
  member  = google_service_account.sa.member

  depends_on = [
    google_service_account.sa,
    module.role,
  ]
}

resource "volterra_cloud_credentials" "xc" {
  name        = var.name
  namespace   = "system"
  description = "Example GCP Cloud Credential"
  gcp_cred_file {
    credential_file {
      clear_secret_info {
        url = format("string:///%s", base64encode(google_service_account_key.sa.private_key))
      }
    }
  }
  depends_on = [
    google_service_account.sa,
    google_service_account_key.sa,
  ]
}
