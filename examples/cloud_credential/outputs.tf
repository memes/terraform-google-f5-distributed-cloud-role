output "qualified_role_id" {
  value       = module.role.qualified_role_id
  description = <<-EOD
  The qualified role-id for the custom F5 Distributed Cloud role.
  EOD
}

output "cloud_credential" {
  value       = volterra_cloud_credentials.xc.name
  description = <<-EOD
  The unique name of the GCP Cloud Credential in your F5 XC tenant.
  EOD
}
