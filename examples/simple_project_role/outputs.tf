output "qualified_role_id" {
  value       = module.role.qualified_role_id
  description = <<-EOD
  The qualified role-id for the custom F5 Distributed Cloud role.
  EOD
}
