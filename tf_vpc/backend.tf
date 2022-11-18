backend "s3" {
  region         = "us-east-2"
  bucket         = "austin-artifacts"
  key            = "terraform_backend/example_backend.tfstate"
  encrypt        = true
}
