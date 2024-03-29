locals {
  engine_version = "2.0"
}

module "hbase" {
  source = "../../"

  #################
  # HBase Instance
  #################
  create = var.create

  instance_name        = var.instance_name
  availability_zone    = var.availability_zone
  engine_version       = local.engine_version
  master_instance_type = var.master_instance_type
  core_instance_type   = var.core_instance_type
  core_disk_type       = var.core_disk_type
  core_disk_size       = var.core_disk_size
  pay_type             = var.pay_type
  duration             = var.duration
  auto_renew           = var.auto_renew
  deletion_protection  = var.deletion_protection
  vswitch_id           = var.vswitch_id

}