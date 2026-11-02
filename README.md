# Production Cloud Infrastructure as Code (IaC)

[![Terraform](https://img.shields.io/badge/Terraform-1.7+-844FBA?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![AWS Provider](https://img.shields.io/badge/AWS%20Provider-v5.0-orange?logo=amazon-aws&logoColor=white)](https://registry.terraform.io/providers/hashicorp/aws/latest)
[![CI/CD](https://img.shields.io/badge/CI%2FCD-Automated%20Plan%20%26%20Check-blue?logo=github-actions&logoColor=white)](#)

Production-grade, modular Infrastructure as Code (IaC) managing multi-region AWS cloud resources, Elastic Kubernetes Service (EKS) clusters, secure networking, and database persistence.

---

## ️ Architecture & Component Topology

```text
cloud-infrastructure-iac/
├── .github/
│   └── workflows/
│       └── terraform-ci.yml        # Format check, validation, and PR plan comments
├── modules/
│   ├── vpc/                       # Multi-AZ VPC with NAT Gateways & Flow Logs
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── eks/                       # EKS Cluster with managed node groups & IRSA
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── rds/                       # Multi-AZ Aurora PostgreSQL with KMS encryption
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── environments/
    ├── dev/
    │   ├── main.tf
    │   ├── terraform.tfvars
    │   └── backend.tf
    └── prod/
        ├── main.tf
        ├── terraform.tfvars
        └── backend.tf
```

---

##  Security Best Practices Implemented

1. **State Protection**: Remote state stored in AWS S3 with AES-256 server-side encryption and DynamoDB distributed state locking.
2. **Least Privilege**: IAM Roles for Service Accounts (IRSA) eliminates static AWS credentials inside Kubernetes pods.
3. **Network Isolation**: EKS worker nodes and databases reside exclusively in private subnets with strict Security Group boundaries.
4. **Automated Gating**: Checkov and tfsec static analysis runs automatically on all Pull Requests.

---

##  Deployment

```bash
cd environments/prod
terraform init
terraform plan -out=tfplan
terraform apply tfplan
```

---

##  Author

**Emaan Humayun**
- GitHub: [@EmaanHumayun](https://github.com/EmaanHumayun)
- LinkedIn: [Emaan Humayun](https://linkedin.com/in/www.linkedin.com/in/emaanmuhammadhumayun)

