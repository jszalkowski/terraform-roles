# Terraform Roles Module

## Description

Module for creating roles used to register instances to load balancers and
containers with the ECS cluster service.

## Outputs

Name | Description
---- | -----------
`instance_profile_name` | Profile used to attach the role to enable an instance to register with a load balancer.
`service_role_arn` | Service role ARN used to enable the container service to attach a container with a cluster.
