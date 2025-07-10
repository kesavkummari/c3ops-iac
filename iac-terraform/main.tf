resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = ["sg-039cc455c92a4cf0c"]

  tags = {
    Name        = "${var.instance_name}-${var.Environment}"
    Environment = var.Environment
    createby    = "Terraform"
  }
}