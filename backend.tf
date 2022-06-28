terraform {
  required_version = ">= 0.12.0"

  backend "s3" {
    region         = "us-west-1"
    bucket         = "austin-artifacts"
    key            = "terraform_backend/example_backend.tfstate"
    encrypt        = true
  }
}
