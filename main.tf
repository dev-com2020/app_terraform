terraform {
  required_version = ">= 1.9.2"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
    google = {
      source = "hashicorp/google"
      version = "5.37.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "eu-central-1"
}
provider "google" {
  # Configuration options
}