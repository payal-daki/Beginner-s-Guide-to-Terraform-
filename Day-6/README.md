
```markdown
# Terraform Workspaces Demo

Learn how to manage multiple environments using Terraform Workspaces efficiently.

## Overview

This repository demonstrates how to use Terraform Workspaces to manage different environments (Dev, Stage, Prod) for deploying infrastructure on AWS using Terraform.


## Key Concepts

 🌍 Terraform Workspaces allow you to manage separate state files for each environment, preventing interference between different deployments.
  
 📂 Use `terraform workspace new <workspace>` to create a new environment workspace, ensuring isolation of resources and configurations.
  
 🔄 Switch between workspaces with `terraform workspace select <workspace>` to deploy configurations specific to each environment without modifying the core infrastructure code.
  
 🛠️ Use Terraform `lookup` function in `main.tf` to dynamically select instance types based on the workspace, enhancing automation and reducing code duplication.

## Example Usage

### Prerequisites

- Terraform installed locally
- AWS IAM credentials configured

### Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/terraform-workspaces-demo.git
   cd terraform-workspaces-demo
   ```

2. Initialize Terraform and select your desired workspace:
   ```bash
   terraform init
   terraform workspace select dev
   ```

3. Review and apply the configuration:
   ```bash
   terraform plan
   terraform apply
   ```

4. Switch to another workspace and deploy:
   ```bash
   terraform workspace select stage
   terraform apply
   ```

5. Clean up resources when no longer needed:
   ```bash
   terraform destroy
   ```

### Directory Structure

```
.
├── main.tf         # Main Terraform configuration
├── dev.tfvars      # Variables specific to dev environment
├── stage.tfvars    # Variables specific to stage environment
├── prod.tfvars     # Variables specific to prod environment
└── README.md       # This README file
```

## Conclusion

By leveraging Terraform Workspaces, you can maintain scalable and consistent infrastructure deployments across multiple environments efficiently.


