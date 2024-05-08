# WAF
web_acl_name = "aws-dev-web-acl"


apis = {

  api_1 = {
    api_name          = "apache"
    load_balancer_url = "http://k8s-ingressn-ingressn-842cc5865a-d535192e2c9a363e.elb.ap-southeast-2.amazonaws.com"
    host_header       = "apache.dev.apikobble.net"
    certificate_arn   = "arn:aws:acm:ap-southeast-2:891377024689:certificate/e85352c3-684a-43a3-a540-3107ff9e4072"
  },

  api_2 = {
    api_name          = "nginx"
    load_balancer_url = "http://k8s-ingressn-ingressn-842cc5865a-d535192e2c9a363e.elb.ap-southeast-2.amazonaws.com"
    host_header       = "nginx.dev.apikobble.net"
    certificate_arn   = "arn:aws:acm:ap-southeast-2:891377024689:certificate/e85352c3-684a-43a3-a540-3107ff9e4072"
  }

  api_3 = {
    api_name          = "admin"
    load_balancer_url = "http://k8s-ingressn-ingressn-842cc5865a-d535192e2c9a363e.elb.ap-southeast-2.amazonaws.com"
    host_header       = "admin.dev.apikobble.net"
    certificate_arn   = "arn:aws:acm:ap-southeast-2:891377024689:certificate/e85352c3-684a-43a3-a540-3107ff9e4072"
  }

  api_4 = {
    api_name          = "wallets"
    load_balancer_url = "http://k8s-ingressn-ingressn-842cc5865a-d535192e2c9a363e.elb.ap-southeast-2.amazonaws.com"
    host_header       = "wallets.dev.apikobble.net"
    certificate_arn   = "arn:aws:acm:ap-southeast-2:891377024689:certificate/e85352c3-684a-43a3-a540-3107ff9e4072"
  }

}
