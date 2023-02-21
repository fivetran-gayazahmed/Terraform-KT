variable "key" {
  type        = string
  description = "api key"
  default     = "value"
}

variable "secret" {
  type        = string
  description = "api secret"
  sensitive   = true
}

variable "mongo_pass" {
  sensitive = true
}

variable "snowflake_pass" {
  sensitive = true
}


