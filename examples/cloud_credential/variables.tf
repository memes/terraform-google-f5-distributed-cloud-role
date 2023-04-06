variable "project_id" {
  type        = string
  description = <<-EOD
  The identifier of the Google Cloud project that will contain the custom role.
  EOD
}

variable "name" {
  type        = string
  description = <<-EOD
  The name to assign to the created service account and Cloud Credential resources.
  EOD
}
