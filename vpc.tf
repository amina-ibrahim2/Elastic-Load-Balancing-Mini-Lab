# Create VPC
resource "aws_vpc" "my-test-vpc" {
    cidr_block            = var.vpc_cidr
    instance_tenancy      = "default"
    enable_dns_hostnames  = true 
}

