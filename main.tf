terraform {
  required_version = ">= 0.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.74.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "thor-rg" {
  name     = "thor-rg"
  location = var.location
  tags = {
    environment = "dev"
  }
}