Terraform AWS WAFv2 Module
This Terraform module creates an AWS WAFv2 Web ACL and associates it with API Gateway resources.

Usage
hcl
Copy code
module "waf" {
  source = "../module/WAF"
  web_acl_name = "example-web-acl"

  apis = {
    "api_id_1" = {
      region = "us-east-1"
      api_id = "api_id_1"
      stage  = "dev"
    }
    "api_id_2" = {
      region = "us-west-2"
      api_id = "api_id_2"
      stage  = "prod"
    }
    # Add more API Gateway resources as needed
  }
}
Variables
web_acl_name: The name of the AWS WAFv2 Web ACL.
apis: A map of API Gateway resources to associate with the Web ACL, where each key is the API ID and each value is an object with attributes region, api_id, and stage.
Example apis Variable
hcl
Copy code
apis = {
  "api_id_1" = {
    region = "us-east-1"
    api_id = "api_id_1"
    stage  = "dev"
  }
  "api_id_2" = {
    region = "us-west-2"
    api_id = "api_id_2"
    stage  = "prod"
  }
  # Add more API Gateway resources as needed
}
Files
waf.tf: Defines the AWS WAFv2 Web ACL and its associated rules.
variables.tf: Defines input variables used in the module, including web_acl_name and apis.
main.tf: Fetches API Gateway resources and calls the module with the required parameters.
