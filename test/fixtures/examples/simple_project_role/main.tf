terraform {
  required_version = ">= 1.0"
}

module "test" {
  source     = "./../../../ephemeral/simple_project_role/"
  project_id = var.project_id
  members    = var.members
}
