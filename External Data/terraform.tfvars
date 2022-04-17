app_name      = "coming-soon"
instance_type = "t2.micro"
key_name      = "jverdoni"
ami = {
  name  = "web-coming-soon"
  owner = "403221994955"
}
subnet_regions = {
  primary   = "us-east-1a"
  secondary = "us-east-1b"
}
api_app_name = "flask-api"