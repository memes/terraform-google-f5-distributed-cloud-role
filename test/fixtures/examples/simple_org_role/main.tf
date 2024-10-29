terraform {
  required_version = ">= 1.3"
}

module "test" {
  source = "./../../../ephemeral/simple_org_role/"
  org_id = var.org_id
}
