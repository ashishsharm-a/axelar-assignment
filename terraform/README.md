
# Terraform Addon for Axelar Node

This Terraform module provisions:
- A Kubernetes namespace for Axelar
- A PersistentVolume for Axelar chain data
- A PersistentVolumeClaim bound to it

## Usage

```bash
cd addons/terraform
terraform init
terraform apply
```
