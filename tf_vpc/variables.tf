variable "aws_account" {
    type     = string
    default = "armory-support-dev"
    description = "AWS account"
}

variable "spin_tags" {
    type        = string
    default     = "test"
    description = "immutable_metadata tag for Spinnaker to cache new VPC"
    
}


# variable "sg_id" {
#     type        = string
#     default     = defaultSecurityGroup.id
#     description = "Security Group ID"
    
# }

variable "aws_region" {
    type     = string
    default = "us-west-2"
    description = "AWS region"
}

variable "tag_name" {
   default = "ec2-vpc"
}

variable "vpc-cidr" {
   default = "10.0.0.0/16"
}

variable "basename" {
   description = "Prefix used for all resources names"
   default = "at"
}

#map of maps for create subnets
variable "prefix" {
   type = map
   default = {
      sub-1 = {
         az = "usw2-az1"
         cidr = "10.0.1.0/24"
      }
      sub-2 = {
         az = "usw2-az2"
         cidr = "10.0.2.0/24"
      }
   }
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
