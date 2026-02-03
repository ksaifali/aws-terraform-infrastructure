AWS Infrastructure Provisioning using Terraform (IaC)
Overview

This repository demonstrates how to provision AWS infrastructure using Terraform, following Infrastructure as Code (IaC) principles.

Instead of manually creating resources through the AWS Console, Terraform allows us to define infrastructure using code, store it in version control, review changes via pull requests, and recreate the same infrastructure reliably across environments.

This project focuses on provisioning an EC2 instance as a starting point, but the structure is designed to scale for additional AWS resources.


Why Infrastructure as Code?

raditional (Manual) Approach

Infrastructure is often created by:

Clicking through the AWS Management Console

Running ad-hoc AWS CLI commands

While this works initially, it introduces problems:

No version control

Manual errors

Difficult to reproduce infrastructure

Configuration drift over time

Hard to audit or roll back changes
Infrastructure as Code (IaC)

With IaC:

Infrastructure is defined using code

Changes are tracked in Git

Environments are reproducible

Infrastructure changes go through code reviews

Terraform is one of the most widely used tools to achieve this.
Why Terraform?

Terraform provides:

Automation – No manual clicks

Consistency – Same code produces the same infrastructure

Version Control – Infrastructure changes are reviewed like application code

Idempotency – Safe to run multiple times

Multi-cloud support – Not locked to a single provider

Easy cleanup – Infrastructure can be destroyed with a single command.

📁 Project Structure

aws-terraform-infrastructure/
├── main.tf        # Core infrastructure resources
├── provider.tf    # Terraform & AWS provider configuration
├── variables.tf   # Input variables
├── outputs.tf     # Output values after provisioning
└── README.md


AWS Configuration for Terraform (Step-by-Step)

Terraform does not store AWS credentials itself.
Instead, it securely reads credentials configured via the AWS CLI.

Step 1: Create an IAM User

Go to AWS Console → IAM

Create a new user

Enable Programmatic access

Attach permissions (for learning/demo):

AmazonEC2FullAccess

AmazonVPCFullAccess (optional for future expansion)

⚠️ In production, always follow least privilege.

Step 2: Install AWS CLI

Verify installation:

aws --version

Step 3: Configure AWS Credentials
aws configure

Enter:

AWS Access Key ID

AWS Secret Access Key

Default region (e.g. us-east-1)

Output format (json)

This stores credentials securely in:

~/.aws/credentials


Terraform will automatically use these credentials.

Terraform Configuration Explanation
Provider Configuration

The AWS provider defines which cloud and region Terraform will use.

provider "aws" {
  region = var.aws_region
}



AMI Selection (Best Practice)

Instead of hardcoding an AMI ID, this project dynamically fetches the latest Amazon Linux 2 AMI using a data source.

This ensures:

No outdated AMIs

Works across regions

Cleaner, future-proof code

▶️ Terraform Workflow
Step 1: Initialize Terraform
terraform init


Downloads required providers and prepares the working directory.

Step 2: Preview Changes
terraform plan


Shows what Terraform will create or modify before applying changes.

Step 3: Apply Configuration
terraform apply


Creates the infrastructure after confirmation.

Step 4: Destroy Infrastructure
terraform destroy


Safely removes all resources created by Terraform.

📤 Outputs

After successful execution, Terraform displays useful information such as:

EC2 Instance ID

Public IP address (if configured)

Outputs make it easy to integrate Terraform with other tools or pipelines

Terraform transforms infrastructure from a manual, error-prone process into a repeatable, auditable, and scalable workflow.

Managing infrastructure as code is a foundational DevOps practice and is essential for modern cloud environments.

📌 Future Improvements

Add VPC and Security Groups

Use remote backend (S3 + DynamoDB)

Introduce modules

Integrate with CI/CD pipeline

✨ Final Note

This project intentionally keeps the infrastructure simple to focus on IaC principles, clarity, and best practices rather than complexity.


