provider "aws" {
  region     = "us-west-2"
}

resource "aws_vpc" "main-vpc" {
  cidr_block = var.vpc-cidr

  tags = {
    Name = var.tag_name
  }
}

# variable "security_group_id" {}

data "aws_security_group" "selected" {
  id = aws_vpc.main-vpc.default_security_group_id
}

# data "aws_security_group" "defaultSecurityGroup" {
#   name        = "defaultSecurityGroup"
#   description = "Allow all traffic"
#   vpc_id      = aws_vpc.main-vpc.id

#   ingress {
#     description      = "TLS from VPC"
#     from_port        = All
#     to_port          = All
#     protocol         = "All"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port        = All
#     to_port          = All
#     protocol         = "All"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "Allow all traffic"
#   }
# }

resource "aws_subnet" "main-subnet" {
  for_each = var.prefix
 
  availability_zone_id = each.value["az"]
  cidr_block = each.value["cidr"]
  vpc_id     = aws_vpc.main-vpc.id

  tags = {
    Name = "${var.basename}-subnet-${each.key}"
    immutable_metadata = "{\"purpose\":\"${var.spin_tags}\"}"
  }
}
