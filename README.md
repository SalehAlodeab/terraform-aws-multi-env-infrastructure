# ☁️ Automated Multi-Environment AWS Infrastructure

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)
![RHEL](https://img.shields.io/badge/Red%20Hat-EE0000?style=for-the-badge&logo=redhat&logoColor=white)

## 📌 Project Overview
This project demonstrates an enterprise-grade Infrastructure as Code (IaC) deployment on AWS. It utilizes **Terraform** to provision highly available networking and compute resources, dynamically switching between `dev` and `prod` environments from a single codebase using Terraform Workspaces.

## 🏗️ Architecture & Key Features
*   **Modular Design:** Custom Terraform Modules separating Network provisioning (VPC, Subnets, IGW, Route Tables) from Compute resources (EC2, Security Groups) for maximum reusability.
*   **Environment Isolation:** Leverages `terraform workspace` to deploy isolated environments. Instance sizes dynamically scale based on the active workspace (e.g., `t2.micro` for dev, `t2.large` for prod).
*   **Remote State Management:** Secures infrastructure state using an S3 backend with state locking (`use_lockfile = true`) to prevent corruption during team collaboration.
*   **Automated Server Bootstrapping:** Uses `user_data` bash scripts to automatically update OS packages, install, and configure Apache web servers on instance boot.
*   **Dynamic AMI Fetching:** Utilizes Terraform Data Sources to dynamically query and fetch the latest secure Red Hat Enterprise Linux 9 (RHEL 9) images.

## 📂 Project Structure
.
├── backend-setup/          # Infrastructure for remote state (S3 Bucket creation)
│   ├── main.tf             # S3 bucket configuration with versioning & prevent_destroy
│   └── provider.tf
├── environments/           # Root module connecting everything
│   ├── backend.tf          # Remote state configuration pointing to S3
│   ├── main.tf             # Module invocations and workspace logic
│   └── variables.tf        # Variable definitions including environment maps
└── modules/                # Reusable Terraform templates
    ├── compute/            # EC2, Security Groups, Data Sources, user_data
    └── network/            # VPC, Subnets, Internet Gateway, Routing


## 🚀 How to Run

**1. Setup the Remote Backend:**
cd backend-setup
terraform init
terraform apply


**2. Provision the Infrastructure:**
cd ../environments
terraform init

# Create and switch to a workspace (e.g., dev or prod)
terraform workspace new dev

# Review the execution plan
terraform plan

# Apply the configuration
terraform apply


## 👨‍💻 Author
**Saleh Alodeab**
*Cloud Computing & IT Infrastructure Specialist*

