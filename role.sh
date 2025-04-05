#!/bin/bash

ROLE_NAME="adminrole"

region="ap-south-1"

INSTANCE_PROFILE_NAME="adminprofile"
 
iam_fullaccess() {   

echo "Creating IAM role with S3 full access..."

aws iam create-role \
    --role-name $ROLE_NAME \
    --assume-role-policy-document file://policy.json

# Step 2: Attach S3 Full Access Policy
echo "Attaching AmazonS3FullAccess policy to the role..."

aws iam attach-role-policy \
    --role-name $ROLE_NAME \
    --policy-arn arn:aws:iam::aws:policy/AdministratorAccess 

aws iam create-instance-profile \
    --instance-profile-name $INSTANCE_PROFILE_NAME

# Add Role to Instance Profile
aws iam add-role-to-instance-profile \
    --instance-profile-name $INSTANCE_PROFILE_NAME \
    --role-name $ROLE_NAME


aws ec2 associate-iam-instance-profile \
    --instance-id $1 \
    --iam-instance-profile Name=$INSTANCE_PROFILE_NAME

}
instanceids=$(aws ec2 describe-instances --region $region --query 'Reservations[*].Instances[*].InstanceId' --output text)
for instanceid in $instanceids; do

if [[ "$instanceid == "i-0cd9c04c8ac8f0bd9"]; then

iam_fullaccess $instanceid
break
fi

done


