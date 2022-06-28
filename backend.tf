terraform {
  required_version = ">= 0.12.0"

  backend "s3" {
    region         = "us-west-2"
    bucket         = "austin-artifacts"
    key            = "terraform_backend/example.tfstate"
    encrypt        = "true"
  }
}
