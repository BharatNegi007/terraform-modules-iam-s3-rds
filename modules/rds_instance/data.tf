data "aws_vpc" "default" {
  default = true

  filter {
    name   = "tag:Name"
    values = ["default"]
  }
}

data "aws_subnets" "database" {
  filter {
    name   = "tag:Name"
    values = ["default_data_subnet*"]
  }
}


data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_security_group" "rds_sg" {
  vpc_id = data.aws_vpc.default.id
  filter {
    name   = "tag:Name"
    values = ["default"]
  }
}
