variable "region" {
  type        = string
  description = "The default region for the test."
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "contact" {
  type        = string
  description = "(Required) The contact for this resource."
}

variable "environment" {
  type        = string
  description = "(Required) The environment where this resource will live."
}

variable "team" {
  type        = string
  description = "(Required) The team responsible for this resource."
}

variable "purpose" {
  type        = string
  description = "(Required) The purpose for this resource."
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "Type of the EC2 instance."
  type        = string
}

variable "iam_instance_profile_name" {
  description = "Name of the IAM instance profile."
  type        = string
}

variable "iam_role_name" {
  description = "Name of the IAM role for the instance profile."
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 key pair."
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to the EC2 instance."
  type        = list(string)
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched."
  type        = string
}

variable "user_data" {
  description = "User data to provide when launching the EC2 instance."
  type        = string
  default     = ""
}

variable "root_block_device_delete_on_termination" {
  description = "Whether the root block device should be deleted on termination."
  type        = bool
  default     = true
}

variable "root_block_device_volume_type" {
  description = "Type of the root block device volume."
  type        = string
  default     = "gp3"
}

variable "root_block_device_volume_size" {
  description = "Size of the root block device volume in GB."
  type        = number
  default     = 15
}