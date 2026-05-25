````markdown id="kj7p2x"
# 📘 AZURE VIRTUAL NETWORK & SUBNET USING TERRAFORM

# 🚀 Terraform Azure VNet and Subnet Creation

This project demonstrates how to create:

- Azure Virtual Network (VNet)
- Azure Subnet

using Terraform.

---

# 📌 What is a Virtual Network (VNet)?

An Azure Virtual Network (VNet) is a private network in Azure that allows Azure resources to communicate securely with each other.

Example:
- Virtual Machines
- Databases
- Load Balancers
- Application Servers

---

# 📌 What is a Subnet?

A Subnet is a smaller network created inside a VNet.

Subnets help:
- Organize resources
- Improve security
- Separate application tiers

Example:
- Frontend Subnet
- Backend Subnet
- Database Subnet

---

# 🛠️ Terraform Code

## main.tf

```hcl
resource "azurerm_virtual_network" "vnetblock" {

  resource_group_name = "myrg1"
  location            = "centralindia"

  name          = "myvnet1"
  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet-1" {

  name                 = "frontendsubnet"
  resource_group_name  = "myrg1"
  virtual_network_name = "myvnet1"

  address_prefixes = [
    "10.0.1.0/24"
  ]
}
```

---

# 🌐 Virtual Network Details

| Property | Value |
|---|---|
| VNet Name | myvnet1 |
| Resource Group | myrg1 |
| Location | centralindia |
| Address Space | 10.0.0.0/16 |

---

# 🔹 Subnet Details

| Property | Value |
|---|---|
| Subnet Name | frontendsubnet |
| CIDR Range | 10.0.1.0/24 |
| Virtual Network | myvnet1 |

---

# 📌 CIDR Understanding

## Virtual Network CIDR

```text
10.0.0.0/16
```

Total IPs:

:contentReference[oaicite:0]{index=0}

---

## Subnet CIDR

```text
10.0.1.0/24
```

Total IPs:

:contentReference[oaicite:1]{index=1}

---

# 🖼️ Architecture Diagram

```text
10.0.0.0/16 (VNet)
│
└── 10.0.1.0/24 (Frontend Subnet)
```

---

# 📁 Project Structure

```text
project/
│
├── main.tf
├── provider.tf
├── terraform.tfvars
└── variables.tf
```

---

# 🚀 Terraform Commands

## Initialize Terraform

```bash
terraform init
```

---

## Validate Terraform Code

```bash
terraform validate
```

---

## View Terraform Plan

```bash
terraform plan
```

---

## Apply Terraform Configuration

```bash
terraform apply
```

---

# 🎯 Benefits of Using VNet & Subnet

✅ Network isolation  
✅ Better security  
✅ Resource segmentation  
✅ Supports multi-tier architecture  
✅ Easy scalability  

---

# 📌 Best Practice

- Use separate subnets for:
  - Frontend
  - Backend
  - Database

- Avoid overlapping CIDR ranges
- Use Network Security Groups (NSGs)

---

# 🎉 Conclusion

Azure VNets and Subnets are fundamental building blocks for secure and scalable cloud infrastructure.

Terraform helps automate the deployment efficiently using Infrastructure as Code (IaC).

Happy Learning 🚀
````
