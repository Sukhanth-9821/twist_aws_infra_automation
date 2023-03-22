resource "aws_subnet" "public_subnet" {
  count = var.public_subnet_count >= 1 ? var.public_subnet_count : 0
  vpc_id     = var.vpc_id
  cidr_block = "20.0.${(count.index)+1}.0/24"

  tags = {
    Name = "${var.project_name}_public_snet-${terraform.workspace}"
  }
}

resource "aws_subnet" "private_subnet" {
  count = var.private_subnet_count >= 1 ? var.private_subnet_count : 0
  vpc_id     = var.vpc_id
  cidr_block = "20.0.${(count.index)+3}.0/24"

  tags = {
    Name = "${var.project_name}_private_snet-${terraform.workspace}"
  }
}
