#######################
# IAM users with tags
########################

resource "aws_iam_user" "iam_users" {
  for_each =  { for user in var.users : user.name => user }

  name = lookup(each.value, "name")

  tags = {
    Role    = each.value.role
    Product = join("/", each.value.product)
  }
}

################################
# IAM user group
################################

resource "aws_iam_group" "groups" {
  count = length(var.groups)

  name = var.groups[count.index]
  
}

################################
# IAM user group membership
################################

resource "aws_iam_group_membership" "iam_group_memberships" {
  count = length(var.users)

  name  = aws_iam_user.iam_users[count.index].name
  users = [ aws_iam_user.iam_users.*.name, count.index ]
  group = [element(aws_iam_group.groups[product].name for product in each.value.product ]
}

################################
# IAM policies
################################

resource "aws_iam_policy" "product_team_alpha_policy" {
  count = var.attach_product_team_alpha_policy ? 1 : 0

  name_prefix = var.product_team_alpha_policy_name_prefix
  policy      = data.aws_iam_policy_document.product_team_alpha.json

  tags = var.tags
}

resource "aws_iam_policy" "product_team_beta_policy" {
  count = var.attach_product_team_beta_policy ? 1 : 0

  name_prefix = var.product_team_beta_policy_name_prefix
  policy      = data.aws_iam_policy_document.product_team_beta.json

  tags = var.tags
}

resource "aws_iam_policy" "product_team_gamma_policy" {
  count = var.attach_product_team_gamma_policy ? 1 : 0

  name_prefix = var.product_team_gamma_policy_name_prefix
  policy      = data.aws_iam_policy_document.product_team_gamma.json

  tags = var.tags
}

####################################
# IAM roles for QA and developers
####################################


resource "aws_iam_role" "developer_role" {
  name = "developer-role"

  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json

  tags = {
    name = "developer_role"
  }
}

resource "aws_iam_role" "qa_role" {
  name = "qa-role"

  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json

  tags = {
    name = "qa_role"
  }
}


##################################################
# Policy Attachement to the user group
##################################################

resource "aws_iam_group_policy_attachment" "product_group_policy_attachments" {
    for_each = tomap({
    "Alpha" = "aws_iam_policy.product_team_alpha_policy.arn",
    "Beta"  = "aws_iam_policy.product_team_beta_policy.arn",
    "Gamma" = "aws_iam_policy.product_team_gamma_policy.arn",
  })
    group      = aws_iam_group.groups[each.key].name
    policy_arn = each.value

}