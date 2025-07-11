# terraform state file
terraform {
  backend "s3" {
    bucket = "c3opstfstatemgmt"
    key    = "terraform.tfstate"
    region = "ap-south-2"
    #dynamodb_table = "c3ops-terraform-lock"
    encrypt = true
  }
}