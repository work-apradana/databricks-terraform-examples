# Main Databricks Workspace Deployment

# Root Bucket
resource "databricks_mws_storage_configurations" "this" {
  provider                   = databricks.accounts
  account_id                 = var.databricks_aws_account_id
  bucket_name                = aws_s3_bucket.this.bucket
  storage_configuration_name = "${local.prefix}-storage-config"
}

# Networking
resource "databricks_mws_networks" "this" {
  provider           = databricks.accounts
  account_id         = var.databricks_aws_account_id
  network_name       = "${local.prefix}-network-config"
  security_group_ids = [module.vpc.default_security_group_id]
  subnet_ids         = module.vpc.private_subnets
  vpc_id             = module.vpc.vpc_id
}

# Cross-Account IAM Role
resource "databricks_mws_credentials" "this" {
  provider         = databricks.accounts
  role_arn         = aws_iam_role.cross_account_role.arn
  credentials_name = "${local.prefix}-creds"
  depends_on       = [time_sleep.wait]
}

# DBX Workspaces
resource "databricks_mws_workspaces" "this" {
  provider        = databricks.accounts
  account_id      = var.databricks_aws_account_id
  aws_region      = var.aws_region
  workspace_name  = local.prefix
  deployment_name = "${local.prefix}-workspace"

  credentials_id           = databricks_mws_credentials.this.credentials_id
  storage_configuration_id = databricks_mws_storage_configurations.this.storage_configuration_id
  network_id               = databricks_mws_networks.this.network_id

  # Uncomment this when you want to general access token for the workspace
  # token {
  #   comment = "terraform-provisioned"
  # }
}
