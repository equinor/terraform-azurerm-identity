variable "identity_name" {
  description = "The name of this Managed identity."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group to create the resources in."
  type        = string
}

variable "location" {
  description = "The location to create the resources in."
  type        = string
}

variable "federated_identity_credentials" {
  description = "A map of federated identity credentials to create for this Managed identity."

  type = map(object({
    name      = string
    audiences = optional(list(string), ["api://AzureADTokenExchange"])
    issuer    = string
    subject   = string
  }))

  default = {}
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
