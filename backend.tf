terraform {
  backend "azurerm" {
    resource_group_name  = "rg-formation-terraform"
    storage_account_name = "saformationterraform2024"
    container_name       = "formation-tfstate"
    key                  = "test-infra.tfstate"
  }
}
