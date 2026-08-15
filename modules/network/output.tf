output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "The ID of the public Subnet"
  value       = aws_subnet.public.id
}

output "private_subnet" {
  description = "The ID of the Private Subnet"
  value       = aws_subnet.private.id
}
