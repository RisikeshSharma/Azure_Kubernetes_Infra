# Azure Kubernetes Infrastructure

This repository contains Terraform code to provision an Azure Kubernetes Service (AKS) cluster and an Azure Container Registry (ACR) using a modular approach.

## Key Concepts
- **for_each**: Used to provision multiple AKS clusters and ACRs based on input maps.
- **Parent & Child Association**: A central Resource Group serves as the parent, with AKS and ACR as child resources linked to it.
- **Modular Design**: Separate modules for AKS and ACR to ensure reusability.
- **CI/CD**: GitHub Actions workflow included for linting (`tflint`, `terraform fmt`) and deployment.

## Project Structure
- `main.tf`: Root configuration calling modules.
- `variables.tf`: Input variables defining the infrastructure.
- `providers.tf`: Azure provider configuration.
- `modules/`: Contains child modules for `aks` and `acr`.
- `.github/workflows/`: CI/CD pipeline definition.

## Requirements
- Terraform >= 1.0
- Azure CLI
- GitHub Secrets for Azure Credentials (`ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_SUBSCRIPTION_ID`, `ARM_TENANT_ID`)
