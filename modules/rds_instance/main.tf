#---------------------------------------------------------------------------##
#
#-----------------RDS DB Instance------------------------------------------## 
#
#------------------------------------------------------------------------- ##

locals {
  create_db_instance = var.create_db_instance

}

resource "aws_db_subnet_group" "db_sub_group" {
  name        = "db-subnet-group"
  description = "var.db_subnet_group_description"
  subnet_ids  = data.aws_subnets.database.ids
  tags = {
    name = "Db Subnet Group"
  }

}

resource "aws_db_instance" "rdsinstance" {
  count = var.create_db_instance ? 1 : 0

  engine         = var.engine_name
  engine_version = var.engine_version
  identifier     = var.identifier
  db_name        = var.db_name
  username       = var.master_user
  # manage_master_user_password = var.manage_master_user_password
  password               = random_password.rds_instance_password[0].result
  db_subnet_group_name   = aws_db_subnet_group.db_sub_group.id
  multi_az               = var.enable_multi_az
  publicly_accessible    = var.enable_public_access
  vpc_security_group_ids = [data.aws_security_group.rds_sg.id]
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage

  auto_minor_version_upgrade = true
  apply_immediately          = true
  backup_retention_period    = var.backup_retention_period
  deletion_protection        = var.enable_deletion_protection
}

resource "random_password" "rds_instance_password" {
  count            = var.create_db_instance ? 1 : 0
  length           = 16
  special          = true
  override_special = "!#$%&-_=+:?"
}
