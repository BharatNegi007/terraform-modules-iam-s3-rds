variable "create_db_instance" {
  description = "create rds db instance"
  type        = bool
  default     = true
}

variable "db_subnet_group_name" {
  description = "Provides the name of the DB subnet group."
  type        = string
  default     = "db_subnet_group"
}

variable "db_subnet_group_description" {
  description = "Provides the description of the DB subnet group."
  type        = string
  default     = "subnet for the db instance"
}


variable "engine_name" {
  description = "Enter the DB engine"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Enter the DB version"
  type        = string
  default     = "5.7"
}

variable "identifier" {
  description = "Enter the DB identifier"
  type        = string
  default     = "my-test-database"
}

variable "db_name" {
  description = "Enter the name of the database to be created inside DB Instance"
  type        = string
  default     = "testdb"
}

variable "master_user" {
  description = "Enter the username for DB"
  type        = string
  default     = "admin"
}

variable "manage_master_user_password" {
  description = "manage master user password."
  type        = bool
  default     = true
}


variable "enable_multi_az" {
  description = "enable multi az for the bucekt."
  type        = string
  default     = false
}

variable "enable_public_access" {
  description = "enable public access for the bucekt."
  type        = string
  default     = false
}

variable "instance_class" {
  description = "define instance class for the rds db instance"
  default     = "db.t2.medium"
}

variable "allocated_storage" {
  description = "define allocated storage for the rds db instance"
  default     = "20"
}

variable "parameter_group_name" {
  description = "define instance class for the rds db instance"
  default     = "db.t2.medium"
}

variable "backup_retention_period" {
  description = "define the backup retention period."
  default     = "7"
}

variable "enable_deletion_protection" {
  description = "If the DB instance should have deletion protection enabled. "
  default     = "true"
}

variable "vpc_id" {
  description = "define vpc id. "
  default     = "vpc-05ed9ce767e649788"
}
