# Define variables
variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "region" {}
variable "tag_name" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "identity" {}
variable "vpc_security_group_ids" {
  type = "list"
}
