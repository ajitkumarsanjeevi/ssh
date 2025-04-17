#!/bin/bash

ROLE_NAME="adminrole"

region="ap-south-1"

INSTANCE_PROFILE_NAME="adminprofile"
 
iam_fullaccess() {   

echo "Creating IAM role with S3 full access..."

aws iam create-role \
    --role-name $ROLE_NAME \
    --assume-role-policy-document file://policy.json
    if [ $? -eq 1 ]; then
    echo "Already exists"
    fi

# Step 2: Attach S3 Full Access Policy
echo "Attaching AmazonS3FullAccess policy to the role..."

aws iam attach-role-policy \
    --role-name $ROLE_NAME \
    --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
    if [ $? -eq 1 ]; then
    echo "Already exists"
    fi
    

aws iam create-instance-profile \
    --instance-profile-name $INSTANCE_PROFILE_NAME
    if [ $? -eq 1 ]; then
    echo "Already exists"
    fi
    

# Add Role to Instance Profile
aws iam add-role-to-instance-profile \
    --instance-profile-name $INSTANCE_PROFILE_NAME \
    --role-name $ROLE_NAME
    if [ $? -eq 1 ]; then
    echo "Already exists"
    fi


aws ec2 associate-iam-instance-profile \
    --instance-id $1 \
    --iam-instance-profile Name=$INSTANCE_PROFILE_NAME
    if [ $? -eq 1 ]; then
    echo "Already exists"
    fi

}



instance_ids=$(aws ec2 describe-instances --query "Reservations[*].Instances[*].InstanceId" --output text)
for instanceid in "$instance_ids"; do
iam_fullaccess "$instanceid"
done



