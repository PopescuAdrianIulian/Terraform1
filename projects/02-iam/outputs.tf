output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "users" {
  value = { for name, user in aws_iam_user.this : name => user.arn }
}

output "s3_readonly_role_arn" {
  value = aws_iam_role.s3_readonly.arn
}

output "lambda_exec_role_arn" {
  value = aws_iam_role.lambda_exec.arn
}

output "elena_access_key_id" {
  value = aws_iam_access_key.elena.id
}

output "elena_secret_key" {
  value     = aws_iam_access_key.elena.secret
  sensitive = true
}