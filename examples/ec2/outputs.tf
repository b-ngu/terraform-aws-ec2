output "my_instance_id" {
  value = module.my_ec2_instance.instance_id
}

output "my_instance_public_ip" {
  value = module.my_ec2_instance.instance_public_ip
}

output "my_instance_private_ip" {
  value = module.my_ec2_instance.instance_private_ip
}
