resource "aws_autoscaling_group" "example" {
  name               = "sample-auto"
  availability_zones = ["us-east-1a","us-east-1b"]
  desired_capacity   = 3
  max_size           = 6
  min_size           = 1

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.foo.id
        version = "$Latest"
      }
    }
  }
  tag {
    key                 = "Name"
    value               = "${var.component}-${var.env}"
    propagate_at_launch = true
  }
}

variable "component" {
  default = "frontend"
}

variable "env" {
  default = "dev"
}