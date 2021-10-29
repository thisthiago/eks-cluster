resource "aws_security_group" "sg_rds_airflow_metadata" {
  name        = "sg_vpc"
  description = "Grupo de seguranca do RDS Postgres Airflow Metadata"
  vpc_id      = aws_vpc.rds_vpc.id
  tags        = var.tags

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
        from_port       = 5432
        to_port         = 5432
        protocol        = "tcp"
        cidr_blocks     = ["192.168.0.0/16"]
        description = "connection"
  }

}

#EKS
resource "aws_security_group" "worker_group_mgmt_one" {
  name_prefix = "worker_group_mgmt_one"
  vpc_id      = module.vpc.vpc_id

  ingress {
        from_port       = 8080
        to_port         = 8080
        protocol        = "tcp"
        cidr_blocks     = ["192.168.0.0/16"]
        description = "connection"
  }

  ingress {
        from_port       = 8793
        to_port         = 8793
        protocol        = "tcp"
        cidr_blocks     = ["192.168.0.0/16"]
        description = "connection"
  }

  ingress {
      from_port       = 6379
      to_port         = 6379
      protocol        = "tcp"
      cidr_blocks     = ["192.168.0.0/16"]
      description = "connection"
  }

  ingress {
        from_port       = 9443
        to_port         = 9443
        protocol        = "tcp"
        cidr_blocks     = ["192.168.0.0/16"]
        description = "connection"
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
      "172.16.0.0/12",
      "192.168.0.0/16",
    ]
  }

  egress {
        from_port       = 5432
        to_port         = 5432
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
  
}
