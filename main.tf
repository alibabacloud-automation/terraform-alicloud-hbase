resource "alicloud_hbase_instance" "this" {
  count                = var.existing_instance_id != "" ? 0 : 1
  name                   = var.instance_name
  zone_id                = var.availability_zone
  engine                 = "hbase"
  engine_version         = var.engine_version
  master_instance_type   = var.master_instance_type
  core_instance_type     = var.core_instance_type
  core_instance_quantity = 1
  core_disk_type         = var.core_disk_type
  core_disk_size         = var.core_disk_size
  pay_type               = var.pay_type
  duration               = var.duration
  auto_renew             = var.auto_renew
  vswitch_id             = var.vswitch_id
}

