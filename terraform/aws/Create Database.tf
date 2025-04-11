# Create a PostgreSQL database instance
resource "aws_db_instance" "this" {
  identifier           = "k8s-db"
  instance_class       = "db.t2.micro"
  engine               = "postgres"
  engine_version       = "13.4"
  username             = var.db_username
  password             = var.db_password
  vpc_security_group_ids = [aws_security_group.db.id]
  db_subnet_group_name    = aws_db_subnet_group.this.name
}

# Create a DB subnet group
resource "aws_db_subnet_group" "this" {
  name       = "k8s-db-subnet-group"
  subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id]
}
