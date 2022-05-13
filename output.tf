output "profile_id" {
  description = "The ID of the Traffic manager profile."
  value       = azurerm_traffic_manager_profile.traffic_manager_profile.id
}
output "fqdn" {
  description = "The FQDN of the created Profile."
  value       = azurerm_traffic_manager_profile.traffic_manager_profile.fqdn
}
output "azure_endpoint_id" {
  description = "The ID of the Azure Endpoint. "
  value       = azurerm_traffic_manager_azure_endpoint.azure.*.id
}
output "external_endpoint_id" {
  description = "The ID of the External Endpoint."
  value       = azurerm_traffic_manager_external_endpoint.external.*.id
}
output "nested_endpoint_id" {
  description = "The ID of the Nested Endpoint."
  value       = azurerm_traffic_manager_nested_endpoint.nested.*.id
}

