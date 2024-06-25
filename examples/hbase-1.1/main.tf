data "alicloud_hbase_zones" "default" {
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_hbase_zones.default.ids.0
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
  vpc_id              = data.alicloud_vpcs.default.ids.0
  vswitch_id          = data.alicloud_vswitches.default.vswitches.0.id
}
