terraform {
  backend "s3" {
    bucket = "terraformtechchallenge"
    region = "us-west-2"
    key = "eks/terraform.tfstate"
  }
}