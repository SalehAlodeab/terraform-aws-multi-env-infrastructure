variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "eu-north-1"
}

variable "ssh_key" {
  description = "The name of the existing SSH key in AWS"
  type        = string
  default     = "my-aws-key"
}

variable "instance_sizes" {
  description = "Map of instance types based on workspace environment"
  type        = map(string)
  default = {
    "dev"  = "t3.micro"
    "prod" = "t3.micro"
  }
}
