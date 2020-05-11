  resource "aws_s3_bucket" "b" {
  bucket = var.austin-test-tf-bucket
  acl = "private"
  bucket_name = "NAME"

  tags = {
    Name        = "Austins bucket"
  }
}
