# F5 Distributed Cloud Role Terraform module

![GitHub release](https://img.shields.io/github/v/release/memes/terraform-google-f5-distributed-cloud-role?sort=semver)
![Maintenance](https://img.shields.io/maintenance/yes/2023)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)

This Terraform module is a helper to create a custom IAM role that has the
permissions required for F5 Distributed Cloud to manage a Google Cloud environment.
The role will be created in the specified project by default, but can be created
as an *Organization role* if preferred, for reuse across projects.

Unless a specific identifier is provided in the `id` variable, a semi-random
identifier will be generated of the form `f5_xc_xxxx` to avoid unique
identifier collisions during the time after a custom role is deleted but before
it is purged from the project or organization.

I have similar modules available for [AWS](https://github.com/memes/terraform-aws-f5-distributed-cloud-role)
and [Azure](https://github.com/memes/terraform-azure-f5-distributed-cloud-role).

> **NOTE:** This module is unsupported and not an official F5 product. If you
> require assistance please join our
> [Slack GCP channel](https://f5cloudsolutions.slack.com/messages/gcp) and ask!

## Examples

### Create the custom role at the project, and assign to an existing service account

See [Simple project role](examples/simple_project_role) example for more details.

<!-- spell-checker: disable -->
```hcl
module "role" {
  source    = "memes/f5-distributed-cloud-role/google"
  version   = "1.0.2"
  target_id = "my-project-id"
  members   = ["serviceAccount:f5-xc@my-project-id.iam.gserviceaccount.com"]
}
```
<!-- spell-checker: enable -->

### Create the custom role for entire org, but do not explicitly assign membership

See [Simple org role](examples/simple_org_role) example for more details.

<!-- spell-checker: disable -->
```hcl
module "org_role" {
  source      = "memes/f5-distributed-cloud-role/google"
  version     = "1.0.2"
  target_type = "org"
  target_id   = "my-org-id"
}
```
<!-- spell-checker: enable -->

### Create the custom role in the project with a fixed id, and assign to a BIG-IP service account

See [Fixed id](examples/fixed_id) example for more details.

<!-- spell-checker: disable -->
```hcl
module "role" {
  source    = "memes/f5-distributed-cloud-role/google"
  version   = "1.0.2"
  id        = "my_custom_role"
  target_id = "my-project-id"
  title     = "An example F5 Distributed Cloud custom role"
  members   = ["serviceAccount:f5-xc@my-project-id.iam.gserviceaccount.com"]
}
```
<!-- spell-checker: enable -->

<!-- spell-checker:ignore markdownlint bigip -->
<!-- markdownlint-disable MD033 MD034 -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.38, < 5.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_role"></a> [role](#module\_role) | terraform-google-modules/iam/google//modules/custom_role_iam | 7.5.0 |

## Resources

| Name | Type |
|------|------|
| [random_id.role_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_target_id"></a> [target\_id](#input\_target\_id) | Sets the target for role creation; must be either an organization ID (target\_type = 'org'),<br>or project ID (target\_type = 'project'). | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The optional description to assign to the custom IAM role. If left blank (default),<br>a suitable description will be created. | `string` | `null` | no |
| <a name="input_id"></a> [id](#input\_id) | An identifier to use for the new role; default is an empty string which will<br>generate a unique identifier. If a value is provided, it must be unique at the<br>organization or project level depending on value of target\_type respectively.<br>E.g. multiple projects can all have a 'f5\_xc' role defined, but an organization<br>level role must be uniquely named. | `string` | `null` | no |
| <a name="input_members"></a> [members](#input\_members) | An optional list of accounts that will be assigned the custom role. Default is<br>an empty list. | `list(string)` | `[]` | no |
| <a name="input_random_id_prefix"></a> [random\_id\_prefix](#input\_random\_id\_prefix) | The prefix to use when generating random role identifier for the new role if<br>`id` field is blank. The default is 'f5\_xc' which will generate a unique role<br>identifier of the form 'f5\_xc\_XXXX', where XXXX is a random hex string. | `string` | `"f5_xc"` | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | Determines if the F5 Distributed Cloud role is to be created for the whole<br>organization ('org') or at a 'project' level. Default is 'project'. | `string` | `"project"` | no |
| <a name="input_title"></a> [title](#input\_title) | The human-readable title to assign to the custom IAM role. If left blank (default),<br>a suitable title will be created. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_qualified_role_id"></a> [qualified\_role\_id](#output\_qualified\_role\_id) | The qualified role-id for the custom CFE role. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-enable MD033 MD034 -->
