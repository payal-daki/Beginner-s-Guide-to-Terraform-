provider "aws" {
    region = "us-east-1"
}

variable "ami" {
    description = "ami for ec2 instance"
}

variable "instance_type" {
    description = "this is instance type"
    type = map(string)

  default = {
    "dev" = "t2.micro"
    "stage" = "t2.micro"
    "prod" = "t2.micro"
  }

 
}

variable "subnet" {
    description = "this is for subnet -id"
  
}


resource "aws_instance" "example" {
    ami = var.ami
    instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
    subnet_id = var.subnet
}
