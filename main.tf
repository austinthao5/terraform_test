resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "artifactory_user" "foobar" {
	name  = "the.dude"
  email = "the.dude@domain.com"
}
