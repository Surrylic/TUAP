provider "aws" {
    region = "us-east-2"
}

resource "aws_db_instance" "example" {
    identifier_prefix = "terraform-up-and-running"
    engine = "mysql"
    allocated_storage = 10
    instance_class = "db.t2.micro"
    skip_final_snapshot = true
    db_name = "example_database"

    username = var.db_username
    password = var.db_password
}

terraform {
  backend "s3" {
    bucket = "062023-terraform-state-bucket"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-2"

  dynamodb_table = "terraform-up-and-running-locks"
  encrypt = true
  }
}

output "address" {
    value = aws_db_instance.example.address
    description = "Database IP Address"
}

output "port" {
    value = aws_db_instance.example.port
    description = "Database port"
}