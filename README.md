# Azure AKS Infrastructure using Terraform

## Overview

This repository contains Terraform Infrastructure as Code (IaC) configuration to provision Azure Kubernetes Service (AKS) infrastructure using reusable Terraform modules.

The project follows a modular approach where each Azure resource has a separate child module and is consumed by the parent module.

## Infrastructure Components

This Terraform code provisions:

- Azure Resource Group
- Azure Container Registry (ACR)
- Azure Kubernetes Service (AKS)
- AKS Default Node Pool
- Terraform Remote State Management Ready

---

## Project Structure

```bash
terraform-azure-aks/

├── child_module
│
│   ├── acr
│   │   ├── main.tf
│   │   ├── variable.tf
│   │   └── output.tf
│   │
│   ├── aks
│   │   ├── main.tf
│   │   ├── variable.tf
│   │   └── output.tf
│   │
│   └── resource_group
│       ├── main.tf
│       ├── variable.tf
│       └── output.tf
│
└── parent_module

    ├── main.tf
    ├── providers.tf
    ├── variable.tf
    ├── terraform.tfvars
    ├── output.tf
    └── .terraform.lock.hcl
```

---

## Terraform Modules

### Resource Group Module

Creates Azure Resource Group.

Example Configuration:

```hcl
resource_group = {

  rg = {

    name     = "aks-RG"
    location = "Central india"

  }

}
```

---

## Azure Container Registry Module

Creates Azure Container Registry.

Example:

```hcl
acr = {

  dev = {

    name                = "rishidevacr2026"
    resource_group_name = "aks-RG"
    location            = "centralindia"
    sku                 = "Standard"
    admin_enabled       = false

  }

}
```

---

## Azure Kubernetes Service Module

Creates AKS Cluster with default node pool.

Example:

```hcl
aks_cluster = {

  dev = {

    name                = "dev-aks-cluster"
    location            = "centralindia"
    resource_group_name = "aks-RG"

    dns_prefix = "devaks"

    node_pool = {

      name       = "system"
      node_count = 2
      vm_size    = "Standard_D2s_v3"

    }

  }

}
```

---

# Deployment Steps

## 1. Clone Repository

```bash
git clone <repository-url>

cd parent_module
```

---

## 2. Terraform Initialization

Initialize terraform providers:

```bash
terraform init
```

---

## 3. Validate Configuration

```bash
terraform validate
```

Expected:

```bash
Success! The configuration is valid.
```

---

## 4. Format Terraform Code

```bash
terraform fmt -recursive
```

---

## 5. Review Terraform Plan

```bash
terraform plan
```

---

## 6. Deploy Infrastructure

```bash
terraform apply -auto-approve
```

---

## 7. Destroy Infrastructure

```bash
terraform destroy -auto-approve
```

---

# Versioning Strategy

This repository follows Semantic Versioning.

Format:

```bash
vMAJOR.MINOR.PATCH
```

Example:

| Version | Description |
|----|----|
| v1.0.0 | Initial AKS Infrastructure |
| v1.1.0 | Added new modules/features |
| v1.1.1 | Bug fixes |

Create Git Tag:

```bash
git tag -a v1.0.0 -m "Initial AKS Terraform Release"
```

Push Tag:

```bash
git push origin v1.0.0
```

---

# Git Workflow

Feature branch:

```bash
git checkout -b feature/aks-module
```

Commit:

```bash
git add .

git commit -m "Added AKS Terraform module"
```

Push:

```bash
git push origin feature/aks-module
```

---

# Best Practices Implemented

✔ Terraform Modular Architecture  
✔ Reusable Child Modules  
✔ Environment Based tfvars  
✔ Azure Provider Configuration  
✔ Semantic Versioning  
✔ Git Tag Based Releases  
✔ Infrastructure as Code  

---

# Tools & Technologies

- Terraform
- Azure Cloud
- Azure Kubernetes Service
- Azure Container Registry
- Git/GitHub

---

# Author

Maintained by: Rishikesh Sharma
