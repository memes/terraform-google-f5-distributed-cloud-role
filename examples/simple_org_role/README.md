# Simple organization-level F5 Distributed Cloud custom role creation

This example demonstrates how to use the module to create an F5 Distributed Cloud
custom IAM role in an organization with minimal inputs. After role creation it
will be available to assign to resources owned by the organization.

## Example tfvars file

* Deploy to organization: `123456`

<!-- spell-checker: disable -->
```hcl
org_id = "123456"
```
<!-- spell-checker: enable -->

### Prerequisites

* Google Cloud account
* IAM role creation permissions for the organization

### Resources created

* Custom F5 Distributed Cloud IAM role created in the organization with a
  generated role identifier

<!-- markdownlint-disable MD033 MD034-->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.58 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_role"></a> [role](#module\_role) | memes/f5-distributed-cloud-role/google | 1.0.2 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The identifier of the Google Cloud organization that will contain the custom role. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_qualified_role_id"></a> [qualified\_role\_id](#output\_qualified\_role\_id) | The qualified role-id for the custom F5 Distributed Cloud role. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-enable MD033 MD034 -->
