resource "aws_iam_instance_profile" "flask" {
  name = var.api_app_name
  role = aws_iam_role.role.name
}

resource "aws_iam_role" "role" {
  name = var.api_app_name
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "",
          "Effect" : "Allow",
          "Principal" : {
            "Service" : [
              "ec2.amazonaws.com"
            ]
          },
          "Action" : "sts:AssumeRole"
        }
      ]
    }
  )
  tags = {
    tag-key = var.app_name
  }
}
resource "aws_iam_policy" "policy" {
  name        = var.api_app_name
  description = "Allow access to dynamoDB"

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : [
            "dynamodb:*"
          ],
          "Effect" : "Allow",
          "Resource" : [
            "*"
          ],

        }
      ]
    }
  )
}
resource "aws_iam_role_policy_attachment" "ec2-read-only-policy-attachment" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}
