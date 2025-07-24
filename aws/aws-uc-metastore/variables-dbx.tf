variable "databricks_aws_account_profile" {
  default     = ""
  description = "Databricks CLI profile for Account-level resources"
}

variable "databricks_aws_workspace_profile" {
  default     = ""
  description = "Databricks CLI profile for Workspace-level resources"
}

variable "databricks_workspace_id" {
  default     = ""
  description = "Databricks Workspace ID"
}
