# Azure Storage Account using Terraform

## Overview

This Terraform configuration creates:

* An Azure Resource Group
* An Azure Storage Account

using the AzureRM provider in Microsoft Azure.

---

# Project Structure

```text id="8rm4tq"
.
├── main.tf
└── README.md
```

---

# Terraform Configuration

```hcl id="v6h5wo"
resource "azurerm_resource_group" "rg2" {
    name     = "rg_india"
    location = "centralindia"
}

resource "azurerm_storage_account" "sa" {
  name                     = "mystorage87311612"
  resource_group_name      = azurerm_resource_group.rg2.name
  location                 = "central india"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
```

---

# Resources Created

## 1. Resource Group

Creates a Resource Group named:

```text id="f5v49k"
rg_india
```

Region:

```text id="n7p0mt"
Central India
```

---

## 2. Storage Account

Creates a Storage Account with:

| Property         | Value             |
| ---------------- | ----------------- |
| Name             | mystorage87311612 |
| Performance Tier | Standard          |
| Replication Type | LRS               |
| Location         | Central India     |

---

# Replication Type

## LRS (Locally Redundant Storage)

LRS stores:

* 3 copies of your data
* Inside the same Azure datacenter

Benefits:

* Low cost
* High durability
* Good for development and testing

---

# Prerequisites

Before running Terraform, ensure you have:

* Terraform installed
* Azure Subscription
* Azure CLI installed
* Logged into Azure

Login command:

```bash id="v2nl0n"
az login
```

---

# Terraform Commands

## Initialize Terraform

```bash id="2qjk0p"
terraform init
```

## Validate Configuration

```bash id="kh76gp"
terraform validate
```

## Preview Infrastructure

```bash id="z8wn1y"
terraform plan
```

## Create Resources

```bash id="3xfvhn"
terraform apply
```

Type:

```bash id="9mg29i"
yes
```

to confirm deployment.

---

# Verify in Azure Portal

Go to:

```text id="c8rzsz"
Azure Portal → Resource Groups → rg_india
```

You will see:

* Resource Group
* Storage Account

---

# Use Cases of Azure Storage Account

Storage Accounts are commonly used for:

* Terraform Remote Backend
* Application Logs
* VM Backups
* Blob Storage
* Static Website Hosting
* CI/CD Artifacts

---

# Author

Created while learning Terraform with Microsoft Azure Infrastructure provisioning.
