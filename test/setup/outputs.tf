output "prefix" {
  value       = random_pet.prefix.id
  description = <<-EOD
  The random prefix to use for all resources in this test run.
  EOD
}

output "project_id" {
  value       = var.project_id
  description = <<-EOD
  The Google Cloud project identifier to use for resources.
  EOD
}

output "org_id" {
  value       = var.org_id
  description = <<-EOD
  The Google Cloud organization identifier to use for resources.
  EOD
}

output "sa" {
  value       = element(module.sa.emails_list, 0)
  description = <<-EOD
  The generated service account to use for testing.
  EOD
}
