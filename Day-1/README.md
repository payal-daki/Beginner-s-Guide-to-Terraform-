
```markdown
# demo-terraform

## Creating an EC2 Instance with Terraform

Welcome to the demo-terraform repository! This guide will walk you through the steps to create an EC2 instance on AWS using Terraform.

### Prerequisites

Ensure you have Terraform installed. If not, install it from [Terraform's official website](https://www.terraform.io/downloads.html).

### Steps

1. **Initialize Terraform in Your Project:**

   Ensure Terraform is initialized in your project directory.

   ```bash
   terraform init
   ```

2. **Write Terraform Configuration (`main.tf`) File:**

   Create a `.tf` file (e.g., `main.tf`) and define your AWS provider and EC2 instance configuration. Here's a basic example:

   ```hcl
   provider "aws" {
     region = "us-east-1"  # Specify your desired AWS region
   }

   resource "aws_instance" "example" {
     ami           = "ami-0c55b159cbfafe1f0"  # Replace with your desired AMI ID
     instance_type = "t2.micro"               # Specify your desired instance type
     subnet_id     = "subnet-12345678"        # Replace with your subnet ID

     tags = {
       Name = "ExampleInstance"  # Add tags as needed
     }
   }
   ```

3. **Review and Validate Terraform Plan:**

   Run `terraform plan` to review the execution plan and ensure no issues.

   ```bash
   terraform plan
   ```

4. **Apply Terraform Configuration:**

   Execute `terraform apply` to apply the Terraform configuration and create the EC2 instance.

   ```bash
   terraform apply
   ```

5. **Confirm EC2 Instance Creation:**

   Check the AWS Management Console or use AWS CLI to verify that your EC2 instance has been created successfully.

6. **Clean Up (Optional):**

   If needed, use `terraform destroy` to remove the resources created by Terraform.

   ```bash
   terraform destroy
   ```

### Interactive Guide

Feel free to interact with the steps above directly in your terminal or integrate them into your CI/CD pipelines for automated infrastructure provisioning.

Adjust the configuration (`ami`, `instance_type`, `subnet_id`, etc.) according to your specific requirements and AWS environment.

Happy Terraforming! 🚀


