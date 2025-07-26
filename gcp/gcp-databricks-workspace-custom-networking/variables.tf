variable "default_tags" {
  type = map(string)
  default = {
    owner = "aditya_pradana"
  }
}

resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}

variable "alias" {
  type        = string
  default     = "my_username"
  description = "Your personal alias, name, initials, or identifier"
}

locals {
  alias  = var.alias
  prefix = "${local.alias}-${random_string.naming.result}"
}

