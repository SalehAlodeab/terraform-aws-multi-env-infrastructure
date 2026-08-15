provider "aws" {
  region = var.aws_region
}

locals {
  env = terraform.workspace == "default" ? "dev" : terraform.workspace
}

# == Network Module ==

module "network" {
  source = "../modules/network"

  environment         = local.env
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
}

# == Compute Module ==

module "compute" {
  source = "../modules/compute"

  environment      = local.env
  key_name         = var.ssh_key
  instance_type    = lookup(var.instance_sizes, local.env, "t3.micro")
  vpc_id           = module.network.vpc_id
  public_subnet_id = module.network.public_subnet_id
}

output "website_url" {
  description = "the public IP address to access the web server"
  value       = "http://${module.compute.server_public_ip}"
}

