output "web_security_group_id" {
  description = "The security group ID for web access"
  value       = aws_security_group.web.id
}
