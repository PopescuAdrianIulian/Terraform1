locals {
  groups = toset(["developers", "auditors"])
}

//folosim for each pentru a creea o resursa pentru fiecare group
resource "aws_iam_group" "this" {
  for_each = local.groups
  name     = each.value
}

//construieste o resursa pentru fiecare user din map
resource "aws_iam_user" "this" {
  for_each = var.users
  name     = each.key
}

resource "aws_iam_user_group_membership" "this" {
  for_each = var.users

  user   = aws_iam_user.this[each.key].name
  groups = [aws_iam_group.this[each.value].name]
}

