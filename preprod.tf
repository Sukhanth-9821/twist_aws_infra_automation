module "twist_vpc"{
    source = "./vpc"
    cidr_block = var.cidr_block
    vpc_tag_name = var.vpc_tag_name
}

module "twist_snet"{
    source = "./subnet"
    project_name = var.project_name
    vpc_id = module.twist_vpc.twist_vpc_id
    #pub_snet_cidr = var.pub_snet_cidr
    public_subnet_count = var.public_subnet_count
    private_subnet_count = var.private_subnet_count
}

module "twist_igw"{
    source = "./igw"
    vpc_id = module.twist_vpc.twist_vpc_id
}