provider "aws" {
  region     = "us-west-2"
}

resource "aws_vpc" "main-vpc" {
  cidr_block = var.vpc-cidr

  tags = {
    Name = var.tag_name
  }
}

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
