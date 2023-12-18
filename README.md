
# terraform-assessment-project
This is a hands-on assessment of Infrastructure-as-Code (IaC). 

# Terraform Modules
Modules are containers for multiple resources that are used together. A module consists of a collection of .tf and/or .tf.json files kept together in a directory.

Modules are the main way to package and reuse resource configurations with Terraform.

# IAM Users Module
This module creates multiple IAM users, groups, IAM roles and policies.
Module is prepared based on the following conditions.
1. Each IAM user must be tagged with information of their role and the product team(s) they are in.
2. IAM Roles "Developer" and "QA" are created and assigned to the users based on their roles.
3. Each IAM user must be associated with a user group based of their product team.
4. Each user group will be attached to distinct permission policies that would allow them to access resources associated with the product they are working on.


# RDS Modules
This module provides a versatile configuration for an Amazon RDS instance. It comes equipped with default settings for subnet groups, VPCs, and security groups. The RDS module adheres to a set of best practices to ensure optimal performance and security, encompassing the following key considerations:

Best Practices for creating RDS Instances
1. Master password for the database must be randomly generated.
2. Backups must be enabled and retained for 7 days.
3. Delete protection must be enabled.
4. Minor engine upgrades will be applied automatically to the DB instance.
5. Instance must not be publicly accessible.

# S3 Module

This is a generic S3 module and can be reused by multiple teams to create S3 buckets for them. 

This S3 module encompassing the following key considerations:
Best Practices for creating S3 buckets
1. Server-side encryption must be enabled.
2. Bucket policies only allow HTTPS requests.
3. Bucket must block public access.
4. Bucket versioning must be enabled.
