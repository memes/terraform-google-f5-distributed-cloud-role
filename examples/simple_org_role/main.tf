# Example Terraform to create a custom F5 Distributed Cloud role at the organization level.

# Only supported on Terraform 1.3+
terraform {
  required_version = ">= 1.3"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.58"
    }
  }
}

# Create a custom F5 Distributed Cloud role for an organization
module "role" {
  source      = "memes/f5-distributed-cloud-role/google"
  version     = "1.0.9"
  target_type = "org"
  target_id   = var.org_id
}
