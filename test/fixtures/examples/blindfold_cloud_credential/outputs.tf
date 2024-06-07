#
# Module under test outputs
#
output "role_id" {
  value = module.test.qualified_role_id
}

output "cloud_credential" {
  value = module.test.cloud_credential
}
