variable "project_id" {
  type        = string
  description = <<-EOD
  The identifier of the Google Cloud project that will contain the custom role.
  EOD
}

variable "id" {
  type        = string
  description = <<-EOD
  A unique identifier to use for the new role.
  EOD
}

variable "title" {
  type        = string
  description = <<-EOD
  The human-readable title to assign to the custom CFE role.
  EOD
}

variable "members" {
  type        = list(string)
  description = <<-EOD
  A list of accounts that will be assigned the custom role.
  EOD
}
