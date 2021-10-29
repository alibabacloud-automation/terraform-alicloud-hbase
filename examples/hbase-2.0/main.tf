variable "profile" {
  default = "default"
}

variable "region" {
  default = "cn-shenzhen"
}

variable "availability_zone" {
  default     = "cn-shenzhen-b"
}

provider "alicloud" {
  region = var.region
  profile = var.profile
}

data "alicloud_zones" "default" {
  available_resource_creation = "HBase"
  enable_details              = true
}

resource "alicloud_vpc" "vpc" {
  vpc_name   = "tf_test_foo"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "this" {
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = "172.16.0.0/21"
  zone_id           = var.availability_zone
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