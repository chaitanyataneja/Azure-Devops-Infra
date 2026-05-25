````markdown id="hm7q2k"
# 📘 TERRAFORM `for_each` + NESTED MAP

# 🚀 Terraform Nested Map with `for_each`

This project demonstrates how to use:

- `for_each`
- Nested Map
- `map(object)`
- Dynamic Resource Creation in Terraform

to create multiple Azure Resource Groups dynamically.

---

# 📌 What is a Nested Map?

A Nested Map is a map that contains multiple objects inside it.

Example:

```hcl
{
  rg1 = {
    name       = "rg-dev"
    location   = "centralindia"
    managed_by = "terraform"
  }

  rg2 = {
    name       = "rg-prod"
    location   = "eastus"
    managed_by = "devops"
  }
}
```

Each key contains another object with multiple attributes.

---

# 🛠️ Hardcoded Nested Map Example

## main.tf

```hcl
resource "azurerm_resource_group" "nestedblock" {

  for_each = {

    rg_1 = {
      name       = "appleios"
      location   = "centralindia"
      managed_by = "terraform"
    }

    rg_2 = {
      name       = "samsung"
      location   = "eastus"
      managed_by = "chaitanya"
    }
  }

  name       = each.value.name
  location   = each.value.location
  managed_by = each.value.managed_by
}
```

---

# ⚡ What Happens Here?

Terraform loops through each object inside the nested map.

It creates:

| Resource Group | Location | Managed By |
|---|---|---|
| appleios | centralindia | terraform |
| samsung | eastus | chaitanya |

---

# 📂 Dynamic Nested Map Using Variables

## variables.tf

```hcl
variable "hello" {

  type = map(object({
    name       = string
    location   = string
    managed_by = string
  }))
}
```

---

# 📄 terraform.tfvars

```hcl
hello = {

  rg1 = {
    name       = "rg-dev"
    location   = "centralindia"
    managed_by = "terraform"
  }

  rg2 = {
    name       = "rg-prod"
    location   = "eastus"
    managed_by = "devops"
  }
}
```

---

# 🛠️ Dynamic Resource Block

## main.tf

```hcl
resource "azurerm_resource_group" "multirg" {

  for_each = var.hello

  name       = each.value.name
  location   = each.value.location
  managed_by = each.value.managed_by
}
```

---

# 🔥 Understanding `each.value`

Terraform accesses object values dynamically.

Example:

```hcl
each.value.name
```

Accesses:

```hcl
name = "rg-dev"
```

Similarly:

```hcl
each.value.location
each.value.managed_by
```

---

# 🎯 Benefits of Nested Map

✅ Dynamic infrastructure creation  
✅ Cleaner Terraform code  
✅ Easy scalability  
✅ Better readability  
✅ Reusable configurations  

---

# 📁 Project Structure

```text
project/
│
├── main.tf
├── variables.tf
├── terraform.tfvars
└── provider.tf
```

---

# 🚀 Terraform Commands

## Initialize Terraform

```bash
terraform init
```

## Validate Terraform Code

```bash
terraform validate
```

## View Terraform Plan

```bash
terraform plan
```

## Apply Terraform Configuration

```bash
terraform apply
```

---

# 📌 Expected Output

Terraform creates multiple Azure Resource Groups dynamically.

Example:

```text
rg-dev
rg-prod
```

with different:
- Locations
- Managed By values

---

# 🎉 Conclusion

Using `for_each` with Nested Maps allows you to create scalable and reusable Terraform configurations with multiple attributes dynamically.

Happy Learning 🚀
````
