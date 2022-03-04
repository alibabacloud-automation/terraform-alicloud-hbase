provider "alicloud" {
  region = "cn-qingdao"
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NoDeleting"
}

data "alicloud_vswitches" "default" {
  name_regex = "default-zone-c"
  vpc_id     = data.alicloud_vpcs.default.vpcs.0.id
}

module "hbase" {
  source = "../.."

  create = true

  instance_name       = var.instance_name
  availability_zone   = data.alicloud_vswitches.default.vswitches.0.zone_id
  engine_version      = "2.0"
  core_instance_type  = "hbase.sn1ne.xlarge"
  core_disk_type      = "cloud_ssd"
  core_disk_size      = var.core_disk_size
  pay_type            = "PostPaid"
  duration            = 1
  auto_renew          = false
  deletion_protection = var.deletion_protection
  vswitch_id          = data.alicloud_vswitches.default.vswitches.0.id

}

module "hbase_1_1" {
  source = "../../modules/hbase-1.1"

  create = true

  instance_name       = var.instance_name
  availability_zone   = data.alicloud_vswitches.default.vswitches.0.zone_id
  core_instance_type  = "hbase.sn1ne.xlarge"
  core_disk_type      = "cloud_ssd"
  core_disk_size      = var.core_disk_size
  pay_type            = "PostPaid"
  duration            = 1
  auto_renew          = false
  deletion_protection = var.deletion_protection
  vswitch_id          = data.alicloud_vswitches.default.vswitches.0.id

}

module "hbase_2_0" {
  source = "../../modules/hbase-2.0"

  create = true

  instance_name       = var.instance_name
  availability_zone   = data.alicloud_vswitches.default.vswitches.0.zone_id
  core_instance_type  = "hbase.sn1ne.xlarge"
  core_disk_type      = "cloud_ssd"
  core_disk_size      = var.core_disk_size
  pay_type            = "PostPaid"
  duration            = 1
  auto_renew          = false
  deletion_protection = var.deletion_protection
  vswitch_id          = data.alicloud_vswitches.default.vswitches.0.id

}