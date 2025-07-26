# VPC
data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.0"

  name = local.prefix
  cidr = var.aws_vpc_config_cidr_block
  azs  = data.aws_availability_zones.available.names
  tags = var.tags

  enable_dns_hostnames = true
  enable_nat_gateway   = true
  single_nat_gateway   = true
  create_igw           = true

  public_subnets = [cidrsubnet(var.aws_vpc_config_cidr_block, 3, 0)]
  private_subnets = [cidrsubnet(var.aws_vpc_config_cidr_block, 3, 1),
  cidrsubnet(var.aws_vpc_config_cidr_block, 3, 2)]

  manage_default_security_group = true
  default_security_group_name   = "${local.prefix}-sg"

  default_security_group_egress = [{
    cidr_blocks = "0.0.0.0/0"
  }]

  default_security_group_ingress = [{
    description = "Allow all internal TCP and UDP"
    self        = true
  }]
}
