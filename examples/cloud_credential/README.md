# Create an F5 Distributed Cloud GCP Cloud Credential

This example demonstrates how to use the module with Google and Volterra providers
to create an F5 Distributed Cloud custom IAM role in a project, and assign it to
a new service account, and embed the service account credentials into an XC Cloud
Credential.

> NOTE: This example will embed the service account JSON key as plaintext in
> XC and in Terraform state. You can choose to use my unofficial F5XC provider
> to blindfold the secret before sending to XC, but the JSON key will remain stored
> as plaintext in Terraform state. See [Blindfold Cloud Credential](../blindfold_cloud_credential/) for example usage.
>
> For production use you should create the split this action into
> two phases and use Blindfold to encrypt the JSON credentials offline.
> See https://docs.cloud.f5.com/docs/services/app-stack/secrets-management for
> more information.

## Example tfvars file

* Create the custom role with randomly generated identifier with prefix `f5_xc_` in project `my-project-id`
* Create a service account named `f5-xc@my-project-id.iam.gserviceaccount.com`
  and attach the custom role
* Create an F5 XC Cloud Credential named `f5-xc` in your tenant that holds the
  service account credentials

<!-- spell-checker: disable -->
```hcl
project_id = "my-project-id"
name = "f5-xc"
```
<!-- spell-checker: enable -->

### Prerequisites

* Google Cloud project
* Appropriate IAM roles in the project
  * Create and manage IAM roles
  * Create and manage service account
* Appropriate roles to create Cloud Credential in an F5 XC tenant

### Resources created

* Custom F5 Distributed Cloud IAM role created in the project
* Service account with binding to custom IAM role and JSON authentication key
* F5 XC Cloud Credential for GCP

<!-- markdownlint-disable MD033 MD034-->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.58 |
| <a name="requirement_volterra"></a> [volterra](#requirement\_volterra) | >= 0.11 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_role"></a> [role](#module\_role) | memes/f5-distributed-cloud-role/google | 1.0.8 |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_key.sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |
| [volterra_cloud_credentials.xc](https://registry.terraform.io/providers/volterraedge/volterra/latest/docs/resources/cloud_credentials) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name to assign to the created service account and Cloud Credential resources. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The identifier of the Google Cloud project that will contain the custom role. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_credential"></a> [cloud\_credential](#output\_cloud\_credential) | The unique name of the GCP Cloud Credential in your F5 XC tenant. |
| <a name="output_qualified_role_id"></a> [qualified\_role\_id](#output\_qualified\_role\_id) | The qualified role-id for the custom F5 Distributed Cloud role. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-enable MD033 MD034 -->
