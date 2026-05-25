# 🚀 Terraform Remote Backend using Azure Storage Account

This project demonstrates how to configure a **Terraform Remote Backend** using an Azure Storage Account in Microsoft Azure.

---

# 📌 Project Overview

In this project:

✅ Resource Group is created  
✅ Storage Account is created  
✅ Terraform State File is stored remotely in Azure Blob Storage  
✅ AzureRM Provider is configured  

This setup helps teams manage Terraform state securely and collaboratively.

---

# 🛠️ Technologies Used

- 🌍 Terraform
- ☁️ Microsoft Azure
- 📦 AzureRM Provider
- 💾 Azure Blob Storage

---

# ⚙️ Provider Configuration

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.73.0"
    }
  }

  backend "azurerm" {
    storage_account_name = "mystorageaccount8732"
    resource_group_name  = "rg_bhakua"
    container_name       = "container1"
    key                  = "test.tfstate"
  }
}

provider "azurerm" {
  features {}
}
```

---

# 🏗️ Main Terraform Configuration

```hcl
resource "azurerm_resource_group" "block1" {
  name     = "rg_bhakua"
  location = "centralindia"
}

resource "azurerm_storage_account" "sa1" {
  name                     = "mystorageaccount8732"
  resource_group_name      = azurerm_resource_group.block1.name
  location                 = azurerm_resource_group.block1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
```

---

# ❓ Why Remote Backend?

By default, Terraform stores the state file locally.

Using Remote Backend provides:

🔹 Centralized state management  
🔹 Team collaboration  
🔹 State locking  
🔹 Better security  
🔹 Backup and recovery  
🔹 CI/CD integration support  

---

# 📋 Prerequisites

Before running this project, ensure you have:

✅ Azure Subscription  
✅ Terraform Installed  
✅ Azure CLI Installed  

---

# 🔐 Azure Login

```bash
az login
```

---

# 📦 Create Blob Container

Terraform backend cannot create the container automatically.

Create it manually using Azure CLI:

```bash
az storage container create \
  --name container1 \
  --account-name mystorageaccount8732
```

---

# 🚀 Initialize Terraform

```bash
terraform init
```

---

# 📖 Terraform Plan

```bash
terraform plan
```

---

# ✅ Terraform Apply

```bash
terraform apply
```

---

# 🔍 Verify Remote State File

Go to:

☁️ Azure Portal → Storage Account → Containers → `container1`

You will find:

```bash
test.tfstate
```

---

# 📂 Project Structure

```bash
terraform-remote-backend/
│
├── provider.tf
├── main.tf
├── .gitignore
└── README.md
```

---

# 🚫 Recommended .gitignore

```gitignore
# Terraform files
.terraform/
*.tfstate
*.tfstate.*
crash.log

# Terraform lock file
.terraform.lock.hcl

# Variable files
*.tfvars
*.tfvars.json
```

---

# ⚠️ Important Notes

🔸 Backend resources must exist before `terraform init`  
🔸 Backend block does not support variables  
🔸 Storage account name must be globally unique  

---

# 💻 Commands Used

## 🔹 Initialize Backend

```bash
terraform init
```

## 🔹 Reconfigure Backend

```bash
terraform init -reconfigure
```

## 🔹 Check Terraform State

```bash
terraform state list
```

---

# 🎯 Conclusion

Terraform Remote Backend is an important concept in real-world DevOps projects because it enables:

✅ Secure infrastructure management  
✅ Team collaboration  
✅ Reliable state management  
✅ Better scalability  

Using Azure Storage Account as a backend is one of the most common production-level practices in Terraform.

---

# ⭐ If you found this project useful, give it a star on GitHub!