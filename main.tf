terraform {
  required_version = ">= 1.9.2"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "eu-central-1"
}
resource "aws_vpc" "tomeczkowa" {
    cidr_block = "10.0.0.0/16"
  
}