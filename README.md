# AWS N-Tier Network With EKS Cluster Deployment

## Project Overview

In this project, I have deployed a scalable and secure N-tier architecture on AWS using Terraform. The architecture consists of a Virtual Private Cloud (VPC) with two public and two private subnets, enabling efficient routing and security for an EKS (Elastic Kubernetes Service) cluster. Additionally, I have set up an S3 bucket as a backend for storing Terraform state files.

## Architecture Components

### VPC Configuration
- **VPC CIDR Block**: `10.0.0.0/16`
- **Public Subnets**:
  - **Public Subnet 1**: `10.0.0.0/24`
  - **Public Subnet 2**: `10.0.1.0/24`
- **Private Subnets**:
  - **Private Subnet 1**: `10.0.2.0/24`
  - **Private Subnet 2**: `10.0.3.0/24`

### Networking Components
- **Internet Gateway**: I attached an internet gateway to the VPC to allow internet access for public subnets.
- **Route Tables**:
  - **Public Route Table**: I configured this route table to route traffic from public subnets to the internet gateway.
  - **Private Route Table**: I set up this route table for private subnets to route traffic through a NAT gateway for outbound internet access.

### Security
- **Security Groups**:
  - I configured security groups to control inbound and outbound traffic for resources in both public and private subnets.

### IAM Roles
- I created IAM roles to provide necessary permissions for the EKS cluster to interact with other AWS services securely.

### EKS Cluster
- I deployed an EKS cluster within the VPC, utilizing the private subnets for running application workloads.

### Terraform Backend
- I created an S3 bucket to store Terraform state files, ensuring that the state is managed remotely and securely.
- Additionally, I set up a DynamoDB table for state locking, preventing simultaneous operations that could corrupt the state.

## Terraform Configuration

The infrastructure is defined using Terraform, allowing me to easily replicate and manage resources. The following key resources are included in my Terraform configuration:

- VPC
- Subnets (Public and Private)
- Route Tables
- Security Groups
- Internet Gateway
- IAM Roles
- EKS Cluster
- S3 Bucket (for backend)
- DynamoDB Table (for state locking)

### Example Backend Configuration

In my `backend.tf` file, I included the following configuration to set up the S3 backend:

```hcl
terraform {
  backend "s3" {
    bucket         = "your-s3-bucket-name"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "your-dynamodb-table-name"
    encrypt        = true
  }
}
```

## Deployment Instructions

1. **Prerequisites**:
   - Ensure you have Terraform installed on your local machine.
   - Configure your AWS credentials.

2. **Clone the Repository**:
   ```bash
   git clone https://github.com/Pratik-Ahire-git/Deploy-AWS-EKS-Network.git
   cd Deploy-AWS-EKS-Network.git
   ```

3. **Initialize Terraform**:
   ```bash
   terraform init
   ```

4. **Plan the Deployment**:
   ```bash
   terraform plan -var-file="variables.tfvars"
   ```

5. **Apply the Configuration**:
   ```bash
   terraform apply -var-file="variables.tfvars"
   ```

6. **Verify Deployment**:
   - I recommend checking the AWS console to confirm that the VPC, subnets, route tables, security groups, EKS cluster, S3 bucket, and DynamoDB table have been created successfully.

## Conclusion

In this project, I successfully deployed an N-tier architecture on AWS using Terraform, providing a scalable and secure environment for applications running in an EKS cluster while utilizing S3 for remote state management and DynamoDB for state locking.
