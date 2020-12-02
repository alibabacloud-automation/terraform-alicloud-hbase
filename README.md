Terraform module which creates hbase single instance and other resources on Alibaba Cloud
terraform-alicloud-hbase
==================================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbase/blob/master/README-CN.md)

Terraform module which creates HBase instance and other resources on Alibaba Cloud

These types of resources are supported:

* [alicloud_hbase_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/hbase_instances)

## Terraform versions

This module requires Terraform 0.12.

Usage
-----

```hcl
module "hbase" {
  source               = "terraform-alicloud-modules/hbase/alicloud"
  region = "cn-beijing"
  profile = "Your-Profile-Name"
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

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`.
If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

## Submit Issues
If you have any problems when using this module, please opening a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues) and let us know.

**Note**: There does not recommend to open an issue on this repo.

Authors
---------
Created and maintained by Tao huajian(quanyun88@gmail.com), He Guimin(@xiaozhu36, heguimin36@163.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)