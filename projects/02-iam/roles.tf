data "aws_iam_policy_document" "readonly_trust" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [aws_iam_user.this[var.readonly_role_user].arn]
    }
  }
}
resource "aws_iam_role" "s3_readonly" {
  name               = "s3-readonly-role"
  assume_role_policy = data.aws_iam_policy_document.readonly_trust.json
}

resource "aws_iam_role_policy_attachment" "s3_readonly" {
  role       = aws_iam_role.s3_readonly.name
  policy_arn = aws_iam_policy.readonly.arn
}

data "aws_iam_policy_document" "lambda_trust" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda_exec" {
  assume_role_policy = data.aws_iam_policy_document.lambda_trust.json
  name               = "lambda-exec-role"
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_access_key" "elena" {
  user = aws_iam_user.this[var.readonly_role_user].name
}