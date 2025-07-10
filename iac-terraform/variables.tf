variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "The tenancy of the instances in the VPC"
  type        = string
  default     = "default"
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-01c837d5176a7605d"
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type        = string
  default     = "subnet-0ab7ef12823c1b8c3"
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
  default     = "tf-sshkey"
}

variable "instance_name" {
  description = "The name of the EC2 instance"
  type        = string
  default     = "c3ops"
}

variable "Environment" {
  description = "The environment for the EC2 instance"
  type        = string
  default     = "Dev"
}

variable "region" {
  description = "The AWS region to deploy the resources in"
  type        = string
  default     = "ap-south-2"

}