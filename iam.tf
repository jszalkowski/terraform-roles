/*
 * IAM role configuration
 */

resource "aws_iam_role" "instance-role" {
  name = "cmx-instance-role"
  assume_role_policy = "${file("${path.module}/policies/ec2-role.json")}"
}

resource "aws_iam_policy_attachment" "instance-policy-attachment" {
  name = "cmx-instance-policy-attachment"
  roles = ["${aws_iam_role.instance-role.name}"]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "instance-profile" {
  name = "cmx-instance-profile"
  roles = ["${aws_iam_role.instance-role.name}"]
}

resource "aws_iam_role" "service-role" {
  name = "cmx-service-role"
  assume_role_policy = "${file("${path.module}/policies/ecs-role.json")}"
}

resource "aws_iam_policy_attachment" "service-policy-attachment" {
  name = "cmx-service-policy-attachment"
  roles = ["${aws_iam_role.service-role.name}"]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}
