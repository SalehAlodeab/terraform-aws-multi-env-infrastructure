variable "environment" {
  description = "the environment name (dev,prod,...)"
  type        = string
}

variable "vpc_id" {
  description = "the ID of the VPC where resources will be created"
  type        = string
}

variable "public_subnet_id" {
  description = "the ID of the public Subnet for the web server"
  type        = string
}

variable "instance_type" {
  description = "The type of the instance"
  type        = string
}

variable "key_name" {
  description = "the SSH key name to access the instance"
  type        = string
}
