terraform {
  backend "s3" {
    bucket         = "saleh-terraform-state-backend-202666"
    key            = "infrastructure/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    use_lockfile = true
  }
}
