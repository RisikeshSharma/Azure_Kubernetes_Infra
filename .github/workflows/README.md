# Azure Kubernetes Infrastructure Automation with Terraform & GitHub Actions

## Overview

This project automates Azure Kubernetes Service (AKS) infrastructure deployment using Terraform and GitHub Actions CI/CD pipeline.

The solution follows Infrastructure as Code (IaC) and DevSecOps best practices with automated validation, security scanning, linting and passwordless Azure authentication using OIDC.

---

# Architecture Flow


```text
Developer
    |
    |
    v
GitHub Repository
    |
    |
    v
GitHub Actions Workflow
    |
    |
    +----------------------+
    |   CI Pipeline        |
    +----------------------+
              |
              |
              v
       Terraform fmt
              |
       Terraform Init
              |
       Terraform Validate
              |
       TFLint Scan
              |
       Checkov Security
              |
       Terraform Plan


              |
              |
              v


    +----------------------+
    |    CD Pipeline       |
    +----------------------+
              |
              |
              v

       Terraform Apply

              |

              v

      Azure Infrastructure


```

---

# Infrastructure Components

Terraform provisions:

- Azure Resource Group
- Azure Container Registry (ACR)
- Azure Kubernetes Service (AKS)
- AKS Node Pool

---

# Technology Stack

| Tool | Purpose |
|---|---|
| Terraform | Infrastructure Provisioning |
| Azure | Cloud Platform |
| AKS | Kubernetes Service |
| ACR | Container Registry |
| GitHub Actions | CI/CD Automation |
| Azure OIDC | Passwordless Authentication |
| TFLint | Terraform Code Quality |
| Checkov | Security Scanning |

---

# Repository Structure


```bash
Azure_Kubernetes_Infra

│
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

├── parent_module
│
│   ├── main.tf
│   ├── providers.tf
│   ├── variable.tf
│   ├── terraform.tfvars
│   └── output.tf
│

└── .github

    └── workflows

        └── terraform-ci-cd.yml

```

---

# GitHub Actions Pipeline

Workflow file:


```bash
.github/workflows/terraform-ci-cd.yml
```

---

# Pipeline Trigger


```yaml
on:

  push:
    branches:
      - main

  pull_request:
    branches:
      - main
```


## Behavior


| Event | CI | Apply |
|---|---|---|
| Pull Request | YES | NO |
| Main Push | YES | YES |


---

# Azure Authentication (OIDC)


This project uses GitHub OIDC authentication.


Benefits:


- No Client Secret stored
- Passwordless authentication
- Short-lived token
- Enterprise recommended approach


---

# Azure OIDC Setup


## Create Azure App Registration


```bash
az ad app create \
--display-name github-terraform-aks
```


Save:


```text
Application Client ID
```


---

## Create Service Principal


```bash
az ad sp create \
--id <CLIENT_ID>
```

---

## Assign Contributor Permission


```bash
az role assignment create \
--assignee <CLIENT_ID> \
--role Contributor \
--scope /subscriptions/<SUBSCRIPTION_ID>
```

---

# Configure Federated Credential


Azure Portal:


```text
Microsoft Entra ID

      |

App Registrations

      |

github-terraform-aks

      |

Certificates & Secrets

      |

Federated Credentials

      |

Add Credential

```


Configuration:


```text
Provider:

GitHub Actions


Organization:

<GITHUB_USERNAME>


Repository:

Azure_Kubernetes_Infra


Entity:

Branch


Branch:

main

```

---

# GitHub Secrets Configuration


Navigate:


```text
Repository

   |

Settings

   |

Secrets and Variables

   |

Actions

```


Add:


| Secret | Value |
|-|-|
| AZURE_CLIENT_ID | Application Client ID |
| AZURE_TENANT_ID | Azure Tenant ID |
| AZURE_SUBSCRIPTION_ID | Azure Subscription ID |


---

# OIDC Permission in Workflow


```yaml
permissions:

  id-token: write

  contents: read
```


Allows GitHub to request Azure identity token.

---

# Environment Variables


```yaml
env:

 TF_VERSION: "1.8.0"

 WORKING_DIR: "parent_module"

 ARM_USE_OIDC: true

```


Purpose:


| Variable | Usage |
|-|-|
| TF_VERSION | Terraform Version |
| WORKING_DIR | Terraform Root Module |
| ARM_USE_OIDC | Enable Azure OIDC |

---

# CI Pipeline Details


## 1. Checkout Repository


```yaml
actions/checkout@v4
```


Downloads source code into runner.


---


## 2. Azure Login


```yaml
azure/login@v2
```


Authentication flow:


```text
GitHub Runner

      |

OIDC Token

      |

Azure Entra ID

      |

Azure Subscription

```

---

## 3. Terraform Format Check


```bash
terraform fmt -check -recursive
```


Checks:

- Formatting
- Code standard


---

## 4. Terraform Init


```bash
terraform init
```


Downloads:

- Providers
- Modules


---

## 5. Terraform Validate


```bash
terraform validate
```


Checks:

- Syntax
- Configuration validity


---

## 6. Terraform Lint


```bash
tflint --init

tflint
```


Detects:

- Best practice issues
- Deprecated syntax
- Provider issues


---

## 7. Checkov Security Scan


Scans Terraform code for:


- Security risks
- Compliance issues
- Misconfigurations


---

## 8. Terraform Plan


```bash
terraform plan
```


Displays infrastructure changes.

---

# CD Pipeline


Runs after:


```text
CI Pipeline Success

          |

          v

Terraform Apply

```

---

## Deployment Condition


```yaml
if: github.ref == 'refs/heads/main'
```


Protection:


- Pull Request → No deployment
- Main Push → Deployment


---

# Terraform Apply


```bash
terraform apply -auto-approve
```


Creates Azure resources.

---

# Git Workflow


Feature development:


```bash
git checkout -b feature/new-module
```


Commit:


```bash
git add .

git commit -m "Added terraform module"

git push

```


Merge using Pull Request.

---

# Versioning Strategy


Semantic Versioning:


```text
vMAJOR.MINOR.PATCH
```


Examples:


```text
v1.0.0  Initial AKS Infrastructure

v1.1.0  Added New Module

v1.1.1  Bug Fix

```


Create Release:


```bash
git tag -a v1.0.0 \
-m "Initial AKS Terraform Release"


git push origin v1.0.0
```

---

# Implemented Best Practices


✔ Modular Terraform Architecture

✔ GitHub Actions CI/CD

✔ Azure OIDC Passwordless Authentication

✔ No Hardcoded Credentials

✔ Terraform Formatting Enforcement

✔ TFLint Static Analysis

✔ Checkov Security Scan

✔ Automated Terraform Plan

✔ Controlled Terraform Apply

✔ Semantic Versioning


---

# Maintainer


**Rishikesh Sharma**

DevOps Engineer | Azure | Terraform | Kubernetes
