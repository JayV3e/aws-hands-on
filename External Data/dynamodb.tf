resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "Thankful"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "Author"
  range_key      = "Date"

  attribute {
    name = "Author"
    type = "S"
  }

  attribute {
    name = "Date"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}