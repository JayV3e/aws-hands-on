data "aws_ami" "coming-soon" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami.name]
  }
  owners = [var.ami.owner]
}

resource "aws_launch_configuration" "as_conf" {
  name            = var.app_name
  image_id        = data.aws_ami.coming-soon.id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.allow_http.id,aws_security_group.allow_ssh.id]
  iam_instance_profile = aws_iam_instance_profile.flask.name
}

resource "aws_autoscaling_group" "coming-soon" {
  vpc_zone_identifier  = [aws_subnet.az-1.id, aws_subnet.az-2.id]
  desired_capacity     = 2
  max_size             = 3
  min_size             = 2
  launch_configuration = aws_launch_configuration.as_conf.name
  load_balancers       = [aws_elb.coming-soon-lb.name]
}