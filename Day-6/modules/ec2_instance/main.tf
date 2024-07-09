provider "aws" {
    region = "us-east-1" 
}

variable "ami" {
    description = "value"
}

variable "aws_instance" {
    description = "value" 
}

variable "subnet" {
    description = "value" 
}

module "ec2_instance" {
    source = "./modules/ec2_instance" 
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_id
}
