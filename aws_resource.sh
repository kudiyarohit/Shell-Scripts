#!/bin/bash

###############################################
# Author  : Rohit Kudiya
# Date    : 5 September 2025
# Version : v1
# Purpose : Script to report AWS resource usage
###############################################

set -e  # Exit immediately if a command fails
set -x  # Debug mode (prints commands)

# Output file
OUTPUT="aws_resources_report.txt"
> $OUTPUT  # Clear previous report

echo "======= AWS Resource Report =======" >> $OUTPUT
echo "Generated on: $(date)" >> $OUTPUT
echo "===================================" >> $OUTPUT

# List S3 Buckets
echo -e "\n[S3 Buckets]" >> $OUTPUT
aws s3 ls >> $OUTPUT

# List EC2 Instances
echo -e "\n[EC2 Instances]" >> $OUTPUT
aws ec2 describe-instances --query "Reservations[].Instances[].InstanceId" --output text >> $OUTPUT

# List Lambda Functions
echo -e "\n[Lambda Functions]" >> $OUTPUT
aws lambda list-functions --query "Functions[].FunctionName" --output text >> $OUTPUT

# List IAM Users
echo -e "\n[IAM Users]" >> $OUTPUT
aws iam list-users --query "Users[].UserName" --output text >> $OUTPUT

echo -e "\nAWS Resource Report Generated Successfully!"
echo "Output saved to: $OUTPUT"
