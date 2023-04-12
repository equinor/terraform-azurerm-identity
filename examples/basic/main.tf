provider "azurerm" {
  features {}
}

resource "random_id" "example" {
  byte_length = 8
}

resource "azurerm_resource_group" "example" {
  name     = "rg-${random_id.example.hex}"
  location = var.location
}

module "identity" {
  # source = "github.com/equinor/terraform-azurerm-identity?ref=v0.0.0"
  source = "../.."

  identity_name       = "id-${random_id.example.hex}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}
