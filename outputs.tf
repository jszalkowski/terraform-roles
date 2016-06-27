/*
 * IAM outputs
 */

output "instance_profile_name" {
  value = "${aws_iam_instance_profile.instance-profile.name}"
}

output "service_role_arn" {
  value = "${aws_iam_role.service-role.arn}"
}
