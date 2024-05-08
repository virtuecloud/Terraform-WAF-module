variable "web_acl_name" {
  description = "The name of the AWS WAFv2 Web ACL"
}

variable "apis" {
  description = "A map of API Gateway resources to associate with the Web ACL"
  type        = map(object({
    region = string
    api_id = string
    stage  = string
  }))
}


