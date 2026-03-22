# variables.tf
# Defines all input variables for our infrastructure

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance (Ubuntu 22.04)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Name of the AWS key pair for SSH access"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for logs"
  type        = string
}
