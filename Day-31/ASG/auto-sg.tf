# resource "aws_autoscaling_group" "example" {
#   availability_zones = ["us-east-1a","us-east-1b"]
#   desired_capacity   = 3
#   max_size           = 6
#   min_size           = 1
#
#   mixed_instances_policy {
#     launch_template {
#       launch_template_specification {
#         launch_template_id = aws_launch_template.foo.id
#         version = "$Latest"
#       }
#     }
#   }
# }