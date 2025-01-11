provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "my-context"
}


resource "aws_iam_role" "external_dns" {
  name = "external_dns_role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": [
            "pods.eks.amazonaws.com"
          ]
        },
        "Action": [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
      }
    ]
  })

  tags = {
    tag-key = "external-dns"
  }
}

resource "aws_iam_role_policy" "externa_dns_policy" {
  name = "external_dns"
  role = aws_iam_role.external_dns.id

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "route53:ChangeResourceRecordSets"
        ],
        "Resource": [
          "arn:aws:route53:::hostedzone/*"
        ]
      },
      {
        "Effect": "Allow",
        "Action": [
          "route53:ListHostedZones",
          "route53:ListResourceRecordSets",
          "route53:ListTagsForResource"
        ],
        "Resource": [
          "*"
        ]
      }
    ]
  })
}



resource "aws_eks_addon" "eks-pod-identity" {
  cluster_name                = "dev-eks"
  addon_name                  = "eks-pod-identity-agent"
  addon_version               = "v1.3.4-eksbuild.1"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}




