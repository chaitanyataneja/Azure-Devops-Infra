````markdown id="6p3cye"
# 📘 TERRAFORM `for_each` + LIST PRACTICE

# 🚀 Terraform Resource Group Creation Using `for_each`

This project demonstrates how to create multiple Azure Resource Groups using:

- `for_each`
- List
- `toset()`
- Variables in Terraform

---

# 📌 Objective

Create multiple Azure Resource Groups dynamically instead of writing separate resource blocks.

All Resource Groups will be created in:

```text
Central India
```

---

# 🛠️ Static `for_each` Example

```hcl
resource "azurerm_resource_group" "multiplerg" {

  for_each = toset([
    "rg_ketan",
    "rg_chatty",
    "rg_bharat"
  ])

  name     = each.key
  location = "Central India"
}
```

---

# ⚡ What is Happening Here?

Terraform converts the list into a set using:

```hcl
toset()
```

Then `for_each` creates one Resource Group for each value.

### Resource Groups Created

```text
rg_ketan
rg_chatty
rg_bharat
```

Location for all RGs:

```text
Central India
```

---

# 📂 Dynamic Example Using Variables

## variables.tf

```hcl
variable "rg" {
  type = list(string)
}

variable "location" {
  type    = string
  default = "Central India"
}
```

---

# 📄 terraform.tfvars

```hcl
rg = [
  "rg-dev",
  "rg-test",
  "rg-prod"
]
```

---

# 🛠️ main.tf

```hcl
resource "azurerm_resource_group" "rg" {

  for_each = toset(var.rg)

  name     = each.key
  location = var.location
}
```

---

# 🎯 Benefits of Using `for_each`

✅ Dynamic resource creation  
✅ Reduces duplicate code  
✅ Easy to scale  
✅ Better readability  
✅ Reusable Terraform code  

---

# 📌 Why Use `toset()`?

`for_each` works with:
- Map
- Set

A normal list must be converted into a set.

Example:

```hcl
toset(var.rg)
```

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

## View Execution Plan

```bash
terraform plan
```

## Apply Terraform Configuration

```bash
terraform apply
```

---

# 📌 Expected Output

Terraform creates:

```text
rg_ketan
rg_chatty
rg_bharat
```

OR

```text
rg-dev
rg-test
rg-prod
```

All in:

```text
Central India
```

---

# 🎉 Conclusion

Using `for_each` with List variables helps automate Azure Resource Group creation efficiently while keeping the Terraform code clean and reusable.

Happy Learning 🚀
````
