variable "app_name" {
  type        = string
  description = "Main app name"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type (flavor)"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "Key name to attach to instance type"
}

variable "ami" {
  type = object({
    name  = string
    owner = string
  })
}

variable "subnet_regions" {
  type = object({
    primary   = string
    secondary = string
  })
}

variable "api_app_name" {
  type        = string
  description = "Name of the api app"
}