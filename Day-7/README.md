

# Day-7 | Terraform Vault Integration | Secrets Management

This README provides a practical guide to integrating Terraform with HashiCorp Vault for secrets management. Follow these steps to understand how to authenticate with Vault, read secrets, and apply them in a Terraform configuration.

## Prerequisites
- Terraform installed ([Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli))
- HashiCorp Vault instance ([Install Vault](https://learn.hashicorp.com/tutorials/vault/getting-started-install))

## Create an AWS EC2 instance with Ubuntu

To create an AWS EC2 instance with Ubuntu, you can use the AWS Management Console or the AWS CLI. Here are the steps involved in creating an EC2 instance using the AWS Management Console:

- Go to the AWS Management Console and navigate to the EC2 service.
- Click on the Launch Instance button.
- Select the Ubuntu Server xx.xx LTS AMI.
- Select the instance type that you want to use.
- Configure the instance settings.
- Click on the Launch button.

## Install Vault on the EC2 instance

To install Vault on the EC2 instance, you can use the following steps:

**Install gpg**

```bash
sudo apt update && sudo apt install gpg
Download the signing key to a new keyring

wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
Verify the key's fingerprint

gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
Add the HashiCorp repo

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
Finally, Install Vault

sudo apt install vault
Start Vault
To start Vault, you can use the following command:

vault server -dev -dev-listen-address="0.0.0.0:8200"
Configure Terraform to read the secret from Vault
Detailed steps to enable and configure AppRole authentication in HashiCorp Vault:

Enable AppRole Authentication:
To enable the AppRole authentication method in Vault, you need to use the Vault CLI or the Vault HTTP API.

Using Vault CLI:

Run the following command to enable the AppRole authentication method:

vault auth enable approle
This command tells Vault to enable the AppRole authentication method.

Create an AppRole:
Create a policy named "terraform":

vault policy write terraform - <<EOF
path "*" {
  capabilities = ["list", "read"]
}

path "secrets/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "kv/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "secret/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "auth/token/create" {
  capabilities = ["create", "read", "update", "list"]
}
EOF
Create an AppRole with the policy:

vault write auth/approle/role/terraform \
    secret_id_ttl=10m \
    token_num_uses=10 \
    token_ttl=20m \
    token_max_ttl=30m \
    secret_id_num_uses=40 \
    token_policies=terraform
Generate Role ID and Secret ID:
After creating the AppRole, you need to generate a Role ID and Secret ID pair. The Role ID is a static identifier, while the Secret ID is a dynamic credential.

Generate Role ID:

Retrieve the Role ID using the Vault CLI:

vault read auth/approle/role/terraform/role-id
Generate Secret ID:

Generate a Secret ID:

vault write -f auth/approle/role/terraform/secret-id
Steps
1. Configure Vault Authentication
 🛡️ Set up Vault with AppRole authentication method.
🔑 Generate Role ID and Secret ID.
2. Initialize Terraform
 🚀 Initialize Terraform with required providers and configurations.
3. Read Secrets from Vault
🗝️ Use Terraform to read secrets from Vault using data sources.
4. Apply Secrets in Terraform Configuration
 📜 Apply retrieved secrets within your Terraform resources.
5. Verify Integration
 ✅ Test and verify if secrets are correctly applied in your infrastructure.
Example Code Snippet
provider "vault" {
  address = "http://vault.example.com"
  skip_ch_token_request = true
}

data "vault_generic_secret" "example" {
  path = "secret/data/test"
}

resource "aws_instance" "example" {
  ami           = "ami-0abc123456789def0"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
    Secret = data.vault_generic_secret.example.data.username
  }
}
Replace placeholders (vault.example.com, ami-0abc123456789def0, etc.) with your actual values.

Conclusion
By following these steps, you've successfully integrated Terraform with HashiCorp Vault for secrets management. Experiment with different Vault configurations and Terraform resources to further enhance your infrastructure automation.



For a detailed walkthrough and explanation, watch the full video here.


This README now includes detailed steps for creating an EC2 instance with Ubuntu and integrating Vault with Terraform. You can further customize it based on your specific environment and configurations.
