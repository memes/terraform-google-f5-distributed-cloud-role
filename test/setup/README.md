# Setup

The Terraform in this folder will be executed before creating resources and can
be used to setup service accounts, service principals, etc, that are used by the
inspec-* verifiers.

## Configuration

Create a local `terraform.tfvars` file that configures the testing project
constraints.

```hcl
# The GCP project identifier to use for project-scoped tests
project_id  = "my-gcp-project"

# The GCP organization identifier to use for org-scoped tests
org_id  = "123456"
```

<!-- markdownlint-disable MD033 MD034 -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.53, < 5.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.4 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_service_account.test](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [local_file.harness](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [random_pet.prefix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | GCP organization identifier. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project identifier. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_org_id"></a> [org\_id](#output\_org\_id) | The Google Cloud organization identifier to use for resources. |
| <a name="output_prefix"></a> [prefix](#output\_prefix) | The random prefix to use for all resources in this test run. |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The Google Cloud project identifier to use for resources. |
| <a name="output_sa"></a> [sa](#output\_sa) | The generated service account to use for testing. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-enable MD033 MD034 -->
