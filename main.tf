locals {
  create_db_instance = var.create_db_instance
  create_bucket      = var.create_bucket
  encryption         = var.apply_server_side_encryption_by_default
  region             = "ap-southeast-1"
  bucket_acl         = "private"
}

module "iam_users" {
  source = "./modules/iam_users"

  users                                 = var.users
  groups                                = var.groups
  attach_product_team_alpha_policy      = var.attach_product_team_alpha_policy
  product_team_alpha_policy_name_prefix = var.product_team_alpha_policy_name_prefix
  product_team_beta_policy_name_prefix  = var.product_team_beta_policy_name_prefix
  attach_product_team_gamma_policy      = var.attach_product_team_gamma_policy
  product_team_gamma_policy_name_prefix = var.product_team_gamma_policy_name_prefix
  tags                                  = merge(var.tags)


}

module "rds_instance" {
  source = "./modules/rds_instance"

  create_db_instance          = var.create_db_instance
  db_subnet_group_name        = var.db_subnet_group_name
  db_subnet_group_description = var.db_subnet_group_description
  engine_name                 = var.engine_name
  engine_version              = var.engine_version
  identifier                  = var.identifier
  db_name                     = var.db_name
  master_user                 = var.master_user
  manage_master_user_password = var.manage_master_user_password
  enable_multi_az             = var.enable_multi_az
  enable_public_access        = var.enable_public_access
  instance_class              = var.instance_class
  allocated_storage           = var.allocated_storage
  parameter_group_name        = var.parameter_group_name
  backup_retention_period     = var.backup_retention_period
  enable_deletion_protection  = var.enable_deletion_protection
  vpc_id                      = var.vpc_id
}

module "aws_s3_bucket" {
  source = "./modules/s3_bucket"

  apply_server_side_encryption_by_default = var.apply_server_side_encryption_by_default
  bucket_tags                             = var.bucket_tags
  create_bucket                           = var.create_bucket
  bucket_name                             = var.bucket_name
  force_destroy                           = var.force_destroy
  enable_encryption                       = var.enable_encryption
  bucket_prefix                           = var.bucket_prefix

}
