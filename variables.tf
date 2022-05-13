variable "resource_group_name" {
  description = "(Required) Name of resource group in which the Traffic Manager Profile will be created"
  type        = string
  default     = "deepak_rg"
}
#-------------------------------------------------------------------------------------------------------------------------------
variable "profile_name" {
  description = "(Required) Name of the Traffic Manager Profile"
  type        = string
  default     = "myprotesting"
}

variable "traffic_routing_method" {
  description = "(Required) Specifies the algorithm used to route traffic, possible values are: Geographic, MultiValue, Performance, Priority, Subnet, Weighted"
  type        = string
  default     = "Subnet"
}

variable "profile_status" {
  description = "(Optional) The status of the profile, can be set to either Enabled or Disabled. Defaults to Enabled"
  type        = string
  default     = "Enabled"
}


variable "max_return" {
  description = "(Optional) The amount of endpoints to return for DNS queries to this Profile. Possible values range from 1 to 8."
  type        = number
  default     = null

}

variable "traffic_view_enabled" {
  description = "(Optional) Indicates whether Traffic View is enabled for the Traffic Manager profile."
  type        = bool
  default     = false
}


#-------------------------------------------------------------------------------------------------------------------------
variable "dns_ttl" {
  description = "(Required) The TTL value of the Profile used by Local DNS resolvers and clients."
  type        = number
  default     = 60
}

#---------------------------------------------------------------------------------------------------------------------------------

variable "monitor_protocol" {
  description = "(Required) The protocol used by the monitoring checks, supported values are HTTP, HTTPS and TCP."
  type        = string
  default     = "HTTP"
}

variable "monitor_port" {
  description = "(Required) The port number used by the monitoring checks."
  type        = number
  default     = 80
}

variable "monitor_path" {
  description = "(Optional) The path used by the monitoring checks. Required when protocol is set to HTTP or HTTPS - cannot be set when protocol is set to TCP."
  type        = string
  default     = "/"
}

variable "monitor_probe_interval" {
  description = "(Optional) The interval used to check the endpoint health from a Traffic Manager probing agent.Supported values are 30 (normal probing) and 10 (fast probing)."
  type        = number
  default     = 10
}

variable "monitor_probe_timeout" {
  description = "Optional) The amount of time the Traffic Manager probing agent should wait before considering that check a failure when a health check probe is sent to the endpoint."
  type        = number
  default     = 5
}

variable "monitor_tolerated_failures" {
  description = "Optional) The number of failures a Traffic Manager probing agent tolerates before marking that endpoint as unhealthy. Valid values are between 0 and 9"
  type        = number
  default     = 3
}

variable "expected_status_code_ranges" {
  description = "(Optional) A list of status code ranges in the format of 100-101."
  type        = list(any)
  default     = ["200-300"]
}

variable "custom_header" {
  description = "Configure the Custom Headers in format host:contoso.com,newheader:newvalue. Maximum supported pair is 8. Applicable for Http and Https protocol. "
  type        = list(object({ name = string, value = string }))

  default = [
    { name = "demo", value = "tresd" },
    { name = "sample", value = "fergf" }
  ]


}

variable "tags" {
  description = "Any tags can be set"
  type        = map(string)
  default = {
    Name = "testing",
    Env  = "testing"
  }
}

#--------------------------------------Endpoints----------------------------------------------------------------

variable "endpoint_type" {
  description = "(Optional) Enter the type of endpoint . Valid options azureEndpoints,externalEndpoints,nestedEndpoints"
  type        = string
  default     = "azureEndpoints"
}

variable "azure_endpoint_name" {
  description = "(Optional) Specify the names of azure endpoints"
  type        = list(string)
  default     = ["try1", "try2"]
}

variable "external_endpoint_name" {
  description = "(Optional) Specify the names of external endpoints"
  type        = list(string)
  default     = []
}

variable "nested_endpoint_name" {
  description = "(Optional) Specify the names of nested endpoints"
  type        = list(string)
  default     = ["demo1", "sample2"]
}

