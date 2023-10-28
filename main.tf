resource "aws_iam_instance_profile" "instance_profile" {
  name = var.iam_instance_profile_name
  role = var.iam_role_name
}

resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  iam_instance_profile   = aws_iam_instance_profile.instance_profile.name
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id
  user_data              = var.user_data

  root_block_device {
    delete_on_termination = var.root_block_device_delete_on_termination
    volume_type           = var.root_block_device_volume_type
    volume_size           = var.root_block_device_volume_size
  }

  tags = merge(
    { "Name" = "${local.resource_prefix}-ec2" },
    var.tags,
  )
}
