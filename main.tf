terraform {
  required_version = ">= 1.3.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.39"
    }
  }

  backend "s3" {
    region = "eu-central-1"
    bucket = "husovschi-terraform"
    key    = "aws-infra/terraform.tfstate"
  }
}

# AWS Provider
provider "aws" {
  region = "eu-central-1"
}

module "vps" {
  source = "./modules/vps"
}