# Complete Beginner Guide

This guide is designed for users who are completely new to Databricks, Terraform, or cloud platforms. If you have little or no prior experience, follow the steps below to get started using this repository. The instructions focus on command-line (CLI) workflows rather than web interfaces. Begin by choosing the cloud provider where you want to deploy your Databricks Workspace, then proceed through each step in order.


## Step 1: Sign Up for a Cloud Provider & Databricks

First, you need an account with your chosen cloud provider. Pick one of the following:

- **AWS:** [Sign up for AWS](https://portal.aws.amazon.com/billing/signup)
- **Azure:** [Sign up for Azure](https://azure.microsoft.com/en-us/free/)
- **GCP:** [Sign up for Google Cloud](https://console.cloud.google.com/freetrial)

Follow the instructions to create your account. You may need to provide a credit card for verification.

You also need to sign up with Databricks:
- **Databricks:** [Sign up for Databricks](https://www.databricks.com/try-databricks)
- _(Optional) Try the Express Setup for serverless workspace running on AWS_

Alternatively Databricks can also be signed-up from individual cloud provider if you already have them:
- **AWS:** [Sign up from AWS Marketplace](https://docs.databricks.com/aws/en/getting-started/onboarding-account)
- **Azure:** [Sign up from Azure Databricks](https://learn.microsoft.com/en-us/azure/databricks/getting-started/free-trial)
- **GCP:** [Sign up from GCP Marketplace](https://docs.databricks.com/gcp/en/getting-started/free-trial)
---

## Step 2: Install the Cloud CLI

You will need the command-line interface (CLI) for your chosen cloud provider.

### AWS CLI

- [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- Check successful installation by running:
  ```bash
  aws --version
  ```
- [Get started with AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html)

### Azure CLI

- [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- Check successful installation by running:
  ```bash
  az --version
  ```
- [Get started with Azure CLI](https://learn.microsoft.com/en-us/cli/azure/get-started-with-azure-cli?view=azure-cli-latest)

### Google Cloud SDK (gcloud)

- [Install Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- After installation, run:
  ```bash
  gcloud --version
  ```
- [Get started with Gcloud CLI](https://cloud.google.com/sdk/docs/install-sdk#initializing_the)

---

## Step 3: Install Databricks CLI

- [Install Databricks CLI](https://docs.databricks.com/en/dev-tools/cli/index.html)
- The recommended way is via pip:
  ```bash
  pip install databricks-cli
  ```
- Verify installation:
  ```bash
  databricks --version
  ```

---

## Step 4: Install Terraform

- [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- Download the appropriate package for your OS and follow the instructions.
- Verify installation:
  ```bash
  terraform version
  ```

---

## Step 5: Authenticate to Your Cloud Provider

### AWS

- For SSO:
  ```bash
  aws configure sso
  aws sso login
  ```
- For access keys:
  ```bash
  aws configure
  ```
- Find [documentation here](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-authentication.html) for reference. SSO/IAM Identity Center authentication is recommended.

### Azure

- Login with:
  ```bash
  az login
  ```
- Find [documentation here](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli?view=azure-cli-latest) for more reference. This guide assumes you use with "Interactive Sign In" method.

### GCP

- Login with:
  ```bash
  gcloud auth login
  gcloud auth application-default login
  ```
  > **Note:** Some organizations may restrict this. If so, use a service account and download its JSON key.
- Find [documentation here](https://cloud.google.com/docs/authentication) for more reference. This guide is using service account and JSON file as the terraform authentication method.
---

## Step 6: Authenticate Databricks CLI

- You need to at least authenticate to your Databricks Account Console. Run:
  ```bash
  databricks auth login --host <account-console-url> --account-id <account-id>
  ```
- Follow the prompts to select your cloud and authenticate.
- Find [documentation here](https://docs.databricks.com/aws/en/dev-tools/auth/) for more reference. This guide assumes you use "Authenticate as a user" method.

---

## Step 7: Clone This Repository
### Clone the Example Repository

- Use `git` to clone this repository to your local machine:
  ```bash
  git clone https://github.com/work-apradana/terraform-databricks-examples.git
  cd terraform-databricks-examples
  ```
- This will give you access to all the example configurations for AWS, Azure, and GCP.

---

## Step 8: Choose and Review an Example

- Navigate to the folder for your target cloud provider:
  - `cd aws/` for Amazon Web Services
  - `cd azure/` for Microsoft Azure
  - `cd gcp/` for Google Cloud Platform
- Review the example Terraform files in the chosen directory.
- You can copy these files to your own project directory or use them as a starting point.

---

## Step 9: Customize Variables

- Edit the `variables.tf` file or create a `.tfvars` file to set values specific to your environment.
- Example: create a file named `sample.terraform.tfvars` and fill in the required variables.

---

## Step 10: Initialize and Apply Terraform

- Initialize the Terraform working directory:
  ```bash
  terraform init
  ```
- (Optional) Review the execution plan:
  ```bash
  terraform plan -var-file="sample.terraform.tfvars"
  ```
- Apply the configuration to create resources:
  ```bash
  terraform apply -var-file="sample.terraform.tfvars"
  ```

---

## Step 11: Clean Up Resources

- When finished, destroy the resources to avoid ongoing costs:
  ```bash
  terraform destroy -var-file="sample.terraform.tfvars"
  ```

---

## Next Steps

- Explore more advanced configurations in the repository.
- Refer to the official [Databricks Terraform provider documentation](https://registry.terraform.io/providers/databricks/databricks/latest/docs) for additional options and resources.
- Always follow your organization's best practices for cloud and data security.

