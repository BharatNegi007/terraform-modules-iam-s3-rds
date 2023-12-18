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
