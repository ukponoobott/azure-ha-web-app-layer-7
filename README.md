# app-gateway-web-app
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_application_gateway.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/application_gateway) | resource |
| [azurerm_application_insights.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/application_insights) | resource |
| [azurerm_linux_web_app.primary](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/linux_web_app) | resource |
| [azurerm_linux_web_app.secondary](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/linux_web_app) | resource |
| [azurerm_public_ip.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/resource_group) | resource |
| [azurerm_service_plan.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/service_plan) | resource |
| [azurerm_subnet.gateway](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) The environment in which the resources are been created. | `string` | `"dev"` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | `"eastus2"` | no |
| <a name="input_workload"></a> [workload](#input\_workload) | (Required) The workload of the resource created. | `string` | `"demo"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->