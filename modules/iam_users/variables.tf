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