resource "null_resource" "ansible" {
  provisioner "local-exec" {
    command = "aws ec2 describe-instances --query 'Reservations[*].Instances[*].PublicIpAddress' --output=text > hosts"
  }
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts ../ansible/flask-deploy/main.yml"
  }
  depends_on = [
    aws_autoscaling_group.coming-soon,
  ]
}