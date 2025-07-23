variable "default_tags" {
  # adjust this to GCP labeling rules
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
  prefix = "apradana-${random_string.naming.result}"
}

