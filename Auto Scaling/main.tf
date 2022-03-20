resource "aws_elb" "coming-soon-lb" {
  name                      = "coming-soon"
  cross_zone_load_balancing = true
  subnets                   = [aws_subnet.az-1.id, aws_subnet.az-2.id]
  security_groups           = [aws_security_group.allow_http.id]
  tags = {
    app = var.app_name
  }
  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "80"
    instance_protocol = "http"
  }
}
