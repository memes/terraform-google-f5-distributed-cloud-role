terraform {
  required_version = ">= 1.0"
}

module "test" {
  source     = "./../../../ephemeral/fixed_id/"
  project_id = var.project_id
  id         = var.id
  title      = var.title
  members    = var.members
}
