#################
# Provider
#################
variable "profile" {
  description = "(Deprecated from version 1.2.0) The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}

variable "shared_credentials_file" {
  description = "(Deprecated from version 1.2.0) This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "region" {
  description = "(Deprecated from version 1.2.0) The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "(Deprecated from version 1.2.0) Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

##############################################################
# HBase Instance
##############################################################
variable "create" {
  description = "Whether to create HBase instance. If false, you can use a existing HBase instance by setting 'existing_instance_id'."
  type        = bool
  default     = false
}

variable "instance_name" {
  description = "Display name of the instance, [2, 128] English or Chinese characters, must start with a letter or Chinese in size, can contain numbers, '_' or '.', '-'."
  type        = string
  default     = ""
}

variable "availability_zone" {
  description = "The available zone to launch hbase instance, Valid value: cn-hangzhou-f, cn-shanghai-d, cn-beijing-e, cn-shenzhen-b, cn-zhangjiakou-a, cn-hongkong-b, ap-southeast-1a, ap-northeast-1b, eu-central-1a"
  type        = string
  default     = ""
}

variable "engine_version" {
  description = "The version number of the database. Valid value: hbase:'1.1', '2.0'."
  type        = string
  default     = "2.0"
}

variable "master_instance_type" {
  description = "The master instance type. Valid value: 'hbase.n1.small', 'hbase.sn1ne.large', 'hbase.sn1ne.xlarge' and so on."
  type        = string
  default     = ""
}

variable "core_instance_type" {
  description = "The master instance type. Valid value: 'hbase.n1.small', 'hbase.sn1ne.large', 'hbase.sn1ne.xlarge' and so on."
  type        = string
  default     = ""
}

variable "core_disk_type" {
  description = "Core node disk type. Valid value:cloud_ssd, cloud_efficiency."
  type        = string
  default     = "cloud_ssd"
}

variable "core_disk_size" {
  description = "Core disk size, unit: GB, disk size per core node; all disk size = coreNodeSize * core_disk_size(1 * 400 =800GB)."
  type        = number
  default     = 400
}

variable "pay_type" {
  description = "Pay type, Valid value:Prepaid: The subscription billing method is used, Postpaid: The pay-as-you-go billing method is used."
  type        = string
  default     = "PostPaid"
}

variable "duration" {
  description = "The duration that you will buy HBase cluster, valid when pay_type = PrePaid."
  type        = number
  default     = 1
}

variable "auto_renew" {
  description = "Auto to renew cluster, valid when pay_type = PrePaid."
  type        = bool
  default     = false
}

variable "deletion_protection" {
  description = "The switch of delete protection."
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "The id of the VPC"
  type        = string
  default     = ""
}

variable "vswitch_id" {
  description = "VSwitch variables, if vswitch_id is empty, then the net_type = classic."
  type        = string
  default     = ""
}