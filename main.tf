module "waf" {
  source = "../module/WAF"

  web_acl_name = var.web_acl_name
  apis = var.apis
}
