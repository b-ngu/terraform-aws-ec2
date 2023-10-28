# terraform-aws-ec2-instance

## Summary

Terraform module which creates EC2 resources on AWS.

The primary purpose of this module is to provision an EC2 instance, the backbone of compute in the AWS cloud. It's designed to enable a broad spectrum of use cases from running simple virtual servers to powering vast cloud-based applications.

## Helpful AWS Documentation Links

- [What is Amazon EC2?](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)
- [EC2 Instance Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html)
- [EC2 Key Pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
- [EC2 Security Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html)

## Example Usage

```hcl
module "my_ec2_instance" {
  source = "path_to_this_module"

  ami_id                       = "ami-0abcd1234efgh5678"
  instance_type                = "t2.micro"
  iam_instance_profile_name    = "MyInstanceProfile"
  iam_role_name                = "MyIAMRole"
  key_name                     = "my-key-name"
  security_group_ids           = ["sg-01234abcd5678efgh"]
  subnet_id                    = "subnet-0abcd1234efgh5678"
  user_data                    = "#!/bin/bash\necho 'Hello, World!'"
  root_block_device_volume_size= 20
  
}
```

Replace `path_to_this_module` with the path to where you have this module.

## Tags

To configure any additional tags, set tags map in module definition

```hcl

module "my_ec2_instance" {
  source              = "path_to_this_module"

  ...

  tags = {
    key1        = "value1"
    key2        = "value2"
  }
}

```

## Examples

* [EC2](./examples/ec2)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=4.28 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=4.28 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_instance.ec2_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input_region) | The default region for the test. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_contact"></a> [contact](#input_contact) | (Required) The contact for this resource. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input_environment) | (Required) The environment where this resource will live. | `string` | n/a | yes |
| <a name="input_team"></a> [team](#input_team) | (Required) The team responsible for this resource. | `string` | n/a | yes |
| <a name="input_purpose"></a> [purpose](#input_purpose) | (Required) The purpose for this resource. | `string` | n/a | yes |
| <a name="input_ami_id"></a> [ami_id](#input_ami_id) | AMI ID for the EC2 instance. | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance_type](#input_instance_type) | Type of the EC2 instance. | `string` | n/a | yes |
| <a name="input_iam_instance_profile_name"></a> [iam_instance_profile_name](#input_iam_instance_profile_name) | Name of the IAM instance profile. | `string` | n/a | yes |
| <a name="input_iam_role_name"></a> [iam_role_name](#input_iam_role_name) | Name of the IAM role for the instance profile. | `string` | n/a | yes |
| <a name="input_key_name"></a> [key_name](#input_key_name) | Name of the EC2 key pair. | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security_group_ids](#input_security_group_ids) | List of security group IDs to attach to the EC2 instance. | `list(string)` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet_id](#input_subnet_id) | Subnet ID where the EC2 instance will be launched. | `string` | n/a | yes |
| <a name="input_user_data"></a> [user_data](#input_user_data) | User data to provide when launching the EC2 instance. | `string` | `""` | no |
| <a name="input_root_block_device_delete_on_termination"></a> [root_block_device_delete_on_termination](#input_root_block_device_delete_on_termination) | Whether the root block device should be deleted on termination. | `bool` | `true` | no |
| <a name="input_root_block_device_volume_type"></a> [root_block_device_volume_type](#input_root_block_device_volume_type) | Type of the root block device volume. | `string` | `gp3` | no |
| <a name="input_root_block_device_volume_size"></a> [root_block_device_volume_size](#input_root_block_device_volume_size) | Size of the root block device volume in GB. | `number` | `15` | no |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance_id](#output_instance_id) | ID of the EC2 instance. |
| <a name="output_instance_public_ip"></a> [instance_public_ip](#output_instance_public_ip) | Public IP of the EC2 instance. |
| <a name="output_instance_private_ip"></a> [instance_private_ip](#output_instance_private_ip) | Private IP of the EC2 instance. |

<!-- END_TF_DOCS -->