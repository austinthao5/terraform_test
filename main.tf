  resource "aws_s3_bucket" "b" {
  acl = "private"

  tags = {
    Name        = "Austins bucket"
  }
}
