terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }

    azuread = {
      source  = "hashicorp/azuread"
    }

  }
}

provider "azurerm" {
  features {}
  subscription_id = "6cbe5477-6885-4ea3-a563-ebdb7bffb64d"
}

provider "azuread" {
}