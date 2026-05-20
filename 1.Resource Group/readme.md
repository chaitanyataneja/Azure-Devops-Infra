# README.md

````md
# Azure Resource Group using Terraform

This project demonstrates how to create an Azure Resource Group using Terraform.

---

# What is a Resource Group in Azure?

A Resource Group in :contentReference[oaicite:0]{index=0} is a logical container that holds related Azure resources together.

Azure resources can include:
- Virtual Machines (VMs)
- Storage Accounts
- Virtual Networks
- Databases
- App Services

A Resource Group helps organize and manage resources for a specific project or environment.

---

# Why Resource Groups are Important?

## 1. Resource Organization
Resource Groups help keep all related resources together.

Example:
```text
Project: Chat Application

Resource Group:
rg_chatty
```

Resources inside:
- VM
- Storage Account
- Database
- Network

---

## 2. Easy Management
You can:
- Deploy resources together
- Monitor resources together
- Delete resources together

Deleting the Resource Group deletes all resources inside it.

---

## 3. Access Control (RBAC)
Permissions can be assigned at Resource Group level.

Example:
- Dev Team → Contributor
- Testing Team → Reader

---

## 4. Cost Management
Azure allows cost tracking per Resource Group.

This helps identify:
- Which project costs more
- Which environment consumes more resources

---

## 5. Lifecycle Management
Resources with the same lifecycle should stay together.

Example:
- Dev Environment → dev-rg
- Test Environment → test-rg
- Production Environment → prod-rg

---

# Terraform Configuration

## Resource Group Code

```hcl
resource "azurerm_resource_group" "rg1" {
  name     = "rg_chatty"
  location = "centralindia"
}
```

---

# Explanation of the Code

| Block | Description |
|------|-------------|
| resource | Used to create a resource in Azure |
| azurerm_resource_group | Azure Resource Group resource type |
| rg1 | Local name of the Terraform resource |
| name | Name of the Resource Group |
| location | Azure region where metadata will be stored |

---

# Prerequisites

Before running this project, ensure you have:

- Terraform installed
- Azure Subscription
- Azure CLI installed
- Logged into Azure using:

```bash
az login
```

---

# Provider Configuration

```hcl
provider "azurerm" {
  features {}
}
```

---

# Terraform Workflow

## 1. Initialize Terraform

```bash
terraform init
```

Downloads required provider plugins.

---

## 2. Validate Configuration

```bash
terraform validate
```

Checks configuration syntax.

---

## 3. Generate Execution Plan

```bash
terraform plan
```

Shows what Terraform will create.

---

## 4. Apply Configuration

```bash
terraform apply
```

Creates the Resource Group in Azure.

---

## 5. Destroy Infrastructure

```bash
terraform destroy
```

Deletes all created resources.

---

# Project Structure

```text
project-folder/
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
└── README.md
```

---

# Best Practices

## Naming Convention
Use meaningful names.

Example:
```text
rg-dev-chatapp
rg-prod-ecommerce
```

---

## Separate Environments
Use different Resource Groups for:
- Development
- Testing
- Production

---

## Use Tags
Tags help with:
- Cost tracking
- Resource organization
- Automation

Example:
```hcl
tags = {
  environment = "dev"
  project     = "chatty"
}
```

---

# Example with Tags

```hcl
resource "azurerm_resource_group" "rg1" {
  name     = "rg_chatty"
  location = "centralindia"

  tags = {
    environment = "dev"
    project     = "chatty"
  }
}
```

---

# Key Points

- A Resource Group is a logical container in Azure.
- One resource can belong to only one Resource Group.
- Resources inside a Resource Group can exist in different regions.
- Deleting a Resource Group deletes all resources inside it.
- Resource Groups simplify infrastructure management.

---

# Output Example

After successful deployment:

```text
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

---

# Author

Created for Terraform and Azure learning purposes.
````
