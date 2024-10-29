terraform {
  required_version = ">= 1.3"
}

module "test" {
  source     = "./../../../ephemeral/cloud_credential/"
  project_id = var.project_id
  name       = var.name
}
