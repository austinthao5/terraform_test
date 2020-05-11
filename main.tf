  resource "aws_s3_bucket" "b" {
  bucket = "austin-bucket-test"
  acl = "private"
  bucket_name = "NAME"

  tags = {
    Name        = "Austins bucket"
  }
}
