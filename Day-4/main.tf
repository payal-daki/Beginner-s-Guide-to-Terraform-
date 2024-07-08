provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "payal" {
  instance_type = "t2.micro"
  ami = "ami-id" # change this
  subnet_id = "subnet-id" # change this
}

resource "aws_s3_bucket" "s3_bucket"{
    bucket = "dp-s3-demo-npl" 
}
resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
