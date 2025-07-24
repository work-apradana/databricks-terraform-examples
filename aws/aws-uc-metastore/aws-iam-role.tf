data "databricks_aws_unity_catalog_assume_role_policy" "this" {
  aws_account_id = var.aws_account_id
  role_name      = local.iam_role_name
  external_id    = databricks_storage_credential.this.aws_iam_role[0].external_id
}

data "databricks_aws_unity_catalog_policy" "this" {
  aws_account_id = var.aws_account_id
  role_name      = local.iam_role_name
  bucket_name    = aws_s3_bucket.this.id
}

resource "aws_iam_policy" "external_data_access" {
  policy = data.databricks_aws_unity_catalog_policy.this.json
  tags = merge(var.tags, {
    Name = "${local.prefix}-metastore-iam-policy"
  })
}

resource "aws_iam_role" "external_data_access" {
  name               = local.iam_role_name
  assume_role_policy = data.databricks_aws_unity_catalog_assume_role_policy.this.json
  tags = merge(var.tags, {
    Name = "${local.prefix}-metastore-iam-role"
  })
}

resource "aws_iam_role_policy_attachment" "external_data_access" {
  role       = aws_iam_role.external_data_access.name
  policy_arn = aws_iam_policy.external_data_access.arn
}

resource "time_sleep" "wait_role_creation" {
  depends_on      = [aws_iam_role.external_data_access]
  create_duration = "20s"
}