````markdown id="k9t4xp"
# 📘 VNET AND SUBNET IN AZURE

# 🚀 Azure Virtual Network (VNet) and Subnet

This project explains the basics of:

- Azure Virtual Network (VNet)
- Azure Subnet
- CIDR notation
- Network segmentation in Azure

using Terraform Infrastructure as Code (IaC).

---

# 🌐 What is a Virtual Network (VNet)?

A Virtual Network (VNet) in Azure is a private network that enables Azure resources to communicate securely with each other, the internet, and on-premises networks.

A VNet provides:
- Network isolation
- Secure communication
- IP address management
- Connectivity between Azure resources

---

# 📌 Example of VNet

```text
VNet Name: myvnet1
Address Space: 10.0.0.0/16
```

---

# 🔹 What is a Subnet?

A Subnet is a smaller network created inside a Virtual Network.

Subnets help divide the VNet into multiple logical sections.

Example:
- Frontend Subnet
- Backend Subnet
- Database Subnet

---

# 📌 Example of Subnet

```text
Subnet Name: frontendsubnet
CIDR Range: 10.0.1.0/24
```

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

# 📊 CIDR Understanding

## VNet CIDR

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
├── 10.0.1.0/24 → Frontend Subnet
├── 10.0.2.0/24 → Backend Subnet
└── 10.0.3.0/24 → Database Subnet
```

---

# 🎯 Benefits of VNet

✅ Network isolation  
✅ Secure communication  
✅ Hybrid connectivity  
✅ IP address management  
✅ Supports scalable architecture  

---

# 🎯 Benefits of Subnet

✅ Network segmentation  
✅ Better security  
✅ Workload isolation  
✅ Traffic management  
✅ Supports multi-tier architecture  

---

# 📁 Project Structure

```text
project/
│
├── main.tf
├── provider.tf
├── variables.tf
└── terraform.tfvars
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

# 📌 Best Practices

- Use separate subnets for:
  - Frontend
  - Backend
  - Database

- Avoid overlapping CIDR ranges
- Use NSGs for security
- Follow Hub-Spoke architecture for enterprise environments

---

# 🎉 Conclusion

Azure VNets and Subnets are core networking components used to build secure, scalable, and production-ready cloud infrastructure.

Terraform simplifies Azure networking using Infrastructure as Code (IaC).

Happy Learning 🚀
````
