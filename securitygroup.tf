resource "aws_security_group" "tech_challenge_sg" {
  name_prefix = "tech_challenge_sg"  
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "sg_ingress" {
  description       = "allow inbound traffic from eks"
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  security_group_id = aws_security_group.tech_challenge_sg.id
  type              = "ingress"
  cidr_blocks = var.sg_cidr_blocks
  
}

resource "aws_security_group_rule" "sg_egress" {
  description       = "allow outbound traffic to anywhere"
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.tech_challenge_sg.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}