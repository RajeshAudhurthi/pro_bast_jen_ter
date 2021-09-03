resource "aws_db_subnet_group" "rds-private-subnet" {
  name = "rds-private-subnet-group"
  subnet_ids = [aws_subnet.rds_subnet1.id, aws_subnet.rds_subnet2.id]
}