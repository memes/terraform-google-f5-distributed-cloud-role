# Example Terraform to create a custom F5 Distributed Cloud role at the organization level.

# Only supported on Terraform 1.0+
terraform {
  required_version = ">= 1.0"
}

# Create a custom F5 BIG-IP CFE role for an organization
module "role" {
  source      = "memes/f5-distributed-cloud-role/google"
  version     = "1.0.0"
  target_type = "org"
  target_id   = var.org_id
}
