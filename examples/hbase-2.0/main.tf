variable "profile" {
  default = "default"
}

variable "region" {
  default = "cn-shenzhen"
}

variable "availability_zone" {
  default     = "cn-shenzhen-b"
}

variable "region" {
  default = "cn-shenzhen"
}

provider "alicloud" {
  region = var.region
  profile = var.profile
}

data "alicloud_zones" "default" {
  available_resource_creation = "HBase"
  enable_details              = true
}

data "alicloud_vpcs" "default" {
  is_default = true
}

resource "alicloud_vswitch" "this" {
  name              = "tf-module-hbase-single-2-0-vsw"
  availability_zone = var.availability_zone
  vpc_id            = data.alicloud_vpcs.default.vpcs.0.id
  cidr_block        = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 4, 4)
}

module "hbase_example" {
  source                 = "../../modules/hbase-2.0"
  region                 = var.region
  instance_name          = "tf-module-hbase-single-example-2.0"
  availability_zone      = var.availability_zone
  master_instance_type   = "hbase.sn1ne.large"
  core_instance_type     = "hbase.sn1ne.large"
  core_disk_type         = "cloud_ssd"
  core_disk_size         = 400
  pay_type               = "PostPaid"
  auto_renew             = "false"
  vswitch_id             = alicloud_vswitch.this.id
}