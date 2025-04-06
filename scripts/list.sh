#!/bin/bash
aws configure set aws-access-key-id $AWS_ACCESS_KEY_ID
aws configure set aws-secret-access-key $AWS_SECRET_ACCESS_KEY
aws configure set default.region $AWS_DEFAULT_REGION
aws s3 ls

