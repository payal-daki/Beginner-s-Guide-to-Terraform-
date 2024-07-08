provider "aws" {
    region = "us-east-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with your desired AMI ID
  instance_type = "t2.micro"               # Specify your desired instance type
  subnet_id     = "subnet-12345678"        # Replace with your subnet ID
  key_name = "aws_key_name"                 #add aws key pair
}
