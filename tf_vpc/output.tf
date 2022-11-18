output "vpc_tag" {
  value = var.spin_tags
}

output "sg_id" {
 value = data.aws_security_group.selected.id 
}
