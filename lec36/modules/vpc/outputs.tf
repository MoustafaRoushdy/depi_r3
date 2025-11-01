output "subnet_ids" {
  value = [for subnet in aws_subnet.this: subnet.id]
}