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

  federated_identity_credentials = {
    # Allow authentication from environment "development"
    "github_env" = {
      name    = "github-env"
      issuer  = "https://token.actions.githubusercontent.com"
      subject = "repo:my-org/my-repo:environment:development"
    }

    # Allow authentication from branch "main"
    "github_branch" = {
      name    = "github-branch"
      issuer  = "https://token.actions.githubusercontent.com"
      subject = "repo:equinor/ops-actions:ref:refs/heads/main"
    }

    # Allow authentication from pull request
    "github_pr" = {
      name    = "github-pr"
      issuer  = "https://token.actions.githubusercontent.com"
      subject = "repo:equinor/ops-actions:pull_request"
    }

    # Allow authentication from tag "dev"
    "github_tag" = {
      name    = "github-tag"
      issuer  = "https://token.actions.githubusercontent.com"
      subject = "repo:equinor/ops-actions:ref:refs/tags/dev"
    }
  }
}
