data "aws_api_gateway_rest_api" "apis" {
  for_each = var.apis
  name = each.value.api_name
}

module "waf" {
  source = "../module/WAF"
  web_acl_name = var.web_acl_name

  apis = {
    for idx, api in data.aws_api_gateway_rest_api.apis : 
    api.id => {
      region = "ap-southeast-2" 
      api_id = api.id
      stage  = "dev"     
    }
  }



}
