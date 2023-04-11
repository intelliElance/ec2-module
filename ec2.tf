resource "aws_instance" "myec2" {
  ami = data.aws_ami.myami.image_id
  key_name = var.key-name
  subnet_id = data.terraform_remote_state.vpc.outputs.subnet_id
  instance_type = var.inst-type
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  tags = {
    "name" = var.tag_name
  }
}
