provider "aws" {
region = "us-east-1"
}

variable "elb_names" {
  type = list
  default = ["aghh-loadbalancer", "aghh-stage-loadbalanacer","aghh-prod-loadbalancer"]
}

resource "aws_iam_user" "lb" {
  name = var.elb_names[count.index]
  count = 3
  path = "/system/"
}

output "iam_names" {
  value = aws_iam_user.lb[*].name
}
