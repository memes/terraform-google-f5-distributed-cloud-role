variable "target_type" {
  type    = string
  default = "project"
  validation {
    condition     = contains(["project", "org"], var.target_type)
    error_message = "The target_type variable must be one of 'project', or 'org'."
  }
  description = <<-EOD
  Determines if the F5 Distributed Cloud role is to be created for the whole
  organization ('org') or at a 'project' level. Default is 'project'.
  EOD
}

variable "target_id" {
  type = string
  validation {
    condition     = can(regex("^[1-9][0-9]+$", var.target_id)) || can(regex("^[a-z][a-z0-9-]{4,28}[a-z0-9]$", var.target_id))
    error_message = "The target_id must be a valid organization or project identifier."
  }
  description = <<-EOD
  Sets the target for role creation; must be either an organization ID (target_type = 'org'),
  or project ID (target_type = 'project').
  EOD
}

variable "id" {
  type    = string
  default = null
  validation {
    condition     = var.id == null || var.id == "" || can(regex("^[a-z0-9_.]{3,64}$", var.id))
    error_message = "The id variable must be empty or between 3 and 64 characters in length and only contain alphanumeric, underscore and periods."
  }
  description = <<-EOD
  An identifier to use for the new role; default is an empty string which will
  generate a unique identifier. If a value is provided, it must be unique at the
  organization or project level depending on value of target_type respectively.
  E.g. multiple projects can all have a 'f5_dc' role defined, but an organization
  level role must be uniquely named.
  EOD
}

variable "title" {
  type    = string
  default = null
  validation {
    condition     = var.title == null || var.title == "" ? true : length(var.title) <= 100
    error_message = "The title variable must be empty, or up to 100 characters long."
  }
  description = <<-EOD
  The human-readable title to assign to the custom IAM role. If left blank (default),
  a suitable title will be created.
  EOD
}

variable "description" {
  type        = string
  default     = null
  description = <<-EOD
  The optional description to assign to the custom IAM role. If left blank (default),
  a suitable description will be created.
  EOD
}

variable "members" {
  type    = list(string)
  default = []
  validation {
    condition     = length(join("", [for member in var.members : can(regex("^(group|serviceAccount|user):[^@]+@[^@]+$", member)) ? "x" : ""])) == length(var.members)
    error_message = "Each member value must be a fully-qualified IAM email address. E.g. serviceAccount:foo@project.iam.gserviceaccount.com."
  }
  description = <<-EOD
  An optional list of accounts that will be assigned the custom role. Default is
  an empty list.
  EOD
}

variable "random_id_prefix" {
  type    = string
  default = "f5_dc"
  validation {
    condition     = can(regex("^[a-z0-9_.]{3,59}$", var.random_id_prefix))
    error_message = "The random_id_prefix variable must be between 3 and 59 characters in length and only contain alphanumeric, underscore and periods."
  }
  description = <<-EOD
  The prefix to use when generating random role identifier for the new role if
  `id` field is blank. The default is 'f5_dc' which will generate a unique role
  identifier of the form 'f5_dc_XXXX', where XXXX is a random hex string.
  EOD
}
