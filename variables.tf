variable "resource_group_name" {
  description = "Name of the resource group to create"
  default     = "test-infra-rg"
}

variable "location" {
  description = "Azure region for the resources"
  default     = "West Europe"
}

variable "storage_account_name" {
  description = "Name of the storage account to create"
  default     = "testinfra2024"
}
