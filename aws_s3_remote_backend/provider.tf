##########################################################################
## Pre-req below
## 1. S3 bucket should be created beforehand
## 2. Fore remote locking, dyanamo db table should be created beforehand 
########################################################################## 

terraform {
  backend "s3" {
    bucket = "s3backend-terraform"
    key    = "tf/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf-lock"
    access_key = ""
    secret_key = ""
  }
}