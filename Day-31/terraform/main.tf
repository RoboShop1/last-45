module "vpc-dev" {

  source = "./modules/vpc"

  vpc_cidr_block = "10.0.0.0/16"
  env            = "dev"
  public_subnets = ["10.0.1.0/24","10.0.2.0/24"]
  web_subnets    = ["10.0.3.0/24","10.0.4.0/24"]
  app_subnets    = ["10.0.5.0/24","10.0.6.0/24"]
  db_subnets     = ["10.0.7.0/24","10.0.8.0/24"]

  public_azs    = ["us-east-1a","us-east-1b"]
  web_azs       = ["us-east-1a","us-east-1b"]
  app_azs       = ["us-east-1a","us-east-1b"]
  db_azs        = ["us-east-1a","us-east-1b"]

}


module "ec2" {
  for_each = local.subnets

  source      = "./modules/ec2"
  subnet_name = "${replace(each.key,"s","")}"
  subnet_id   = element(each.value,0)
}


# output "vpc_main_details" {
#   value = module.vpc-dev
# }

locals {
  subnets = { for i,k in module.vpc-dev: i => k.*.id if can(regex(".*subnets",i))}
}

output "main" {
  value = local.subnets
}

# output "subnets_names" {
#   value = { for i,k in module.vpc-dev: i => k.*.id if can(regex(".*subnets",i))}
# }






#   output "for_directive_index_if_strip" {
#   value = <<EOF
# %{~ for i, name in var.names ~}
# ${name}%{ if i < length(var.names) - 1 }, %{ endif }
# %{~ endfor ~}
# EOF
# }