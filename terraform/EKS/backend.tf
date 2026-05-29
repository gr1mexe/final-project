terraform {
  backend "s3" {
    bucket         = "danit-devops-tf-state-900132385534"
    key            = "eks/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "lock-tf-eks"
  }
}