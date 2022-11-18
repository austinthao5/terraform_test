# Basic VPC
module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "3.2.0"

    name                 = "ec2-deploy-vpc"
    cidr                 = "10.0.0.0/16"
    azs                  = data.aws_availability_zones.available.names
    private_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]       # , "10.0.3.0/24"
    public_subnets       = ["10.0.4.0/24", "10.0.5.0/24"]       # , "10.0.6.0/24"
    create_database_subnet_group = true
    database_subnet_group_name   = "austin-subnet-group-db"
    database_subnets     = ["10.0.6.0/24","10.0.7.0/24"]      
    enable_nat_gateway   = true
    single_nat_gateway   = true
    enable_dns_hostnames = true
    create_igw = true
    # create_database_nat_gateway_route = true

    tags = {
    "customer_name" = "${var.customer_name}"
    }

    public_subnet_tags = {
    "immutable_metadata" = "{"purpose":"ec2-vpc"}",
    "createdBy"          = "Austin"
    }

    private_subnet_tags = {
    "createdBy" = "Austin"
    }
}
