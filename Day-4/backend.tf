terraform {
  backend "s3" {
    bucket = "dp-s3-demo-npl"
    region = "us-east-1"
    key    = "devpay/terraform.tfstate"
    dynamodb_table = "terraform_lock"
  }
}
