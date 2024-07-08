terraform {
  backend "s3" {
    bucket = "dp-s3-demo-hemal1"
    region = "us-east-1"
    key    = "devpay/terraform.tfstate"
  }
}
