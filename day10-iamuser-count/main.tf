resource "aws_iam_user" "iamuser" {
    count = length(var.aws_iam_user)
    name = var.aws_iam_user[count.index]
}