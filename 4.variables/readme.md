````markdown id="p6ofjz"
# Terraform Variables

Terraform variables are used to make the configuration reusable and dynamic.

---

# 1. Variable Block (variables.tf)

Define variables inside a `variables.tf` file.

```hcl
variable "resource_group_name" {
  type = string
}
```

Assign value:

```hcl
resource_group_name = "rg-demo"
```

---

# 2. terraform.tfvars File

Terraform automatically loads values from `terraform.tfvars`.

```hcl
resource_group_name = "rg-demo"
location            = "Central India"
```

---

# 3. Custom .tfvars File

You can create custom variable files.

Example:

```text
dev.tfvars
prod.tfvars
```

Usage:

```bash
terraform plan -var-file="dev.tfvars"
```

---

# 4. Using Specific Variable Files

You can execute Terraform using a specific variable file.

```bash
terraform plan -var-file="dev.tfvars"
```

Example:

```bash
terraform plan -var-file="prod.tfvars"
terraform apply -var-file="prod.tfvars"
```

This is commonly used for:
- Dev Environment
- QA Environment
- Production Environment

Example structure:

```text
dev.tfvars
qa.tfvars
prod.tfvars
```

---

# 5. Command Line Variables

Pass variables directly during execution.

```bash
terraform apply -var="location=Central India"
```

Multiple variables:

```bash
terraform apply \
-var="location=Central India" \
-var="environment=dev"
```

---

# 6. Environment Variables

Terraform supports environment variables using `TF_VAR_`.

Linux/macOS:

```bash
export TF_VAR_location="Central India"
```

Windows PowerShell:

```powershell
$env:TF_VAR_location="Central India"
```

---

# 7. Default Values in Variable Block

You can define default values.

```hcl
variable "location" {
  type    = string
  default = "Central India"
}
```

---

# 8. Auto Loaded tfvars Files

Terraform automatically loads:

```text
terraform.tfvars
*.auto.tfvars
```

Example:

```text
dev.auto.tfvars
```

---

# Variable Precedence Order

Terraform follows this priority:

1. Command line (`-var`)
2. `.tfvars` files
3. Environment variables
4. Default values

---

# Best Practices

- Use `variables.tf` for declarations
- Use `.tfvars` for environment values
- Never commit sensitive `.tfvars` files
- Use remote backend for production
- Keep reusable modules generic

---

# Example Project Structure

```text
project/
│
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── provider.tf
```

---
````
