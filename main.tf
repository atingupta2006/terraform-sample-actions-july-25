provider "aws" {
}

variable "elb_names" {
  type = list
  default = ["ating-dev-loadbalancer", "ating-stage-loadbalanacer","ating-gh-prod-loadbalancer"]
}


resource "aws_iam_user" "lb" {
  name = var.elb_names[count.index]
  count = 3
  path = "/system/"
}

output "iam_names" {
  value = aws_iam_user.lb[*].name
}
