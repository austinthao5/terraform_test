variable "cluster_version" {
    type = string
    default = "1.22"
    description = "EKS Cluster version"
}

variable "eks_node_type" {
    type = string
    default = "r5.large"
    description = "EC2 instance type to use for EKS nodes"
}

variable "eks_node_count" {
    type = number
    default = "2"
    description = "Worker node ASG desired capacity"
}

variable "eks_asg_max_size" {
    type = number
    default = "2"
    description = "Worker node ASG max size"
}

# variable "db_instance_type" {
#     type = string
#     description = "RDS instance type"
# }

variable "route53_primary_zone_id" {
    type = string
    default = "Z0277253WQIZFHHI1E1M"    
    description = "Route 53 zone ID to create A records in"
}

variable "aws_account" {
    type     = string
    default = "armory-support-dev"
    description = "AWS account"
}

variable "aws_region" {
    type     = string
    default = "us-west-2"
    description = "AWS region"
}

variable "customer_name" {
    type     = string
    default = "shlomo-eks-tf"
    description = "Customer account name"
}

# variable "aws_key" {
#     type = string
# }

# variable "aws_secret" {
#     type = string
# }

# variable "spinnaker_github_org" {
#     type = string
#     description = "Repo to inject into Service Manifiest for dinghy etc"
# }

# variable "spinnaker_github_repo" {
#     type = string
#     description = "Repo to inject into Service Manifiest for dinghy etc"
# }

# variable "github_pat" {
#     type = string
#     description = "GitHub PAT for spinnaker access. Add as TF_VAR env"
# }
