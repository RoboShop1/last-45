provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}



variable "external_dns_values" {
  default = {
    set1= {
      name = "serviceAccount.create"
      value = "true"
    }
    set2 = {
      name = "serviceAccount.name"
      value = "external-dns"
    }
    set2 = {
      name = "policy"
      value = "sync"
    }
  }
}

resource "helm_release" "external-dns" {
  depends_on = [aws_eks_addon.eks-pod-identity]

  name       = "external-dns"
  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"
  version    = "external-dns"
  namespace = "external-dns"
  create_namespace = true
  atomic =  true

 dynamic "set" {
  for_each = var.external_dns_values
   content {
    name = set.value.name
    vlaue = set.value.value
  }
}
}

resource "aws_eks_pod_identity_association" "external-poid" {
  depends_on = [aws_eks_addon.eks-pod-identity]
  cluster_name    = "dev-eks"
  namespace       = "external-dns"
  service_account = "external-dns"
  role_arn        = aws_iam_role.external_dns.arn
}



