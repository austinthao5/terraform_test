  resource "aws_s3_bucket" "b" {
  bucket = "austin-bucket-test"
  acl = "private"

  tags = {
    Name        = "Austins bucket"
  }
}
