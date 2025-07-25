# Terraform Databricks Examples

## Introduction

This repository contains practical examples of using [Terraform](https://www.terraform.io/) to deploy and manage [Databricks](https://databricks.com/) workspaces and resources across multiple cloud providers. It is intended as a reference for infrastructure engineers, data engineers, and anyone interested in automating Databricks deployments using Infrastructure as Code (IaC) principles.

You can find more comprehensive example of [Databricks Official Terraform examples](https://github.com/databricks/terraform-databricks-examples). This repository is meant as the lighter version of it, providing you with quick commonly used workspace configuration.

NOTE: This guide assumes you have some prior knowledge about Cloud and Terraform. If you are quite new about all this, you may want to follow the [Complete Beginner's Guide](./beginner-guide.md) for a more guided approach.


## Repository Structure

The repository is organized by provider, with each provider having its own directory:

- `aws/`   – For deploying Databricks on Amazon Web Services
- `azure/` – For deploying Databricks on Microsoft Azure
- `gcp/`   – For deploying Databricks on Google Cloud Platform


## How to Use This Repository

1. **Clone the Repository**
   ```bash
   git clone https://github.com/work-apradana/terraform-databricks-examples.git
   cd terraform-databricks-examples
   ```

2. **Choose Your Cloud Provider**
   - Navigate to the folder for your target cloud: `aws/`, `azure/`, or `gcp/`.

3. **Review and Customize**
   - Review the example Terraform files.
   - Copy the folder or files to your own project directory.
   - Edit variable values as needed (see `variables.tf` and example `.tfvars` files).

4. **Initialize and Apply**
   - Initialize Terraform:
     ```bash
     terraform init
     ```
   - (Optional) Review the execution plan:
     ```bash
     terraform plan -var-file="sample.terraform.tfvars"
     ```
   - Apply the configuration:
     ```bash
     terraform apply -var-file="sample.terraform.tfvars"
     ```

5. **Clean Up**
   - To destroy the resources created by the example:
     ```bash
     terraform destroy -var-file="sample.terraform.tfvars"
     ```

## Notes

- **Terraform Installation:** Look into [Teraform installation instructions](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) for terraform installation.
- **Credentials & Authentication:** In this example, User-2-Machine authentication is used for Databricks, AWS, and Azure. Meaning that you will need to setup cli and login using `databricks auth login`, `aws sso login`, or `az login`. This is to minimize presence of long term credentials such as service account/principal. For GCP, usually `gcloud auth application-default login` is used but since it is blocked by my organizational policy, service-account file is used instead. Feel free the application default login method if it suits you.
- **Sensitive Data:** Do not commit sensitive information (such as secrets or cloud credentials) to version control. Use `.tfvars` files and reference them locally.
- **Cost:** Note that the resources used in these examples are not all within Cloud's Free Tier limit. Most cost will come from networking component such as NAT gateway and data egress. 
- **Customization:** These examples are intended as starting points. Adapt them to fit your needs and best practices.

## Contributing

Contributions, improvements, and new examples are welcome! Please open an issue or submit a pull request.

## License

This repository is provided for educational purposes and is licensed under the MIT License.

---
