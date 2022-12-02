terraform {
  required_providers {
    example = {
      version = "~> 1.0.0"
    }
  }
  backend "s3" {
    region         = "us-east-2"
    bucket         = "austin-artifacts"
    key            = "terraform_backend/example_backend.tfstate"
    encrypt        = true
  }
}
