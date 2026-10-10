data "aws_iam_policy_document" "developers" {
  statement {
    sid       = "ListBucket"
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.app_data.arn]
  }

  statement {
    sid       = "ReadWriteObjects"
    actions   = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
    resources = ["${aws_s3_bucket.app_data.arn}/*"]
  }
}


data "aws_iam_policy_document" "readonly" {
  statement {
    sid     = "ReadOnly"
    actions = ["s3:Get*", "s3:List*"]
    resources = [
      aws_s3_bucket.app_data.arn,
      "${aws_s3_bucket.app_data.arn}/*",
    ]
  }
}

resource "aws_iam_policy" "developers" {
  policy = data.aws_iam_policy_document.developers.json
  name   = "developers-s3-rw"
}
resource "aws_iam_policy" "readonly" {
  policy = data.aws_iam_policy_document.readonly.json
  name   = "s3-readOnly"
}

locals {
  group_policies = {
    developers = aws_iam_policy.developers.arn
    auditors   = aws_iam_policy.readonly.arn
  }
}
resource "aws_iam_group_policy_attachment" "this" {
  for_each = local.group_policies

  group      = aws_iam_group.this[each.key].name
  policy_arn = each.value
}
