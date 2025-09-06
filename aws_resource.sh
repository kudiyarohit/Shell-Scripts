!#/bin/bash

#####################
#
# Author: Rohit Kudiya
# Date: 5 September 2025
# verion: v1
# This script will report the AWS resource usage
#####################

set -x # Debug mode

# AWS S3
# AWS EC2
# AWS LAMBDA
# AWS IAM Users

# List S3 buckets
echo "List of S3 buckets"
aws s3 ls > resources

# List EC2 Instances
echo "List of EC2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resources

# List lambda
echo "List of Lambda functions"
aws lambda list-functions >> resources

# List IAM users
echo "List of IAM users"
aws iam list-users >> resources
