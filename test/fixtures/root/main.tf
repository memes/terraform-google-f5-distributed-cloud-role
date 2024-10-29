terraform {
  required_version = ">= 1.3"
}

module "test" {
  source           = "./../../../"
  target_type      = var.target_type
  target_id        = var.target_id
  id               = var.id
  title            = var.title
  description      = var.description
  members          = var.members
  random_id_prefix = var.random_id_prefix
}
