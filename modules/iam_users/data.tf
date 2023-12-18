#############################
# IAM Policies
############################


data "aws_iam_policy_document" "product_team_alpha" {
  statement {
    sid = ""
    effect = "Allow"

    actions = ["*"]
    resources = ["*"]
    condition {
        test     = "ForAnyValue:StringEquals" 
        variable = "aws:RequestTag/ProductTeam"
        values   = ["Alpha"]
    }
  }
}


data "aws_iam_policy_document" "product_team_beta" {
  statement {
    sid = ""
    effect = "Allow"

    actions = ["*"]
    resources = ["*"]
    condition {
        test     = "ForAnyValue:StringEquals" 
        variable = "aws:RequestTag/ProductTeam"
        values   = ["Beta"]
    }
  }
}



data "aws_iam_policy_document" "product_team_gamma" {
  statement {
    sid = ""
    effect = "Allow"

    actions = ["*"]
    resources = ["*"]
    condition {
        test     = "ForAnyValue:StringEquals" 
        variable = "aws:RequestTag/ProductTeam"
        values   = ["Gamma"]
    }
  }
}

####################################################
# Assument role policy
###################################################

data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}