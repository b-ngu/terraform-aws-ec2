provider "aws" {
  region = var.region
}

module "my_ec2_instance" {
  source = "../../"

  contact     = var.contact
  environment = var.environment
  team        = var.team
  purpose     = var.purpose

  ami_id                       = "ami-0abcd1234efgh5678"
  instance_type                = "t2.micro"
  iam_instance_profile_name    = "MyInstanceProfile"
  iam_role_name                = "MyIAMRole"
  key_name                     = "my-key-name"
  security_group_ids           = ["sg-01234abcd5678efgh"]
  subnet_id                    = "subnet-0abcd1234efgh5678"
  user_data                    = "#!/bin/bash\necho 'Hello, World!' > /var/www/html/index.html"
  root_block_device_volume_size= 20

  tags = {
    "Environment" = "Dev"
    "Owner"       = "John Doe"
  }
}