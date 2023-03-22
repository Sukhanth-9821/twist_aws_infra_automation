resource "aws_vpc" "twist_vpc" {
  cidr_block       = "${var.cidr_block}"
  tags = {
    Name = "${var.vpc_tag_name}_vpc-${terraform.workspace}"
  }
}