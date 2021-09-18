在阿里云上创建一个 HBase 单机版 实例数据库
terraform-alicloud-hbase
=====================================================================


本 Module 用于在阿里云的 VPC 下创建一个[HBase云数据库](https://help.aliyun.com/product/49055.html).

本 Module 支持创建以下资源:

* [HBase 数据库实例 (hbase_instance)](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/hbase_instances)

## Terraform 版本

本模板要求使用版本 Terraform 0.12。

## 用法

```hcl
module "hbase_example" {
  source               = "terraform-alicloud-modules/hbase/alicloud/"
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

## 模板

本 Module 提供了丰富多样的模板用于创建不同版本和规格的 HBase 资源，以满足不同的使用场景，如：

* [单机版 HBase 1.1](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbase/tree/master/modules/hbase-1.1)
* [单机版 HBase 2.0](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbase/tree/master/modules/hbase-2.0)


更多模板详见 [Modules](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbase/tree/master/modules).

## 示例

* [单机版 HBase 1.1 创建示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbase/tree/master/examples/hbase-1.1)
* [单机版 HBase 2.0 创建示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbase/tree/master/examples/hbase-2.0)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file` 中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

## 提交问题
如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues)，我们将根据问题描述提供解决方案。

**注意**: 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)


