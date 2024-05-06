resource "aws_wafv2_web_acl" "web-acl" {
name        = "aws-dev-web-acl"
description = "acl for dev waf"
scope       = "REGIONAL"

default_action {
    allow {}
}
rule {
    name     = "AWSManagedRulesAmazonIpReputationList"
    priority = 0

    statement {
    managed_rule_group_statement {
        vendor_name = "AWS"
        name        = "AWSManagedRulesAmazonIpReputationList"

        rule_action_override {
        name = "AWSManagedIPDDoSList"
        action_to_use {
        block {}
        }
        }
    }
    }
    override_action {
    none {}
    }

    visibility_config {
    sampled_requests_enabled = true
    cloudwatch_metrics_enabled = true
    metric_name = "AWS-AWSManagedRulesAmazonIpReputationList"
    }

}

rule {
    name     = "Geo-Controls"
    priority = 1

    statement {
    geo_match_statement {
    country_codes = ["RU"]
    }
    }
    action {
    block {}
    }

    visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "Geo-Controls"
    sampled_requests_enabled   = false
    }
}

rule {
    name     = "rate-based-rule"
    priority = 2

    statement {
    rate_based_statement {
        limit                 = 100
        aggregate_key_type    = "IP"
    }
    }

    action {
    block {}
    }

    visibility_config {
    sampled_requests_enabled    = true
    cloudwatch_metrics_enabled = true
    metric_name                = "rate-based-rule"
    }
}

rule {
    name     = "AWSManagedRulesSQLiRuleSet"
    priority = 3

    statement {
    managed_rule_group_statement {
        vendor_name = "AWS"
        name        = "AWSManagedRulesSQLiRuleSet"
    }
    }

    override_action {
    none {}
    }

    visibility_config {
    sampled_requests_enabled    = true
    cloudwatch_metrics_enabled = true
    metric_name                = "AWS-AWSManagedRulesSQLiRuleSet"
    }
}


visibility_config {
    sampled_requests_enabled = true
    cloudwatch_metrics_enabled = true
    metric_name = "AWS-AWSManagedRulesAmazonIpReputationList"
}

}



data "aws_api_gateway_rest_api" "rest_api" {
for_each = var.apis
name     = each.value.api_name
}

resource "aws_wafv2_web_acl_association" "api_gw_association" {
for_each    = var.apis
resource_arn = "arn:aws:apigateway:ap-southeast-2::/restapis/${data.aws_api_gateway_rest_api.rest_api[each.key].id}/stages/dev"
web_acl_arn = aws_wafv2_web_acl.web-acl.arn
}
