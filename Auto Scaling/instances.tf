data "aws_ami" "coming-soon" {
  most_recent = true

  filter {
    name   = "name"
    values = ["web-coming-soon"]
  }
  owners = ["403221994955"]
}

resource "aws_launch_configuration" "as_conf" {
  name          = "web-coming-soon"
  image_id      = data.aws_ami.coming-soon.id
  instance_type = "t2.micro"
  key_name      = "jverdoni"
  security_groups = [aws_security_group.allow_http.id]

  user_data = file("${path.module}/startup.sh")
}

resource "aws_autoscaling_group" "coming-soon" {
  vpc_zone_identifier  = [aws_subnet.az-1.id, aws_subnet.az-2.id]
  desired_capacity     = 2
  max_size             = 3
  min_size             = 2
  launch_configuration = aws_launch_configuration.as_conf.name
  load_balancers       = [aws_elb.coming-soon-lb.name]
}