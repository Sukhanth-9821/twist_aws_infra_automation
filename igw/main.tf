resource "aws_internet_gateway" "twist_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "twist_igw-${terraform.workspace}"
  }
}