
resource "aws_iam_role" "test_role" {
  name = "params_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "params_role"
  }
}

# This become in-line policy
resource "aws_iam_role_policy" "test_policy" {
  name = "params_policy"
  role = aws_iam_role.test_role.id

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "VisualEditor0",
        "Effect": "Allow",
        "Action": [
          "ssm:GetParameterHistory",
          "ssm:GetParametersByPath",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "ssm:DescribeParameters"
        ],
        "Resource": "arn:aws:ssm:*:339712959230:parameter/dev.*"
      }
    ]
  })
}



# normal -policy
resource "aws_iam_policy" "policy" {
  name        = "normal_params_policy"
  path        = "/"
  description = "My test policy"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "VisualEditor0",
        "Effect": "Allow",
        "Action": [
          "ssm:GetParameterHistory",
          "ssm:GetParametersByPath",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "ssm:DescribeParameters"
        ],
        "Resource": "arn:aws:ssm:*:339712959230:parameter/dev.*"
      }
    ]
    })
}


resource "aws_iam_instance_profile" "test_profile" {
  name = "params_profile"
  role = aws_iam_role.test_role.name
}
