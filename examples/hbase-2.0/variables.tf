# HBase Instance
variable "instance_name" {
  description = "Display name of the instance, [2, 128] English or Chinese characters, must start with a letter or Chinese in size, can contain numbers, '_' or '.', '-'."
  type        = string
  default     = "tf-testacc-name"
}

variable "core_disk_size" {
  description = "Core disk size, unit: GB, disk size per core node; all disk size = 1 * core_disk_size(1 * 400 =400GB)."
  type        = number
  default     = 400
}

variable "deletion_protection" {
  description = "The switch of delete protection."
  type        = bool
  default     = false
}