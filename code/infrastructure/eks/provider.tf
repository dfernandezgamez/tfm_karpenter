terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.6.1"
    }
     aws = {
      source  = "hashicorp/aws"
      version = ">= 3.70.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
