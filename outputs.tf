output "identity_id" {
  description = "The ID of this Managed identity."
  value       = azurerm_user_assigned_identity.this.id
}

output "identity_client_id" {
  description = "The client ID of this Managed identity."
  value       = azurerm_user_assigned_identity.this.client_id
}

output "identity_principal_id" {
  description = "The principal (object) ID of this Managed identity."
  value       = azurerm_user_assigned_identity.this.principal_id
}

output "identity_tenant_id" {
  description = "The tenant ID of this Managed identity."
  value       = azurerm_user_assigned_identity.this.tenant_id
}
