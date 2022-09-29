variable "project_id" {
  type        = string
  description = <<-EOD
  The identifier of the Google Cloud project that will contain the custom role.
  EOD
}

variable "members" {
  type        = list(string)
  description = <<-EOD
  A list of accounts that will be assigned the custom role.
  EOD
}
