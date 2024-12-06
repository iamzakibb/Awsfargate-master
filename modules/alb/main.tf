
resource "aws_lb" "main" {
  name               = "ecs-app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = tolist(var.security_group_id) 
  subnets            =var.subnet_ids # Ensure these are in different AZs
  enable_deletion_protection = false
  enable_cross_zone_load_balancing = true

  tags = {
    Name = "ecs-app-alb"
  }
}


resource "aws_lb_target_group" "main" {
  name     = "ecs-target-group"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip" # Use 'ip' when using awsvpc network mode
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

resource "aws_lb_target_group_attachment" "ecs" {
  count            = length(var.ecs_service_private_ips)
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = var.ecs_service_private_ips[count.index]
  port             = 8080
}


