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

locals {
  alias = "<your-alias-or-id>"
  prefix = "${local.alias}-${random_string.naming.result}"
}

