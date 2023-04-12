resource "azurerm_user_assigned_identity" "this" {
  name                = var.identity_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = var.tags
}

resource "azurerm_federated_identity_credential" "this" {
  for_each = var.federated_identity_credentials

  name                = each.value["name"]
  resource_group_name = var.resource_group_name
  parent_id           = azurerm_user_assigned_identity.this.id
  audience            = each.value["audiences"]
  issuer              = each.value["issuer"]
  subject             = each.value["subject"]
}
