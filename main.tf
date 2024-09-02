terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.38, < 7.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4"
    }
  }
}

resource "random_id" "role_id" {
  byte_length = 2

  keepers = {
    target_type = var.target_type
    target_id   = var.target_id
  }
}

locals {
  title       = coalesce(var.title, "Custom F5 Distributed Cloud role")
  description = coalesce(var.description, "Allow F5 Distributed Cloud to fully manage Google Cloud resources")
  permissions = distinct(concat([
    "compute.addresses.create",
    "compute.addresses.createInternal",
    "compute.addresses.delete",
    "compute.addresses.deleteInternal",
    "compute.addresses.get",
    "compute.addresses.list",
    "compute.addresses.use",
    "compute.addresses.useInternal",
    "compute.backendServices.create",
    "compute.backendServices.delete",
    "compute.backendServices.get",
    "compute.backendServices.list",
    "compute.disks.create",
    "compute.disks.delete",
    "compute.disks.get",
    "compute.disks.list",
    "compute.disks.resize",
    "compute.disks.setLabels",
    "compute.firewalls.create",
    "compute.firewalls.delete",
    "compute.firewalls.get",
    "compute.firewalls.list",
    "compute.firewalls.update",
    "compute.forwardingRules.create",
    "compute.forwardingRules.delete",
    "compute.forwardingRules.get",
    "compute.forwardingRules.list",
    "compute.forwardingRules.setLabels",
    "compute.globalOperations.get",
    "compute.healthChecks.create",
    "compute.healthChecks.delete",
    "compute.healthChecks.get",
    "compute.healthChecks.list",
    "compute.healthChecks.useReadOnly",
    "compute.images.create",
    "compute.images.get",
    "compute.images.list",
    "compute.images.useReadOnly",
    "compute.instanceGroupManagers.create",
    "compute.instanceGroupManagers.delete",
    "compute.instanceGroupManagers.get",
    "compute.instanceGroupManagers.list",
    "compute.instanceGroupManagers.update",
    "compute.instanceGroups.create",
    "compute.instanceGroups.delete",
    "compute.instanceGroups.get",
    "compute.instanceGroups.list",
    "compute.instanceGroups.use",
    "compute.instanceTemplates.create",
    "compute.instanceTemplates.delete",
    "compute.instanceTemplates.get",
    "compute.instanceTemplates.list",
    "compute.instanceTemplates.useReadOnly",
    "compute.instances.attachDisk",
    "compute.instances.create",
    "compute.instances.delete",
    "compute.instances.deleteAccessConfig",
    "compute.instances.detachDisk",
    "compute.instances.get",
    "compute.instances.list",
    "compute.instances.reset",
    "compute.instances.resume",
    "compute.instances.setLabels",
    "compute.instances.setMachineResources",
    "compute.instances.setMachineType",
    "compute.instances.setMetadata",
    "compute.instances.setServiceAccount",
    "compute.instances.setTags",
    "compute.instances.start",
    "compute.instances.stop",
    "compute.instances.update",
    "compute.instances.updateAccessConfig",
    "compute.instances.updateNetworkInterface",
    "compute.instances.use",
    "compute.interconnectAttachments.get",
    "compute.machineTypes.get",
    "compute.machineTypes.list",
    "compute.networkEndpointGroups.attachNetworkEndpoints",
    "compute.networks.access",
    "compute.networks.create",
    "compute.networks.delete",
    "compute.networks.get",
    "compute.networks.list",
    "compute.networks.update",
    "compute.networks.updatePolicy",
    "compute.networks.use",
    "compute.networks.useExternalIp",
    "compute.projects.get",
    "compute.regionBackendServices.create",
    "compute.regionBackendServices.delete",
    "compute.regionBackendServices.get",
    "compute.regionBackendServices.list",
    "compute.regionBackendServices.use",
    "compute.regionOperations.get",
    "compute.regions.get",
    "compute.routers.get",
    "compute.routes.create",
    "compute.routes.delete",
    "compute.routes.get",
    "compute.routes.list",
    "compute.subnetworks.create",
    "compute.subnetworks.delete",
    "compute.subnetworks.get",
    "compute.subnetworks.list",
    "compute.subnetworks.setPrivateIpGoogleAccess",
    "compute.subnetworks.update",
    "compute.subnetworks.use",
    "compute.subnetworks.useExternalIp",
    "compute.zones.get",
    "iam.serviceAccounts.actAs",
    "iam.serviceAccounts.get",
    "iam.serviceAccounts.list",
    "resourcemanager.projects.get",
    ],
    var.target_type == "org" ? [
      "resourcemanager.projects.list",
    ] : [],
  ))
}

# Create a custom IAM role for F5 Distributed Cloud; service accounts should be
# granted this role.
module "role" {
  source       = "terraform-google-modules/iam/google//modules/custom_role_iam"
  version      = "7.7.1"
  target_level = var.target_type
  target_id    = var.target_id
  role_id      = coalesce(var.id, format("%s_%s", var.random_id_prefix, random_id.role_id.hex))
  title        = local.title
  description  = local.description
  permissions  = local.permissions
  members      = var.members
}
