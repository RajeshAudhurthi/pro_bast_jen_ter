# vpc
resource "aws_vpc" "vpc" {
  cidr_block       = var.vpccidr
  instance_tenancy = "default"

  tags = {
    Name = "my-vpc"
  }

  enable_dns_hostnames = true
}