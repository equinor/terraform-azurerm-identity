provider "azurerm" {
  features {}
}

resource "random_id" "example" {
  byte_length = 8
}

module "identity" {
  # source = "github.com/equinor/terraform-azurerm-identity?ref=v0.0.0"
  source = "../.."

  identity_name       = "id-${random_id.example.hex}"
  resource_group_name = var.resource_group_name
  location            = var.location
}
