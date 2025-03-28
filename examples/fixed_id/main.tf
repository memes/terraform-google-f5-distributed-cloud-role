# Example Terraform to create a custom F5 Distributed Cloud role in a project
# with a specified identifier.

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

# Create a full custom F5 Distributed Cloud role with a fixed identifier
module "role" {
  source    = "memes/f5-distributed-cloud-role/google"
  version   = "1.0.9"
  target_id = var.project_id
  id        = var.id
  title     = var.title
  members   = var.members
}
