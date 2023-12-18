terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
      
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
  shared_credentials_files = ["/Users/user/.aws/credentials"]
  profile                 = "default"
}