variable "weight" {
  description = "(Required) Specifies how much traffic should be distributed to this endpoint. Valid values are between 1 and 1000."
  type        = list(string)
  default     = ["70"]
}
variable "target_resource_id" {
  description = "(Required) The resource id of an Azure resource to target."
  type        = list(string)
  default     = ["/subscriptions/4c93ad0c-1cbc-4230-8418-f8df57418f3c/resourceGroups/deepak_rg/providers/Microsoft.Network/trafficManagerProfiles/demomy", "/subscriptions/4c93ad0c-1cbc-4230-8418-f8df57418f3c/resourceGroups/example-resources/providers/Microsoft.Network/trafficManagerProfiles/example-profile"]
}
variable "external_target_resource" {
  description = "(Required) The FQDN DNS name of the target."
  type        = list(string)
  default     = ["www.example.com", "www.demo.com"]
}
variable "priority" {
  description = "(Optional) Specifies the priority of this Endpoint, this must be specified for Profiles using the Priority traffic routing method. Supports values between 1 and 1000, with no Endpoints sharing the same value."
  type        = list(string)
  default     = ["1", "2"]
}
variable "minimum_child_endpoints" {
  description = "(Required) This argument specifies the minimum number of endpoints that must be 'online' in the child profile in order for the parent profile to direct traffic to any of the endpoints in that child profile. This value must be larger than 0."
  type        = list(string)
  default     = ["1", "2"]
}

variable "endpoint_location" {
  description = "(Optional) Specifies the Azure location of the Endpoint, this must be specified for Profiles using the Performance routing method."
  type        = list(string)
  default     = ["eastus"]
}

variable "custom_header_nested_endpoint" {
  description = "Configure the Custom Headers in format host:contoso.com,newheader:newvalue. Maximum supported pair is 8. Applicable for Http and Https protocol. "
  type        = list(object({ name = string, value = string }))

  default = [
    { name = "demo", value = "egr" },
    { name = "sample", value = "uku" }
  ]


}
variable "custom_header_azure_endpoint" {
  description = "Configure the Custom Headers in format host:contoso.com,newheader:newvalue. Maximum supported pair is 8. Applicable for Http and Https protocol. "
  type        = list(object({ name = string, value = string }))

  default = [
    { name = "demo", value = "egr" },
    { name = "sample", value = "uku" }
  ]


}
variable "custom_header_external_endpoint" {
  description = "Configure the Custom Headers in format host:contoso.com,newheader:newvalue. Maximum supported pair is 8. Applicable for Http and Https protocol. "
  type        = list(object({ name = string, value = string }))

  default = [
    { name = "XXXXX", value = "uuuuu" },
    { name = "zzzzz", value = "yyyy" }
  ]


}

variable "minimum_required_child_endpoints_ipv4" {
  description = "(Optional) This argument specifies the minimum number of IPv4 (DNS record type A) endpoints that must be 'online' in the child profile in order for the parent profile to direct traffic to any of the endpoints in that child profile."
  type        = list(string)
  default     = ["1", "2"]
}

variable "minimum_required_child_endpoints_ipv6" {
  description = "(Optional) This argument specifies the minimum number of IPv6 (DNS record type AAAA) endpoints that must be 'online' in the child profile in order for the parent profile to direct traffic to any of the endpoints in that child profile."
  type        = list(string)
  default     = ["1", "2"]
}

variable "geo_mappings" {
  description = "(Optional) A list of Geographic Regions used to distribute traffic, such as WORLD, UK or DE. The same location can't be specified in two endpoints."
  type        = any
  default     = [["GEO-EU", "AL"], ["WORLD", "AT"]]
}

variable "first" {
  description = "(Required) The first IP Address in this subnet. "
  type        = any
  default     = ["10.0.0.0", "11.0.0.0"]


}
variable "last" {
  description = "(Optional) The last IP Address in this subnet."
  type        = any
  default     = ["10.0.0.255", "11.0.255.255"]


}
variable "scope" {
  description = "- (Optional) The block size (number of leading bits in the subnet mask)."
  type        = any
  default     = ["24", "16"]


}

#-------------------------------------------ip---------------------------------------------

variable "pub_ip_name" {
  type        = list(string)
  description = "(Required) Specifies the name of the Public IP resource"
  default     = ["mytrhretbwg777","demo448888"]
}



variable "allocation_method" {
  type        = string
  description = "(Required) Defines the allocation method for this IP address.Possible values are Static or Dynamic"
  default     = "Static"
}

variable "sku" {
  type        = string
  description = "(Optional) The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic."
  default     = "Basic"
}

variable "public_ip_tags" {
  description = "A mapping of tags which should be assigned to the PublicIP"
  type        = map(string)
  default = {
    author : "opstree"
  }
}
















