resource "aws_db_instance" "metadados_airflow" {
  identifier                   = "db-airflow-metadata"
  instance_class               = "db.t2.micro"
  allocated_storage            = 20
  storage_type                 = "gp2"
  engine                       = "postgres"
  engine_version               = "12.5"
  #username                     = local.db_creds.username
  #password                     = local.db_creds.password

  username                     = "airflow"
  password                     = "1airflow"
  name                         = "dbairflowmetadata"
  
  db_subnet_group_name         = aws_db_subnet_group.sub_group.name
  vpc_security_group_ids       = [aws_security_group.sg_rds_airflow_metadata.id]
  backup_retention_period      = 1
  deletion_protection          = true
  skip_final_snapshot          = true
  publicly_accessible          = true
  performance_insights_enabled = true
  tags                         = var.tags
}