terraform {
    required_providers {
      azurerm = {
        source  = "hashicorp/azurerm"
        version = "=4.1.0"
      }
    }
}
provider "azurerm" {
  features {}
  subscription_id = "9f536dd9-9986-4eb8-a73d-7c9374b6d408"
}