terraform {
  backend "s3" {
    region         = "us-west-2"
    bucket         = "austin-lambda"
    key            = "example_backend.tfstate"
    encrypt        = true
  }
}
