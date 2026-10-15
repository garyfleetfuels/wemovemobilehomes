# Azure Static Web Apps Infrastructure (Terraform & AVM)

This directory contains the enterprise Infrastructure as Code (IaC) for **We Move Mobile Homes**, provisioning the hosting environment using Terraform and the official Microsoft [Azure Verified Module (AVM)](https://registry.terraform.io/modules/Azure/avm-res-web-staticsite/azurerm) for Azure Static Web Apps.

---

## Architecture Overview

- **Resource Group**: `azurerm_resource_group.this` (`rg-wmmh-prod`)
- **Hosting Service**: `Azure/avm-res-web-staticsite/azurerm` (`stapp-wmmh-prod`)
- **Control-Plane Region**: `westeurope` (globally distributed edge CDN delivery for UK / EU)
- **SKU**: `Free` tier (seamlessly upgradeable to `Standard` via variables for SLA and custom enterprise apex domain features)

---

## Prerequisites

1. **Terraform CLI**: Version `>= 1.8.0` installed.
2. **Azure CLI (`az`)**: Installed and authenticated.
3. **Azure Subscription Permissions**: Contributor or Owner role on the target subscription or parent management group.

---

## Operational Runbook

### 1. Azure Authentication

Login to your Azure account and set your target subscription:

```powershell
# Authenticate interactively
az login

# List accessible subscriptions
az account list --output table

# Set target subscription
az account set --subscription "<SUBSCRIPTION_ID_OR_NAME>"
```

### 2. Configure Parameters (Optional)

Copy the example variables file to customize configuration:

```powershell
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` if needed to adjust the environment, names, region, or tags.

### 3. Initialize Terraform

Initialize the working directory to download the `azurerm` provider and the `Azure/avm-res-web-staticsite/azurerm` module:

```powershell
terraform init
```

> **Note on Remote State**: In team and production CI/CD environments, uncomment the `backend "azurerm"` block in `versions.tf` and supply your Azure Storage Account backend details before running `terraform init`.

### 4. Plan & Review Changes

Generate an execution plan to verify resources to be created:

```powershell
terraform plan -out=tfplan
```

### 5. Apply Infrastructure

Execute the verified plan:

```powershell
terraform apply tfplan
```

---

## Post-Provisioning: GitHub Actions CI/CD Integration

Azure Static Web Apps requires an API deployment token to allow GitHub Actions to build and deploy your Astro static site.

### 1. Extract the Deployment Token

Run the following command to securely output the API token without leaking other state details:

```powershell
terraform output -raw static_web_app_api_key
```

### 2. Configure GitHub Repository Secret

1. Navigate to your GitHub repository: [https://github.com/littlescratch/wmmhweb/settings/secrets/actions](https://github.com/littlescratch/wmmhweb/settings/secrets/actions)
2. Click **New repository secret**.
3. Set the name to:
   ```text
   AZURE_STATIC_WEB_APPS_API_TOKEN
   ```
4. Paste the extracted token value and click **Add secret**.

---

## Teardown / Decommissioning

To destroy all provisioned infrastructure:

```powershell
terraform destroy
```
