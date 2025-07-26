data "databricks_aws_assume_role_policy" "this" {
  provider    = databricks.accounts
  external_id = var.databricks_aws_account_id
}

data "databricks_aws_crossaccount_policy" "this" {
  provider    = databricks.accounts
  policy_type = "managed" # customer | managed | restricted policy
}

resource "aws_iam_role" "cross_account_role" {
  name               = "${local.prefix}-cross-account"
  assume_role_policy = data.databricks_aws_assume_role_policy.this.json
  tags               = var.tags
}

resource "aws_iam_role_policy" "this" {
  name   = "${local.prefix}-policy"
  role   = aws_iam_role.cross_account_role.id
  policy = data.databricks_aws_crossaccount_policy.this.json
}

resource "time_sleep" "wait" {
  depends_on = [
    aws_iam_role.cross_account_role
  ]
  create_duration = "15s"
}
