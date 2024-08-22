在阿里云上创建一个 HBase 单机版 实例数据库
terraform-alicloud-hbase


本 Module 用于在阿里云的 VPC 下创建一个[HBase云数据库](https://help.aliyun.com/product/49055.html).

本 Module 支持创建以下资源:

* [HBase 数据库实例 (hbase_instance)](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/hbase_instances)

## 用法

```hcl
module "hbase_example" {
  source               = "terraform-alicloud-modules/hbase/alicloud/"
  #################
  # HBase Instance
  #################
  engine               = "HBase"
  engine_version       = "2.0"
  region                 = "cn-shenzhen"
  instance_name          = "myInstance"
  availability_zone      = "cn-shenzhen-b"
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

* [（已废弃）单机版 HBase 1.1](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbase/tree/master/modules/hbase-1.1)
* [（已废弃）单机版 HBase 2.0](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbase/tree/master/modules/hbase-2.0)


更多模板详见 [Modules](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbase/tree/master/modules).

## 示例

* [完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbase/tree/master/examples/complete)

## 注意事项
本Module从版本v1.1.0开始已经移除掉如下的 provider 的显式设置：

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/hbase"
}
```

如果你依然想在Module中使用这个 provider 配置，你可以在调用Module的时候，指定一个特定的版本，比如 1.0.0:

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

如果你想对正在使用中的Module升级到 1.1.0 或者更高的版本，那么你可以在模板中显式定义一个相同Region的provider：
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
或者，如果你是多Region部署，你可以利用 `alias` 定义多个 provider，并在Module中显式指定这个provider：

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

定义完provider之后，运行命令 `terraform init` 和 `terraform apply` 来让这个provider生效即可。

更多provider的使用细节，请移步[How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform 版本

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |

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