output "rds_endpoint" {
  value = aws_db_instance.default.endpoint
}

output "ec2_pip" {
  value = "ssh ubuntu@${aws_instance.web_server.private_ip}"
}

