locals {
  nucleus_web_domain_name = "nucleus-${var.environment_suffix}.experience.hyland.io"
}

module "eks_tags" {
  source = "git::https://bitbucket.hylandqa.net/scm/pe/tf-mod-default-tags.git//terraform?ref=0.2.0"

  role             = "eks"
  description      = "EKS Cluster for the Hyland Experience Platform"
  project          = "HXP"
  resource_version = "1.0.0"
}

module "eks_ingress" {
  source = "git::https://bitbucket.hylandqa.net/scm/pe/tf-mod-eks-ingress.git?ref=0.3.0"

  vpc_id = data.aws_vpc.hxp.id

  cluster_name     = local.cluster_name
  environment_name = var.environment_suffix
  platform         = "experience"

  subnets        = data.aws_subnet_ids.hxp_private.ids
  public_subnets = data.aws_subnet_ids.hxp_public.ids

  public_zone_id       = data.aws_route53_zone.hylandio.id
  private_zone_id      = aws_route53_zone.internal.id
  create_private_alias = true

  tags = module.eks_tags.default_tags

  providers = {
    aws     = aws
    aws.dns = aws.dns
  }
}

resource "aws_iam_openid_connect_provider" "this" {
  client_id_list = ["sts.amazonaws.com"]
  // TODO: Figure out how to automate this or wait for https://github.com/terraform-providers/terraform-provider-aws/issues/10104
  // Right now we have to pull the hostname from /.well-known/openid-configuration => jwks_uri
  // and then fingerprint the root cert manually
  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280"]
  url             = module.eks.cluster_oidc_issuer_url
}

resource "aws_route53_zone" "internal" {
  name    = "experience.hyland.internal."
  comment = "Private zone for internal DNS"

  vpc {
    vpc_id = data.aws_vpc.hxp.id
  }
}

resource "aws_route53_record" "nucleus_cname_public_ingress" {
  name     = local.nucleus_web_domain_name
  type     = "CNAME"
  zone_id  = data.aws_route53_zone.hylandio.id
  records  = [module.eks_ingress.cname_public]
  ttl      = "1800"
  provider = aws.dns
}

resource "aws_iam_role_policy_attachment" "ssm-get-parameters-worker-role" {
  role       = module.eks.worker_iam_role_name
  policy_arn = aws_iam_policy.ssm-get-parameters.arn
}

module "eks" {
  source = "github.com/terraform-aws-modules/terraform-aws-eks?ref=v6.0.2"

  config_output_path = "./.terraform/locals/"

  cluster_name              = local.cluster_name
  cluster_version           = "1.15"
  cluster_enabled_log_types = var.cluster_enabled_log_types

  vpc_id = data.aws_vpc.hxp.id

  subnets = data.aws_subnet_ids.hxp_private.ids

  worker_groups = [
    {
      name                  = "blue"
      instance_type         = "t3.large"
      ami_id                = data.aws_ami.eks_worker_1_15.id
      target_group_arns     = module.eks_ingress.addon_target_group_arns
      asg_desired_capacity  = 0
      asg_max_size          = 0
      asg_min_size          = 0
      autoscaling_enabled   = false
      protect_from_scale_in = false
    },
    {
      name                  = "green"
      instance_type         = "t3.large"
      ami_id                = data.aws_ami.eks_worker_1_15.id
      target_group_arns     = module.eks_ingress.addon_target_group_arns
      asg_desired_capacity  = 2
      asg_max_size          = 10
      asg_min_size          = 2
      autoscaling_enabled   = true
      protect_from_scale_in = true
    },
  ]

  manage_aws_auth = true
  map_roles = [
    {
      rolearn  = var.eks_role_arn
      username = "PowerUsers"
      groups   = ["system:masters"]
    }
  ]

  worker_additional_security_group_ids = module.eks_ingress.addon_security_group_ids

  tags = module.eks_tags.default_tags
}
