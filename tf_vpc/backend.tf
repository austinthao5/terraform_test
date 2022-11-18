backend "s3" {
  region         = "us-east-2"
  bucket         = "austin-artifacts"
  key            = "terraform_backend/ec2-vpc.tfstate"
  encrypt        = true
}

