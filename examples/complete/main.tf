provider "alicloud" {
  region = "cn-shenzhen"
}

variable "availability_zone" {
  default = "cn-shenzhen-b"
}

data "alicloud_vpcs" "default" {
  is_default = true
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = var.availability_zone
}

module "hbase" {
  source = "../.."

  create = true

  instance_name         = var.instance_name
  availability_zone     = data.alicloud_vswitches.default.vswitches.0.zone_id
  core_instance_type    = "hbase.sn1ne.xlarge"
  core_disk_type        = "cloud_ssd"
  core_disk_size        = var.core_disk_size
  pay_type              = "PostPaid"
  duration              = 1
  auto_renew            = false
  deletion_protection   = var.deletion_protection
  vswitch_id            = data.alicloud_vswitches.default.vswitches.0.id
  vpc_id                = data.alicloud_vpcs.default.ids.0
  immediate_delete_flag = true
}

module "hbase_1_1" {
  source = "../.."

  create = true

  instance_name         = var.instance_name
  availability_zone     = data.alicloud_vswitches.default.vswitches.0.zone_id
  engine_version        = "1.1"
  core_instance_type    = "hbase.sn1ne.xlarge"
  core_disk_type        = "cloud_ssd"
  core_disk_size        = var.core_disk_size
  pay_type              = "PostPaid"
  duration              = 1
  auto_renew            = false
  deletion_protection   = var.deletion_protection
  vswitch_id            = data.alicloud_vswitches.default.vswitches.0.id
  vpc_id                = data.alicloud_vpcs.default.ids.0
  immediate_delete_flag = true
}

module "hbase_2_0" {
  source = "../.."

  create = true

  instance_name         = var.instance_name
  availability_zone     = data.alicloud_vswitches.default.vswitches.0.zone_id
  engine_version        = "2.0"
  core_instance_type    = "hbase.sn1ne.xlarge"
  core_disk_type        = "cloud_ssd"
  core_disk_size        = var.core_disk_size
  pay_type              = "PostPaid"
  duration              = 1
  auto_renew            = false
  deletion_protection   = var.deletion_protection
  vswitch_id            = data.alicloud_vswitches.default.vswitches.0.id
  vpc_id                = data.alicloud_vpcs.default.ids.0
  immediate_delete_flag = true
}
