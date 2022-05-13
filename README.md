Azure Traffic Manager Profile Terraform Module
==============================================

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

- This terraform module will create a Traffic Manager Profile and Endpoints .
- This project is a part of opstree's ot-azure initiative for terraform modules.

Inputs
------
 Name | Description | Type | Default | Required 
------|-------------|------|---------|:--------:
`resource_group_name` |  The name of the resource group in which resources are created | `string` | "" | Yes 
`location` |  The location of the resource group in which resources are created | `string` | "" | Yes 
`profile_name` | Name of the Traffic Manager Profile  | `string` | "" | Yes
`traffic_routing_method` |  Specifies the algorithm used to route traffic, possible values are: Geographic, MultiValue, Performance, Priority, Subnet, Weighted | `string` | "" | Yes
`profile_status` | The status of the profile, can be set to either Enabled or Disabled. Defaults to Enabled | `string` | "" | No
`max_return` | The amount of endpoints to return for DNS queries to this Profile. Possible values range from 1 to 8. | `number` | "" | No
`traffic_view_enabled` |  Indicates whether Traffic View is enabled for the Traffic Manager profile | `bool` | false | No
`dns_ttl` | (Required) The TTL value of the Profile used by Local DNS resolvers and clients. | `number` | "" | No
`monitor_protocol` | The protocol used by the monitoring checks, supported values are HTTP, HTTPS and TCP.  | `string`| "" | Yes
`monitor_port` | The port number used by the monitoring checks  |   `number` |  | Yes
`monitor_path` | The path used by the monitoring checks. Required when protocol is set to HTTP or HTTPS - cannot be set when protocol is set to TCP. | `string` | "" | No
`monitor_probe_interval` | The interval used to check the endpoint health from a Traffic Manager probing agent.Supported values are 30 (normal probing) and 10 (fast probing) | `number` | 10 | No
`monitor_probe_timeout` | The amount of time the Traffic Manager probing agent should wait before considering that check a failure when a health check probe is sent to the endpoint. | `number` |  | No
`monitor_tolerated_failures` | The number of failures a Traffic Manager probing agent tolerates before marking that endpoint as unhealthy. Valid values are between 0 and 9 | `number` |  | No
`expected_status_code_ranges` | A list of status code ranges in the format of 100-101. | `list(any)` | [] | No
`custom_header` | Configure the Custom Headers in format host:contoso.com,newheader:newvalue. Maximum supported pair is 8. Applicable for Http and Https protocol. | `list` | [] | No
`tags` | Any tags can be set | `map(string)` |  | No
`endpoint_type` | Enter the type of endpoint . Valid options azureEndpoints,externalEndpoints,nestedEndpoints. | `string` |  | No
`azure_endpoint_name` | Specify the names of azure endpoints | `list` | [] | No
`external_endpoint_name` | Specify the names of external endpoints. | `list` |  | No
`nested_endpoint_name` | Specify the names of nested endpoints | `list` | [] | No
`weight` | Specifies how much traffic should be distributed to this endpoint. Valid values are between 1 and 1000. | `list` | [] | No
`target_resource_id` | The resource id of an Azure resource to target. | `list` | [] | Yes
`external_target_resource` | The FQDN DNS name of the target | `list` | [] | No
`priority` | Specifies the priority of this Endpoint, this must be specified for Profiles using the Priority traffic routing method. Supports values between 1 and 1000, with no Endpoints sharing the same value. | `list` | [ ] | No
`minimum_child_endpoints` | This argument specifies the minimum number of endpoints that must be 'online' in the child profile in order for the parent profile to direct traffic to any of the endpoints in that child profile. This value must be larger than 0 | `list` | [ ] | Yes
`endpoint_location` | Specifies the Azure location of the Endpoint, this must be specified for Profiles using the Performance routing method. | `list` | [ ] | No
`custom_header_nested_endpoint` | Configure the Custom Headers in format host:contoso.com,newheader:newvalue. Maximum supported pair is 8. Applicable for Http and Https protocol. | `list` | [ ] | No
`custom_header_azure_endpoint` | Configure the Custom Headers in format host:contoso.com,newheader:newvalue. Maximum supported pair is 8. Applicable for Http and Https protocol. | `list` | [ ] | No
`custom_header_external_endpoint` | Configure the Custom Headers in format host:contoso.com,newheader:newvalue. Maximum supported pair is 8. Applicable for Http and Https protocol. | `list` | [ ] | No
`minimum_required_child_endpoints_ipv4` | This argument specifies the minimum number of IPv4 (DNS record type A) endpoints that must be 'online' in the child profile in order for the parent profile to direct traffic to any of the endpoints in that child profile. | `list` | [ ] | No
`minimum_required_child_endpoints_ipv6` | This argument specifies the minimum number of IPv6 (DNS record type AAAA) endpoints that must be 'online' in the child profile in order for the parent profile to direct traffic to any of the endpoints in that child profile | `list` | [ ] | No



## Outputs

Name | Description
---- | -----------
`profile_id`|The ID of the Traffic manager profile
`fqdn`|The FQDN of the created Profile
`azure_endpoint_id`|The ID of the Azure Endpoint
`external_endpoint_id`|The ID of the External Endpoint
`nested_endpoint_id`|The ID of the Nested Endpoint

### Contributors
|  [![Deepak Kumar][deepak_avatar]][deepak_homepage]<br/>[Deepak Kumar][deepak_homepage] |
|---|

[deepak_homepage]: https://gitlab.com/deepak.kumar34
[deepak_avatar]: https://gitlab.com/uploads/-/system/user/avatar/10842436/avatar.png?width=400