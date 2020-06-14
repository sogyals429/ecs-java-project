terraform {
  backend "s3" {
    bucket = "terraform-aws-ecs"
    key = "terraform.tfstate.d"
    region = "ap-southeast-2"
  }
}

provider "aws" {
  version = "~> 2.0"
  region = "ap-southeast-2"
}
