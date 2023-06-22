variable "db_username" {
  type        = string
  description = "The username for the database."
  sensitive = true
}

variable "db_password" {
    description = "The database password"
    type = string
    sensitive = true
}