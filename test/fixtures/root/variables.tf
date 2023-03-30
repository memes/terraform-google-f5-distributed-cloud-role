variable "target_type" {
  type    = string
  default = "project"
}

variable "target_id" {
  type = string
}

variable "id" {
  type    = string
  default = null
}

variable "title" {
  type    = string
  default = null
}

variable "description" {
  type    = string
  default = null
}

variable "members" {
  type    = list(string)
  default = []
}

variable "random_id_prefix" {
  type    = string
  default = "f5_xc"
}
