resource "aws_instance" "coming-soon" {
  ami           = data.aws_ami.coming-soon.id
  instance_type = "t2.micro"
  key_name      = "jverdoni"

  tags = {
    app = "aws-hands-on"
  }
  vpc_security_group_ids = [
    aws_security_group.allow_http.id,
    aws_security_group.allow_ssh.id
  ]
  user_data = file("${path.module}/startup.sh")
}


data "aws_ami" "coming-soon" {
  most_recent = true

  filter {
    name   = "name"
    values = ["web-coming-soon"]
  }
  owners = ["403221994955"]
}
