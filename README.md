Terraform module which creates hbase single instance and other resources on Alibaba Cloud
terraform-alicloud-hbase

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbase/blob/master/README-CN.md)

Terraform module which creates HBase instance and other resources on Alibaba Cloud

These types of resources are supported:

* [alicloud_hbase_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/hbase_instances)

Usage
-----

```hcl
module "hbase" {
  source               = "terraform-alicloud-modules/hbase/alicloud"
  #################
  # HBase Instance
  #################
  engine               = "HBase"
  engine_version       = "2.0"
  region                 = "cn-shenzhen"
  instance_name          = "myInstance"
  availability_zone      = "cn-shenzhen-b"
  master_instance_type   = "hbase.sn1ne.large"
  core_instance_type     = "hbase.sn1ne.large"
  core_disk_type         = "cloud_ssd"
  core_disk_size         = 400
  pay_type               = "PostPaid"
  auto_renew             = "false"
  vswitch_id             = "vsw-bp**********"

}
```
## Modules

This module provides rich sub-modules to support different HBase version and usage scenario, like:

* [Single HBase 1.1](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbase/tree/master/modules/hbase-1.1)
* [Single HBase 2.0](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbase/tree/master/modules/hbase-2.0)

See [more modules](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbase/tree/master/modules).

## Examples

* [Example of a HBase 1.1](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbase/tree/master/examples/hbase-1.1)
* [Example of a HBase 2.0](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbase/tree/master/examples/hbase-2.0)

## Notes
From the version v1.1.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/hbase"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.0.0:

```hcl
module "hbase_example" {
  source         = "terraform-alicloud-modules/hbase/alicloud/"
  version        = "1.0.0"
  region         = "cn-beijing"
  profile        = "Your-Profile-Name"
  engine         = "HBase"
  engine_version = "2.0"
  // ...
}
```

If you want to upgrade the module to 1.1.0 or higher in-place, you can define a provider which same region with
previous region:

```hcl
provider "alicloud" {
  region  = "cn-beijing"
  profile = "Your-Profile-Name"
}
module "hbase_example" {
  source         = "terraform-alicloud-modules/hbase/alicloud/"
  engine         = "HBase"
  engine_version = "2.0"
  // ...
}
```
or specify an alias provider with a defined region to the module using `providers`:

```hcl
provider "alicloud" {
  region  = "cn-beijing"
  profile = "Your-Profile-Name"
  alias   = "bj"
}
module "hbase_example" {
  source         = "terraform-alicloud-modules/hbase/alicloud/"
  providers      = {
    alicloud = alicloud.bj
  }
  engine         = "HBase"
  engine_version = "2.0"
  // ...
}
```

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.

More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform versions

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |

## Submit Issues
If you have any problems when using this module, please opening a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues) and let us know.

**Note**: There does not recommend to open an issue on this repo.

Authors
---------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)