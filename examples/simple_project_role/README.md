# Simple project-level F5 Distributed Cloud custom role creation

This example demonstrates how to use the module to create an F5 Distributed Cloud
custom IAM role in a project with minimal inputs, and assign it to the list of
IAM accounts provided.

## Example tfvars file

* Deploy to project: `my-project-id`
* Add the role to the existing service account: 'f5-xc@my-project-id.iam.gserviceaccount.com'

<!-- spell-checker: disable -->
```hcl
project_id = "my-project-id"
members    = [
  "serviceAccount:f5-xc@my-project-id.iam.gserviceaccount.com",
]
```
<!-- spell-checker: enable -->

### Prerequisites

* Google Cloud project
* Service account(s) to which the role will be assigned
* IAM role creation and assignment permissions in the project

### Resources created

* Custom F5 Distributed Cloud IAM role created in the project with a generated
  role identifier, assigned to service account(s)

<!-- markdownlint-disable MD033 MD034-->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.58 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_role"></a> [role](#module\_role) | memes/f5-distributed-cloud-role/google | 1.0.9 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_members"></a> [members](#input\_members) | A list of accounts that will be assigned the custom role. | `list(string)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The identifier of the Google Cloud project that will contain the custom role. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_qualified_role_id"></a> [qualified\_role\_id](#output\_qualified\_role\_id) | The qualified role-id for the custom F5 Distributed Cloud role. |
<!-- END_TF_DOCS -->
<!-- markdownlint-enable MD033 MD034 -->
