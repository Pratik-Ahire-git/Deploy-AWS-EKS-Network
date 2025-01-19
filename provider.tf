terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.66.0"
    }
  }
  backend "s3" {
    bucket         = "demonbucket666"
    key            = "LockID"
    region         = "ap-south-2"
    dynamodb_table = "demontable"


  }
}

provider "aws" {
  region = "ap-south-2"
}

locals {
  cluster_name    = "Nop_cluster"
  node_group_name = "Nop_node_group"
  ec2_ssh_key     = "MasterKey"
}