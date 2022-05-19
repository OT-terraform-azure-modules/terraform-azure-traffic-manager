resource "random_id" "server" {
  keepers = {
    azi_id = 2
  }

  byte_length = 2
}


data "azurerm_resource_group" "res_group" {
  name = var.resource_group_name
}

resource "azurerm_traffic_manager_profile" "traffic_manager_profile" {
  name                   = join("-", tolist([var.profile_name, random_id.server.hex]))
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.traffic_routing_method
  profile_status         = var.profile_status
  max_return             = var.max_return
  traffic_view_enabled   = var.traffic_view_enabled


  dns_config {
    relative_name = join("-", tolist([var.profile_name, random_id.server.hex]))
    ttl           = var.dns_ttl
  }

  monitor_config {
    protocol                     = var.monitor_protocol
    port                         = var.monitor_port
    path                         = var.monitor_path
    interval_in_seconds          = var.monitor_probe_interval
    timeout_in_seconds           = var.monitor_probe_timeout
    tolerated_number_of_failures = var.monitor_tolerated_failures
    expected_status_code_ranges  = var.expected_status_code_ranges

    dynamic "custom_header" {
      for_each = var.custom_header
      content {
        name  = custom_header.value["name"]
        value = custom_header.value["value"]
      }
    }

  }

  tags = var.tags
}


resource "azurerm_traffic_manager_azure_endpoint" "azure" {
  count              = var.endpoint_type == "azureEndpoints" ? length(var.azure_endpoint_name) : 0
  name               = var.azure_endpoint_name[count.index]
  profile_id         = azurerm_traffic_manager_profile.traffic_manager_profile.id
  weight             = element(var.weight, count.index)
  target_resource_id = var.target_resource_id                     #element(var.target_resource_id, count.index) #element(module.public-ip_module.public_ip_id, count.index)    #azurerm_public_ip.example.id #data.azurerm_public_ip.example.id 
  geo_mappings       = var.geo_mappings[count.index]

  subnet {
    first = var.first[count.index]
    last  = var.last[count.index]
    scope = var.scope[count.index]
  }
  

  dynamic "custom_header" {
    for_each = var.custom_header_azure_endpoint
    content {
      name  = custom_header.value["name"]
      value = custom_header.value["value"]
    }
  }


}


resource "azurerm_traffic_manager_external_endpoint" "external" {
  count             = var.endpoint_type == "externalEndpoints" ? length(var.external_endpoint_name) : 0
  name              = var.external_endpoint_name[count.index]
  profile_id        = azurerm_traffic_manager_profile.traffic_manager_profile.id
  target            = var.external_target_resource[count.index]
  endpoint_location = element(var.endpoint_location, count.index)
  weight            = element(var.weight, count.index)
  priority          = var.priority[count.index]
  geo_mappings      = var.geo_mappings[count.index]

  subnet {
    first = var.first[count.index]
    last  = var.last[count.index]
    scope = var.scope[count.index]
  }


  dynamic "custom_header" {
    for_each = var.custom_header_external_endpoint
    content {
      name  = custom_header.value["name"]
      value = custom_header.value["value"]
    }
  }


}

resource "azurerm_traffic_manager_nested_endpoint" "nested" {
  count                                 = var.endpoint_type == "nestedEndpoints" ? length(var.nested_endpoint_name) : 0
  name                                  = var.nested_endpoint_name[count.index]
  target_resource_id                    = element(var.target_resource_id, count.index) #azurerm_traffic_manager_profile.child.id
  priority                              = var.priority[count.index]
  profile_id                            = azurerm_traffic_manager_profile.traffic_manager_profile.id
  minimum_child_endpoints               = var.minimum_child_endpoints[count.index]
  endpoint_location                     = element(var.endpoint_location, count.index)
  weight                                = element(var.weight, count.index)
  minimum_required_child_endpoints_ipv4 = var.minimum_required_child_endpoints_ipv4[count.index]
  minimum_required_child_endpoints_ipv6 = var.minimum_required_child_endpoints_ipv6[count.index]
  geo_mappings                          = var.geo_mappings[count.index]

  subnet {
    first = var.first[count.index]
    last  = var.last[count.index]
    scope = var.scope[count.index]
  }

  dynamic "custom_header" {
    for_each = var.custom_header_nested_endpoint
    content {
      name  = custom_header.value["name"]
      value = custom_header.value["value"]
    }
  }

}
