##################################
#  Variables
##################################

variable "users" {
  description = "List of users with roles and products"
  type        = list(object({
    name    = string
    role    = string
    product = list(string)
  }))
}

variable "groups" {
  description = "List of user groups"
  type        = list(string)
}

variable "attach_product_team_alpha_policy" {
  description = "enable to attach policy to alpha team"
  type = bool
  default = true
}

variable "product_team_alpha_policy_name_prefix" {
  description = "product_team_alpha_policy_name_prefix"
  type = string
  default = null
}

variable "attach_product_team_beta_policy" {
  type = bool
  default = false
}

variable "product_team_beta_policy_name_prefix" {
  description = "product_team_beta_policy_name_prefix"
  type = string
  default = null
}

variable "attach_product_team_gamma_policy" {
  type = bool
  default = false
}

variable "product_team_gamma_policy_name_prefix" {
  type = string
  default = null
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type = map(string)
  default     = {}
  
}

######################################
# RDS Variables
######################################

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

###################################
# S3 bucket variables
###################################

variable "apply_server_side_encryption_by_default" {
  description = "enable server side encryption by default"
  default     = true
}

variable "bucket_tags" {
  description = "tags to assign to the bucket."
  type        = map(string)
  default = {
    "environment" = "test"
  }
}

variable "create_bucket" {
  description = "Create s3 bucket"
  default     = "true"
}

variable "bucket_name" {
  description = "name for the s3 bucket"
  default     = "s3-proj-alpha"
}

variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  type        = bool
  default     = false
}
variable "enable_encryption" {
  description = "Enable Encryption."
  type        = bool
  default     = true
}


variable "bucket_prefix" {
  description = "Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket."
  type        = string
  default     = null
}

#variable "aws_account_id" {
#  description = "value"
#  default = ""
#}
